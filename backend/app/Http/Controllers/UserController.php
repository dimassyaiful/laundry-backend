<?php

namespace App\Http\Controllers;

use App\QueryBuilderClass\UserQB;
use DB;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $userData = UserQB::getAllData();
        return makeReturnJson(true, $userData);
    }

    public function userDetails(Request $request, $idUser)
    {
        $userData = UserQB::getSelectedData($idUser);
        return makeReturnJson(true, $userData);
    }
 
    public function cekUsername(Request $request, $username)
    {
        $userData = UserQB::cekUsername($username);
        $isExists = false;
        if($userData){ 
            //jika ditemukan maka return true
            $isExists = true;
        }
        return makeReturnJson(true, ['isExists'=>$isExists]);
    }

    public function userInsert(Request $request)
    {
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [
                'id_jenis_user' => 'required|int',
                'username' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare
            $defaultPassword = password_hash("12345678", PASSWORD_BCRYPT);
            $userData = [
                'id_jenis_user' => $request->id_jenis_user,
                'username' => $request->username,
                'password' => $defaultPassword,
                'is_active' => 1,
            ];

            // insert user execute
            DB::beginTransaction();
            $execute = UserQB::insert($request->header('id_user'), $userData);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Sorry, username sudah pernah digunakan", 200);
            }
            DB::commit();
            return makeReturnJson(true, "User berhasil didaftarkan", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }

    public function userUpdate(Request $request)
    {
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [
                'id_user' => 'required|numeric',
                'id_jenis_user' => 'required|numeric',
                'username' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare
            $userData = [
                'id_jenis_user' => $request->id_jenis_user 
            ];

            // cek username
            //cek apakah username telah tersedia
            $cekUsername = UserQB::cekUsername($request->username); 
            
            if(!$cekUsername){
                //username belum digunakan
                $userData['username'] = $request->username;
              } else if($cekUsername && $cekUsername->id_user == $request->id_user){
                //username sudah digunakan tapi oleh user itu sendiri
                //skip
              } else if($cekUsername){
                //atau username sudah digunakan
                return makeReturnJson(false, "Maaf, Username sudah digunakan", 200);
              }  
            //if changing password
            if (isset($request->password)) {
                $userData['password'] = password_hash($request->password, PASSWORD_BCRYPT);
            }

            // update user execute
            DB::beginTransaction();
            $execute = UserQB::update($request->header('id_user'), $request->id_user, $userData);
             
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, User gagal diupdate", 200);
            }
            DB::commit();
            return makeReturnJson(true, "User berhasil diupdate", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }

    public function userDelete(Request $request)
    {
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [
                'id_user' => 'required|int' 
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            } 

            // make user active = 0
            $userData = [
                'is_active' => 0 
            ];

            DB::beginTransaction();
            $execute = UserQB::delete($request->header('id_user'),$request->id_user, $userData);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menghapus user", 200);
            }
            DB::commit();
            return makeReturnJson(true, "User berhasil dihapus", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }

}
