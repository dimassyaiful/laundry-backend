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
$router->group(['prefix' => 'auth', 'middleware' => 'passport'], function () use ($router) {
    $router->post('/logout', 'AuthController@logout');
    $router->post('/refreshPassport', 'AuthController@refreshPassport');
});

//router user
$router->group(['prefix' => 'api/user', 'middleware' => 'passport'], function () use ($router) {
    $router->get('/data', 'UserController@index');
    $router->get('/data/{idUser}', 'UserController@userDetails');
    $router->get('/username/{username}', 'UserController@cekUsername');
    $router->post('/insert', 'UserController@userInsert');
    $router->post('/update', 'UserController@userUpdate');
    $router->post('/delete', 'UserController@userDelete');
    $router->post('/updatePassword', 'UserController@userUpdatePassword');
});

//router jenis laundry
$router->group(['prefix' => 'api/jenislaundry', 'middleware' => 'passport'], function () use ($router) {
    $router->get('/data', 'JenisLaundryController@index');
    $router->get('/data/{id}', 'JenisLaundryController@details');
    $router->post('/insert', 'JenisLaundryController@insert');
    $router->post('/update', 'JenisLaundryController@update');
    $router->post('/delete', 'JenisLaundryController@delete');
    $router->get('/status', 'JenisLaundryController@status_laundry');
});

//router Customer
$router->group(['prefix' => 'api/customer', 'middleware' => 'passport'], function () use ($router) {
    $router->get('/data', 'CustomerController@index');
    $router->get('/data/{id}', 'CustomerController@details');
    $router->post('/insert', 'CustomerController@insert');
    $router->post('/update', 'CustomerController@update');
    $router->post('/delete', 'CustomerController@delete');
    $router->post('/setInden', 'CustomerController@setInden');
});

//router Task
$router->group(['prefix' => 'api/task', 'middleware' => 'passport'], function () use ($router) {
    $router->get('/data', 'TaskController@index');
    $router->get('/data/{id}', 'TaskController@details');
    $router->post('/insert', 'TaskController@insert');
    $router->post('/update', 'TaskController@update');
    $router->post('/delete', 'TaskController@delete');
    $router->post('/handover', 'TaskController@handover');
    $router->post('/setStatus', 'TaskController@setStatus');
});

//router laundry
$router->group(['prefix' => 'api/laundry', 'middleware' => 'passport'], function () use ($router) {
    $router->get('/data', 'LaundryController@index');
    $router->get('/data/{id}', 'LaundryController@details');
    $router->post('/insert', 'LaundryController@insert');
    $router->post('/update', 'LaundryController@update');
    $router->post('/delete', 'LaundryController@delete');
    $router->get('/status', 'LaundryController@getAllStatus');
});
