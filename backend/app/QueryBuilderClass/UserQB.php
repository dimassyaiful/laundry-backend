<?php
namespace App\QueryBuilderClass;

use DB;
use Log;

class UserQB
{

    private static $tb_user = "user";
    private static $tb_jenisUser = "jenis_user";

    public static function getAllData()
    {
        $tb_user = self::$tb_user . " as u";
        $tb_jenisUser = self::$tb_jenisUser . " as j";
        try {
            $user = DB::table($tb_user)
                ->select(
                    'u.id_user',
                    'u.username',
                    'u.is_active',
                    'j.jenis_user')
                ->where('u.is_active', 1)
                ->where('u.id_jenis_user', '<>', 1)
                ->join($tb_jenisUser, 'u.id_jenis_user', '=', 'j.id_jenis_user')
                ->get();
            return $user;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function getSelectedData($idUser)
    {
        $tb_user = self::$tb_user . " as u";
        $tb_jenisUser = self::$tb_jenisUser . " as j";
        try {
            $user = DB::table($tb_user)
                ->select(
                    'u.id_user',
                    'u.username',
                    'u.is_active',
                    'j.jenis_user')
                ->where('u.is_active', 1)
                ->where('u.id_jenis_user', '<>', 1)
                ->where('u.id_user', '=', $idUser)
                ->join($tb_jenisUser, 'u.id_jenis_user', '=', 'j.id_jenis_user')
                ->get();
            return $user;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function cekUsername($username)
    {
        $tb_user = self::$tb_user; 
        try {
            $validation = DB::table($tb_user)
                ->select('id_user', 'username')  
                ->where('username', '=', $username) 
                ->first();
            
            return $validation;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return true;
        }
    }

    public static function insert($userInput, $userData)
    {
        $insertInfo = getInsertUpdateInfo($userInput);
        $insertData = array_merge($userData, $insertInfo);
        try {
            return DB::table('user')->insert($insertData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }

    public static function update($userInput, $userId, $userData)
    {
        $updateInfo = getUpdateInfo($userInput);
        $updateData = array_merge($userData, $updateInfo); 
        try {
            return DB::table('user')
                ->where('id_user', $userId)
                ->update($updateData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }

    
    public static function delete($userInput, $userId, $userData)
    {
        $updateInfo = getUpdateInfo($userInput);
        $updateData = array_merge($userData, $updateInfo); 
        try {
            return DB::table('user')
                ->where('id_user', $userId)
                ->update($updateData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }
}
