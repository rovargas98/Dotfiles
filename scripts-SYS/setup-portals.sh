#!/bin/bash

# Colores para que el output sea más legible
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Sin color

echo -e "${GREEN}[+] Iniciando script de configuración de portales (Hyprland + KDE)...${NC}"

# 1. Crear el directorio de portales si no existe
PORTAL_DIR="$HOME/.config/xdg-desktop-portal"
echo -e "${YELLOW}[*] Comprobando directorio ${PORTAL_DIR}...${NC}"
mkdir -p "$PORTAL_DIR"

# 2. Eliminar un posible portals.conf genérico
# Si existe un portals.conf sin prefijo, puede sobreescribir las reglas específicas.
if [ -f "$PORTAL_DIR/portals.conf" ]; then
    echo -e "${YELLOW}[*] Eliminando portals.conf genérico para evitar conflictos...${NC}"
    rm "$PORTAL_DIR/portals.conf"
fi

# 3. Crear configuración estricta para Hyprland
echo -e "${GREEN}[+] Creando hyprland-portals.conf...${NC}"
cat <<EOF > "$PORTAL_DIR/hyprland-portals.conf"
[preferred]
default=hyprland;gtk
org.freedesktop.impl.portal.ScreenCast=hyprland
org.freedesktop.impl.portal.Screenshot=hyprland
EOF

# 4. Crear configuración estricta para KDE
echo -e "${GREEN}[+] Creando kde-portals.conf...${NC}"
cat <<EOF > "$PORTAL_DIR/kde-portals.conf"
[preferred]
default=kde
EOF

# 5. Instalar dependencias necesarias (pedirá contraseña para sudo)
echo -e "${YELLOW}[*] Verificando e instalando dependencias (grim, slurp)...${NC}"
sudo pacman -S --needed grim slurp

# 6. Reiniciar los servicios de usuario
echo -e "${GREEN}[+] Reiniciando servicios de captura y portal...${NC}"
systemctl --user daemon-reload
systemctl --user restart wireplumber pipewire pipewire-pulse xdg-desktop-portal xdg-desktop-portal-hyprland

echo -e "${GREEN}[✔] ¡Configuración completada con éxito!${NC}"
echo -e "Abre Vesktop y prueba a compartir pantalla."
