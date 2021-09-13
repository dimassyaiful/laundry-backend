<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; 

class AuthController extends Controller
{
    public function login(Request $request){

        // validation         
        $data = $request->post();
        $validator = \Validator::make($data, [
            'username' => 'required',
            'password' => 'required'
        ]);
 
        if ($validator->fails()) { 
            $messages = $validator->errors(); 
            return convertJson(false,$validator->errors()->first());
        }
 
 
    }
}
