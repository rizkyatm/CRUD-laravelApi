<?php

namespace App\Http\Controllers;

use App\Models\Guru;
use Illuminate\Http\Request;

class guruController extends Controller
{
    public function index(){
        $gurus = Guru::all();
        return view('guru.index',compact(['gurus']));
    }

    public function create(){
        return view('guru.create');
    }

    public function store(Request $request){
        guru::create($request->all());
        return redirect('/guru');
    }

    public function edit($id){
        $guru = Guru::find($id);
        return view('guru.edit', compact(['guru']) );
    }

    public function update(Request $request, $id){
        $guru = Guru::find($id);
        $guru->update($request->all());
        return redirect('/guru');
    }

    public function destroy($id){
        $guru = Guru::find($id);
        $guru->delete();
        return redirect('/guru');
    }
}
