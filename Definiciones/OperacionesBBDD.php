<?php

namespace Definiciones;

class OperacionesBBDD
{
    protected $nombreBBDD;
    protected $usuario;
    protected $psswd;
    protected $servidor;
    protected $pPDO;

    public function __construct($nombreBBDD, $usuario, $psswd, $servidor)
    {
        $this->nombreBBDD = $nombreBBDD;
        $this->usuario = $usuario;
        $this->psswd = $psswd;
        $this->servidor = $servidor;

        $this->pPDO = new \PDO('mysql:dbname='.$this->nombreBBDD.';host='.$this->servidor, $this->usuario, $this->psswd);
    }

    public function borra_alumno(string $DNI)
    {
        $sql[0] = "DELETE FROM matriculas WHERE Alumno = ?";
        $sql[1] = "DELETE FROM alumnos WHERE DNI = ?";

        try
        {
            $this->pPDO->beginTransaction();

            $prep[0] = $this->pPDO->prepare($sql[0]);
            $prep[0]->execute([$DNI]);

            $prep[1] = $this->pPDO->prepare($sql[1]);
            $prep[1]->execute([$DNI]);

            $this->pPDO->commit();
        }
        catch (\Exception $e)
        {
            $this->pPDO->rollBack();
        }
        finally
        {
            if (isset($prep[0]))
                unset($prep[0]);
            if (isset($prep[1]))
                unset($prep[1]);
        }
    }
}

(new OperacionesBBDD('cursos', 'root', '', 'localhost'))->borra_alumno('111111111');