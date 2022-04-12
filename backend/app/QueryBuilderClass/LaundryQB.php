<?php
namespace App\QueryBuilderClass;

use DB;
use Log;

class LaundryQB
{

    private static $tb = "laundry";
    private static $view = "view_laundry";
    private static $viewReport = "view_laundry_report";
    private static $tbUser = "user";
    private static $tbHistory = "laundry_history";
    private static $tbStatus = "status";

    public static function getAllStatus()
    {
        $tb = self::$tbStatus;
        try {
            $data = DB::table($tb)->select('*')->get();
            $statusId = [];
            $statusNama = [];
            foreach ($data as $key => $value) {
                array_push($statusId, $value->id_status);
                array_push($statusNama, $value->keterangan);
            }
            return array(
                'idStatus' => $statusId,
                'ketStatus' => $statusNama,
            );
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function getStatus()
    {
        $tb = self::$tbStatus;
        try {
            $data = DB::table($tb)->select('*')->get();
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            return [];
        }
    }

    public static function getAllData(
        $startDate, 
        $endDate , 
        $status=null, 
        $statusBayar=null, 
        $customerName=null
    ){
        $tb = self::$view;

        try {
            $query = DB::table($tb)
                ->select(
                    '*'
                )
                ->whereDate('tanggal_masuk', '>=', $startDate)
                ->whereDate('tanggal_masuk', '<=', $endDate)
                ->where('is_active', 1)
                ->limit(50)
                ->orderBy("status_laundry", 'asc');

                if(ISSET($status) && $status != ''){
                    $query->where('status_laundry','=',$status);
                }
                if(!EMPTY($statusBayar) && $statusBayar != ''){
                    $query->where('status_bayar','=',$statusBayar);
                } 
                if(!EMPTY($customerName)){
                    $query->where('nama_customer','like','%'.$customerName.'%');
                }
 


            $data = $query->get();
            return $data;
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            showExceptions($e->getMessage());
            return [];
        }
    }

    public static function getAllReport(
        $startDate, 
        $endDate , 
        $status=null, 
        $statusBayar=null,
        $customerName=null,
        $jenis_laundry=NULL,
        $tglLunas=null,
        $tglLunas2=null
    )
    {
        $tb = self::$viewReport;

        try {
            $query = DB::table($tb)
                ->select(
                    '*'
                )
                ->where('is_active', 1) 
                ->orderBy("tanggal_masuk", 'desc');

                if($tglLunas && $tglLunas2){
                    $query->whereDate('tanggal_lunas', '>=', $tglLunas);
                    $query->whereDate('tanggal_lunas', '<=', $tglLunas2);
                }else{
                    $query->whereDate('tanggal_masuk', '>=', $startDate);
                    $query->whereDate('tanggal_masuk', '<=', $endDate);
                }

                if(ISSET($status) && $status != ''){
                    $query->where('status_laundry','=',$status);
                }
                if(!EMPTY($statusBayar) && $statusBayar != ''){
                    $query->where('status_bayar','=',$statusBayar);
                } 
                if(!EMPTY($jenis_laundry) && $jenis_laundry != ''){
                    $query->where('status_bayar','=',$statusBayar);
                } 
                if(!EMPTY($customerName)){
                    $query->where('nama_customer','like','%'.$customerName.'%');
                }


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
        $tb = self::$view;
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

    public static function getMaxid(){
        $tb = self::$tb;
        $data = DB::table($tb)
                ->select(DB::raw('count(id) as count')) 
                ->first();  
        return $data->count;
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
                ->join($tbUser, 'u.id_user', '=', 'h.insert_by')
                ->where('h.uuid_task', $taskUuid)
                ->orderBy('h.insert_at', 'desc')
                ->get();
            if (!$data) {
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