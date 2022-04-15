<?php
namespace App\QueryBuilderClass;

use DB;
use Log;

class AbsensiQB
{

    private static $tbAbsensi = "absensi";   
    private static $tbWifi = "wifi";   

    public static function getAllDataAbsen($id_user,$date1, $date2)
    {
        $tb = self::$tbAbsensi; 
        try {
            $data = DB::table($tb)
                ->select( 
                    '*'
                )
                ->where('id_user', $id_user)  
                ->whereDate('tanggal', '>=', $date1)
                ->whereDate('tanggal', '<=', $date2) 
                ->orderBy("tanggal", 'desc')
                ->get(); 
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    
    public static function getAbsenToday($id_user)
    {
        $tb = self::$tbAbsensi; 
        try {
            $data = DB::table($tb)
                ->select( 
                    '*'
                )
                ->where('tanggal', date('Y-m-d')) 
                ->where('id_user', $id_user)  
                ->first();  
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    
    public static function getWifi($bssid)
    {
        $tb = self::$tbWifi; 
        try {
            $data = DB::table($tb)
                ->select( 
                    '*'
                )  
                ->where('bssid', $bssid)  
                ->first(); 
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }
 
  
    public static function insert($data)
    {
        $insertInfo = getInsertUpdateInfo($data['id_user']);
        $insertData = array_merge($data, $insertInfo);
 
        $tb = self::$tbAbsensi; 
        try {
            return DB::table($tb)->insert($insertData);
        } catch (\Exception $e) {
            Log::info($e);
            showExceptions($e->getMessage());
            return false;
        }
    }

    public static function update($id, $date, $data)
    {
        $updateInfo = getUpdateInfo($id);
        $updateData = array_merge($data, $updateInfo);
        $tb = self::$tbAbsensi;
        try {
            return DB::table($tb)
                ->where('id_user', $id)
                ->where('tanggal', $date)
                ->update($data);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage()); 
            return false;
        }
    }

     
 
}