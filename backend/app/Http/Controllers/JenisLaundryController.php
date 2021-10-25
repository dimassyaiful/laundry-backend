<?php

namespace App\Http\Controllers;

use App\QueryBuilderClass\JenisLaundryQB;
use DB;
use Illuminate\Http\Request;

class JenisLaundryController extends Controller
{
    public function index(Request $request)
    {
        $data = JenisLaundryQB::getAllData();
        return makeReturnJson(true, $data);
    }

    public function details(Request $request, $id)
    {
        //get selected data
        $data = JenisLaundryQB::getSelectedData($id);
        if (!isset($data)) {
            return makeReturnJson(true, []);
        }

        //get status data
        $statusData = JenisLaundryQB::getStatusData($data->status_order_array);
        $data->status_order = $statusData;

        return makeReturnJson(true, $data);
    }

    public function insert(Request $request)
    {
        try {
            // validation
            $data = $request->post();
            $validator = \Validator::make($data, [
                'jenis_laundry' => 'required',
                'uom' => 'required',
                'harga_per_uom' => 'required|numeric',
                'status_order_array' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare
            $data = [
                'jenis_laundry' => $request->jenis_laundry,
                'uom' => $request->uom,
                'harga_per_uom' => $request->harga_per_uom,
                'status_order_array' => $request->status_order_array,
            ];

            // insert jenis laundry
            DB::beginTransaction();
            $execute = JenisLaundryQB::insert($request->header('id_user'), $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menambahkan jenis laundry", 200);
            }
            DB::commit();
            return makeReturnJson(true, "Jenis Laundry berhasil ditambahkan", 200);
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
                'id_jenis_laundry' => 'required|numeric',
                'jenis_laundry' => 'required',
                'uom' => 'required',
                'harga_per_uom' => 'required|numeric',
                'status_order_array' => 'required',
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare
            $data = [
                'jenis_laundry' => $request->jenis_laundry,
                'uom' => $request->uom,
                'harga_per_uom' => $request->harga_per_uom,
                'status_order_array' => $request->status_order_array,
            ];

            // update
            DB::beginTransaction();
            $execute = JenisLaundryQB::update($request->header('id_user'), $request->id_jenis_laundry, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah jenis laundry", 200);
            }
            DB::commit();
            return makeReturnJson(true, "Jenis Laundry berhasil diubah", 200);
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
                'id_jenis_laundry' => 'required|int',
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
            $execute = JenisLaundryQB::delete($request->header('id_user'), $request->id_jenis_laundry, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal menghapus Jenis Laundry", 200);
            }
            DB::commit();
            return makeReturnJson(true, "Jenis Laundry berhasil dihapus", 200);
        } catch (\Exception $e) {
            return makeReturnJson(false, $e->getMessage());
        }
    }
}
