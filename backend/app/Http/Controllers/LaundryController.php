<?php

namespace App\Http\Controllers;

use App\QueryBuilderClass\LaundryQB;
use App\QueryBuilderClass\TaskQB;
use App\QueryBuilderClass\JenisLaundryQB;
use App\QueryBuilderClass\CustomerQB;
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
        $lunasDateStart = $request->tanggal_lunas;
        $lunasDateEnd = $request->tanggal_lunas2;

        if (!$startDate) {
            $startDate = date('Y-m-d', strtotime('today - 30 days'));
        }
        if (!$endDate) {
            $endDate = date('Y-m-d');
        } 

        $data = LaundryQB::getAllReport($startDate, $endDate, $status, $statusBayar, $customerName,$jenis_laundry, $lunasDateStart,$lunasDateEnd); 
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
        $dataLaundry->token = password_hash($dataLaundry->uuid_laundry.$dataLaundry->insert_at,PASSWORD_DEFAULT);
        
        $data = [
            'laundry' => $dataLaundry,
            'task' => $dataTask,
        ];

        if (!$data) {
            makeReturnJson(true, []);
        }

        return makeReturnJson(true, $data);
    }

    public function details_web(Request $request, $id)
    {
        //get selected data laundry
        //get task
        $dataLaundry = LaundryQB::getSelectedData($id);
        if(!$dataLaundry){
            return makeReturnJson(false, 'No Data Found', 400);
        }

        $dataTask = TaskQB::getListTaskLaundryWeb($id);  
        
        // phone number encrypt
        $phoneNumber = $dataLaundry->no_telp;
        $a =substr($phoneNumber,0,8);
        $b = str_replace($a,'********',$phoneNumber);
        $dataLaundry->no_telp = $b;
        

        
        // unset property
        $dataLaundry->no_nota = $dataLaundry->id;
        unset($dataLaundry->id);
        unset($dataLaundry->uuid_customer);
        unset($dataLaundry->alamat); 
        unset($dataLaundry->is_active);
        unset($dataLaundry->insert_at);
        unset($dataLaundry->update_at);
        unset($dataLaundry->update_by);

        // data task
        $total_harga = 0;
        foreach ($dataTask as $key => $value) {
            $dataJl = JenisLaundryQB::getSelectedData($value->id_jenis_laundry);
            $statusData = JenisLaundryQB::getStatusDataWeb($dataJl->status_order_array);
            foreach ($statusData as $k => $val) { 
                if($val->id_status == $value->status_id){
                    $statusData[$k]->selected = true;
                }else{
                    $statusData[$k]->selected = false;
                }  
                if($val->id_status == 0){
                    $statusData[$k]->keterangan = "Dalam Antrian";
                } 
                unset($statusData[$k]->icon);
            }
            $dataTask[$key]->status = $statusData;
            $total_harga += (int)$value->total_harga;
            unset($dataTask[$key]->status_id);
            unset($dataTask[$key]->id_jenis_laundry);
        } 

        // total harga
        $dataLaundry->total_harga = $total_harga;
 
        
        $data = [
            'laundry' => $dataLaundry,
            'cucian' => $dataTask,
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
                'status_bayar' => $request->status_bayar, 
                'tanggal_lunas' => $request->tanggal_lunas,
                'tanggal_keluar' => $request->tanggal_keluar,
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

    public function sendWaReceipt(Request $request)
    {
        // validation
        $data = $request->post();
        $validator = \Validator::make($data, [
            'uuid_laundry' => 'required',
            'token' => 'required', 
        ]);

        // get data laundry
        $dataLaundry = LaundryQB::getSelectedData($data['uuid_laundry']);
        if(!$dataLaundry){
            return makeReturnJson(false, 'Data Tidak Ditemukan');
        }

        $dataTask = TaskQB::getListTaskLaundry($data['uuid_laundry']); 
        if(!$dataTask){
            return makeReturnJson(false, 'Data Tidak Ditemukan');
        }

        // Validate Token
        // Token terdiri dari encrypt uuid dan created by
        $verifyCode = $dataLaundry->uuid_laundry.$dataLaundry->insert_at;
        if(!password_verify($verifyCode,$data['token'])){
            return makeReturnJson(false, 'Token Not Valid');
        }

        $phoneNumber = $dataLaundry->no_telp;
        $message = "Hi ".$dataLaundry->nama_customer.", 
berikut Detail Cucian anda : 

No nota: ".$dataLaundry->id."
Tanggal: ".date('d/m/Y', strtotime($dataLaundry->tanggal_masuk));

        // hitung total
        $totalNominal = 0;
        $message .= "
---------------------";
        foreach ($dataTask as $key => $val) {
            $message .= "
Jenis: ".$val->jenis_laundry."
Jumlah: ".$val->jumlah." ".$val->uom."
harga:  Rp. " . number_format($val->harga,0,',','.')."/".$val->uom."
---------------------";
        $totalNominal += $val->total_harga;
        }

        $statusBayar = 'Belum Lunas';
        if($dataLaundry->status_bayar==10){
            $statusBayar = 'Lunas';
        }

        $message .= "
Total Harga : Rp. ".number_format($totalNominal,0,',','.')."
Status Bayar : ".$statusBayar." 
Status : On Progress

Status Pengerjaan Cucian bisa di cek disini
https://sinarcleanlaundry.com/?".$dataLaundry->uuid_laundry."

Terimakasih
- Sinar Clean Laundry - ";

        return $this->sendMessageWa($phoneNumber,$message);
    }

    public function sendWaInfoSelesai(Request $request)
    {
        // validation
        $data = $request->post();
        $validator = \Validator::make($data, [
            'uuid_laundry' => 'required',
            'token' => 'required', 
        ]);

        // get data laundry
        $dataLaundry = LaundryQB::getSelectedData($data['uuid_laundry']);
        if(!$dataLaundry){
            return makeReturnJson(false, 'Data Tidak Ditemukan');
        }

        $dataTask = TaskQB::getListTaskLaundry($data['uuid_laundry']); 
        if(!$dataTask){
            return makeReturnJson(false, 'Data Tidak Ditemukan');
        }

        // Validate Token
        // Token terdiri dari encrypt uuid dan created by
        $verifyCode = $dataLaundry->uuid_laundry.$dataLaundry->insert_at;
        if(!password_verify($verifyCode,$data['token'])){
            return makeReturnJson(false, 'Token Not Valid');
        }

        $phoneNumber = $dataLaundry->no_telp;
        $message = "Hi ".$dataLaundry->nama_customer.",
laundry nya sudah selesai ya :)

Detail Cucian :
No nota: ".$dataLaundry->id."
Tanggal: ".date('d/m/Y', strtotime($dataLaundry->tanggal_masuk));

        // hitung total
        $totalNominal = 0;
        $message .= "
---------------------";
        foreach ($dataTask as $key => $val) {
            $message .= " 
Jenis: ".$val->jenis_laundry."
Jumlah: ".$val->jumlah." ".$val->uom."
harga:  Rp. " . number_format($val->harga,0,',','.')."/".$val->uom."
---------------------";
        $totalNominal += $val->total_harga;
        }

        $statusBayar = 'Belum Lunas';
        if($dataLaundry->status_bayar==10){
            $statusBayar = 'Lunas';
        }

        $message .= "
Total Harga : Rp. ".number_format($totalNominal,0,',','.')."
Status Bayar : ".$statusBayar." 
Status : Selesai

Terimakasih
- Sinar Clean Laundry - ";
 

        return $this->sendMessageWa($phoneNumber,$message);
    }

    public Function sendMessageWa($phoneNumber,$message){
        if(substr($phoneNumber,  0, 2)=='08'){
            $phoneNumber = substr($phoneNumber, 2);
            $phoneNumber = '628'.$phoneNumber;
        }
        $whatsappMsg = urlencode( $message );
        $text = "https://api.whatsapp.com/send?phone=".$phoneNumber."&text=".$whatsappMsg; 
       
        return makeReturnJson(true, $text,200);    
    }

    
    public function gunakanDataInden(Request $request)
    {
        // validation
        $data = $request->post();
        $validator = \Validator::make($data, [
            'uuid_laundry' => 'required',
            'uuid_customer' => 'required', 
        ]);

        if ($validator->fails()) {
            $messages = $validator->errors();
            return makeReturnJson(false, $validator->errors()->first(), 400);
        }
        
        // get data laundry
        $dataLaundry = LaundryQB::getSelectedData($data['uuid_laundry']);
        if(!$dataLaundry){
            return makeReturnJson(false, 'Data Laundry Tidak Ditemukan');
        }

        $inden_from_laundry = $dataLaundry->potongan_inden;
        $userUuid = $dataLaundry->uuid_customer;
        $dataCustomer = CustomerQB::getSelectedData($userUuid);
        if(!$dataCustomer){
            return makeReturnJson(false, 'Data Customer Tidak Ditemukan');
        }
        $inden_from_customer = $dataCustomer->inden;

        //prepare
        $data = [
            'potongan_inden' => $inden_from_customer, 
        ];  
        $uuid_task_history = Uuid::uuid4()->toString();
        $jumlahString = number_format($inden_from_customer);
        $keterangan = $request->header('username') . " menggunakan inden sebanyak $jumlahString untuk laundry dengan no. nota  ".$dataLaundry->id;
        $dataHistory = [
            'uuid_inden_history' => $uuid_task_history,
            'uuid_customer' => $request->uuid_customer,
            'total' => 0,
            'keterangan' => $keterangan,
        ]; 
        try {
            DB::beginTransaction();

            // ubah detail laundry
            $execute = LaundryQB::update($request->header('id_user'), $request->uuid_laundry, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah detail laundry", 200, 'f4b964e4-c973-11ec-9d64-0242ac120002');
            }

            // Ubah detail customer (inden)
            $data = ['inden' => 0 ];
            $execute = CustomerQB::update($request->header('id_user'), $request->uuid_customer, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah data inden customer", 200, "8d9ec18e-c976-11ec-9d64-0242ac120002");
            }

            // insert task history
            $execute = CustomerQB::addIndenHistory($request->header('id_user'), $dataHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah data inden customer", 200, "929e4ee4-c975-11ec-9d64-0242ac120002");
            }
            
            DB::commit();
            return makeReturnJson(true, "Detail Laundry berhasil diubah", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }

    
    public function batal_gunakanDataInden(Request $request)
    {
        // validation
        $data = $request->post();
        $validator = \Validator::make($data, [
            'uuid_laundry' => 'required',
            'uuid_customer' => 'required', 
        ]);

        if ($validator->fails()) {
            $messages = $validator->errors();
            return makeReturnJson(false, $validator->errors()->first(), 400);
        }
        
        // get data laundry
        $dataLaundry = LaundryQB::getSelectedData($data['uuid_laundry']);
        if(!$dataLaundry){
            return makeReturnJson(false, 'Data Laundry Tidak Ditemukan');
        }

        $inden_from_laundry = $dataLaundry->potongan_inden;
        $userUuid = $dataLaundry->uuid_customer;
        $dataCustomer = CustomerQB::getSelectedData($userUuid);
        if(!$dataCustomer){
            return makeReturnJson(false, 'Data Customer Tidak Ditemukan');
        }
        $inden_from_customer = $dataCustomer->inden;
        

        //prepare
        $data = [
            'potongan_inden' => 0, 
        ];  
        $dataCustomer = ['inden' => $inden_from_laundry ];
        $uuid_task_history = Uuid::uuid4()->toString();
        $jumlahString = number_format($inden_from_laundry);
        $keterangan = $request->header('username') . " membatalkan penggunaan inden sebanyak $jumlahString untuk laundry dengan no. nota  ".$dataLaundry->id;
        $dataHistory = [
            'uuid_inden_history' => $uuid_task_history,
            'uuid_customer' => $request->uuid_customer,
            'total' => $inden_from_laundry,
            'keterangan' => $keterangan,
        ]; 
        try {
            DB::beginTransaction();

            // ubah detail laundry
            $execute = LaundryQB::update($request->header('id_user'), $request->uuid_laundry, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah detail laundry", 200, 'f4b964e4-c973-11ec-9d64-0242ac120002');
            }

            // Ubah detail customer (inden)
            $execute = CustomerQB::update($request->header('id_user'), $request->uuid_customer, $dataCustomer);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah data inden customer", 200, "8d9ec18e-c976-11ec-9d64-0242ac120002");
            }

            // insert task history
            $execute = CustomerQB::addIndenHistory($request->header('id_user'), $dataHistory);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah data inden customer", 200, "929e4ee4-c975-11ec-9d64-0242ac120002");
            }
            
            DB::commit();
            return makeReturnJson(true, "Detail Laundry berhasil diubah", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }
}