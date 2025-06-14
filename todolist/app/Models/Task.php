<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\User;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'title',
        'description',
        'is_done',
        'due_date',
        'priority',
    ];

    // Relasi: Setiap tugas dimiliki oleh satu user
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
