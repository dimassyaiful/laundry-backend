<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; 
use DB;
use Crypt;
use DateTime;

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
        
        //get data user
        $user = DB::table('user')->where('username', $request->username)->first(); 
        if(!$user){
            return makeReturnJson(false,"User tidak ditemukan",401); 
        }

        //verify password
        $passwordHash = $user->password;
        $verify = password_verify($request->password, $passwordHash); 
        if($verify===false){ 
            return makeReturnJson(false,"Password salah",401);  
        }

        //generate token
        $key = rand(100000,500000); //generate number text
        $encrypted = password_hash($key, PASSWORD_BCRYPT); 

        //get now date and date for expired password
        $loginDate = (new DateTime())->format('Y-m-d H:i:s');
        $expiredDate = (new DateTime('+1day'))->format('Y-m-d H:i:s'); 
 
        //delete & insert to passport table
        try {
            DB::table('passport')->where('username', '=', $request->username)->delete();
            DB::table('passport')->insert([
                'id_user' => $user->id_user,
                'username' => $user->username,
                'passport' => $encrypted,
                'last_login' => $loginDate,
                'expiry_date' => $expiredDate,
            ]);

             
            $session = [
                'passport'=>$encrypted
            ];
            return makeReturnJson(true,$session,200);  
        } catch (\Exception $e) {
            return makeReturnJson(false,$e->getMessage(),500);  
        } 
    }

    public function logout(Request $request){
        $headerUsername = $request->header('username');
        try {
            DB::table('passport')->where('username', '=', $headerUsername)->delete();
            return makeReturnJson(true,"Logout Berhasil",200);   
        } catch (\Exception $e) {
            return makeReturnJson(false,$e->getMessage(),500);  
        }
    }

    
    public function refreshPassport(Request $request){
        $headerUsername = $request->header('username');
        $headerPassport = $request->header('passport'); 

        //get Data passport
        $passport = DB::table('passport') 
            ->where('username', $headerUsername)
            ->where('passport', $headerPassport)
            ->first(); 
        
        //generate token
        $key = rand(100000,500000); //generate number text
        $encrypted = password_hash($key, PASSWORD_BCRYPT); 
            
        //get date for expired passpord 
        $expiredDate = (new DateTime('+1day'))->format('Y-m-d H:i:s');  

        try { 
            DB::table('passport')->where('username', '=', $headerUsername)->delete();
            DB::table('passport')->insert([
                'id_user' => $passport->id_user,
                'username' => $passport->username,
                'passport' => $encrypted,
                'last_login' => $passport->last_login,
                'expiry_date' => $expiredDate,
            ]);

            $session = [
                'passport'=>$encrypted
            ];  

            return makeReturnJson(true,$session,400);    
        } catch (\Exception $e) {
            return makeReturnJson(false,$e->getMessage(),500);  
        }
    }
}
