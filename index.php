<?php
declare(strict_types=1);

use \Definiciones\Profesor as profe;

spl_autoload_register(function ($class)
{
    $file = __DIR__ . DIRECTORY_SEPARATOR . str_replace('\\', DIRECTORY_SEPARATOR, $class) . '.php';

    if ($file != "" && file_exists($file))
        require_once $file;
});


$p1 = new profe('1923421', 'Juan', 'email');
$p2 = new profe('1927777', 'Luis', 'email');
$p3 = new profe('1923432', 'Pepe', 'email');

$profesores = [];
$profesores[$p1->get_dni()] = $p1;
$profesores[$p2->get_dni()] = $p2;
$profesores[$p3->get_dni()] = $p3;

if (!empty($_POST['submit']) && !empty($_POST['prof']))
{
    $profesor = serialize($profesores[$_POST['prof']]);

    header('Location: mostrar_datos_profesor.php?profesor=' . $profesor);
}
?>

<form action="<?php htmlspecialchars($_SERVER['PHP_SELF'])?>" method="post">
    <select name="prof">
        <option style="display: none;">Elija un profesor</option>
        <?php foreach ($profesores as $prof)
        {
            echo '<option value="' . $prof->get_dni() . '">' . $prof->get_nombre() . '</option>';
        }?>
    </select>
    <input type="submit" name="submit" value="submit">
</form>