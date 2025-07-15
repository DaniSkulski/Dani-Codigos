import pygame
import sys

# Inicializar Pygame
pygame.init()

# Colores
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
RED = (255, 0, 0)
GREEN = (0, 255, 0)

# Configuración de la pantalla
WIDTH, HEIGHT = 600, 400
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Juego del Ahorcado")

# Fuentes
font = pygame.font.Font(None, 36)
large_font = pygame.font.Font(None, 48)

# Variables de juego
max_intentos = 6
intentos = 0
palabra_secreta = "PYTHON"  # Puedes cambiar esta palabra o pedir al jugador 1 que la ingrese.
palabra_mostrada = ["_"] * len(palabra_secreta)
letras_usadas = []

# Función para dibujar el estado actual de la palabra
def mostrar_palabra():
    palabra_actual = " ".join(palabra_mostrada)
    text_surface = font.render(palabra_actual, True, BLACK)
    screen.blit(text_surface, (WIDTH // 2 - text_surface.get_width() // 2, HEIGHT // 2 - 50))

# Función para dibujar los intentos restantes
def mostrar_intentos_restantes():
    intentos_restantes = max_intentos - intentos
    text_surface = font.render(f"Intentos restantes: {intentos_restantes}", True, BLACK)
    screen.blit(text_surface, (WIDTH // 2 - text_surface.get_width() // 2, HEIGHT // 2 + 50))

# Función principal del juego
def juego_ahorcado():
    global intentos
    jugando = True

    while jugando:
        # Manejo de eventos
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            elif event.type == pygame.KEYDOWN:
                letra = chr(event.key).upper()  # Convertimos a mayúscula
                if letra.isalpha() and letra not in letras_usadas:  # Solo letras no repetidas
                    letras_usadas.append(letra)
                    letra_encontrada = False

                    # Verificar si la letra está en la palabra
                    for i in range(len(palabra_secreta)):
                        if palabra_secreta[i] == letra:
                            palabra_mostrada[i] = letra
                            letra_encontrada = True
                    
                    # Si la letra no está, se incrementan los intentos
                    if not letra_encontrada:
                        intentos += 1

                    # Verificar si el jugador ha ganado o perdido
                    if "_" not in palabra_mostrada:
                        mensaje_final("¡Ganaste! Adivinaste la palabra.")
                        jugando = False
                    elif intentos >= max_intentos:
                        mensaje_final(f"Perdiste. La palabra era: {palabra_secreta}")
                        jugando = False

        # Dibujar el entorno gráfico
        screen.fill(WHITE)
        mostrar_palabra()
        mostrar_intentos_restantes()
        pygame.display.flip()

# Función para mostrar un mensaje final
def mensaje_final(mensaje):
    screen.fill(WHITE)
    text_surface = large_font.render(mensaje, True, RED)
    screen.blit(text_surface, (WIDTH // 2 - text_surface.get_width() // 2, HEIGHT // 2))
    pygame.display.flip()
    pygame.time.delay(3000)  # Mostrar el mensaje durante 3 segundos

# Iniciar el juego
juego_ahorcado()