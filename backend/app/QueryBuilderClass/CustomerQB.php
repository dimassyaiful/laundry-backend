<?php
namespace App\QueryBuilderClass;

use DB;
use Log;

class CustomerQB
{

    private static $tb = "customer";  
    private static $tbIndenHistory = "customer_inden_history";  

    public static function getAllData()
    {
        $tb = self::$tb . " as c"; 
        try {
            $data = DB::table($tb)
                ->select( 
                    'c.uuid_customer',
                    'c.no_telp',
                    'c.nama',
                    'c.alamat',
                    'c.inden',
                    'c.update_at',
                    'c.update_by'
                )
                ->where('is_active', 1)  
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
        $tb = self::$tb . " as c"; ; 
        try {
            $data = DB::table($tb)
                ->select(
                'c.uuid_customer',
                'c.no_telp',
                'c.nama',
                'c.alamat',
                'c.inden',
                'c.update_at',
                'c.update_by'
                )
                ->where('c.is_active', 1)  
                ->where('c.uuid_customer', $id)  
                ->first();
            
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function getStatusData($statusString)
    { 
        $statusArr = explode(',', $statusString);
        $tb = self::$tbStatus . " as s"; 
        try {
            $data = DB::table($tb)
                ->select(
                    's.id_status',
                    's.keterangan',
                    's.icon_material as icon',
                ) 
                ->whereIn('id_status', $statusArr)
                ->orderByRaw("FIELD(id_status,$statusString)")
                ->get();
            
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

    public static function update($userInput, $id, $data)
    {
        $updateInfo = getUpdateInfo($userInput);
        $updateData = array_merge($data, $updateInfo); 
        try {
            return DB::table(self::$tb)
                ->where('uuid_customer', $id)
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

    
    public static function addIndenHistory($userInput, $data)
    {
        $insertInfo = getInsertUpdateInfo($userInput);
        $insertData = array_merge($data, $insertInfo);
        try {
            return DB::table(self::$tbIndenHistory)->insert($insertData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }
     
 
}
