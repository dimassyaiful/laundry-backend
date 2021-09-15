<?php
namespace App\QueryBuilderClass;

use DB;
use Log;

class JenisLaundryQB
{

    private static $tb = "jenis_laundry"; 
    private static $tbStatus = "status"; 

    public static function getAllData()
    {
        $tb = self::$tb . " as j"; 
        try {
            $data = DB::table($tb)
                ->select( 
                    'j.id_jenis_laundry',
                    'j.jenis_laundry',
                    'j.uom',
                    'j.update_at',
                    'j.update_by', 
                )
                ->where('j.is_active', 1)  
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
        $tb = self::$tb . " as j"; 
        try {
            $data = DB::table($tb)
                ->select(
                    'j.*'
                )
                ->where('j.is_active', 1) 
                ->where('j.id_jenis_laundry', '=', $id) 
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
            return DB::table('jenis_laundry')
                ->where('id_jenis_laundry', $id)
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
                ->where('id_jenis_laundry', $id)
                ->update($updateData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }
     
 
}
