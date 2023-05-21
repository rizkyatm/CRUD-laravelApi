<?php

use App\Http\Controllers\guruController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/guru',[guruController::class,'index']);
Route::get('/guru/create',[guruController::class,'create']);
Route::post('/guru',[guruController::class,'store']);
Route::get('/guru/{id}/edit',[guruController::class,'edit']);
Route::put('/guru/{id}',[guruController::class,'update']);
Route::delete('/guru/{id}',[guruController::class,'destroy']);
