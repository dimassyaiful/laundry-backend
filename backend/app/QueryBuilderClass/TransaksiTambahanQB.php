<?php
namespace App\QueryBuilderClass;

use DB;
use Log;

class TransaksiTambahanQB
{

    private static $tb_traksaksi = "transaksi_tambahan"; 

    public static function getAllData()
    {
        $tb_traksaksi = self::$tb_traksaksi . " as t"; 
        try {
            $data = DB::table($tb_traksaksi)
                ->select(
                    't.*', )
                ->where('t.is_active', 1)  
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
        $tb_traksaksi = self::$tb_traksaksi . " as t"; 
        try {
            $data = DB::table($tb_traksaksi)
                ->select('t.*')
                ->where('t.is_active', 1) 
                ->where('t.uuid', '=', $id) 
                ->first();
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function insert($Input, $data)
    {
        $insertInfo = getInsertUpdateInfo($Input);
        $insertData = array_merge($data, $insertInfo);
        try {
            return DB::table(self::$tb_traksaksi)->insert($insertData);
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
            return DB::table(self::$tb_traksaksi)
                ->where('uuid', $id)
                ->update($updateData);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return false;
        }
    }
 
}