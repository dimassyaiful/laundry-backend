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

//router user
$router->group(['prefix' => 'api/user','middleware' => 'passport'], function () use ($router) {
    $router->get('/data', 'UserController@index');
    $router->get('/data/{idUser}', 'UserController@userDetails');
    $router->get('/username/{username}', 'UserController@cekUsername');
    $router->post('/insert', 'UserController@userInsert');
    $router->post('/update', 'UserController@userUpdate');
    $router->post('/delete', 'UserController@userDelete');
});


//router jenis laundry
$router->group(['prefix' => 'api/jenislaundry','middleware' => 'passport'], function () use ($router) {
    $router->get('/data', 'JenisLaundryController@index');
    $router->get('/data/{id}', 'JenisLaundryController@details'); 
    $router->post('/insert', 'JenisLaundryController@insert');
    $router->post('/update', 'JenisLaundryController@update');
    $router->post('/delete', 'JenisLaundryController@delete');
});
