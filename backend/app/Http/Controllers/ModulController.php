<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class ModulController extends Controller
{
    function json_return($status, $message = "")
    {
        return response()->json([
            'isSuccess' => $status,
            'message' => $message
        ]);
    }

    public function index()
    {
        try {
            $users = DB::table('modul')->get();
            return $this->json_return(true, $users);
        } catch (\Exception $e) {
            return $this->json_return(false, $e->getMessage());
        }
    }
    //
}
