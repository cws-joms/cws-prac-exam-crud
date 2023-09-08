<?php

namespace App\Http\Controllers;


use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Services\UserService;

class UsersController extends Controller
{
    private $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function index(Request $request)
    {
        $request = User::activeUsers()->get();
        return response()->json($request);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users|max:255',
            'role' => 'required|string|max:255',
            'password' => 'required|string|min:4',
        ]);

        $userData = $request->only(['name', 'email', 'role', 'password']);

        $user = $this->userService->createUser($userData);

        return response()->json('User created!');
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);

        if (!$user) {
            return response()->json('User not found', 404);
        }

        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'role' => 'required|string|max:255',
            'password' => 'sometimes|string|min:4',
        ]);

        $userData = $request->only(['name', 'email', 'role']);

        if ($request->has('password')) {
            $userData['password'] = Hash::make($request->input('password'));
        }

        $user = $this->userService->updateUser($user, $userData);

        return response()->json('User info updated');
    }

    public function delete($id)
    {
        $user = User::find($id);

        if (!$user) {
            return response()->json('User not found', 404);
        }

        $this->userService->deleteUser($user);

        return response()->json('User deleted successfully');
    }
}