<?php

namespace App\Http\Controllers;

use App\QueryBuilderClass\CustomerQB;
use DB;
use Illuminate\Http\Request;
use Ramsey\Uuid\Uuid;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
        $data = CustomerQB::getAllData();
        return makeReturnJson(true, $data);
    }

    public function details(Request $request, $id)
    {
        //get selected data
        $dataCustomer = CustomerQB::getSelectedData($id);
        $dataHistory = CustomerQB::getIndenHistory($id);
        $data = array(
            "customer_detail" => $dataCustomer,
            "history" => $dataHistory,
        );

        if (!$dataCustomer) {
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
                'uuid_customer' => 'required',
                'no_telp' => 'required|numeric',
                'nama' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare
            $data = [
                'uuid_customer' => $request->uuid_customer,
                'no_telp' => $request->no_telp,
                'nama' => $request->nama,
                'alamat' => $request->alamat,
            ];

            // insert
            DB::beginTransaction();
            $execute = CustomerQB::insert($request->header('id_user'), $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menambahkan Customer", 200);
            }
            DB::commit();
            return makeReturnJson(true, "Customer berhasil ditambahkan", 200);
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
                'uuid_customer' => 'required',
                'no_telp' => 'required|numeric',
                'nama' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare
            $data = [
                'no_telp' => $request->no_telp,
                'nama' => $request->nama,
                'alamat' => $request->alamat,
            ];

            // update
            DB::beginTransaction();
            $execute = CustomerQB::update($request->header('id_user'), $request->uuid_customer, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah customer", 200, '27b7fc3c-18c8-11ec-9621-0242ac130002');
            }
            DB::commit();
            return makeReturnJson(true, "Customer berhasil diubah", 200);
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
                'uuid_customer' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            // make active = 0
            $data = [
                'is_active' => 0,
            ];

            DB::beginTransaction();
            $execute = CustomerQB::delete($request->header('id_user'), $request->uuid_customer, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menghapus Customer", 200);
            }
            DB::commit();
            return makeReturnJson(true, "Customer berhasil dihapus", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }

    public function setInden(Request $request)
    {
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [
                'uuid_customer' => 'required',
                'jumlah' => 'required|numeric',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            DB::beginTransaction();

            // update customer table
            $data = [
                'inden' => $request->jumlah,
            ];
            $execute = CustomerQB::update($request->header('id_user'), $request->uuid_customer, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah data inden customer", 200, "93904422-15c7-11ec-82a8-0242ac130003");
            }

            // add history inden
            $uuid_task_history = Uuid::uuid4()->toString();
            $jumlahString = number_format($request->jumlah);
            $keterangan = $request->header('username') . " Mengubah data inden menjadi $jumlahString";
            $data = [
                'uuid_inden_history' => $uuid_task_history,
                'uuid_customer' => $request->uuid_customer,
                'total' => $request->jumlah,
                'keterangan' => $keterangan,
            ];
            $data['uuid_customer'] = $request->uuid_customer;
            $execute = CustomerQB::addIndenHistory($request->header('id_user'), $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah data inden customer", 200, "9b01d95a-15c7-11ec-82a8-0242ac130003");
            }

            DB::commit();
            return makeReturnJson(true, "Data Inden berhasil diubah", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }

    }
}
