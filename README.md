# ⚔️ DevOps CyberDeck - Cyberpunk Berserk Noir Dotfiles

[![OS: CachyOS](https://img.shields.io/badge/OS-CachyOS%20(Arch)-00d2ff?style=for-the-badge&logo=archlinux&logoColor=white)](https://cachyos.org/)
[![Compositor: Hyprland](https://img.shields.io/badge/Compositor-Hyprland%20(Wayland)-00b4d8?style=for-the-badge&logo=wayland&logoColor=white)](https://hyprland.org/)
[![GPU: NVIDIA RTX 5070 Ti](https://img.shields.io/badge/GPU-RTX%205070%20Ti-76b900?style=for-the-badge&logo=nvidia&logoColor=white)](https://www.nvidia.com/)
[![Editor: Neovim](https://img.shields.io/badge/Editor-Neovim%20v0.11+-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Theme: Berserk Noir](https://img.shields.io/badge/Theme-Cyberpunk%20Berserk-ff2a3a?style=for-the-badge)](https://github.com/rovargas98/Dotfiles)

Entorno de trabajo avanzado de alto rendimiento para **Administración de Sistemas, Cloud & DevOps**, optimizado para estaciones con doble monitor, GPU NVIDIA Blackwell/Ada y doble usuario. Fusiona una estética **Manga Noir minimalista** inspirada en Berserk (carbón puro, marfil y acentos rojo Marca del Sacrificio `#ff2a3a`) con telemetría en tiempo real y componentes de estilo **Cyberpunk / Tokyo Night**.

---

## 📑 Tabla de Contenidos
* [🖥️ Especificaciones de Hardware y Monitores](#-especificaciones-de-hardware-y-monitores)
* [🎨 Identidad Estética y Paleta de Colores](#-identidad-estética-y-paleta-de-colores)
* [🏛️ Estructura del Repositorio](#-estructura-del-repositorio)
* [⌨️ Atajos de Teclado Maestros (Keybinds)](#-atajos-de-teclado-maestros-keybinds)
* [🧩 Componentes Principales](#-componentes-principales)
  * [1. Hyprland (Lua API) & Reglas de Mosaico](#1-hyprland-lua-api--reglas-de-mosaico)
  * [2. Waybar Anti-Jitter con Telemetría Fija](#2-waybar-anti-jitter-con-telemetría-fija)
  * [3. Terminal Kitty (Manga Noir & Tiling)](#3-terminal-kitty-manga-noir--tiling)
  * [4. Neovim DevOps (LSP Nativo + Mason + PNPM)](#4-neovim-devops-lsp-nativo--mason--pnpm)
  * [5. Panel Lateral Eww (Command Center)](#5-panel-lateral-eww-command-center)
  * [6. Ecosistema Multimedia Spotube & Conectividad Móvil](#6-ecosistema-multimedia-spotube--conectividad-móvil)
  * [7. Pantalla de Acceso SDDM Astronaut Berserk](#7-pantalla-de-acceso-sddm-astronaut-berserk)
* [🛠️ Scripts de Automatización DevOps (`scripts-SYS/`)](#-scripts-de-automatización-devops-scripts-sys)
* [⚡ Despliegue Rápido (Symlinks)](#-despliegue-rápido-symlinks)
* [🧠 Integración con Obsidian CyberDeck](#-integración-con-obsidian-cyberdeck)

---

## 🖥️ Especificaciones de Hardware y Monitores

El entorno está configurado para aprovechar al máximo una disposición multimonitor a alta tasa de refresco (144Hz):

| Salida | Modelo | Resolución / Hz | Espacios de Trabajo Asignados | Rol |
| :--- | :--- | :--- | :--- | :--- |
| **DP-2** | AOC Q27G2WG4 (27") | `2560x1440 @ 144Hz` | Impares: `1, 3, 5, 7, 9` | Monitor Principal (Código, Navegador, LLM) |
| **DP-1** | AOC G2490W1G4 (24") | `1920x1080 @ 144Hz` | Pares: `2, 4, 6, 10` | Monitor Secundario (Terminales, Docker, Logs) |

*   **GPU:** NVIDIA GeForce RTX 5070 Ti (Driver 615.78+ con Direct Scanout Wayland).
*   **Gestión de Energía:** Suspensión/Reanudación con preservación íntegra de VRAM en `/var/tmp` vía `nvidia-powerd` y systemd services.
*   **Gestión Multiusuario:** Despachador en SDDM que arranca `devops` en Hyprland Wayland y `ro` en KDE Plasma.

---

## 🎨 Identidad Estética y Paleta de Colores

Diseñado para eliminar la fatiga visual en jornadas intensas de trabajo técnico manteniendo alto contraste en código y sintaxis:

```
[ Carbono Manga #0c0d12 ] ──── Base de ventanas, terminales e islas flotantes
[ Grafito Slate #181922 ] ──── Módulos individuales y paneles secundarios
[ Marfil Manga  #d5d6db ] ──── Texto principal y documentación legible
[ Berserk Red   #ff2a3a ] ──── Marca del Sacrificio: cursor, bordes activos y alertas
[ Neon Cyan     #56b6c2 ] ──── Ventana activa, red Wi-Fi y acentos tecnológicos
[ Cyber Violet  #c678dd ] ──── Audio, memoria RAM y estados visuales
[ Neon Jade     #98c379 ] ──── Telemetría óptima y estados operativos
```

*   **Tipografía del Sistema:** `JetBrainsMono Nerd Font` (ligaduras activas y números tabulares `tnum` para telemetría estática).
*   **Decoración de Ventanas:** Bordes de 2px, esquinas redondeadas de 7px y desenfoque (*blur*) de doble pasada en ventanas translúcidas.

---

## 🏛️ Estructura del Repositorio

```
Dotfiles/
├── .gitignore            # Exclusión de backups y temporales (*.backup, *.conflict_bak)
├── Documentacion/        # Manuales exhaustivos de cada subsistema
│   ├── eww_documentacion_completa.md
│   ├── kitty_completo.md
│   ├── nvim_berserk_manga_noir.md
│   ├── spotube_y_ecosistema_multimedia.md
│   └── waybar_berserk_cyberpunk.md
├── configuracion/        # Notas de soporte y perfiles SDDM
├── eww/                  # Centro de control interactivo Eww (CSS nativo)
│   ├── eww.css           # Estilos Tokyo Night / Berserk
│   └── eww.yuck          # Definición de ventanas y widgets
├── hypr/                 # Configuración maestra del compositor Hyprland
│   ├── hyprland.lua      # Configuración central (Lua API 0.55+)
│   ├── hyprland.md       # Espejo documental de la configuración
│   ├── hyprlock.conf     # Pantalla de bloqueo minimalista
│   ├── hyprpaper.conf    # Fondos de pantalla duales
│   └── scripts/          # Scripts de entorno y visor de keybinds
├── kitty/                # Terminal Kitty con layouts splits y paleta Manga Noir
│   └── kitty.conf
├── mako/                 # Demonio de notificaciones Wayland adaptado al tema
│   └── config
├── nvim/                 # IDE Neovim unificado (Lazy.nvim, Mason LSP, Treesitter)
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua/              # Módulos de configuración y tema Berserk Lualine
├── pypr/                 # Orquestación de Scratchpads (Pyprland)
│   └── config.toml
├── rofi/                 # Temas Berserk Cyberpunk para lanzadores y menú
│   ├── berserk-keybinds.rasi
│   └── config.rasi
├── scripts-SYS/          # Automatizaciones de SysAdmin, Redes, SDDM y Seguridad
├── sddm_diagnostico/     # Parches y trazabilidad del gestor de inicio
├── wallpapers/           # Wallpapers en alta definición (Berserk & Tokyo Night)
└── waybar/               # Barra superior con telemetría anti-jitter fija
    ├── config            # Declaración de módulos y tooltips
    ├── style.css         # Estilos Cyberpunk Berserk
    └── scripts/          # Telemetría de CPU, GPU (RTX) y conmutación de audio
```

---

## ⌨️ Atajos de Teclado Maestros (Keybinds)

Pulsa `SUPER + I` en cualquier momento para desplegar el menú interactivo de atajos con tema Berserk:

### Gestión de Ventanas y Sistema
| Atajo | Acción |
| :--- | :--- |
| `SUPER + Return` | Abrir terminal principal (**Kitty**) integrada en mosaico |
| `SUPER + Q` | Cerrar ventana activa |
| `SUPER + V` | Alternar modo flotante / mosaico |
| `SUPER + F` | Alternar pantalla completa (*fullscreen*) |
| `SUPER + R` | Lanzador de aplicaciones (**Rofi**) con tema Berserk |
| `SUPER + I` | Desplegar guía de atajos en pantalla (**Rofi Keybinds**) |
| `SUPER + A` | Abrir / Ocultar Centro de Control (**Eww Command Center**) |
| `SUPER + E` | Explorador de archivos terminal (**Yazi**) |
| `SUPER + M` | Menú de energía y apagado (**Hyprshutdown**) |

### Scratchpads Rápidos (Pyprland)
| Atajo | Módulo Emergente |
| :--- | :--- |
| `SUPER + SHIFT + T` | **Terminal rápida flotante** (Kitty centrada 60%x70%) |
| `SUPER + SHIFT + N` | **Notas rápidas** (Neovim editando `~/.notes/quicknotes.md`) |
| `SUPER + SHIFT + M` | **Reproductor de música** (**Spotube** flotante) |
| `SUPER + SHIFT + S` | **Consola Serial / Debugging** flotante |

### Navegación y Cuadrícula
| Atajo | Acción |
| :--- | :--- |
| `SUPER + [H/J/K/L]` o `Flechas` | Mover foco de ventana (Izquierda / Abajo / Arriba / Derecha) |
| `SUPER + SHIFT + [H/J/K/L]` | Desplazar ventana en el mosaico |
| `SUPER + CTRL + [H/J/K/L]` | Redimensionar ventana activa |
| `SUPER + [1..9]` | Cambiar al espacio de trabajo |
| `SUPER + SHIFT + [1..9]` | Enviar ventana activa al espacio de trabajo |
| `SUPER + Tab` | Ciclar entre ventanas abiertas y traer al frente |
| `Print` | Captura de pantalla completa (`~/Pictures/`) |
| `SHIFT + Print` | Captura de área interactiva (`slurp` + `grim`) |

---

## 🧩 Componentes Principales

### 1. Hyprland (Lua API) & Reglas de Mosaico
*   Configurado mediante el intérprete nativo de Lua (`hyprland.lua`).
*   **Estabilidad de mosaico:** Incluye la regla `suppress_event = "maximize"` para evitar que aplicaciones como Kitty soliciten maximizarse a Wayland y rompan la cuadrícula de mosaico.
*   **Aislamiento de temporales:** Se eliminó la inyección global de `TMPDIR` en el compositor, permitiendo que `/run/user/1001/` arranque de forma limpia e higiénica.

### 2. Waybar Anti-Jitter con Telemetría Fija
Documentación completa en: **[waybar_berserk_cyberpunk.md](Documentacion/waybar_berserk_cyberpunk.md)**.
*   **Eliminación de balanceo lateral:** Se retiraron las velocidades variables de red del texto principal (movidas al tooltip interactivo al pasar el ratón).
*   **Telemetría forzada a dos dígitos:** Formato estricto `%02d` en CPU (`cpu-telemetry.sh`) y GPU (`gpu-telemetry.sh`).
*   **Números tabulares:** Activación de `font-feature-settings: "tnum"` y anchos mínimos fijos (`min-width`) en CSS para que la barra permanezca 100% estática.

### 3. Terminal Kitty (Manga Noir & Tiling)
Documentación completa en: **[kitty_completo.md](Documentacion/kitty_completo.md)**.
*   `remember_window_size no` y tamaño inicial de ventana fijado para evitar aperturas maximizadas accidentales.
*   Paleta Berserk Manga Noir: fondo carbón `#0c0d12`, cursor Marca del Sacrificio `#ff2a3a` y colores estándar ANSI de alta legibilidad.
*   Soporte integrado de layouts splits (`Ctrl+Shift+Enter`, `Ctrl+Shift+D`, `Ctrl+Shift+H`) y transmisión masiva a múltiples terminales con Broadcast Kitten (`F11`).

### 4. Neovim DevOps (LSP Nativo + Mason + PNPM)
Documentación completa en: **[nvim_berserk_manga_noir.md](Documentacion/nvim_berserk_manga_noir.md)**.
*   Arquitectura unificada bajo `lazy.nvim` eliminando carpetas anidadas erróneas.
*   Tema Berserk Manga Noir con barra de estado Lualine personalizada con indicador de modo dinámico.
*   Entorno de ejecución Node.js aprovisionado mediante `pnpm` en `~/.local/share/pnpm/bin/` para soportar la instalación autónoma en `:Mason` de:
    *   `bash-language-server` (Scripts DevOps)
    *   `dockerfile-language-server` (Imágenes y contenedores)
    *   `yaml-language-server` (Manifiestos Kubernetes)
    *   `ansible-language-server` (Playbooks de infraestructura)
    *   `pyright` (Desarrollo Python)

### 5. Panel Lateral Eww (Command Center)
Documentación completa en: **[eww_documentacion_completa.md](Documentacion/eww_documentacion_completa.md)**.
*   Migrado a CSS nativo (`eww.css`) compatible con Eww 0.6+.
*   Slidervumeter de volumen con cambio de salida de audio en tiempo real.
*   Monitoreo dinámico de CPU, GPU RTX y control rápido del filtro de luz nocturna (`hyprsunset`).

### 6. Ecosistema Multimedia Spotube & Conectividad Móvil
Documentación completa en: **[spotube_y_ecosistema_multimedia.md](Documentacion/spotube_y_ecosistema_multimedia.md)**.
*   Wrapper de aislamiento en `~/.local/bin/spotube` que protege contra colisiones de permisos multiusuario en `/tmp/NewPipeCLI`.
*   Motor de audio ajustado a `newPipe` para resolver streams de YouTube instantáneamente sin bloqueos ni cargas infinitas.
*   Plugin de Spotify v0.2.2 integrado y Spotube Connect activado en el puerto `9090` con reglas de cortafuegos UFW para control remoto desde el móvil.

### 7. Pantalla de Acceso SDDM Astronaut Berserk
*   Tema `sddm-astronaut-theme` personalizado con la paleta de sangre Berserk (`#ff2a3a`) y tipografía `JetBrainsMono Nerd Font`.
*   Scripts dedicados en `scripts-SYS/` para alternar fondos de inicio (`guts.png` / `marca.png`) y garantizar el guardado de sesiones independientes (`devops` $\rightarrow$ Hyprland, `ro` $\rightarrow$ Plasma).

---

## 🛠️ Scripts de Automatización DevOps (`scripts-SYS/`)

Scripts de mantenimiento, redes y seguridad listos para producción ubicados en `scripts-SYS/`:

| Script | Descripción | Permisos |
| :--- | :--- | :--- |
| **`enable-phone-connect.sh`** | Abre en UFW los puertos para KDE Connect (`1714:1764` TCP/UDP) y Spotube Connect (`9090` TCP), arrancando demonios y Avahi mDNS. | `sudo` |
| **`fix-nvidia-power.sh`** | Configura los servicios systemd de NVIDIA para preservar la VRAM al suspender en `/var/tmp` y actualiza initramfs. | `sudo` |
| **`setup-sddm-astronaut.sh`** | Instala y configura el tema SDDM Astronaut con despachador automático de entorno por usuario. | `sudo` |
| **`set-sddm-berserk.sh`** | Aplica personalización Berserk al tema de SDDM con fondos `guts` o `marca`. | `sudo` |
| **`secure-docker-ufw.sh`** | Protege contenedores Docker aislando puertos publicados de accesos externos no autorizados. | `sudo` |
| **`steam-lan-ufw.sh`** | Habilita el descubrimiento y streaming local de Steam (`27031:27037`) restringido a la LAN local (`192.168.1.0/24`). | `sudo` |
| **`spotube-connect-ufw.sh`** | Regla específica de cortafuegos para permitir el control remoto de música desde el teléfono. | `sudo` |
| **`configurador-firewall.sh`** | Detecta puertos libres dinámicamente y genera reglas de cortafuegos restringidas a la interfaz `enp4s0` y subred LAN. | `sudo` |
| **`fix-sddm.sh`** | Corrige parpadeos negros y bloqueos de pantalla en SDDM Wayland. | `sudo` |
| **`setup-portals.sh`** | Configura los portales XDG de escritorio para captura de pantalla y compartir ventanas en Hyprland. | Usuario |

---

## ⚡ Despliegue Rápido (Symlinks)

Para desplegar estos dotfiles en un sistema nuevo o sincronizar tu configuración:

```bash
# 1. Clonar el repositorio
git clone git@github.com:rovargas98/Dotfiles.git ~/Dotfiles

# 2. Crear enlaces simbólicos hacia ~/.config/
ln -sf ~/Dotfiles/hypr ~/.config/hypr
ln -sf ~/Dotfiles/kitty ~/.config/kitty
ln -sf ~/Dotfiles/waybar ~/.config/waybar
ln -sf ~/Dotfiles/mako ~/.config/mako
ln -sf ~/Dotfiles/nvim ~/.config/nvim
ln -sf ~/Dotfiles/eww ~/.config/eww
ln -sf ~/Dotfiles/rofi ~/.config/rofi
ln -sf ~/Dotfiles/pypr ~/.config/pypr

# 3. Dar permisos de ejecución a los scripts
chmod +x ~/Dotfiles/scripts-SYS/*.sh
chmod +x ~/Dotfiles/waybar/scripts/*.sh
chmod +x ~/Dotfiles/hypr/scripts/*.sh
```

---

## 🧠 Integración con Obsidian CyberDeck

Este repositorio trabaja en armonía con una bóveda de notas de **Obsidian** ubicada en `~/Documents/Obsidian/Vault/`:
*   Las guías técnicas y respuestas del asistente se integran con cabeceras YAML estándar para gestión del conocimiento (PKM).
*   La **Vista de Gráfico (*Graph View*)** de Obsidian permite visualizar la topología conceptual de tu estación conectada a través del nodo central `PC_Dashboard.md`.
