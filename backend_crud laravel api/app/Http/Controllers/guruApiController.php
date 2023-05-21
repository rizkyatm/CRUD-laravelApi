<?php

namespace App\Http\Controllers;

use App\Models\Guru;
use Illuminate\Http\Request;

class guruApiController extends Controller
{
    public function index()
    {
        $gurus = Guru::all();
        return response()->json(['message' => 'berhasil', 'data'=> $gurus]);
    }

    public function show($id)
    {
        $guru = Guru::find($id);
        return response()->json(['message' => 'berhasil', 'data'=> $guru]);
    }

    public function store(Request $request)
    {
        $guru = guru::create($request->all());
        return response()->json(['message' => 'berhasil di tambah', 'data'=> $guru]);
    }

    public function update(Request $request, $id)
    {
        $guru = Guru::find($id);
        $guru->update($request->all());
        return response()->json(['message' => 'berhasil di edit', 'data'=> $guru]);
    }

    public function destroy($id)
    {
        $guru = Guru::find($id);
        $guru->delete();
        return response()->json(['message' => 'berhasil di hapus', 'data'=> null]);
    }
    
}
