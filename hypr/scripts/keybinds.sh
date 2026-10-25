#!/usr/bin/env bash

THEME="$HOME/Dotfiles/rofi/berserk-keybinds.rasi"

cat << 'EOF' | rofi -dmenu -i -p "󰘳 ATAJOS" -theme "$THEME"
======================================================================
🚀 LANZADOR Y UTILIDADES BÁSICAS
======================================================================
SUPER + Enter                 : Abrir terminal principal (kitty)
SUPER + Q                     : Cerrar la ventana activa
SUPER + A                     : Alternar Centro de Control lateral (Eww)
SUPER + I                     : Abrir este buscador interactivo de atajos
SUPER + M                     : Menú de apagado y sesión (hyprshutdown)
SUPER + E                     : Explorador de archivos en terminal (yazi)
SUPER + V                     : Alternar ventana entre flotante y mosaico
SUPER + R                     : Lanzador de aplicaciones del sistema (rofi)
SUPER + F                     : Alternar modo pantalla completa (fullscreen)

======================================================================
🎯 NAVEGACIÓN Y FOCO
======================================================================
SUPER + Tab                   : Alternar entre ventanas abiertas (estilo Alt-Tab)
SUPER + Flechas               : Mover el foco (Arriba / Abajo / Izquierda / Derecha)
SUPER + H / J / K / L         : Mover el foco en estilo Vim

======================================================================
🖥️ WORKSPACES (Áreas de trabajo multimonitor)
======================================================================
SUPER + [1-9]                 : Cambiar al workspace 1 al 9 (DP-2 impares, DP-1 pares)
SUPER + SHIFT + [1-9]         : Mover la ventana activa al workspace 1 al 9

======================================================================
🔲 GESTIÓN Y REDIMENSIÓN DE VENTANAS
======================================================================
SUPER + SHIFT + Flechas       : Desplazar ventana por la cuadrícula
SUPER + SHIFT + H / J / K / L : Desplazar ventana por la cuadrícula (Estilo Vim)
SUPER + CTRL + Flechas        : Redimensionar ventana activa (mantener pulsado)

======================================================================
🛠️ SCRATCHPADS (Ventanas flotantes - Pyprland)
======================================================================
SUPER + SHIFT + T             : Mostrar/Ocultar terminal flotante (scratch-term)
SUPER + SHIFT + N             : Mostrar/Ocultar notas flotantes (scratch-notes)
SUPER + SHIFT + M             : Mostrar/Ocultar reproductor de música (Spotube)
SUPER + SHIFT + S             : Mostrar/Ocultar consola serial (scratch-serial)

======================================================================
📊 BARRA SUPERIOR (Waybar - Acciones Interactivas)
======================================================================
Clic en CPU / Memoria         : Abrir monitor de recursos interactivo (btop)
Clic en Centro de Control (󱄄) : Abrir/Cerrar Centro de Control lateral (Eww)
Clic en Botón Berserk (󰐥)     : Abrir menú de apagado/bloqueo (hyprshutdown)
Rueda ratón sobre Volumen     : Subir / Bajar volumen
Clic sobre Icono de Volumen   : Silenciar / Activar sonido general

======================================================================
📸 CAPTURAS DE PANTALLA Y AUDIO
======================================================================
Print (Impr Pant)             : Capturar pantalla completa (~/Pictures/)
SHIFT + Print                 : Capturar área o región específica
Teclas Multimedia             : Control de volumen del sistema (subir/bajar/mute)

======================================================================
🖱️ GESTIÓN CON RATÓN
======================================================================
SUPER + Clic Izquierdo        : Agarrar y arrastrar ventana libremente
SUPER + Clic Derecho          : Redimensionar ventana interactivamente
EOF
