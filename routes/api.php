<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|


 Route::middleware('auth:api')->get('/user', function (Request $request) {
     return $request->user();
 });*/

/*
Route::group([
    'prefix' => 'auth'
], function () {
    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@signup');
  
    Route::group([
      'middleware' => 'auth:api'
    ], function() {
        Route::get('logout', 'AuthController@logout');
        Route::get('user', 'AuthController@user');
    });
});*/

Route::get('get_informations', 'InformationController@getTableInformations');
Route::post('create_information', 'InformationController@create');
Route::post('edit_information', 'InformationController@edit');
Route::post('delete_information', 'InformationController@delete');
Route::get('get_grafic_data', 'InformationController@getGraficData');
Route::get('get_infos', 'InformationController@getInformations');
Route::get('get_map_info', 'InformationController@getInformationsForMaps');

