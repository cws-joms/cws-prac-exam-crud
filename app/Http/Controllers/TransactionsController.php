<?php

namespace App\Http\Controllers;

use App\Models\Transactions;
use App\Services\TransactionService;
use Illuminate\Http\Request;

class TransactionsController extends Controller
{

    private $transactionService;

    public function __construct(TransactionService $transactionService)
    {
        $this->transactionService = $transactionService;
    }

    public function index(Request $request)
    {
        $transactions = Transactions::where('customer_id', $request->customer_id)->get();
        return response()->json($transactions);
    }

    public function store_transaction(Request $request)
    {
        // Validate the incoming data for the transaction
        $request->validate([
            'customer_id' => 'required|exists:customers,id',
            'product_name' => 'required|string|max:255',
            'quantity' => 'required|integer',
            'unit_price' => 'required|numeric',
        ]);

        $transactionData = $request->only(['customer_id', 'product_name', 'quantity', 'unit_price']);

        $transaction = $this->transactionService->createTransaction($transactionData);

        return response()->json('Transaction created!');
    }
}
