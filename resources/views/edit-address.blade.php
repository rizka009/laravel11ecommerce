@extends('layouts.app')
@section('content')
<main class="pt-90">
    <div class="mb-4 pb-4"></div>
    <div class="container">
        <h2 class="page-title">Edit Address</h2>
        <form action="{{ route('checkout.update.address', $address->id) }}" method="POST">
            @csrf
            <div class="row">
                <div class="col-md-6">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" name="name" value="{{ $address->name }}" required>
                        <label for="name">Full Name *</label>
                        @error('name')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" name="phone" value="{{ $address->phone }}" required>
                        <label for="phone">Phone Number *</label>
                        @error('phone')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" name="zip" value="{{ $address->zip }}" required>
                        <label for="zip">Pincode *</label>
                        @error('zip')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" name="state" value="{{ $address->state }}" required>
                        <label for="state">State *</label>
                        @error('state')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" name="city" value="{{ $address->city }}" required>
                        <label for="city">Town / City *</label>
                        @error('city')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" name="address" value="{{ $address->address }}" required>
                        <label for="address">House no, Building Name *</label>
                        @error('address')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" name="locality" value="{{ $address->locality }}" required>
                        <label for="locality">Road Name, Area, Colony *</label>
                        @error('location')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-floating my-3">
                        <input type="text" class="form-control" name="landmark" value="{{ $address->landmark }}" required>
                        <label for="landmark">Landmark *</label>
                        @error('landmark')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>
                </div>
                <div class="col-md-12 text-end">
                    <button class="btn btn-primary">Save Changes</button>
                </div>
            </div>
        </form>
    </div>
</main>
@endsection
