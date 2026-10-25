#!/usr/bin/env bash

# ==============================================================================
# SCRIPT DE REGLAS UFW PARA STEAM IN-HOME STREAMING (RED LOCAL)
# ==============================================================================
# Permite el descubrimiento y transmisión de Steam entre dispositivos
# de la red doméstica (192.168.1.0/24), eliminando los bloqueos recurrentes
# en wlan0 y enp4s0.

set -euo pipefail

SUBNET="192.168.1.0/24"

echo "🎮 Configurando reglas de UFW para Steam Local ($SUBNET)..."

# 1. Puertos UDP de descubrimiento y transmisión de Steam
sudo ufw allow from "$SUBNET" to any port 27031:27036 proto udp comment 'Steam In-Home Discovery & Audio'

# 2. Puertos TCP de control de Steam Remote Play
sudo ufw allow from "$SUBNET" to any port 27036:27037 proto tcp comment 'Steam In-Home Control'

# 3. Recargar y verificar estado
sudo ufw reload
echo ""
echo "✅ Reglas aplicadas con éxito en el cortafuegos."
echo ""
sudo ufw status numbered
