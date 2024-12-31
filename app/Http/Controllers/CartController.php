<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Address;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Surfsidemedia\Shoppingcart\Facades\Cart;


class CartController extends Controller
{
    public function index()
    {
        $items = Cart::instance('cart')->content();
        return view('cart',compact('items'));
    }

    public function add_to_cart(Request $request)
    {
        if (!Auth::check())
        {
            return redirect()->route('login');
        }

        Cart::instance('cart')->add($request->id,$request->name,$request->quantity,$request->price)->associate('App\Models\Product');
        return redirect()->back();
    }

    public function increase_cart_quantity($rowId)
    {
        $product = Cart::instance('cart')->get($rowId);
        $qty = $product->qty + 1;
        Cart::instance('cart')->update($rowId,$qty);
        return redirect()->back();
    }

    public function decrease_cart_quantity($rowId)
    {
        $product = Cart::instance('cart')->get($rowId);
        $qty = $product->qty - 1;
        Cart::instance('cart')->update($rowId,$qty);
        return redirect()->back();
    }

    public function remove_item($rowId)
    {
        Cart::instance('cart')->remove($rowId);
        return redirect()->back();
    }

    public function empty_cart()
    {
        Cart::instance('cart')->destroy();
        return redirect()->back();
    }

    public function apply_coupon_code(Request $request)
    {
        $coupon_code = $request->coupon_code;
        if (isset($coupon_code))
        {
            $coupon = Coupon::where('code', $coupon_code)
            ->where('expiry_date', '>=', Carbon::today())
            ->where('cart_value', '<=', Cart::instance('cart')->subtotal())
            ->first();
            if (!$coupon) {
                return redirect()->back()->with('error','Invalid Coupon Code!');
            }else {
                Session::put('coupon',[
                    'code' => $coupon->code,
                    'type' => $coupon->type,
                    'value' => $coupon->value,
                    'cart_value' => $coupon->cart_value
                ]);
                $this->calculateDiscount();
                return redirect()->back()->with('success','Coupon had been applied!');
            }
        }else {
            return redirect()->back()->with('error','Invalid Coupon Code!');
        }
    }

    public function calculateDiscount()
    {
        $discount = 0;
        if (Session::has('coupon'))
        {
            if (Session::get('coupon')['type']=='fixed')
            {
                $discount = Session::get('coupon')['value'];
            }else {
                $discount = (Cart::instance('cart')->subtotal() * Session::get('coupon')['value'])/100;
            }

            $subtotalAfterDiscount = Cart::instance('cart')->subtotal() - $discount;
            $taxAfterDiscount = ($subtotalAfterDiscount * config('cart.tax'))/100;
            $totalAfterDiscount = $subtotalAfterDiscount + $taxAfterDiscount;

            Session::put('discounts',[
                'discount' => number_format(floatval($discount),2,'.',''),
                'subtotal' => number_format(floatval($subtotalAfterDiscount),2,'.',''),
                'tax' => number_format(floatval($taxAfterDiscount),2,'.',''),
                'total' => number_format(floatval($totalAfterDiscount),2,'.','')
            ]);
        }
    }

    public function remove_coupon_code()
    {
        Session::forget('coupon');
        Session::forget('discounts');
        return back()->with('success','Coupon has been removed!');
    }

    public function checkout()
    {
        if (!Auth::check())
        {
            return redirect()->route('login');
        }

        $address = Address::where('user_id',Auth::user()->id)->where('isdefault',1)->first();
        return view('checkout',compact('address'));
    }

    public function place_an_order(Request $request)
    {
        $user_id = Auth::user()->id;
        $address = Address::where('user_id', $user_id)->where('isdefault', true)->first();

        if (!$address) {
            $request->validate([
                'name' => 'required|max:100',
                'phone' => 'required|numeric|digits_between:10,15',
                'zip' => 'required|numeric|digits:6',
                'state' => 'required',
                'city' => 'required',
                'address' => 'required',
                'locality' => 'required',
                'landmark' => 'required',
            ]);

            $address = new Address();
            $address->name = $request->name;
            $address->phone = $request->phone;
            $address->zip = $request->zip;
            $address->state = $request->state;
            $address->city = $request->city;
            $address->address = $request->address;
            $address->locality = $request->locality;
            $address->landmark = $request->landmark;
            $address->country = 'indonesia';
            $address->user_id = $user_id;
            $address->isdefault = true;
            $address->save();
        }

        $this->setAmountforCheckout();

        // Mulai proses order
        $order = new Order();
        $order->user_id = $user_id;
        $order->subtotal = Session::get('checkout')['subtotal'];
        $order->discount = Session::get('checkout')['discount'];
        $order->tax = Session::get('checkout')['tax'];
        $order->total = Session::get('checkout')['total'];
        $order->name = $address->name;
        $order->phone = $address->phone;
        $order->locality = $address->locality;
        $order->address = $address->address;
        $order->city = $address->city;
        $order->state = $address->state;
        $order->country = $address->country;
        $order->landmark = $address->landmark;
        $order->zip = $address->zip;
        $order->save();

        // Proses Order Item
        foreach (Cart::instance('cart')->content() as $item) {
            $product = Product::find($item->id);

            // Validasi stok
            if ($product->quantity < $item->qty) {
                return redirect()->back()->with('error', "Stok produk {$product->name} tidak mencukupi.");
            }

            // Validasi expiry date
            if (Carbon::now()->greaterThan($product->expiry_date)) {
                return redirect()->back()->with('error', "Produk {$product->name} telah kedaluwarsa.");
            }

            // Kurangi stok produk
            $product->quantity -= $item->qty;
            $product->stock_status = $product->quantity > 0 ? 'instock' : 'outofstock';
            $product->save();

            // Simpan Order Item
            $orderItem = new OrderItem();
            $orderItem->product_id = $item->id;
            $orderItem->order_id = $order->id;
            $orderItem->price = $item->price;
            $orderItem->quantity = $item->qty;
            $orderItem->save();
        }

        // Proses pembayaran
        if ($request->mode == "card") {
            // Integrasikan pembayaran kartu
        } elseif ($request->mode == "paypal") {
            // Integrasikan pembayaran PayPal
        } elseif ($request->mode == "transfer") {
            $transaction = new Transaction();
            $transaction->user_id = $user_id;
            $transaction->order_id = $order->id;
            $transaction->mode = $request->mode;
            $transaction->status = "pending";
            $transaction->save();
        }

        // Kosongkan keranjang
        Cart::instance('cart')->destroy();
        Session::forget('checkout');
        Session::forget('coupon');
        Session::forget('discounts');
        Session::put('order_id', $order->id);

        return redirect()->route('cart.order.confirmation');
    }


    public function setAmountforCheckout()
    {
        if (!Cart::instance('cart')->content()->count() > 0)
        {
            Session::forget('checkout');
            return;
        }

        if (Session::has('coupon'))
        {
            $subtotal = str_replace(',', '', Cart::instance('cart')->subtotal());
            $tax = str_replace(',', '', Cart::instance('cart')->tax());
            $total = str_replace(',', '', Cart::instance('cart')->total());

            Session::put('checkout', [
                'discount' => Session::get('discounts')['discount'],
                'subtotal' => $subtotal,
                'tax' => $tax,
                'total' => $total,
            ]);
        }
        else
        {
            $subtotal = str_replace(',', '', Cart::instance('cart')->subtotal());
            $tax = str_replace(',', '', Cart::instance('cart')->tax());
            $total = str_replace(',', '', Cart::instance('cart')->total());

            Session::put('checkout', [
                'discount' => 0,
                'subtotal' => $subtotal,
                'tax' => $tax,
                'total' => $total,
            ]);
        }
    }

    public function editAddress($id)
{
    $address = Address::findOrFail($id);

    // Pastikan hanya pemilik alamat yang bisa mengedit
    if ($address->user_id !== Auth::id()) {
        return redirect()->route('checkout')->with('error', 'Anda tidak memiliki izin untuk mengedit alamat ini.');
    }

    return view('edit-address', compact('address'));
}

public function updateAddress(Request $request, $id)
{
    $address = Address::findOrFail($id);

    if ($address->user_id !== Auth::id()) {
        return redirect()->route('cart.checkout')->with('error', 'Anda tidak memiliki izin untuk mengedit alamat ini.');
    }

    $request->validate([
        'name' => 'required|max:100',
        'phone' => 'required|numeric|digits_between:10,15',
        'zip' => 'required|numeric|digits:6',
        'state' => 'required',
        'city' => 'required',
        'address' => 'required',
        'locality' => 'required',
        'landmark' => 'required',
    ]);

    $data = $request->except('_token');

    $address->update($data);

    return redirect()->route('cart.checkout')->with('success', 'Alamat berhasil diperbarui.');
}




    public function order_confirmation()
    {
        if (Session::has('order_id'))
        {
            $order = Order::find(Session::get('order_id'));
            return view('order-confirmation',compact('order'));
        }
        return redirect()->route('cart.index');
    }
}
