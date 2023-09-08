<?php

namespace App\Services;

use App\Models\Products;

class ProductService
{
    public function createProduct(array $productData)
    {
        $product = new Products([
            'name' => $productData['name'],
            'description' => $productData['description'],
            'quantity' => $productData['quantity'],
            'unit_price' => $productData['unit_price'],
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $product->save();
        return $product;
    }

    public function updateProduct(Products $product, array $productData)
    {
        $product->update($productData);
        return $product;
    }

    public function deleteProduct(Products $product)
    {
        $product->is_deleted = 1;
        $product->in_stock = 0;
        $product->save();
    }
}