<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\todolistController;
use App\Http\Middleware\AuthTokenMiddleware;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware([AuthTokenMiddleware::class])->post('/logout', [AuthController::class, 'logout']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/tasks', [todolistController::class, 'index']);
    Route::post('/tasks', [todolistController::class, 'store']);
    Route::put('/tasks/{id}', [todolistController::class, 'update']);
    Route::delete('/tasks/{id}', [todolistController::class, 'destroy']);
});

