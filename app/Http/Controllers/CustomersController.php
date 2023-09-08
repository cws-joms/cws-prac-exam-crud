<?php

namespace App\Http\Controllers;

use App\Models\Customers;
use Illuminate\Http\Request;
use App\Services\CustomerService;

class CustomersController extends Controller
{
    private $customerService;

    public function __construct(CustomerService $customerService)
    {
        $this->customerService = $customerService;
    }

    public function index(Request $request)
    {
        $request = Customers::activeCustomers()->get();
        return response()->json($request);
    }

    public function store(Request $request)
    {
        $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'middle_name' => 'nullable|string|max:255',
            'birth_date' => 'required|date',
            'gender' => 'required|string',
            'marital_status' => 'required|string',
        ]);

        $customerData = $request->only(['first_name', 'last_name', 'middle_name', 'birth_date', 'gender', 'marital_status']);

        $customer = $this->customerService->createCustomer($customerData);

        return response()->json('Customer created!');
    }

    public function update(Request $request, $id)
    {
        $customer = Customers::find($id);

        if (!$customer) {
            return response()->json('Customer not found', 404);
        }

        $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'middle_name' => 'nullable|string|max:255',
            'birth_date' => 'required|date',
            'gender' => 'required|string',
            'marital_status' => 'required|string',
        ]);

        $customerData = $request->only(['first_name', 'last_name', 'middle_name', 'birth_date', 'gender', 'marital_status']);

        $customer = $this->customerService->updateCustomer($customer, $customerData);

        return response()->json('Customer info updated');
    }

    public function delete($id)
    {
        $customer = Customers::find($id);

        if (!$customer) {
            return response()->json('Customer not found', 404);
        }

        $this->customerService->deleteCustomer($customer);

        return response()->json('Customer deleted successfully');
    }
}
