#!/usr/bin/env bash

cat << 'EOF' | rofi -dmenu -i -p "🔍 Buscar atajo..." -theme-str 'window {width: 850px;} listview {lines: 20;}'
======================================================================
🚀 LANZADOR Y UTILIDADES BÁSICAS
======================================================================
SUPER + Enter                 : Abrir la terminal (kitty)
SUPER + Q                     : Cerrar la ventana actual activa
SUPER + M                     : Salir de Hyprland
SUPER + E                     : Abrir el explorador de archivos (yazi)
SUPER + V                     : Alternar ventana entre flotante y mosaico
SUPER + R                     : Abrir el lanzador de aplicaciones (rofi)
SUPER + F                     : Pantalla completa (fullscreen)

======================================================================
🎯 NAVEGACIÓN Y FOCO
======================================================================
SUPER + Tab                   : Ciclar ventanas abiertas (estilo Alt-Tab)
SUPER + Flechas               : Mover el foco (Arriba/Abajo/Izq/Der)
SUPER + H/J/K/L               : Mover el foco (Estilo Vim)

======================================================================
🖥️ WORKSPACES (Áreas de trabajo)
======================================================================
SUPER + [1-9]                 : Cambiar al workspace 1 al 9
SUPER + SHIFT + [1-9]         : Mover la ventana activa al workspace 1 al 9

======================================================================
🔲 GESTIÓN Y REDIMENSIÓN DE VENTANAS
======================================================================
SUPER + SHIFT + Flechas       : Mover ventana físicamente por la cuadrícula
SUPER + SHIFT + H/J/K/L       : Mover ventana físicamente (Estilo Vim)
SUPER + CTRL + Flechas        : Redimensionar ventana (mantener para repetir)

======================================================================
🛠️ SCRATCHPADS (Ventanas flotantes - Pyprland)
======================================================================
SUPER + SHIFT + T             : Mostrar/Ocultar terminal flotante
SUPER + SHIFT + N             : Mostrar/Ocultar notas flotantes
SUPER + SHIFT + M             : Mostrar/Ocultar reproductor de música
SUPER + SHIFT + S             : Mostrar/Ocultar utilidad serial

======================================================================
📸 CAPTURAS Y MULTIMEDIA
======================================================================
Print (Impr Pant)             : Capturar pantalla completa (~/capturas/)
SHIFT + Print                 : Capturar una región específica de la pantalla
Teclas Multimedia             : Subir, bajar o silenciar el volumen general

======================================================================
🖱️ INTEGRACIÓN PROFESIONAL CON EL RATÓN
======================================================================
SUPER + Clic Izquierdo        : Mantener pulsado para agarrar y mover ventana
SUPER + Clic Derecho          : Mantener pulsado para redimensionar ventana
EOF
