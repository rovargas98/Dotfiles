#!/bin/bash

# 1. Leer el uso de CPU directamente del Kernel (100% a prueba de idiomas)
read cpu a b c previdle rest < /proc/stat
prevtotal=$((a+b+c+previdle))
sleep 0.5
read cpu a b c idle rest < /proc/stat
total=$((a+b+c+idle))
usage=$(( 100 * ( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))

# 2. Leer la temperatura de forma segura (Aporte del usuario - Expresión regular PCRE)
temp=$(sensors | grep -E '(Tctl|Core 0|Package id 0)' | head -n 1 | grep -oP '\+\K[0-9]+' | head -n 1)
temp=${temp:-50} # Fallback de seguridad

# 3. Lógica de colores (usando comparaciones nativas de bash)
if [ "$temp" -lt 50 ]; then class="cold"
elif [ "$temp" -lt 70 ]; then class="normal"
elif [ "$temp" -lt 85 ]; then class="warm"
else class="hot"; fi

# 4. Imprimir formato final para Waybar
printf '{"text": " %d%%  %d°C", "class": "%s"}\n' "$usage" "$temp" "$class"
