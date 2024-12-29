<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Surfsidemedia\Shoppingcart\Facades\Cart;

class WishlistController extends Controller
{
    public function index()
    {
        $items = Cart::instance('wishlist')->content();
        return view('wishlist', compact('items'));
    }


    public function add_to_wishlist(Request $request)
    {
        if (!Auth::check())
        {
            return redirect()->route('login');
        }
        Cart::instance('wishlist')->add($request->id,$request->name,$request->quantity,$request->price)->associate('App\Models\Product');
        return redirect()->back();
    }

    public function remove_item($rowId)
    {
        Cart::instance('wishlist')->remove($rowId);
        return redirect()->back();
    }

    public function empty_wishlist()
    {
        Cart::instance('wishlist')->destroy();
        return redirect()->back();
    }

    public function move_to_cart($rowId)
    {
        $item = Cart::instance('wishlist')->get($rowId);
        Cart::instance('wishlist')->remove($rowId);
        Cart::instance('cart')->add($item->id,$item->name,$item->qty,$item->price)->associate('App\Models\Product');
        return redirect()->back();
    }
}
