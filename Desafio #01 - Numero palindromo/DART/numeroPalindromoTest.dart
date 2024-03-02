import 'dart:math';

void main() {
  final number = generarPalindromoBigInt(10000);
  //print(number);
  // Medir el tiempo de ejecución de la función 1
  Stopwatch reloj = Stopwatch();

  reloj.start();
  final result1 = isPalindrome3(number);
  reloj.stop();
  print(result1);
  var tiempoFuncionUno = reloj.elapsedMicroseconds;

  // Medir el tiempo de ejecución de la función 2
  reloj.reset();
  reloj.start();
  final result2 = isPalindrome3(number);
  reloj.stop();
  print(result2);
  var tiempoFuncionDos = reloj.elapsedMicroseconds;
  reloj.reset();
  // Comparar los tiempos de ejecución
  print('Tiempo de ejecución de la Función 1: $tiempoFuncionUno us');
  print('Tiempo de ejecución de la Función 2: $tiempoFuncionDos us');

  if (tiempoFuncionUno < tiempoFuncionDos) {
    print('La Función 1 es más rápida.');
  } else if (tiempoFuncionUno > tiempoFuncionDos) {
    print('La Función 2 es más rápida.');
  } else {
    print('Ambas funciones tienen el mismo rendimiento.');
  }
}

bool isPalindrome(BigInt number) {
  String numberStr = number.toString();
  String reverseNumber = numberStr.split('').reversed.join('');

  return numberStr == reverseNumber;
}

bool isPalindrome2(BigInt number) {
  final numberStr = number.toString();
  final numberLength = numberStr.length;

  for (int i = 0; i < numberLength ~/ 2; i++) {
    if (numberStr[i] != numberStr[numberLength - i - 1]) {
      return false;
    }
  }
  return true;
}

bool isPalindrome3(BigInt number) {
  // Manejar el caso especial de 0 directamente
  if (number == BigInt.zero) {
    return true;
  }

  // Copiamos el número original para compararlo más tarde
  BigInt originalNumber = number;
  BigInt reversedNumber = BigInt.zero;

  // Invertimos el número
  while (number > BigInt.zero) {
    // Obtenemos el dígito actual
    BigInt digit = number % BigInt.from(10);
    
    // Añadimos el dígito al número invertido
    reversedNumber = reversedNumber * BigInt.from(10) + digit;

    // Eliminamos el último dígito del número original (lo desplazamos un lugar a la derecha)
    number = number ~/ BigInt.from(10);
  }

  // Comparamos el número original con su versión invertida
  return originalNumber == reversedNumber;
}

// Función para generar un BigInt de una longitud específica con dígitos aleatorios
BigInt generarBigIntAleatorio(int longitud) {
  Random random = Random();
  String numeroStr = '';

  // Añadir dígitos aleatorios a la cadena, asegurándose de que el primer dígito no sea 0
  numeroStr += random.nextInt(9).toString(); // El primer dígito no puede ser 0
  for (int i = 1; i < longitud; i++) {
    numeroStr +=
        random.nextInt(10).toString(); // Los siguientes dígitos pueden ser 0-9
  }

  return BigInt.parse(numeroStr); // Convertir la cadena a BigInt y devolverlo
}

BigInt generarPalindromoBigInt(int longitud) {
  String palindromoStr = '';
  String bigIntRandom = generarBigIntAleatorio(longitud ~/ 2).toString();

  palindromoStr = bigIntRandom + bigIntRandom.split('').reversed.join('');

  return BigInt.parse(palindromoStr);
}

/**
 * Notas
 * Convertir el BigInt a String es una de las operaciones que mas consume recursos.
 * Si esta operación no se utilizara en isPalindrome e isPalindrome2, la funcion
 * isPalindrome2 seria significativamente mas rapida.
 */