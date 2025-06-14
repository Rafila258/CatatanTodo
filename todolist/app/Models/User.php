<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

// Tambahkan use trait Sanctum di sini
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    // Tambahkan HasApiTokens di sini bersama trait lain
    use HasApiTokens, HasFactory, Notifiable;

    // Isi class kamu tetap sama...
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
