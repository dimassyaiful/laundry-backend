<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\QueryBuilderClass\CustomerQB;
use DB;

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
        $data = CustomerQB::getSelectedData($id); 
        if(!$data){
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
                'no_telp'  => 'required|numeric',
                'nama'     => 'required'
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare 
            $data = [ 
                'uuid_customer' => $request->uuid_customer,
                'no_telp'  => $request->no_telp,
                'nama'     => $request->nama,
                'alamat'  => $request->alamat, 
            ];

            // insert jenis laundry
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
                'no_telp'  => 'required|numeric',
                'nama'     => 'required'
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            }

            //prepare 
            $data = [  
                'no_telp'  => $request->no_telp,
                'nama'     => $request->nama,
                'alamat'  => $request->alamat, 
            ];

            // update
            DB::beginTransaction();
            $execute = CustomerQB::update($request->header('id_user'), $request->uuid_customer, $data);
            if (!$execute) {
                DB::rollBack();
                return makeReturnJson(false, "Maaf, gagal mengubah customer", 200);
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
                'uuid_customer' => 'required' 
            ]);

            if ($validator->fails()) {
                $messages = $validator->errors();
                return makeReturnJson(false, $validator->errors()->first(), 400);
            } 

            // make active = 0
            $data = [
                'is_active' => 0 
            ];

            DB::beginTransaction();
            $execute = CustomerQB::delete($request->header('id_user'),$request->uuid_customer, $data);
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
}
