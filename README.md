# 🛠️ DevOps CyberDeck - Tokyo Night Dotfiles

Este repositorio contiene los archivos de configuración (dotfiles) y scripts de automatización para un entorno de alto rendimiento diseñado para administración de sistemas y desarrollo (DevOps).

---

## 🎨 Especificación Estética
*   **Tema Visual:** Tokyo Night (Oscuro, Azul, Morado, Cian).
*   **Fuente Principal:** `JetBrainsMono Nerd Font` (perfecta para distinguir caracteres especiales en código, scripts de bash y manifiestos de Kubernetes).
*   **Transparencias:** Opacidad al 85% con difuminado (blur) de fondo.

---

## 🏛️ Estructura del Repositorio

```
Dotfiles/
├── Documentacion/        # Manuales completos de herramientas
│   ├── eww_documentacion_completa.md
│   ├── kitty_completo.md
│   ├── nvim_berserk_manga_noir.md
│   ├── spotube_y_ecosistema_multimedia.md
│   └── waybar_berserk_cyberpunk.md
├── configuracion/        # Notas de configuración del sistema
├── eww/                  # Widgets interactivos del panel lateral (Eww)
├── hypr/                 # Configuración de Hyprland (Lua API), bloqueo y wallpapers
├── kitty/                # Terminal Kitty con layouts, broadcast y tema Berserk Manga
├── mako/                 # Notificaciones minimalistas adaptadas a Tokyo Night
├── nvim/                 # IDE Neovim (v0.11+) unificado con LSP Nativo y Lazy.nvim
├── pypr/                 # Mapeo de Scratchpads (terminal, notas, música, serial)
├── pyprland/             # Copias alternativas de comportamiento de Pyprland
├── rofi/                 # Lanzador de aplicaciones y visor de atajos con tema Berserk
├── scripts-SYS/          # Scripts maestros de mantenimiento y seguridad (DevOps)
├── sddm_diagnostico/     # Registro y parches aplicados a la pantalla de login
├── wallpapers/           # Wallpapers predefinidos (DP-1 y DP-2)
└── waybar/               # Barra superior Cyberpunk Berserk con telemetría fija y VU Meter
```

---

## ⚡ Enlaces Simbólicos Sugeridos
Para aplicar estas configuraciones en tu sistema, los archivos deben estar enlazados desde `~/Dotfiles` hacia `~/.config/`:

```bash
# Crear enlaces simbólicos
ln -s ~/Dotfiles/hypr ~/.config/hypr
ln -s ~/Dotfiles/kitty ~/.config/kitty
ln -s ~/Dotfiles/waybar ~/.config/waybar
ln -s ~/Dotfiles/mako ~/.config/mako
ln -s ~/Dotfiles/nvim ~/.config/nvim
ln -s ~/Dotfiles/eww ~/.config/eww
ln -s ~/Dotfiles/rofi ~/.config/rofi
ln -s ~/Dotfiles/pyprland ~/.config/pypr
```

---

## 📦 Dependencias Clave por Componente

### 1. Compositor y Bloqueo (`hypr/`)
*   `hyprland` (Se recomienda usar la API de scripting en Lua para consistencia).
*   `hyprpaper` (Gestión de wallpapers duales).
*   `hyprlock` & `hypridle` (Bloqueador y gestor de suspensión de pantalla).
*   `hyprsunset` (Filtro de luz azul nocturna).

### 2. Telemetría y Barra superior (`waybar/`)
*   `cava` (Requerido para la salida cruda del ecualizador en `waybar/vumeter.sh`).
*   `lm_sensors` (Requerido por `cpu-telemetry.sh` para extraer la temperatura del CPU).
*   `nvidia-smi` (Requerido por `gpu-telemetry.sh` para telemetría de la GPU RTX 5070 Ti).
*   `wireplumber` (Requerido por `audio-switch.sh` para conmutar las salidas de audio).

### 3. Editor de Código (`nvim/`)
*   `neovim` >= 0.11 (Obligatorio para la función nativa `vim.lsp.enable`).
*   Servidores LSP recomendados de instalar mediante Mason:
    *   `pyright` (Python)
    *   `bashls` (Bash scripts)
    *   `dockerls` (Dockerfiles)
    *   `ansiblels` (Ansible playbooks)
    *   `yamlls` (YAML / Manifiestos de Kubernetes con esquema estricto `.k8s.yaml`)

---

## 🛠️ Scripts del Sistema (`scripts-SYS/`)
Automatizaciones críticas para SysAdmins:

*   **[secure-docker-ufw.sh](scripts-SYS/secure-docker-ufw.sh):** Protege los contenedores Docker aislando puertos expuestos (ej. `3306`) y configurando `ufw-docker` en la interfaz `enp4s0`.
*   **[setup-portals.sh](scripts-SYS/setup-portals.sh):** Configura los portales XDG para corregir el streaming de pantalla en Hyprland.
*   **[fix-sddm.sh](scripts-SYS/fix-sddm.sh):** Corrige el parpadeo negro en SDDM y activa el guardado de la última sesión para separar KDE de Hyprland.
*   **[fix-nvidia-power.sh](scripts-SYS/fix-nvidia-power.sh):** Soluciona los cuelgues al suspender/reanudar con NVIDIA preservando la VRAM en `/var/tmp` y actualizando initramfs.
*   **[setup-sddm-astronaut.sh](scripts-SYS/setup-sddm-astronaut.sh):** Instala el tema `sddm-astronaut-theme` y configura el despachador de entorno automático (devops -> Hyprland, ro -> KDE Plasma).
*   **[set-sddm-berserk.sh](scripts-SYS/set-sddm-berserk.sh):** Personaliza `sddm-astronaut-theme` con la paleta Berserk (`#ff2a3a`), `JetBrainsMono Nerd Font` y los wallpapers del sistema (`marca.png` o `guts.png`).
*   **[steam-lan-ufw.sh](scripts-SYS/steam-lan-ufw.sh):** Habilita las reglas de cortafuegos UFW para descubrimiento y streaming local de Steam (puertos 27031-27037) restringido a la LAN `192.168.1.0/24`.
*   **[enable-phone-connect.sh](scripts-SYS/enable-phone-connect.sh):** Desbloquea en UFW los puertos de KDE Connect (`1714:1764` TCP/UDP) y Spotube Connect (`9090` TCP), activando Avahi mDNS.
*   **[spotube-connect-ufw.sh](scripts-SYS/spotube-connect-ufw.sh):** Regla de firewall específica para Spotube Connect restringida a la red local.
*   **[configurador-firewall.sh](scripts-SYS/configurador-firewall.sh):** Detecta el firewall UFW, encuentra un puerto libre de forma dinámica y genera/aplica la regla restringida para `enp4s0` y la red `192.168.1.0/24`.


---

## 🧠 Integración con Obsidian
Este repositorio trabaja de forma híbrida con tu bóveda de notas de Obsidian local para documentar tu sistema:
1. Las respuestas de tus consultas se inyectan como notas con cabecera YAML en la carpeta de ingesta.
2. Tu bóveda de Obsidian se encuentra ubicada en `~/Documents/Obsidian/Vault/`.
3. Para una navegación gráfica de tu PC, abre la bóveda en Obsidian y pulsa en la **Vista de Gráfico (Graph View)**; verás un mapa conceptual de tu CyberDeck conectado a través del archivo central `PC_Dashboard.md`.

---

## 🖥️ Configuración del Terminal Predeterminado (Kitty)
Para asegurar que todo el entorno gráfico (incluyendo Rofi/Wofi, lanzadores y aplicaciones) utilice Kitty de manera integrada y predecible, se aplican las siguientes reglas:

### 1. Variables de Entorno y Compositor
En `hypr/hyprland.lua`, se centraliza la variable del terminal preferido a nivel de compositor y entorno:
* Variable local: `local terminal = "kitty"`
* Variable de entorno heredada por subprocesos: `hl.env("TERMINAL", "kitty")` (Nota: Si en el futuro se implementa UWSM, esta variable de entorno debe moverse a `~/.config/uwsm/env`).

### 2. Wrapper Estándar de Terminal (`xdg-terminal-exec`)
Para asegurar la compatibilidad con programas de escritorio que siguen la especificación de Freedesktop, se provee un script ejecutable en `~/.local/bin/xdg-terminal-exec` que intercepta llamadas y las delega directamente a Kitty:
```bash
#!/bin/bash
exec kitty "$@"
```

### 3. Asociaciones MIME (Evitar Secuestro de Directorios)
Se asocia explícitamente el tipo de datos `inode/directory` a Dolphin para evitar que Kitty intente actuar erróneamente como gestor de directorios:
```bash
xdg-mime default org.kde.dolphin.desktop inode/directory
```

