<?php

namespace Definiciones;

if (!empty ($_GET['profesor']))
{
    $profesor = unserialize($_GET['profesor']);

    var_dump($_GET['profesor']);
    echo '<br>';
    var_dump($profesor);
}
?>