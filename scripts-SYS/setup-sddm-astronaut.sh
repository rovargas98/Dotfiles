#!/usr/bin/env bash

# ==============================================================================
# SCRIPT DE INSTALACIÓN Y CONFIGURACIÓN: SDDM ASTRONAUT + AUTO DISPATCHER
# ==============================================================================
# 1. Configura el tema sddm-astronaut-theme (Qt6, minimalista, moderno).
# 2. Instala el despachador de entorno por usuario (devops -> Hyprland, ro -> Plasma).

set -euo pipefail

echo "🚀 Iniciando configuración de SDDM Astronaut y Despachador de Sesiones..."

# ------------------------------------------------------------------------------
# 1. CREAR EL DESPACHADOR INTELIGENTE DE SESIÓN WAYLAND
# ------------------------------------------------------------------------------
DISPATCHER="/usr/local/bin/user-session-dispatcher"
echo "Creando despachador inteligente en $DISPATCHER..."

sudo bash -c "cat > $DISPATCHER" << 'EOF'
#!/usr/bin/env bash
# Despachador de sesión por usuario para Wayland
TARGET_USER="${USER:-$(whoami)}"

case "$TARGET_USER" in
    devops)
        exec /usr/bin/start-hyprland "$@"
        ;;
    ro)
        exec /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland "$@"
        ;;
    *)
        if command -v start-hyprland >/dev/null 2>&1; then
            exec /usr/bin/start-hyprland "$@"
        else
            exec /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland "$@"
        fi
        ;;
esac
EOF

sudo chmod 755 "$DISPATCHER"
echo "✔ Despachador instalado con éxito."

# Crear la entrada de sesión prioritaria (00-auto-session.desktop)
SESSION_ENTRY="/usr/share/wayland-sessions/00-auto-session.desktop"
echo "Registrando sesión predeterminada en $SESSION_ENTRY..."

sudo bash -c "cat > $SESSION_ENTRY" << 'EOF'
[Desktop Entry]
Name=Auto (Entorno por Usuario)
Comment=Hyprland para devops, Plasma para ro
Exec=/usr/local/bin/user-session-dispatcher
Type=Application
DesktopNames=Hyprland;KDE
EOF

sudo chmod 644 "$SESSION_ENTRY"
echo "✔ Sesión automática registrada."

# ------------------------------------------------------------------------------
# 2. INSTALAR EL TEMA SDDM-ASTRONAUT-THEME
# ------------------------------------------------------------------------------
SRC_DIR="/tmp/sddm-astronaut-theme"
DEST_DIR="/usr/share/sddm/themes/sddm-astronaut-theme"

if [ ! -d "$SRC_DIR" ]; then
    echo "Descargando tema sddm-astronaut-theme..."
    git clone --depth 1 https://github.com/Keyitdev/sddm-astronaut-theme.git "$SRC_DIR"
fi

echo "Instalando tema en $DEST_DIR..."
sudo rm -rf "$DEST_DIR"
sudo mkdir -p "$DEST_DIR"
sudo cp -rf "$SRC_DIR"/* "$DEST_DIR/"

# Instalar tipografías del tema
echo "Instalando tipografías..."
sudo mkdir -p /usr/share/fonts/sddm-astronaut-fonts
sudo cp -rf "$SRC_DIR"/Fonts/* /usr/share/fonts/sddm-astronaut-fonts/
sudo fc-cache -f >/dev/null 2>&1 || true

# Configurar variante por defecto (hyprland_kath o astronaut)
if [ -f "$DEST_DIR/Themes/hyprland_kath.conf" ]; then
    echo "Aplicando variante hyprland_kath..."
    sudo sed -i 's|^ConfigFile=.*|ConfigFile=Themes/hyprland_kath.conf|' "$DEST_DIR/metadata.desktop"
fi

# ------------------------------------------------------------------------------
# 3. ACTIVAR EL TEMA EN LA CONFIGURACIÓN DE SDDM
# ------------------------------------------------------------------------------
THEME_CONF="/etc/sddm.conf.d/theme.conf"
echo "Activando sddm-astronaut-theme en $THEME_CONF..."
sudo bash -c "cat > $THEME_CONF" << 'EOF'
[Theme]
Current=sddm-astronaut-theme
EOF

# ------------------------------------------------------------------------------
# 4. CONFIGURAR COMPORTAMIENTO DE SESIÓN EN SDDM
# ------------------------------------------------------------------------------
BEHAVIOR_CONF="/etc/sddm.conf.d/30-session-behavior.conf"
echo "Asegurando configuración de sesión en $BEHAVIOR_CONF..."
sudo bash -c "cat > $BEHAVIOR_CONF" << 'EOF'
[General]
RememberLastSession=true
RememberLastUser=true

[Users]
HideUsers=root
MinimumUid=1000
EOF

echo ""
echo "🎉 ¡Instalación y configuración completadas con éxito!"
echo "Ahora, al iniciar sesión con devops entrarás a Hyprland, y con ro a KDE Plasma automáticamente."
