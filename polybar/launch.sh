#!/usr/bin/env bash

# Ruta de configuración
DIR="$HOME/.config/polybar"

# Terminar con los posibles procesos
killall -q polybar

# Esperar a que el proceso esté terminado
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanzar las 3 barras
polybar izquierda -c "$DIR"/config.ini &
polybar centro -c "$DIR"/config.ini &
polybar derecha -c "$DIR"/config.ini &
