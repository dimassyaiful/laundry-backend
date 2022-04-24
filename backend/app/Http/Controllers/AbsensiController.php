<?php

namespace App\Http\Controllers;

use App\QueryBuilderClass\AbsensiQB;
use DB;
use Illuminate\Http\Request;

class AbsensiController extends Controller
{
    public function index(Request $request)
    {   
        $data = $request->post();
        $validator = \Validator::make($data, [
            'id_user' => 'required', 
            'tanggal_1' => 'required', 
            'tanggal_2' => 'required', 
        ]);
        if ($validator->fails()) {
            $messages = $validator->errors();
            return makeReturnJson(false, $validator->errors()->first(), 400);
        }

        $id = $request->id_user;
        $date1 = $request->tanggal_1;
        $date2 = $request->tanggal_2;
        $data = AbsensiQB::getAllDataAbsen($id,$date1,$date2);
        return makeReturnJson(true, $data);
    }

    public function hariIni(Request $request)
    {
        
        $data = $request->post();
        $validator = \Validator::make($data, [
            'id_user' => 'required', 
        ]);
        if ($validator->fails()) {
            $messages = $validator->errors();
            return makeReturnJson(false, $validator->errors()->first(), 400);
        }


        $id = $request->id_user;
        $data = AbsensiQB::getAbsenToday($id);
        return makeReturnJson(true, $data);
    }
 

    public function insert(Request $request)
    {
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [
                'id_user' => 'required', 
                'type'=>'required',
                'bssid'=>'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            // cek bssid
            $bssid =  AbsensiQB::getWifi($request->bssid);
            if(!$bssid){
                return makeReturnJson(false, "Mohon connect wifi laundry terlebih dahulu", 200);
            }
            
            // prepare 
            DB::beginTransaction();
            $date = date('Y-m-d');
            $datetime = date('Y-m-d H:i:s');
            $id = $request->id_user;
            $type = $request->type;
            if($type=='checkin'){ 
                $xdata = AbsensiQB::getAbsenToday($id);
                if(!$xdata){
                    $data = [
                        'id_user' => $request->id_user,
                        'tanggal' => $date,
                        'tanggal_masuk' => $datetime, 
                    ];
                    $execute = AbsensiQB::insert($data);
                }else{
                    return makeReturnJson(false, "Anda sudah melakukan check in", 200);
                }
            }else if($type=='checkout'){ 
                $xdata = AbsensiQB::getAbsenToday($id);
                if(!$xdata){
                    return makeReturnJson(false, "data check in tidak ditemukan", 200);
                }else{
                    if($xdata->tanggal_keluar !== null){
                        return makeReturnJson(false, "Anda sudah melakukan check out", 200);
                    }
                    $data = [ 
                        'tanggal_keluar' => date('Y-m-d H:i:s'), 
                    ];
                    $execute = AbsensiQB::update($id,$date,$data);
                }
            }

 
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menambahkan Absensi", 200);
            }
            DB::commit();
            return makeReturnJson(true, "Berhasil", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage(), 500);
        }

    }
  
  
}