#!/usr/bin/env bash

# ==============================================================================
# SCRIPT DE TEMATIZACIÓN: SDDM ASTRONAUT - BERSERK EDITION
# ==============================================================================
# Aplica la estética oficial de tus dotfiles:
# - Fondos: marca.png (2560x1440) o guts.png (1920x1080)
# - Acentos: $red-berserk (#ff2a3a) y Tokyo Night Dark (#16161e)
# - Fuente: JetBrainsMono Nerd Font

set -euo pipefail

WALLPAPER_CHOICE="${1:-marca}" # 'marca' o 'guts'
THEME_DIR="/usr/share/sddm/themes/sddm-astronaut-theme"
WALLPAPERS_SRC="/home/devops/Dotfiles/wallpapers"

echo "🗡️ Configurando estética Berserk en SDDM Astronaut (Wallpaper: $WALLPAPER_CHOICE)..."

# 1. Copiar fondos de Berserk al tema
sudo cp -f "$WALLPAPERS_SRC/marca.png" "$THEME_DIR/Backgrounds/marca.png"
sudo cp -f "$WALLPAPERS_SRC/guts.png" "$THEME_DIR/Backgrounds/guts.png"

SELECTED_BG="Backgrounds/${WALLPAPER_CHOICE}.png"

# 2. Crear configuración Berserk para el tema
CONF_FILE="$THEME_DIR/Themes/berserk.conf"
echo "Generando $CONF_FILE..."

sudo bash -c "cat > $CONF_FILE" << EOF
[General]
#################### General ####################

ScreenWidth="2560"
ScreenHeight="1440"
ScreenPadding="0"

Font="JetBrainsMono Nerd Font"
FontSize="13"

KeyboardSize="0.4"
RoundCorners="14"

Locale=""
HourFormat="HH:mm"
DateFormat="dddd, d 'de' MMMM"

HeaderText="CYBERDECK // BERSERK EDITION"

#################### Background ####################

BackgroundPlaceholder=""
Background="$SELECTED_BG"
BackgroundSpeed=""
PauseBackground=""
DimBackground="0.1"
CropBackground="true"
BackgroundHorizontalAlignment="center"
BackgroundVerticalAlignment="center"

#################### Colors ####################

HeaderTextColor="#ff2a3a"
DateTextColor="#c0caf5"
TimeTextColor="#ffffff"

FormBackgroundColor="#16161e"
BackgroundColor="#0f0f14"
DimBackgroundColor="#000000"

LoginFieldBackgroundColor="#1a1b26"
PasswordFieldBackgroundColor="#1a1b26"
LoginFieldTextColor="#c0caf5"
PasswordFieldTextColor="#c0caf5"
UserIconColor="#ff2a3a"
PasswordIconColor="#ff2a3a"

PlaceholderTextColor="#565f89"
WarningColor="#ff2a3a"

LoginButtonTextColor="#ffffff"
LoginButtonBackgroundColor="#ff2a3a"
SystemButtonsIconsColor="#c0caf5"
SessionButtonTextColor="#c0caf5"
VirtualKeyboardButtonTextColor="#c0caf5"

DropdownTextColor="#c0caf5"
DropdownSelectedBackgroundColor="#ff2a3a"
DropdownBackgroundColor="#16161e"

HighlightTextColor="#ffffff"
HighlightBackgroundColor="#ff2a3a"
HighlightBorderColor="#ff2a3a"

HoverUserIconColor="#ff2a3a"
HoverPasswordIconColor="#ff2a3a"
HoverSystemButtonsIconsColor="#ff2a3a"
HoverSessionButtonTextColor="#ff2a3a"
HoverVirtualKeyboardButtonTextColor="#ff2a3a"

#################### Form ####################

PartialBlur="true"
FullBlur="false"
BlurMax="32"
Blur="1.0"

HaveFormBackground="true"
FormPosition="center"
EOF

# 3. Activar el preset en metadata.desktop
echo "Activando preset berserk.conf en metadata.desktop..."
sudo sed -i 's|^ConfigFile=.*|ConfigFile=Themes/berserk.conf|' "$THEME_DIR/metadata.desktop"

echo "✅ ¡SDDM Astronaut Berserk Edition configurado con éxito!"
