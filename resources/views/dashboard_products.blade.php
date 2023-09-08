@extends('layouts.app')

@section('content')

<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                @include('partials.sidebar')
            </div>
        </div>
        <div class="col py-3">
            <div id="products" class="mt-4">
                <!-- Vue component for managing products  -->
            </div>
        </div>
    </div>
</div>

@endsection
