<?php

namespace App\Http\Controllers;

use App\Models\Geofence;
use App\Models\Outlet;
use Illuminate\Http\Request;

class GeofenceController extends Controller
{
    public function index(){

        $data['geofences'] = Geofence::all();
        return view('geofencing-index', $data);
    }

    public function create(){
        $data['outlets'] = Outlet::all();
        return view('geofencing-draw', $data);
    }

    public function store(Request $request){
        // $coordinates = json_decode($request->coordinates);
        Geofence::create([
            'name' => $request->name,
            'coordinates' => $request->coordinates
        ]);

        return redirect(route('index'));
    }

    public function edit($id){
        $data['geofence'] = Geofence::find($id);
        $data['outlets'] = Outlet::all();
        return view('geofencing-update', $data);
    }

    public function update(Request $request){
        Geofence::where('id', $request->id)->update([
            'name' => $request->name,
            'coordinates' => $request->coordinates
        ]);

        return redirect(route('index'));
    }
}
