import wave

def audio_a_binario(archivo_audio, archivo_binario):
    # Abre el archivo de audio
    archivo_audio = wave.open(archivo_audio, 'rb')
    
    # Obtiene los parámetros del archivo de audio
    canales = archivo_audio.getnchannels()
    profundidad_bits = archivo_audio.getsampwidth()
    tasa_muestreo = archivo_audio.getframerate()
    frames = archivo_audio.getnframes()
    
    # Lee todos los frames del archivo de audio
    frames_audio = archivo_audio.readframes(frames)
    
    # Convierte los frames a binario
    binario = ''.join(format(byte, '08b') for byte in frames_audio)
    
    # Guarda el binario en un archivo de texto
    with open(archivo_binario, 'w') as archivo_txt:
        archivo_txt.write(f'Canales: {canales}\n')
        archivo_txt.write(f'Profundidad en bits: {profundidad_bits}\n')
        archivo_txt.write(f'Tasa de muestreo: {tasa_muestreo}\n')
        archivo_txt.write(f'Longitud en frames: {frames}\n\n')
        archivo_txt.write(binario)
    
    archivo_audio.close()

# Nombre del archivo de audio de entrada
archivo_audio = 'ejemplo_audio.wav'

# Nombre del archivo de texto binario de salida
archivo_binario = 'audio_binario.txt'

# Llama a la función para convertir el audio a binario y guardarlo en un archivo de texto
audio_a_binario(archivo_audio, archivo_binario)

print(f'Se ha convertido el archivo de audio "{archivo_audio}" a binario y se ha guardado en "{archivo_binario}".')
