#!/bin/bash
# Extrae los IDs de los dispositivos de salida y rota entre ellos
sinks=($(wpctl status | sed -n '/Sinks:/,/├─/p' | grep -oP '\d+(?=\.)'))
current=$(wpctl status | sed -n '/Sinks:/,/├─/p' | grep '\*' | grep -oP '\d+(?=\.)')

for i in "${!sinks[@]}"; do
    if [[ "${sinks[$i]}" == "$current" ]]; then
        next_index=$(( (i + 1) % ${#sinks[@]} ))
        wpctl set-default "${sinks[$next_index]}"
        # Notifica al sistema el cambio
        notify-send -t 1500 -u low "Audio" "Dispositivo de salida cambiado"
        break
    fi
done
