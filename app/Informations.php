<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Informations extends Model
{
    protected $fillable = [
        'name', 'surname', 'phone_number', 'city', 'street','house_number'
    ];
}
