<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        return view('user.index');
    }

    public function orders()
    {
        $orders = Order::where('user_id', Auth::user()->id)->orderBy('created_at', 'DESC')->paginate(10);
        return view('user.orders', compact('orders'));
    }

    public function order_details($order_id)
    {
        $order = Order::where('user_id', Auth::user()->id)->where('id', $order_id)->first();
        if ($order) {
            $orderItems = OrderItem::where('order_id', $order->id)->orderBy('id', 'asc')->paginate(12);
            $transaction = Transaction::where('order_id', $order->id)->first();
            return view('user.order-details', compact('order', 'orderItems', 'transaction'));
        } else {
            return redirect()->route('login');
        }
    }

    public function order_cancel(Request $request)
    {
        $order = Order::find($request->order_id);
        $order->status = "canceled";
        $order->canceled_date = Carbon::now();
        $order->save();
        return back()->with('status', 'Order has been cancelled successfully!');
    }

    public function account_details()
    {
        // Ambil data pengguna saat ini
        $user = Auth::user();
        return view('user.account-details', compact('user'));
    }

    public function update_account_details(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'mobile' => 'required|string|max:15',
            'email' => 'required|email|unique:users,email,' . Auth::id(),
            'old_password' => 'nullable|string',
            'new_password' => 'nullable|string|min:8|confirmed',
        ]);

        $user = Auth::user();

        // Perbarui data pengguna
        $user->name = $request->name;
        $user->mobile = $request->mobile;
        $user->email = $request->email;

        // Jika password lama dan baru diisi, lakukan validasi dan ubah password
        if ($request->filled('old_password') && $request->filled('new_password')) {
            if (!Hash::check($request->old_password, $user->password)) {
                return back()->withErrors(['old_password' => 'Old password is incorrect.']);
            }
            $user->password = Hash::make($request->new_password);
        }

        $user->save();
        return redirect()->route('user.account.details')->with('status', 'Account details updated successfully!');
    }

    public function uploadTransferProof(Request $request)
    {
        $request->validate([
            'transfer_proof' => 'required|image|mimes:jpeg,png,jpg|max:2048', // Maksimal ukuran 2MB
        ]);

        $transaction = Transaction::findOrFail($request->transaction_id);

        if ($request->hasFile('transfer_proof')) {
            // Dapatkan file dari request
            $file = $request->file('transfer_proof');

            // Tentukan lokasi penyimpanan
            $destinationPath = public_path('uploads/transaksi'); // Langsung di folder public/uploads/transaksi
            $fileName = time() . '_' . $file->getClientOriginalName(); // Buat nama unik untuk file

            // Pindahkan file ke folder tujuan
            $file->move($destinationPath, $fileName);

            // Simpan path relatif ke database (hanya path mulai dari uploads)
            $transaction->transfer_proof = 'uploads/transaksi/' . $fileName;
            $transaction->save();

            return back()->with('status', 'Transfer proof uploaded successfully!');
        }

        return back()->withErrors(['transfer_proof' => 'Failed to upload transfer proof.']);
    }

    public function order_complete(Request $request)
{
    // Mencari order berdasarkan order_id dan user_id
    $order = Order::where('user_id', Auth::user()->id)
                  ->where('id', $request->order_id)
                  ->where('status', 'ordered') // Pastikan status pesanan adalah "ordered"
                  ->first();

    // Jika order ditemukan, update status menjadi "completed"
    if ($order) {
        $order->status = 'completed';  // Mengubah status menjadi 'completed'
        $order->completed_date = Carbon::now();  // Menambahkan tanggal selesai
        $order->save();

        return back()->with('status', 'Order status updated to completed successfully!');
    }

    // Jika pesanan tidak ditemukan atau statusnya bukan "ordered"
    return back()->withErrors(['order' => 'Order not found or already completed.']);
}

}
