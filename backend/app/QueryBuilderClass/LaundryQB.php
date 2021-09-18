<?php
namespace App\QueryBuilderClass;

use DB;
use Log;

class LaundryQB
{

    private static $tb = "laundry";  
    private static $view = "view_laundry";  
    private static $tbUser = "user";  
    private static $tbHistory = "laundry_history";  
    private static $tbStatus = "status";  

    public static function getAllData()
    {
        $tb = self::$view; 
        try {
            $data = DB::table($tb)
                ->select( 
                    '*'
                )
                ->where('is_active', 1)  
                ->limit(100)
                ->orderBy("update_at", 'desc') 
                ->get(); 
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function getSelectedData($id)
    {
        $tb = self::$view ; 
        try {
            $data = DB::table($tb)
                ->select(
                    '*'
                ) 
                ->where('uuid_laundry', $id)  
                ->first(); 
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    } 

    public static function getHistoryData($taskUuid)
    {
        $tb = self::$tbHistory . " as h";
        $tbUser = self::$tbUser . " as u"; 
        try {
            $data = DB::table($tb)
                ->select(
                    'h.keterangan',
                    'h.insert_at',
                    'u.username as insert_by' 
                )
                ->join($tbUser,'u.id_user','=','h.insert_by')  
                ->where('h.uuid_task', $taskUuid)  
                ->orderBy('h.insert_at','desc')
                ->get(); 
            if(!$data){
                return []; 
            }
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }
  
    public static function insert($userInput, $data)
    {
        $insertInfo = getInsertUpdateInfo($userInput);
        $insertData = array_merge($data, $insertInfo);
        try {
            return DB::table(self::$tb)->insert($insertData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }

    
    public static function insertHistory($userInput, $data)
    {
        $insertInfo = getInsertUpdateInfo($userInput);
        $insertData = array_merge($data, $insertInfo);
        try {
            return DB::table(self::$tbHistory)->insert($insertData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }

    public static function update($userInput, $id, $data)
    {
        $updateInfo = getUpdateInfo($userInput);
        $updateData = array_merge($data, $updateInfo); 
        try {
            return DB::table(self::$tb)
                ->where('uuid_laundry', $id)
                ->update($updateData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }

    public static function delete($userInput, $id, $data)
    {
        $updateInfo = getUpdateInfo($userInput);
        $updateData = array_merge($data, $updateInfo); 
        try {
            return DB::table(self::$tb)
            ->where('uuid_laundry', $id)
            ->update($updateData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }

     
     
 
}
