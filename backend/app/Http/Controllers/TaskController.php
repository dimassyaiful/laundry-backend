<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\QueryBuilderClass\TaskQB;
use App\QueryBuilderClass\UserQB;
use Ramsey\Uuid\Uuid;
use DB;

class TaskController extends Controller
{
    public function index(Request $request)
    {
        $status_id = $request->status_id;
        $except_status_id = $request->except_status_id;
        $handle_by = $request->handle_by;

        $data = TaskQB::getAllData($status_id, $handle_by,$except_status_id);
        return makeReturnJson(true, $data);
    }

    public function details(Request $request, $id)
    {
        //get selected data
        $data = TaskQB::getSelectedData($id); 
        if(!$data){
            makeReturnJson(true, []);
        } 
        
        $historyData = TaskQB::getHistoryData($id); 
        if(!$data){ $historyData =  []; } 
        $dataReturn = [
            'details'=> $data,
            'history'=> $historyData,
        ];

        return makeReturnJson(true, $dataReturn);
    }

    public function insert(Request $request)
    { 
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [ 
                'uuid_task' => 'required',
                'uuid_laundry'=> 'required',
                'id_jenis_laundry' => 'required', 
                'jumlah' => 'required|numeric',
                'uom'    => 'required',
                'harga'  => 'required|numeric',
                'total_harga' => 'required|numeric'
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare 
            $data = [ 
                'uuid_task'         => $request->uuid_task,
                'uuid_laundry'      => $request->uuid_laundry,
                'id_jenis_laundry'  => $request->id_jenis_laundry, 
                'jumlah'            => $request->jumlah,
                'uom'               => $request->uom,
                'harga'             => $request->harga,
                'total_harga'       => $request->total_harga
            ];

            $uuid_task_history = Uuid::uuid4()->toString();
            $keterangan = "List Cucian Telah Ditambahkan";
            $dataHistory = [ 
                'uuid_task_history' => $uuid_task_history,
                'uuid_task'         => $request->uuid_task,
                'status_from'       => null,
                'status_to'         => 0, 
                'keterangan'        => $keterangan
            ];

            DB::beginTransaction();

            // insert task
            $execute = TaskQB::insert($request->header('id_user'), $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menambahkan List Cucian", "5b6973f8-1698-11ec-9621-0242ac130002");
            }

            // insert task history 
            $execute = TaskQB::insertHistory($request->header('id_user'), $dataHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menambahkan List Cucian", "96cecc4a-1698-11ec-9621-0242ac130002");
            }

            DB::commit();
            return makeReturnJson(true, "List Cucian berhasil ditambahkan", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        } 
    }

    public function update(Request $request)
    { 
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [ 
                'uuid_task' => 'required', 
                'id_jenis_laundry' => 'required', 
                'jumlah' => 'required|numeric',
                'uom'    => 'required',
                'harga'  => 'required|numeric',
                'total_harga' => 'required|numeric',
                'status' => 'required|numeric'
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare  
            $uuid_task = $request->uuid_task;
            $data = [  
                'id_jenis_laundry'  => $request->id_jenis_laundry, 
                'jumlah'            => $request->jumlah,
                'uom'               => $request->uom,
                'harga'             => $request->harga,
                'total_harga'       => $request->total_harga
            ];
            
            $uuid_task_history = Uuid::uuid4()->toString();
            $keterangan = "Detail List Cucian Berhasil Diubah";
            $dataHistory = [ 
                'uuid_task_history' => $uuid_task_history,
                'uuid_task'         => $request->uuid_task,
                'status_from'       => $request->status,
                'status_to'         => $request->status, 
                'keterangan'        => $keterangan
            ];

            DB::beginTransaction();

            // insert task
            $execute = TaskQB::update($request->header('id_user'), $uuid_task, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah detail List Cucian", "2a094166-169e-11ec-9621-0242ac130002");
            }

            // insert task history 
            $execute = TaskQB::insertHistory($request->header('id_user'), $dataHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah detail List Cucian", "2deb9a40-169e-11ec-9621-0242ac130002");
            }
 
            DB::commit();
            return makeReturnJson(true, "List Cucian berhasil diubah", 200);
        } catch (\Exception $e) { 
            return makeReturnJson(false, $e->getMessage());
        } 
    }

    
    public function delete(Request $request)
    {
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [
                'uuid_task' => 'required' , 

            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            } 

            // make active = 0
            $data = [
                'is_active' => 0 
            ];

            $uuid_task_history = Uuid::uuid4()->toString();
            $keterangan = "List Cucian Berhasil Dihapus";
            $dataHistory = [ 
                'uuid_task_history' => $uuid_task_history,
                'uuid_task'         => $request->uuid_task,  
                'keterangan'        => $keterangan
            ];

            DB::beginTransaction();
            //hapus data task
            $execute = TaskQB::delete($request->header('id_user'),$request->uuid_task, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menghapus Task", 200, "f55ddeea-16a2-11ec-9621-0242ac130002");
            } 

            // insert task history 
            $execute = TaskQB::insertHistory($request->header('id_user'), $dataHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menghapus List Cucian", "5c2dcde2-16a3-11ec-9621-0242ac130002");
            }
            DB::commit();
            return makeReturnJson(true, "Task berhasil dihapus", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }

    public function setStatus(Request $request)
    { 
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [ 
                'uuid_task' => 'required',   
                'status_from' => 'required|numeric',
                'status_to' => 'required|numeric', 
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare  
            $uuid_task = $request->uuid_task;
            $data = [   
                'status_task'       => $request->status_to 
            ];
            

            //get status text
            $statusFromText = TaskQB::getStatusText($request->status_from);
            $statusToText   = TaskQB::getStatusText($request->status_to);
            $uuid_task_history = Uuid::uuid4()->toString();
            $keterangan = "Update status dari '$statusFromText' ke '$statusToText'";
            $dataHistory = [ 
                'uuid_task_history' => $uuid_task_history,
                'uuid_task'         => $request->uuid_task,
                'status_from'       => $request->status_from,
                'status_to'         => $request->status_to, 
                'keterangan'        => $keterangan
            ];

            DB::beginTransaction();

            // insert task
            $execute = TaskQB::update($request->header('id_user'), $uuid_task, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah status List Cucian", "24c5b5d4-16a5-11ec-9621-0242ac130002");
            }

            // insert task history 
            $execute = TaskQB::insertHistory($request->header('id_user'), $dataHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah status List Cucian", "30962862-16a5-11ec-9621-0242ac130002");
            }
 
            DB::commit();
            return makeReturnJson(true, "Status List Cucian berhasil diubah", 200);
        } catch (\Exception $e) { 
            return makeReturnJson(false, $e->getMessage());
        } 
    }

    public function handover(Request $request)
    { 
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [ 
                'uuid_task' => 'required',   
                'id_user' => 'required|numeric',
                'status' => 'required'
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare  
            $uuid_task = $request->uuid_task;
            $data = [   
                'id_user'       => $request->id_user 
            ];
            

            //get status text
            $username = UserQB::getUsername($request->id_user); 
            if(!$username){
                return makeReturnJson(false, "User tidak ditemukan", 200, '5db40e2e-16a8-11ec-9621-0242ac130002'); 
            }
            $uuid_task_history = Uuid::uuid4()->toString();
            $keterangan = "Handover task ke $username";
            $dataHistory = [ 
                'uuid_task_history' => $uuid_task_history,
                'uuid_task'         => $request->uuid_task,
                'status_from'       => $request->status,
                'status_to'         => $request->status, 
                'keterangan'        => $keterangan
            ];

            DB::beginTransaction();

            // insert task
            $execute = TaskQB::update($request->header('id_user'), $uuid_task, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal handover List Cucian", "a75e4620-16a8-11ec-9621-0242ac130002");
            }

            // insert task history 
            $execute = TaskQB::insertHistory($request->header('id_user'), $dataHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal handover List Cucian", "a75e4620-16a8-11ec-9621-0242ac130002");
            }
 
            DB::commit();
            return makeReturnJson(true, "Berhasil Handover List Cucian", 200);
        } catch (\Exception $e) { 
            return makeReturnJson(false, $e->getMessage());
        } 
    }

    public function setPhoto(Request $request)
    { 
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [ 
                'uuid_task' => 'required',   
                'status' => 'required|numeric'
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }
            
            if(EMPTY($request->file('photo'))){ 
                return makeReturnJson(false, 'File Tidak Ditemukan', 400);
            }

            // Upload Gambar
            $file = $request->file('photo'); 
            $tipe = $file->getClientOriginalExtension();   
            $allowedTypeFile = ['jpg','jpeg','png'];
            if(!in_array($tipe,$allowedTypeFile)){
                return makeReturnJson(false, 'Format Image Not Allowed', 400);
            }
            $destinationPath = 'upload/task/';
            $file_name = $request->uuid_task.Date('d-m-Y H-i-s').'.'.$tipe;   
            $file->move($destinationPath,$file_name);
            $valuePhoto = $destinationPath.$file_name;
            
            //prepare  
            $uuid_task = $request->uuid_task;
            $data = [  
                'photo'  => $valuePhoto,
            ];
            
            $uuid_task_history = Uuid::uuid4()->toString();
            $keterangan = "Mengubah data foto";
            $dataHistory = [ 
                'uuid_task_history' => $uuid_task_history,
                'uuid_task'         => $request->uuid_task,
                'status_from'       => $request->status,
                'status_to'         => $request->status, 
                'keterangan'        => $keterangan
            ];

            DB::beginTransaction();

            // insert task
            $execute = TaskQB::update($request->header('id_user'), $uuid_task, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengupload gambar", "746cea10-c7e6-11ec-9d64-0242ac120002");
            }

            // insert task history 
            $execute = TaskQB::insertHistory($request->header('id_user'), $dataHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah detail List Cucian", "7a66fc62-c7e6-11ec-9d64-0242ac120002");
            }
 
            DB::commit();
            return makeReturnJson(true, "List Cucian berhasil diubah", 200);
        } catch (\Exception $e) { 
            return makeReturnJson(false, $e->getMessage());
        } 
    }

}