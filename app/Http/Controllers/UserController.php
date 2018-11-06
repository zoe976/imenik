<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\User;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function getUser()
    {	
        $user = \Auth::user(); 
       // Log::info($user);
        return json_encode(["user"=>$user]);
    }
}
