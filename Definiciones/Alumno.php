<?php

namespace Definiciones;

use \DateTime;

final class Alumno extends Individuo
{
    static $n = 0;

    protected $direccion;
    protected $telefono;
    protected $matriculas;
    protected $date;

    public function __construct(string $dni, string $nombre, string $email, string $direccion, int $telefono)
    {
        parent::__construct($dni, $nombre, $email);
        $this->$direccion = $direccion;
        $this->telefono = $telefono;
        $this->date = new DateTime();
        $this->matriculas = [];

        self::$n++;
    }

    public function __destruct()
    {
        self::$n--;
    }
}