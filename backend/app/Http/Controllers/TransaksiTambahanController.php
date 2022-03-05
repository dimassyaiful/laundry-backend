<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request; 
use Ramsey\Uuid\Uuid;
use App\QueryBuilderClass\TransaksiTambahanQB;
use DB;

class TransaksiTambahanController extends Controller{
    public function index(Request $request)
    {
        $data = TransaksiTambahanQB::getAllData();
        return makeReturnJson(true, $data);
    }
    public function details(Request $request, $id)
    {
        $data = TransaksiTambahanQB::getSelectedData($id); 
        return makeReturnJson(true, $data);
    }
    public function insert(Request $request)
    {
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [
                'uuid' => 'required',
                'type' => 'required',
                'jumlah' => 'required',
                'tanggal' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare 
            $data = [
                'uuid' => $request->uuid,
                'type' => $request->type,
                'jumlah' => $request->jumlah,
                'tanggal_transaksi' => $request->tanggal,
                'is_active' => 1,
            ]; 

            // insert user execute
            DB::beginTransaction();
            $execute = TransaksiTambahanQB::insert($request->header('id_user'), $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal memasukkan data transaksi", 200);
            }
            DB::commit();
            return makeReturnJson(true, "Transaksi tambahan berhasil ditambahkan", 200);
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
                'uuid' => 'required',
                'type' => 'required',
                'jumlah' => 'required',
                'tanggal' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare 
            $data = [
                'uuid' => $request->uuid,
                'type' => $request->type,
                'jumlah' => $request->jumlah,
                'tanggal_transaksi' => $request->tanggal,
                'is_active' => 1,
            ];  

            // update user execute
            DB::beginTransaction();
            $execute = TransaksiTambahanQB::update($request->header('id_user'), $request->uuid, $data);

            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal update data transaksi tambahan", 200);
            }
            DB::commit();
            return makeReturnJson(true, "Data berhasil diupdate", 200);
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
                'uuid' => 'required',
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
            $execute = TransaksiTambahanQB::update($request->header('id_user'), $request->uuid, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menghapus transaksi tambahan", 200);
            }
            DB::commit();
            return makeReturnJson(true, "Data berhasil dihapus", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }


}