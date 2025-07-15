Proceso Ahorcado 
    // Declaraciones
    Definir palabraSecreta Como Cadena
    Definir letra Como Caracter
    Definir intentos, maxIntentos, longitud_palabra Como Entero
    Definir palabraMostrada Como Cadena
	
    // Declaraci�n
    maxIntentos <- 6  // N�mero m�ximo de intentos permitidos
    intentos <- 0
	
    // Men� de inicio del juego
    Escribir "============================="
    Escribir "       �JUEGO DEL AHORCADO!       "
    Escribir "============================="
    Escribir "Reglas: Debes adivinar la palabra secreta."
    Escribir "Tienes un m�ximo de ", maxIntentos, " intentos."
    Escribir "�Buena suerte!"
    Escribir "============================="
	
    // Declaraci�n
    Escribir "Jugador 1, ingrese la palabra secreta: "
    Leer palabraSecreta
    Borrar Pantalla // Limpia la pantalla para ocultar la palabra ingresada por el Jugador 1
	
    // Declaraci�n de la longitud de la palabra
    longitud_palabra <- Longitud(palabraSecreta)
	
	// Declaraci�n de los arreglos
	Dimension palabraMostrada[longitud_palabra]
    Dimension arregloSecreto[longitud_palabra]
	
	// Ciclo para llenar el arreglo 'arregloSecreto' con los caracteres de la palabra secreta
    Para i <- 1 Hasta longitud_palabra Hacer
        arregloSecreto[i] <- Subcadena(palabraSecreta, i, i)
    FinPara
	
	// Ciclo para inicializar la palabra a mostrar con guiones bajos
	Para i <- 1 Hasta longitud_palabra Hacer
        palabraMostrada[i] <- "_"
    FinPara
	
	// Ciclo principal del juego
	Mientras intentos < maxIntentos Y ConvertirACadena(palabraMostrada, longitud_palabra) <> palabraSecreta Hacer
        Escribir "============================="
        Escribir "   TABLERO DE JUEGO:    "
        Escribir "============================="
        Escribir "Palabra a adivinar: "
        
		// Ciclo para mostrar el estado actual de la palabra
        Para i <- 1 Hasta longitud_palabra Hacer
            Escribir Sin Saltar palabraMostrada[i], " "
        FinPara
        Escribir "" // Salto de l�nea para mostrar el tablero correctamente
        
        // Informaci�n de los intentos restantes
        Escribir "Intentos restantes: ", maxIntentos - intentos
        Escribir "============================="
        Escribir "Ingrese una letra:"
        Leer letra
		
        // Declaraci�n de la variable que indica si la letra fue encontrada
        letraEncontrada <- Falso
        
        // Ciclo para verificar si la letra est� en la palabra secreta
        Para i <- 1 Hasta longitud_palabra Hacer
            // Condicional para comparar la letra ingresada con las letras de la palabra secreta
            Si arregloSecreto[i] = letra Entonces
                palabraMostrada[i] <- letra
                letraEncontrada <- Verdadero
            FinSi
        FinPara
		
        // Condicional para verificar si la letra fue encontrada
        Si No letraEncontrada Entonces
            intentos <- intentos + 1
            Escribir "�Letra incorrecta! Intentos fallidos: ", intentos
        Sino
            Escribir "�Correcto! La letra est� en la palabra."
        FinSi
        Escribir "============================="
    FinMientras
	
    // Condicional para mostrar el resultado del juego
    Si ConvertirACadena(palabraMostrada, longitud_palabra) = palabraSecreta Entonces
        Escribir "=================================="
        Escribir "�Felicidades, Jugador 2! Adivinaste la palabra: ", palabraSecreta
        Escribir "=================================="
    Sino
        Escribir "=================================="
        Escribir "Lo siento, has perdido. La palabra era: ", palabraSecreta
        Escribir "=================================="
    FinSi
FinProceso

// Subproceso para convertir un arreglo en una cadena
SubProceso cadena <- ConvertirACadena(arreglo, longitud_palabra)
    // Declaraci�n
    cadena <- ""
    // Ciclo para concatenar los elementos del arreglo en una sola cadena
    Para i <- 1 Hasta longitud_palabra Hacer
        cadena <- cadena + arreglo[i]
    FinPara
FinSubProceso
