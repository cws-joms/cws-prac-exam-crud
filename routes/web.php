<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\CustomersController;
use App\Http\Controllers\TransactionsController;
use App\Http\Controllers\ProductsController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

Route::get('/', [DashboardController::class, 'index'])->name('home');
Route::get('/manage-users', [DashboardController::class, 'manage_users'])->name('manage.users');
Route::get('/manage-customers', [DashboardController::class, 'manage_customers'])->name('manage.customers');
Route::get('/manage-products', [DashboardController::class, 'manage_products'])->name('manage.products');
Route::get('/dashboard_customers_transactions/{customer_id}', [DashboardController::class, 'view_transactions'])
    ->name('view.customer.transactions');
    
Route::get('/users', [UsersController::class, 'index'])->name('users');
Route::post('/save_user', [UsersController::class, 'store']);
Route::put('/update_user/{id}', [UsersController::class, 'update']);
Route::put('/delete_user/{id}', [UsersController::class, 'delete']);

Route::get('/customers', [CustomersController::class, 'index'])->name('customers');
Route::post('/save_customer', [CustomersController::class, 'store']);
Route::put('/update_customer/{id}', [CustomersController::class, 'update']);
Route::put('/delete_customer/{id}', [CustomersController::class, 'delete']);

Route::post('/save_transaction', [TransactionsController::class, 'store_transaction']);
Route::get('/transactions/{customer_id}', [TransactionsController::class, 'index'])->name('transactions.index');

Route::get('/products', [ProductsController::class, 'index'])->name('products');
Route::post('/save_product', [ProductsController::class, 'store']);
Route::put('/update_product/{id}', [ProductsController::class, 'update']);
Route::put('/delete_product/{id}', [ProductsController::class, 'delete']);

