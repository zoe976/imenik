<?php

namespace App\Http\Controllers;

use App\Informations;
use App\Http\Resources\InformationResource;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

use Validator;

class InformationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
       //$this->middleware('auth:api');
    }
    
    //kreira podatke
    public function create(Request $request)
    {
       
        $error_message =  'Potrebno je popuniti sva polje.';
        //Log::info($request);
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'surname' => 'required|string|max:255',
            'phone_number' => 'required|string|max:255 ',
            'city' => 'required|string|max:255',
            'street' => 'required|string|max:255',
            'house_number' => 'required|max:255',
        ]);

        if ($validator->fails())
        {
            return json_encode(["status"=>0, "error" => $error_message]);
        }else
        {
            $information = Informations::create([
                'name' => $request->name,
                'surname' => $request->surname,
                'phone_number' => $request->phone_number,
                'city' => $request->city,
                'street' => $request->street,
                'house_number' => $request->house_number,
            ]);
            return new InformationResource($information);
        }
        
    }

    //vraca podatke za tabelu
    public function getTableInformations(Request $request)
    {
       // Log::info($request);
        if(isset($request->filter))
        {
           
            $informations = Informations::where('name', "LIKE", '%'.$request->filter.'%')
            ->orWhere('surname', "LIKE", '%'.$request->filter.'%')
            ->orWhere('phone_number', "LIKE", '%'.$request->filter.'%')
            ->orWhere('city', "LIKE", '%'.$request->filter.'%')
            ->orWhere('street', "LIKE", '%'.$request->filter.'%')
            ->orWhere('house_number', "LIKE", '%'.$request->filter.'%');
        }else
        {
            $informations=  DB::table('informations');
        }
      

        if (is_null($request->sort))
        {
            $informations = $informations->orderBy('id', 'desc')->paginate($request->per_page);
        }else
        {
         $sort = $request->get('sort', $request->sort);
         $sort = explode('|', $sort);
         $informations = $informations->orderBy($sort[0], $sort[1])->paginate($request->per_page);
        }

        return $informations;

    }

    //edituje podatke
    public function edit(Request $request)
    {
         $error_message =  'Potrebno je popuniti sva polje.';
        //Log::info($request);
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'surname' => 'required|string|max:255',
            'phone_number' => 'required|string|max:255 ',
            'city' => 'required|string|max:255',
            'street' => 'required|string|max:255',
            'house_number' => 'required|max:255',
        ]);

         if ($validator->fails())
        {
            return json_encode(["status"=>0, "error" => $error_message]);
        }else
        {
            $information = Informations::findOrFail($request->id);
            //Log::info($request);

            $information->name = $request->informations['name'];
            $information->surname = $request->informations['surname'];
            $information->phone_number = $request->informations['phone_number'];
            $information->city = $request->informations['city'];
            $information->street = $request->informations['street'];
            $information->house_number = $request->informations['house_number'];
            $information->save();

            return new InformationResource($information);
        }
    }


    //brise podatke
    public function delete(Request $request)
    {
        $information = Informations::findOrFail($request->id);
        $inf = $information->delete();
        //Log::info($inf);
        return json_encode(["status"=>$inf]);
    }

    //vraca sredjene podatke za ispis
    public function getInformations()
    {
        $information = DB::table('informations')
                 ->orderBy('city', 'asc')
                 ->orderBy('surname', 'asc')
                 ->orderBy('name', 'asc')
                 ->get();

        $grouped = $information->groupBy(['city', 'surname']);

        //Log::info($grouped);

       return json_encode(["grouped"=>$grouped]);

    }

    //vraca podatke za grafik
    public function getGraficData()
    {
        //$information = Informations::all();
        $data= array();
        $labels = array();

        $information = DB::table('informations')
                 ->select('city', DB::raw('count(*) as total'))
                 ->groupBy('city')
                 ->get();

        //Log::info($information);

        
        return json_encode(["information"=>$information]);
    }

    public function getInformationsForMaps()
    {
        $informations = Informations::all();
       return json_encode(["informations"=>$informations]);

    }


    
}
