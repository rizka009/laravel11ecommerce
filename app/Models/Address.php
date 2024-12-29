<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    // Tentukan kolom yang diizinkan untuk mass assignment
    protected $fillable = [
        'name',
        'phone',
        'zip',
        'state',
        'city',
        'address',
        'locality',
        'landmark',
        'user_id', // Tambahkan jika ada hubungan ke pengguna
    ];
}
