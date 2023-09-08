<?php
// app/Services/UserService.php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserService
{
    public function createUser(array $userData)
    {
        // Validation can be moved here if needed
        $user = new User([
            'name' => $userData['name'],
            'email' => $userData['email'],
            'role' => $userData['role'],
            'password' => Hash::make($userData['password']),
            'is_deleted' => 0,
            'email_verified_at' => now(),
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $user->save();
        return $user;
    }

    public function updateUser(User $user, array $userData)
    {
        // Validation can be moved here if needed
        $user->update($userData);
        return $user;
    }

    public function deleteUser(User $user)
    {
        $user->is_deleted = 1;
        $user->save();
    }
}
