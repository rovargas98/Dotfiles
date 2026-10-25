#!/bin/bash
data=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits)
usage=$(echo $data | awk -F', ' '{print $1}')
temp=$(echo $data | awk -F', ' '{print $2}')

usage=${usage:-0}
temp=${temp:-50}

if [ "$temp" -lt 50 ]; then class="cold"
elif [ "$temp" -lt 70 ]; then class="normal"
elif [ "$temp" -lt 85 ]; then class="warm"
else class="hot"; fi

# Imprimir formato final para Waybar con ancho fijo de 2 dígitos
printf '{"text": "󰢮 %02d%%  %02d°C", "class": "%s"}\n' "$((10#$usage))" "$((10#$temp))" "$class"
