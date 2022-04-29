<?php
namespace App\QueryBuilderClass;

use DB;
use Log;

class TaskQB
{

    private static $tb = "task";  
    private static $view = "view_task";  
    private static $tbUser = "user";  
    private static $tbHistory = "task_history";  
    private static $tbStatus = "status";  

    public static function getAllData($status_id, $handle_by, $except_status_id)
    {
        $tb = self::$view; 
        try {
            $query = DB::table($tb)
                ->select( 
                    '*'
                )
                ->where('is_active', 1);
            if($status_id){
                $query->where('status_id', $status_id);
            }
            if($handle_by){
                $query->where('handle_by_id', $handle_by);
            }
            if($except_status_id){
                $query->where('status_id','<>' ,$except_status_id);
            }

            $query->limit(100)->orderBy("update_at", 'desc');
            $data = $query->get(); 
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }


     
    public static function getListTaskLaundry($uuidLaundry)
    {
        $tb = self::$view; 

        try {
            $query = DB::table($tb)
                ->select(
                    '*'
                )
                ->where('is_active', 1)  
                ->where('uuid_laundry', $uuidLaundry); 
            $data = $query->get(); 

            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function getListTaskLaundryWeb($uuidLaundry)
    {
        $tb = self::$view; 

        try {
            $query = DB::table($tb)
                ->select(
                    'uuid_task',
                    'uuid_laundry',
                    'nama',
                    'jenis_laundry',
                    'id_jenis_laundry',
                    'jumlah',
                    'uom',
                    'harga',
                    'total_harga',
                    'status',
                    'status_id', 
                )
                ->where('is_active', 1)  
                ->where('uuid_laundry', $uuidLaundry); 
            $data = $query->get(); 

            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function getSelectedData($id)
    {
        DB::enableQueryLog();
        $tb = self::$view ; 
        try {
            $query = DB::table($tb)
                ->select(
                    '*'
                ) 
                ->where('uuid_task', $id);
            $data = $query->first(); 
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function getStatusText($id)
    {
        $tb = self::$tbStatus ; 
        try {
            $data = DB::table($tb)
                ->select(
                    'keterangan'
                )  
                ->where('id_status', $id)  
                ->first(); 
            return $data->keterangan;
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
            Log::info($e);
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
                ->where('uuid_task', $id)
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
            ->where('uuid_task', $id)
            ->update($updateData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }

     
     
 
}