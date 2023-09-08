<?php

namespace App\Http\Controllers;

use App\Models\Products;
use App\Services\ProductService;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    private $productService;

    public function __construct(ProductService $productService)
    {
        $this->productService = $productService;
    }

    public function index(Request $request)
    {
        $products = Products::activeProducts()->get();
        return response()->json($products);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:1000',
            'unit_price' => 'required|numeric|min:0',
            'quantity' => 'required|numeric|min:0',
        ]);

        $productData = $request->only(['name', 'description', 'unit_price', 'quantity']);

        $product = $this->productService->createProduct($productData);

        return response()->json('Product created!');
    }

    public function update(Request $request, $id)
    {
        $product = Products::find($id);

        if (!$product) {
            return response()->json('Product not found', 404);
        }

        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:1000',
            'unit_price' => 'required|numeric|min:0',
            'quantity' => 'required|numeric|min:0',
        ]);

        $productData = $request->only(['name', 'description', 'unit_price', 'quantity']);

        $product = $this->productService->updateProduct($product, $productData);

        return response()->json('Product info updated');
    }

    public function delete($id)
    {
        $product = Products::find($id);

        if (!$product) {
            return response()->json('Product not found', 404);
        }

        $this->productService->deleteProduct($product);

        return response()->json('Product deleted successfully');
    }
}
