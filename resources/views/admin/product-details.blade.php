@extends('layouts.admin')

@section('content')
<div class="main-content-inner">
    <div class="main-content-wrap">
        <div class="flex items-center flex-wrap justify-between gap20 mb-27">
            <h3>Product Details</h3>
            <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                <li>
                    <a href="{{ route('admin.index') }}">
                        <div class="text-tiny">Dashboard</div>
                    </a>
                </li>
                <li>
                    <i class="icon-chevron-right"></i>
                </li>
                <li>
                    <a href="{{ route('admin.products') }}">
                        <div class="text-tiny">Products</div>
                    </a>
                </li>
                <li>
                    <i class="icon-chevron-right"></i>
                </li>
                <li>
                    <div class="text-tiny">Product Details</div>
                </li>
            </ul>
        </div>

        <div class="wg-box">

            <div class="mt-3">
                <a href="{{ route('admin.products') }}" class="btn btn-secondary" style="padding: 10px 10px; font-size: 12px;">
                    <i class="bi bi-arrow-left"></i> Back to Products
                </a>
                <a href="{{ route('admin.product.edit', ['id' => $product->id]) }}" class="btn btn-primary" style="padding: 10px 10px; font-size: 12px;">
                    <i class="bi bi-pencil-square"></i> Edit Product
                </a>
            </div>

            <div class="product-details-wrap">
                <div class="row">
                    <!-- Detail produk -->
                    <div class="col-md-12" style="max-width: 100%;"> <!-- Memastikan kolom melebar penuh -->
                        <table class="table table-striped table-bordered" style="width: 100%;">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Price</th>
                                    {{-- <th>SalePrice</th> --}}
                                    <th>SKU</th>
                                    <th>Category</th>
                                    <th>Brand</th>
                                    <th>Featured</th>
                                    <th>Stock</th>
                                    <th>Quantity</th>
                                    <th>Production</th>
                                    <th>Expiry Date</th>
                                    <th>Short Description</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="image">
                                            <img src="{{ asset('uploads/products/thumbnails') }}/{{ $product->image }}" alt="{{ $product->name }}" class="image">
                                        </div>
                                        <div class="name">
                                            <a href="#" class="body-title-2">{{ $product->name }}</a>
                                            <div class="text-tiny mt-3">{{ $product->slug }}</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="name">
                                            {{-- <a href="#" class="body-title-2">Price: Rp. {{ $product->regular_price }}</a> --}}
                                            <div class="text-bold mt-3">Price: {{ $product->formatted_regular_price }}</div>
                                            <div class="text-bold mt-3">Sale: {{ $product->formatted_sale_price }}</div>
                                        </div>
                                    </td>
                                    {{-- <td>Rp. {{ $product->regular_price }}</td>
                                    <td>Rp. {{ $product->sale_price }}</td> --}}
                                    <td>{{ $product->SKU }}</td>
                                    <td>{{ $product->category->name }}</td>
                                    <td>{{ $product->brand->name }}</td>
                                    <td>{{ $product->featured == 0 ? "No":"Yes" }}</td>
                                    <td>{{ $product->stock_status }}</td>
                                    <td>{{ $product->quantity }}</td>
                                    <td>{{ $product->production_date }}</td>
                                    <td>
                                        @if($product->expiry_date && \Carbon\Carbon::now()->gt($product->expiry_date))
                                            <span style="color: red;">{{ $product->expiry_date }}</span>
                                        @else
                                            {{ $product->expiry_date }}
                                        @endif
                                    </td>
                                    <td>{{ $product->short_description }}</td>
                                    <td>{{ $product->description }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>



            </div>
        </div>

    </div>
</div>
@endsection
