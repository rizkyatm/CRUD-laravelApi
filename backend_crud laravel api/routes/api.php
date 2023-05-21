<?php

use App\Http\Controllers\guruApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('/guru',[guruApiController::class,'index']);//menampilakan semua data
Route::get('/guru/{id}',[guruApiController::class,'show']);//menampilkan data sesuai id
Route::post('/guru',[guruApiController::class,'store']);//menambah data baru
Route::put('/guru/{id}',[guruApiController::class,'update']);//mengedit data 
Route::delete('/guru/{id}',[guruApiController::class,'destroy']);//menghapus data sesuai id 
