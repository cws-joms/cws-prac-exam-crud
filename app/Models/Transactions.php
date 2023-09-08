<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transactions extends Model
{
    use HasFactory;

    protected $fillable = [
        'reference_id',
        'customer_id',
        'product_name',
        'quantity',
        'unit_price',
        'created_at',
        'updated_at',
    ];

}
