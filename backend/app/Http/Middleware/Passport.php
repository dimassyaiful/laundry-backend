<?php

namespace App\Http\Middleware;

use Closure;

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
        // Pre-Middleware Action

        //main main aja
        $password = '123'; 
        $password_encrypted = password_hash($password, PASSWORD_BCRYPT);
        dd($password_encrypted);

        $response = $next($request);

        // Post-Middleware Action

        return $response;
    }
}
