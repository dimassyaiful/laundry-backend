<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->get('foo', function () {
    return 'Hello World';
});

// $router->get('/module', 'ModulController@index');


//router module auth 
$router->post('auth/login', 'AuthController@login');
$router->group(['prefix' => 'auth','middleware' => 'passport'], function () use ($router) {
    $router->post('/logout', 'AuthController@logout');
    $router->post('/refreshPassport', 'AuthController@refreshPassport');
});

//router modul passport
$router->group(['prefix' => 'api/module','middleware' => 'passport'], function () use ($router) {
    $router->get('/data', 'ModulController@index');
});
