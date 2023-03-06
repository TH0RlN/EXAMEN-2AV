<?php

namespace Definiciones;

use \DateTime;
use \Definiciones\Trait_fecha as miTrait;

class Departamento
{
    protected $id;
    protected $profesores;
    protected $date;

    use miTrait;

    public function __construct($id, $profesores)
    {
        $this->id = $id;
        $this->profesores = $profesores;
        $this->date = new DateTime();
    }
}