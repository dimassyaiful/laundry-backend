<?php

namespace App\Http\Middleware;

use Closure;
use DB;
use DateTime;

class Passport
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // middleware passport disini gunanya untuk mengecek passport
        // apakah akses user sudah bener atau belum

        if (!$request->hasHeader('id_user') || !$request->hasHeader('passport') || !$request->hasHeader('username')) {
            return makeReturnJson(false,"Restricted Access",400); 
        }

        $headerUsername = $request->header('username');
        $headerUserId   = $request->header('id_user');
        $headerPassport = $request->header('passport');
        $isRefreshToken = $request->header('refreshPassport');

        $passport = DB::table('passport') 
            ->where('username', $headerUsername)
            ->where('passport', $headerPassport)
            ->where('id_user', $headerUserId)
            ->first();
        
        // jika passport tidak ditemukan, mungkin belum login
        if(!$passport){
            return makeReturnJson(false,"Passport Invalid",401);  
        }

        // jika passport ditemukan, cek apakah expired atau tidak
        $date_now       = new DateTime();
        $date_expired   = new DateTime($passport->expiry_date); 
        if (!$isRefreshToken && $date_now > $date_expired) {
            return makeReturnJson(false,"Expired Session",440);  
        }  
        $response = $next($request); 
        return $response;
    }
}
