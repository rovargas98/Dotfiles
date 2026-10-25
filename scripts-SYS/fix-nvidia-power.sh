#!/usr/bin/env bash

# ==============================================================================
# SCRIPT DE REPARACIÓN DE ENERGÍA Y SUSPENSIÓN NVIDIA (RTX 5070 Ti)
# ==============================================================================
# Este script soluciona los cuelgues (pantalla negra y deadlock) al suspender
# el equipo bajo Wayland (KDE Plasma y Hyprland).

set -euo pipefail

echo "🚀 Iniciando configuración de gestión de energía para NVIDIA..."

# 1. CREAR CONFIGURACIÓN DE MODPROBE PARA PRESERVAR VRAM
CONFIG_FILE="/etc/modprobe.d/nvidia-power-management.conf"
echo "Creando configuración de preservación de VRAM en $CONFIG_FILE..."

sudo bash -c "cat > $CONFIG_FILE" << 'EOF'
# Preservar asignaciones de memoria de vídeo en RAM/disco durante la suspensión
options nvidia NVreg_PreserveVideoMemoryAllocations=1

# Directorio temporal para volcar la memoria de vídeo
options nvidia NVreg_TemporaryFilePath=/var/tmp
EOF

echo "✅ Archivo $CONFIG_FILE creado exitosamente."

# 2. HABILITAR SERVICIOS SYSTEMD DE SUSPENSIÓN Y REANUDACIÓN
echo "Verificando servicios de systemd para suspensión de NVIDIA..."
sudo systemctl enable nvidia-suspend.service nvidia-resume.service nvidia-hibernate.service

# 3. ACTUALIZAR INITRAMFS
echo "Actualizando initramfs para incluir los parámetros del módulo NVIDIA..."
sudo mkinitcpio -P

echo ""
echo "🎉 ¡Configuración completada con éxito!"
echo "Los cambios se aplicarán plenamente en el próximo reinicio o tras recargar los módulos."
