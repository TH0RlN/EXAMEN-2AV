<?php

namespace Definiciones;

class Profesor extends Individuo
{
    protected mixed $supervisor;
    protected array $cursos;

    public function __construct(string $dni, string $nombre, string $email, mixed $supervisor = null)
    {
        parent::__construct($dni, $nombre, $email);
        $this->supervisor = $supervisor;
        $this->cursos = [];
    }

    public function __serialize(): array
    {
        $data = [];

        $data['dni'] = $this->dni;
        $data['nombre'] = $this->nombre;
        $data['email'] = $this->email;
        $data['supervisor'] = $this->supervisor ? serialize($this->supervisor) : 'null';
        $data['cursos'] = [];

        foreach ($this->cursos as $curso) {
            $data['cursos'][] = serialize($curso);
        }

        return $data;
    }

    public function __unserialize(array $data): void
    {
        $this->dni = $data['dni'];
        $this->nombre = $data['nombre'];
        $this->email = $data['email'];
        $this->supervisor = $data['supervisor'] == 'null' ? null : unserialize($data['supervisor']);

        $cursos = [];

        foreach ($data['cursos'] as $curso) {
            $cursos[] = unserialize($curso);
        }

        $this->cursos = $cursos;
    }

    public function __toString()
    {
        echo 'DNI: ' . $this->dni . '<br>';
        echo 'Nombre: ' . $this->nombre . '<br>';
        echo 'Email: ' . $this->email . '<br>';
        echo 'Supervisor: <br>' . $this->supervisor . '<br>';
        echo 'Cursos: <ul>';
        foreach ($this->cursos as $curso)
        {
            echo '<li>' . $curso . '</li>';
        }
        echo '</ul>';
    }
}