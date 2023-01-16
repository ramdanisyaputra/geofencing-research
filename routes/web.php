<?php

use App\Http\Controllers\GeofenceController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('index', [GeofenceController::class, 'index'])->name('index');
Route::get('create', [GeofenceController::class, 'create'])->name('create');
Route::post('store', [GeofenceController::class, 'store'])->name('store');
Route::get('edit/{id}', [GeofenceController::class, 'edit'])->name('edit');
Route::patch('update', [GeofenceController::class, 'update'])->name('update');
