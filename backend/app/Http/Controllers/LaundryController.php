<?php

namespace App\Http\Controllers;

use App\QueryBuilderClass\LaundryQB;
use App\QueryBuilderClass\TaskQB;
use DB;
use Illuminate\Http\Request;
use Ramsey\Uuid\Uuid;

class LaundryController extends Controller
{
    public function index(Request $request)
    {
        $startDate = $request->tanggal_masuk;
        $endDate = $request->tanggal_masuk2;
        $status = $request->status;
        $statusBayar = $request->status_bayar;
        $customerName = $request->customer_name;
        $jenis_laundry = $request->jenis_laundry;
        
        // print_r($request->request);
        // exit;

        if (!$startDate) {
            $startDate = date('Y-m-d', strtotime('today - 30 days'));
        }
        if (!$endDate) {
            $endDate = date('Y-m-d');
        }
            

        $dataStatus = LaundryQB::getAllStatus();
        $listIdStatus = $dataStatus['idStatus'];
        $listKetStatus = $dataStatus['ketStatus'];

        $data = LaundryQB::getAllData($startDate, $endDate, $status, $statusBayar, $customerName);
        $returnData = [];
        foreach ($data as $key => $val) {
            $dataLaundry = $val;

            // Cari Task 
            $dataTask = TaskQB::getListTaskLaundry($val->uuid_laundry,$jenis_laundry); 

            if(isset($jenis_laundry) && $jenis_laundry != ''){
                $count = 0;
                foreach ($dataTask as $row) {
                    if($row->id_jenis_laundry == $jenis_laundry){
                        $count = 1;
                    }
                }
                if($count < 1){
                    continue;
                }
            }

            // Cari Status laundry
            $idx = array_search($dataLaundry->status_laundry, $listIdStatus);
            $statusLaundry = $listKetStatus[$idx];

            // Cari Status Bayar
            $idx = array_search($dataLaundry->status_bayar, $listIdStatus);
            $statusBayar = $listKetStatus[$idx];

            $dataLaundry->task_data = $dataTask;
            $dataLaundry->status_laundry_ket = $statusLaundry;
            $dataLaundry->status_bayar_ket = $statusBayar;
            array_push($returnData, $dataLaundry);
        }
        return makeReturnJson(true, $returnData);
    }

    public function getDataLaporan(Request $request)
    {
        $startDate = $request->tanggal_masuk;
        $endDate = $request->tanggal_masuk2;
        $status = $request->status;
        $statusBayar = $request->status_bayar;
        $customerName = $request->customer_name;
        $jenis_laundry = $request->jenis_laundry; 

        if (!$startDate) {
            $startDate = date('Y-m-d', strtotime('today - 30 days'));
        }
        if (!$endDate) {
            $endDate = date('Y-m-d');
        } 

        $data = LaundryQB::getAllReport($startDate, $endDate, $status, $statusBayar, $customerName,$jenis_laundry); 
        return makeReturnJson(true, $data);
    }

    public function getAllStatus(Request $request)
    {
        //get selected data laundry
        $data = LaundryQB::getStatus();
        if (!$data) {
            makeReturnJson(true, []);
        }
        return makeReturnJson(true, $data);
    }

    public function details(Request $request, $id)
    {
        //get selected data laundry
        //get task
        $dataLaundry = LaundryQB::getSelectedData($id);
        $dataTask = TaskQB::getListTaskLaundry($id);

        $data = [
            'laundry' => $dataLaundry,
            'task' => $dataTask,
        ];

        if (!$data) {
            makeReturnJson(true, []);
        }

        return makeReturnJson(true, $data);
    }

    public function insert(Request $request)
    {
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [
                'laundryData' => 'required',
                'taskData' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare
            $dataLaundry = $request->laundryData;
            $idLaundry = LaundryQB::getMaxid() + 1;
            $dataLaundry['id'] = $idLaundry;  


            $dataTask = $request->taskData;
            $keterangan = "Laundry Baru Telah Ditambahkan";
            $uuid_task_history = Uuid::uuid4()->toString();
            $dataLaundryHistory = [ 
                'uuid_laundry_history' => $uuid_task_history,
                'uuid_laundry' => $dataLaundry['uuid_laundry'],
                'keterangan' => $keterangan,
            ]; 

            DB::beginTransaction();

            // insert Laundry
            $execute = LaundryQB::insert($request->header('id_user'), $dataLaundry);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menambahkan Laundry", "602a6a80-18c5-11ec-9621-0242ac130002");
            }
            $execute = LaundryQB::insertHistory($request->header('id_user'), $dataLaundryHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menambahkan History Laundry", "66dcd19c-18c5-11ec-9621-0242ac130002");
            }

            // insert task & history
            foreach ($dataTask as $rows) {
            $row = json_decode($rows,true);  
                $uuid_task_history = Uuid::uuid4()->toString();
                $dataHistory = [
                    'uuid_task_history' => $uuid_task_history,
                    'uuid_task' => $row['uuid_task'],
                    'status_from' => null,
                    'status_to' => 0,
                    'keterangan' => "List Cucian Telah Ditambahkan",
                ]; 

                // insert task
                $execute = TaskQB::insert($request->header('id_user'), $row);
                if (!$execute) {
                    DB::rollBack();
                    return makeReturnJson(false, "Maaf, gagal menambahkan List Cucian", "8812c730-18c6-11ec-9621-0242ac130002");
                }

                // insert task History
                $execute = TaskQB::insertHistory($request->header('id_user'), $dataHistory);
                if (!$execute) {
                    DB::rollBack();
                    return makeReturnJson(false, "Maaf, gagal menambahkan History List Cucian", "9170d8da-18c6-11ec-9621-0242ac130002");
                }
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
                'uuid_laundry' => 'required',
                'uuid_customer' => 'required',
                'tanggal_masuk' => 'required',
                'status_bayar' => 'required|numeric',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare
            $data = [
                'uuid_customer' => $request->uuid_customer,
                'tanggal_masuk' => $request->tanggal_masuk,
                'tanggal_keluar' => $request->tanggal_keluar,
                'status_bayar' => $request->status_bayar,
            ];

            $keterangan = "Detail Laundry Berhasil Diubah";
            $uuid_task_history = Uuid::uuid4()->toString();
            $dataLaundryHistory = [
                'uuid_laundry_history' => $uuid_task_history,
                'uuid_laundry' => $request->uuid_laundry,
                'keterangan' => $keterangan,
            ];

            // update
            DB::beginTransaction();
            $execute = LaundryQB::update($request->header('id_user'), $request->uuid_laundry, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah detail laundry", 200, '104956e0-18c8-11ec-9621-0242ac130002');
            }

            // insert task history
            $execute = LaundryQB::insertHistory($request->header('id_user'), $dataLaundryHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah detail List Cucian", "1d403968-18c8-11ec-9621-0242ac130002");
            }
            DB::commit();
            return makeReturnJson(true, "Detail Laundry berhasil diubah", 200);
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
                'uuid_laundry' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            // make active = 0
            $data = [
                'is_active' => 0,
            ];

            $uuid_task_history = Uuid::uuid4()->toString();
            $keterangan = "Laundry Berhasil Dihapus";
            $dataLaundryHistory = [
                'uuid_laundry_history' => $uuid_task_history,
                'uuid_laundry' => $request->uuid_laundry,
                'keterangan' => $keterangan,
            ];

            DB::beginTransaction();
            //hapus data task
            $execute = LaundryQB::delete($request->header('id_user'), $request->uuid_laundry, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menghapus Laundry", 200, "53f6fdf6-18c9-11ec-9621-0242ac130002");
            }

            // insert task history
            $execute = LaundryQB::insertHistory($request->header('id_user'), $dataLaundryHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menambahkan history laundry", "68e4bbf4-18c9-11ec-9621-0242ac130002");
            }
            DB::commit();
            return makeReturnJson(true, "Laundry berhasil dihapus", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }
}
