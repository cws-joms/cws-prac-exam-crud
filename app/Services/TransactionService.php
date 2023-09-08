<?php

namespace App\Services;

use App\Models\Transactions;

class TransactionService
{
    public function createTransaction(array $transactionData)
    {
        $transaction = new Transactions([
            'customer_id' => $transactionData['customer_id'],
            'reference_id' => now()->format('YmdHis'),
            'product_name' => $transactionData['product_name'],
            'quantity' => $transactionData['quantity'],
            'unit_price' => $transactionData['unit_price'],
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $transaction->save();
        return $transaction;
    }
}