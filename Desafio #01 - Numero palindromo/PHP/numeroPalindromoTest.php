<?php
function is_palindrome($number)
{
    if ($number != strrev($number)) {
        return false;
    }
    return true;
}
function is_palindrome2($number)
{
    $digits = strlen($number);
    $half_digits = floor($digits / 2);
    $digit_array = str_split($number);
    
    for ($i = 0; $i < $half_digits; $i++) {
        if ($digit_array[$i] != $digit_array[$digits - $i - 1]) return false;
    }

    return true;
}
// Función para generar un string de dígitos aleatorios
function generarStringAleatorio($longitud) {
    $string = "";
    for ($i = 0; $i < $longitud; $i++) {
        // Generar un dígito aleatorio entre 0 y 9
        $digito = rand(0, 9);
        // Concatenar el dígito al string
        $string .= $digito;
    }
    return $string;
}

// Generar un string de 100 dígitos aleatorios
$stringAleatorio = generarStringAleatorio(10000000);

// Imprimir el string generado
//echo $stringAleatorio;
echo "\n";

$inicioFuncionUno = microtime(true);
is_palindrome($stringAleatorio);
$finFuncionUno = microtime(true);
$tiempoFuncionUno = $finFuncionUno - $inicioFuncionUno;

// Medir el tiempo de ejecución de la función 2
$inicioFuncionDos = microtime(true);
is_palindrome2($stringAleatorio);
$finFuncionDos = microtime(true);
$tiempoFuncionDos = $finFuncionDos - $inicioFuncionDos;

// Comparar los tiempos de ejecución
echo "Tiempo de ejecución de la Función 1: " . $tiempoFuncionUno . " segundos\n";
echo "Tiempo de ejecución de la Función 2: " . $tiempoFuncionDos . " segundos\n";

if ($tiempoFuncionUno < $tiempoFuncionDos) {
    echo "La Función 1 es más rápida.\n";
} elseif ($tiempoFuncionUno > $tiempoFuncionDos) {
    echo "La Función 2 es más rápida.\n";
} else {
    echo "Ambas funciones tienen el mismo rendimiento.\n";
}

// Medir el consumo de memoria de la función 1
$inicioMemoriaFuncionUno = memory_get_usage();
is_palindrome($stringAleatorio);
$finMemoriaFuncionUno = memory_get_usage();
$consumoMemoriaFuncionUno = $finMemoriaFuncionUno - $inicioMemoriaFuncionUno;

// Medir el consumo de memoria de la función 2
$inicioMemoriaFuncionDos = memory_get_usage();
is_palindrome2($stringAleatorio);
$finMemoriaFuncionDos = memory_get_usage();
$consumoMemoriaFuncionDos = $finMemoriaFuncionDos - $inicioMemoriaFuncionDos;

// Comparar el consumo de memoria
echo "Consumo de memoria de la Función 1: " . $consumoMemoriaFuncionUno . " bytes\n";
echo "Consumo de memoria de la Función 2: " . $consumoMemoriaFuncionDos . " bytes\n";

if ($consumoMemoriaFuncionUno < $consumoMemoriaFuncionDos) {
    echo "La Función 1 consume menos memoria.\n";
} elseif ($consumoMemoriaFuncionUno > $consumoMemoriaFuncionDos) {
    echo "La Función 2 consume menos memoria.\n";
} else {
    echo "Ambas funciones consumen la misma cantidad de memoria.\n";
}