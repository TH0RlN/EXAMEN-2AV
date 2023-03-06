<?php

namespace Definiciones;

class Curso
{
    protected string $nombre;

    public function __construct(string $nombre)
    {
        $this->nombre = $nombre;
    }

    public function __serialize(): array
    {
        $arr = [];
        $arr['nombre'] = $this->nombre;
        return $arr;
    }

    public function __unserialize(array $data): void
    {
        $this->nombre = $data['nombre'];
    }

    public function __toString()
    {
        echo $this->nombre;
    }
}