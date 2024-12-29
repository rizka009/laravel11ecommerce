<!-- resources/views/admin/users.blade.php -->

@extends('layouts.admin')

@section('content')
<div class="main-content-inner">
    <div class="main-content-wrap">
        <div class="flex items-center flex-wrap justify-between gap20 mb-27">
            <h3>Users</h3>
            <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                <li>
                    <a href="index.html">
                        <div class="text-tiny">Dashboard</div>
                    </a>
                </li>
                <li>
                    <i class="icon-chevron-right"></i>
                </li>
                <li>
                    <div class="text-tiny">All Users</div>
                </li>
            </ul>
        </div>

        <div class="wg-box">
            <div class="wg-table table-all-user">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center"  width="5%">No</th>
                                <th>User</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th class="text-center" width="10%">Total Orders</th>
                                <th width="10%">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($users as $user)
                            <tr>
                                <td class="text-center">{{ $user->id }}</td>
                                <td class="pname">
                                    {{-- <div class="image">
                                        <img src="{{ asset('path/to/user/avatar') }}" alt="" class="image">
                                    </div> --}}
                                    <div class="name">
                                        <a href="#" class="body-title-2">{{ $user->name }}</a>
                                        <div class="text-tiny mt-3">{{ $user->utype }}</div>
                                    </div>
                                </td>
                                <td>{{ $user->mobile }}</td>
                                <td>{{ $user->email }}</td>
                                <td class="text-center">{{ $user->orders_count }}</td><!-- Ini bisa diubah jika ingin menghitung orders -->
                                <td>
                                    <div class="list-icon-function">
                                        <form action="{{ route('admin.users.delete', $user->id) }}" method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <div class="item text-danger delete">
                                                <i class="icon-trash-2"></i>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Paginasi -->
            <div class="divider"></div>
            <div class="flex items-center justify-between flex-wrap gap10 wgp-pagination">
                {{ $users->links() }} <!-- Menampilkan tombol navigasi halaman -->
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    $(function(){
        $('.delete').on('click',function(e){
            e.preventDefault();
            var form = $(this).closest('form');
            swal({
                title: "are you sure?",
                text: "You want to delete this record?",
                type: "warning",
                buttons: ["No","Yes"],
                confirmButtonColor: "#dc3545"
            }).then(function(result){
                if (result) {
                    form.submit();
                }
            });
        });
    })
</script>

@endpush
