<?php

namespace Definiciones;

trait Trait_fecha
{
    static function addYear(object $obj)
    {
        $obj->date->modify('+1 year');
    }
}