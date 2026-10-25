#!/usr/bin/env bash
# ==============================================================================
# HABILITAR SPOTUBE CONNECT EN FIREWALL UFW (LAN)
# Abre el puerto 9090 para el control remoto desde el móvil (Wi-Fi y Cable)
# ==============================================================================

if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root: sudo $0"
  exit 1
fi

SUBNET="192.168.1.0/24"
PORT=9090

echo "[1/2] Abriendo puerto $PORT (TCP) para la subred local $SUBNET..."
ufw allow from $SUBNET to any port $PORT proto tcp comment "Spotube Connect Remote Control"

echo "[2/2] Recargando UFW..."
ufw reload

echo "¡Listo! Puerto $PORT habilitado para Spotube Connect en toda la red local."
