<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class InformationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
        'id' => $this->id,
        'name' => $this->name,
        'surname' => $this->surname,
        'phone_number' => $this->phone_number,
        'city' => $this->city,
        'street' => $this->street,
        'house_number' => $this->house_number,
        'created_at' => (string)$this->created_at,
        'updated_at' => (string)$this->updated_at,
    ];
    }
}
