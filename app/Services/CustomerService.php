<?php

namespace App\Services;

use App\Models\Customers;

class CustomerService
{
    public function createCustomer(array $customerData)
    {
        $customer = new Customers([
            'first_name' => $customerData['first_name'],
            'last_name' => $customerData['last_name'],
            'middle_name' => $customerData['middle_name'] ?? null,
            'birth_date' => $customerData['birth_date'],
            'gender' => $customerData['gender'],
            'marital_status' => $customerData['marital_status'],
            'is_deleted' => 0,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $customer->save();
        return $customer;
    }

    public function updateCustomer(Customers $customer, array $customerData)
    {
        $customer->update($customerData);
        return $customer;
    }

    public function deleteCustomer(Customers $customer)
    {
        $customer->is_deleted = 1;
        $customer->save();
    }
}
