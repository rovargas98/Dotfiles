#!/usr/bin/env bash

# ==============================================================================
# SCRIPT DE REPARACIÓN DE SDDM - Gestión de Sesiones por Usuario
# ==============================================================================
# Este script soluciona el problema donde SDDM no recuerda qué escritorio 
# (KDE o Hyprland) corresponde a cada usuario (ro o devops).

echo "🚀 Iniciando optimización de SDDM..."

# 1. ACTIVAR EL RECUERDO DE SESIÓN POR USUARIO
# Creamos un archivo de configuración de alta prioridad.
echo "Configurando SDDM para recordar la última sesión de cada usuario..."
sudo bash -c 'cat > /etc/sddm.conf.d/30-session-behavior.conf <<EOF
[General]
RememberLastSession=true
RememberLastUser=true

[Users]
HideUsers=root
MinimumUid=1000
EOF'

# 2. RESOLVER CONFLICTO DE DISPLAY SERVER
# Detectamos si hay un override a X11 y lo cambiamos a Wayland para consistencia.
if [ -f /etc/sddm.conf.d/20-session-override.conf ]; then
    echo "Cambiando DisplayServer de X11 a Wayland en 20-session-override.conf..."
    sudo sed -i 's/DisplayServer=x11/DisplayServer=wayland/' /etc/sddm.conf.d/20-session-override.conf
fi

# 3. VERIFICAR PERMISOS DEL DIRECTORIO DE ESTADO
# SDDM necesita escribir en /var/lib/sddm para guardar la última sesión.
echo "Asegurando permisos en /var/lib/sddm..."
sudo chown -R sddm:sddm /var/lib/sddm
sudo chmod -R 750 /var/lib/sddm

# 4. SOLUCIONAR PANTALLA NEGRA (Qt6 & Layer Shell)
echo "Aplicando parches de compatibilidad Wayland/Qt6..."

# Forzar QtVersion=6 en el tema Tokyo Night
THEME_METADATA="/usr/share/sddm/themes/tokyo-night-sddm/metadata.desktop"
if [ -f "$THEME_METADATA" ]; then
    echo "Configurando QtVersion=6 en $THEME_METADATA..."
    if grep -q "QtVersion=" "$THEME_METADATA"; then
        sudo sed -i 's/QtVersion=.*/QtVersion=6/' "$THEME_METADATA"
    else
        echo "QtVersion=6" | sudo tee -a "$THEME_METADATA" > /dev/null
    fi
fi

# Instalar dependencias críticas si faltan
echo "Verificando dependencias de Layer Shell y Qt Wayland..."
sudo pacman -S --needed --noconfirm layer-shell-qt qt5-wayland qt6-wayland

# 5. EXPLICACIÓN SOBRE EL TEMA
echo ""
echo "⚠️ NOTA SOBRE EL TEMA TOKYO NIGHT:"
echo "El tema actual puede tener una limitación visual: a veces no cambia el icono"
echo "o el nombre del escritorio en el selector hasta que empiezas a escribir"
echo "la contraseña. Sin embargo, con los cambios anteriores, SDDM debería"
echo "seleccionar internamente la sesión correcta para cada usuario."

echo ""
echo "✅ ¡Listo! Por favor, reinicia el sistema para aplicar los cambios."
echo "Comando sugerido: reboot"
