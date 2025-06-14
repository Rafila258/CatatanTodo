<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Models\Task;

class todolistController extends Controller
{
    // Ambil semua tugas milik user
    public function index(Request $request)
    {
        return Task::where('user_id', $request->user()->id)
            ->orderByRaw("FIELD(priority, 'high', 'medium', 'low')")
            ->orderBy('due_date')
            ->get();
    }

    // Simpan tugas baru
    public function store(Request $request): JsonResponse
    {
        $data = $request->validate([
            'title'       => 'required|string',
            'description' => 'nullable|string',
            'priority'    => 'required|in:low,medium,high',
            'due_date'    => 'required|date|after_or_equal:today',
        ]);

        $data['user_id'] = $request->user()->id;
        $data['is_done'] = false;

        $tasks = Task::create($data);

        return response()->json($tasks, 201);
    }

    // Update tugas
    public function update(Request $request, $id): JsonResponse
    {
        $tasks = Task::where('id', $id)
            ->where('user_id', $request->user()->id)
            ->firstOrFail();

        $data = $request->validate([
            'title'       => 'sometimes|required|string',
            'description' => 'nullable|string',
            'priority'    => 'in:low,medium,high',
            'due_date'    => 'nullable|date|after_or_equal:today',
            'is_done'     => 'boolean',
        ]);

        $tasks->update($data);

        return response()->json($tasks);
    }

    // Hapus tugas
    public function destroy(Request $request, $id): JsonResponse
    {
        $tasks = Task::where('id', $id)
            ->where('user_id', $request->user()->id)
            ->firstOrFail();

        $tasks->delete();

        return response()->json(['message' => 'Tugas berhasil dihapus']);
    }
}
