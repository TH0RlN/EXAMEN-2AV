<?php

namespace Definiciones;

class Individuo
{
    protected $dni;
    protected $nombre;
    protected $email;

    public function __construct(string $dni, string $nombre, string $email)
    {
        $this->dni = $dni;
        $this->nombre = $nombre;
        $this->email = $email;
    }

    public function get_dni()
    {
        return $this->dni;
    }

    public function get_nombre()
    {
        return $this->nombre;
    }

    public function __serialize(): array
    {
        $data = [];


        $data['dni'] = $this->dni;
        $data['nombre'] = $this->nombre;
        $data['email'] = $this->email;

        return $data;
    }

    public function __unserialize(array $data): void
    {
        $this->dni = $data['dni'];
        $this->nombre = $data['nombre'];
        $this->email = $data['email'];
    }
}