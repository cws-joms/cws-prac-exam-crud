<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('dashboard');
    }

    public function manage_users()
    {
        return view('dashboard_users');
    }

    public function manage_customers()
    {
        return view('dashboard_customers');
    }

    public function manage_products()
    {
        return view('dashboard_products');
    }

    public function view_transactions()
    {
        return view('dashboard_customers_transactions');
    }

}
