#!/bin/sh

# Barras de caracteres para el vúmetro
bar_chars="  ▂▃▄▅▆▇█"

# Lanzamos cava en modo pipe, leyendo solo 1 canal y normalizado
cava -p <(echo "[general]
bars = 1
sleep_timer = 0
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 8") | awk -v chars="$bar_chars" '{
    # Tomamos el valor de cava (0-8) y lo usamos como índice para los caracteres
    val = $1
    if (val == "") val = 0;
    print substr(chars, val + 1, 1) substr(chars, val + 1, 1)substr(chars, val + 1, 1);
    fflush();
}'
