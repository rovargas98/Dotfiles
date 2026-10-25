# ⚔️ DevOps CyberDeck - Tmux Berserk Manga Noir Multiplexer

[![Tool: Tmux](https://img.shields.io/badge/Multiplexer-Tmux%20v3.4+-00d2ff?style=for-the-badge&logo=tmux&logoColor=white)](https://github.com/tmux/tmux)
[![Theme: Berserk Noir](https://img.shields.io/badge/Theme-Cyberpunk%20Berserk-ff2a3a?style=for-the-badge)](https://github.com/rovargas98/Dotfiles)
[![Role: DevOps & SysAdmin](https://img.shields.io/badge/Role-DevOps%20%2F%20SRE-98c379?style=for-the-badge)](https://cachyos.org/)

El pilar fundamental de cualquier **Ingeniero DevOps, SysAdmin o SRE** es el multiplexor de terminal **Tmux**. A diferencia de los emuladores gráficos locales (como Kitty, Alacritty o Foot), Tmux desacopla la sesión de la ventana gráfica: vive en el servidor, sobrevive a desconexiones de red SSH, gestiona múltiples ventanas y paneles de logs en paralelo, y permite emitir comandos masivos simultáneos a flotas enteras mediante **Modo Broadcast**.

En este CyberDeck, Kitty actúa como el **anfitrión gráfico de alto rendimiento** (GPU Wayland, 144Hz, blur, fuentes tipográficas y paleta Manga Noir), mientras que **Tmux asume el control absoluto de las sesiones, paneles, pestañas y persistencia**.

---

## 📑 Tabla de Contenidos
* [🎯 ¿Por qué Tmux para DevOps frente al Tiling local?](#-por-qué-tmux-para-devops-frente-al-tiling-local)
* [🎨 Identidad Visual Berserk Manga Noir](#-identidad-visual-berserk-manga-noir)
* [⌨️ Tabla Maestra de Atajos (Keybinds)](#-tabla-maestra-de-atajos-keybinds)
* [🔥 Superpoderes DevOps: Modo Broadcast (F11)](#-superpoderes-devops-modo-broadcast-f11)
* [📋 Modo Copia Vi y Portapapeles Wayland](#-modo-copia-vi-y-portapapeles-wayland)
* [🚀 Integración de Shell Principal en el Sistema](#-integración-de-shell-principal-en-el-sistema)
* [🔄 Persistencia de Sesiones con TPM (Resurrect & Continuum)](#-persistencia-de-sesiones-con-tpm-resurrect--continuum)
* [🛠️ Comandos Rápidos de DevOps (`tmx`)](#-comandos-rápidos-de-devops-tmx)

---

## 🎯 ¿Por qué Tmux para DevOps frente al Tiling local?

| Característica | Kitty Tiling Local | Tmux DevOps CyberDeck |
| :--- | :--- | :--- |
| **Persistencia ante caídas de SSH** | ❌ La sesión muere al caer la conexión | ✅ La sesión sigue viva en el host remoto (`tmux attach`) |
| **Portabilidad a Servidores y Bastions** | ❌ Requiere entorno gráfico Wayland | ✅ Funciona en cualquier Linux sin X11/Wayland |
| **Broadcast a Múltiples Servidores** | ⚠️ Requiere sockets locales (`kitten broadcast`) | ✅ Nativo (`synchronize-panes` con `F11`) en cualquier máquina |
| **Persistencia tras Reinicio de SO** | ❌ No disponible | ✅ Guardado automático continuo con `tmux-resurrect` |
| **Navegación Unificada con Neovim** | ⚠️ Limitada | ✅ Integrable vía bindings nativos estilo Vim (`h, j, k, l`) |

---

## 🎨 Identidad Visual Berserk Manga Noir

La interfaz inferior y los bordes de Tmux han sido diseñados meticulosamente para integrarse con la estética de **Hyprland, Waybar y Neovim**:

```
[ Carbono Manga #0c0d12 ] ──── Fondo de la barra de estado y paneles inactivos
[ Grafito Slate #181922 ] ──── Módulos secundarios de pestañas inactivas y host
[ Berserk Red   #ff2a3a ] ──── Borde del panel activo, sesión actual y alerta Marca
[ Texto Marfil  #d5d6db ] ──── Texto principal y nombres de ventanas
[ Cyber Cyan    #56b6c2 ] ──── Indicador de hostname del nodo
[ Cyber Violet  #c678dd ] ──── Reloj digital en tiempo real
[ Neon Jade     #98c379 ] ──── Indicador de telemetría y estado óptimo
```

*   **Borde Activo:** Resaltado en rojo Berserk Crimson `#ff2a3a`.
*   **Borde Inactivo:** Carbón grafito `#232430`.
*   **Alerta Broadcast:** Si el modo broadcast está activo, la barra muestra una insignia en rojo parpadeante `󰓦 BROADCAST ACTIVO`.

---

## ⌨️ Tabla Maestra de Atajos (Keybinds)

El **Prefijo Maestro** es el estándar de la industria (**`Ctrl + B`**), con **`Ctrl + A`** como prefijo secundario.

### 1. Gestión de Paneles y Divisiones (Splits)
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `Prefix + %` o `Prefix + |` | **División Vertical** | Divide la pantalla lado a lado (conserva directorio actual) |
| `Prefix + "` o `Prefix + -` | **División Horizontal** | Divide la pantalla arriba y abajo (conserva directorio actual) |
| `Prefix + z` o `Alt + Z` | **Alternar Zoom** | Maximiza temporalmente el panel activo a pantalla completa |
| `Prefix + x` | **Cerrar Panel** | Mata el panel activo |
| `Prefix + o` | **Ciclar Paneles** | Salta al siguiente panel |
| `Prefix + ;` | **Último Panel** | Salta al último panel activo |
| `Prefix + q` | **Números de Panel** | Muestra números en pantalla para saltar rápido |

### 2. Navegación Fluida Neovim + Tmux (Sin Prefijo)
Gracias a `christoomey/vim-tmux-navigator`, viajas entre splits de Neovim y paneles de Tmux de forma continua:

| Atajo | Dirección | Modo |
| :--- | :--- | :--- |
| `Ctrl + h` | Panel/Split Izquierdo | Directo (Neovim & Tmux) |
| `Ctrl + l` | Panel/Split Derecho | Directo (Neovim & Tmux) |
| `Ctrl + k` | Panel/Split Superior | Directo (Neovim & Tmux) |
| `Ctrl + j` | Panel/Split Inferior | Directo (Neovim & Tmux) |
| `Ctrl + \` | Split/Panel Previo | Directo (Neovim & Tmux) |

### 3. Redimensión de Paneles
| Atajo | Acción |
| :--- | :--- |
| `Prefix + Ctrl + Flechas` | Redimensión suave de panel en esa dirección (Estándar Industria) |
| `Prefix + H` / `J` / `K` / `L` | Redimensionar panel en saltos de 5 celdas hacia Izquierda / Abajo / Arriba / Derecha |

### 4. Gestión de Ventanas (Pestañas)
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `Prefix + c` | Crear una nueva ventana/pestaña | Conserva el directorio actual |
| `Prefix + ,` | Renombrar ventana | Cambia el título en la barra de estado |
| `Prefix + &` | Cerrar ventana | Cierra la pestaña activa y sus paneles |
| `Prefix + n` / `Prefix + p` | Siguiente / Anterior | Moverse a la ventana siguiente o previa |
| `Prefix + l` | Última ventana | Alterna entre las dos últimas ventanas activas |
| `Prefix + 0..9` | Saltar a ventana | Salto directo por índice |
| `Prefix + w` | Lista interactiva | Árbol interactivo de todas las ventanas y sesiones |
| `Prefix + f` | Buscar ventana | Busca ventanas abiertas por nombre |
| `Alt + [1..9]` | Salto directo | Salto rápido sin prefijo a ventanas 1 a 9 |

---

## 🔥 Superpoderes DevOps: Modo Broadcast (F11)

El **Modo Broadcast** permite que cualquier comando escrito en el panel activo se replique inmediatamente en **todos los paneles abiertos de esa ventana**:

*   **Pulsación:** Pulsa `F11` (o `Prefix + b` / `Prefix + S`).
*   **Feedback visual:** La barra de estado inferior mostrará `󰓦 BROADCAST ACTIVO` en rojo Berserk, y Tmux notificará el estado en el mensaje superior.
*   **Caso de Uso DevOps:** Abre 4 paneles, haz SSH a 4 nodos de un clúster Kubernetes (`node-01`, `node-02`, etc.), activa `F11` y ejecuta `sudo systemctl restart containerd` simultáneamente en todas las máquinas.

---

## 📋 Modo Copia Vi y Portapapeles Wayland

Tmux está integrado con el portapapeles de Wayland (`wl-copy` y `wl-paste`):

1. Pulsa `Prefix + [` o `Escape` para entrar en **Modo Copia**.
2. Usa teclas de navegación Vim (`h`, `j`, `k`, `l`, `w`, `b`, `/` para buscar).
3. Pulsa `v` para iniciar la selección visual de texto.
4. Pulsa `y` para copiar la selección al portapapeles del sistema (Wayland) y salir del modo copia.
5. También puedes **seleccionar directamente con el ratón**, y al soltar el botón se copiará automáticamente al portapapeles.
6. Para pegar dentro de Tmux: `Prefix + P` o `Ctrl + Shift + V`.

---

## 🚀 Integración de Shell Principal en el Sistema

Para que Tmux sea la experiencia nativa de inicio:

1. **Auto-arranque en `~/.zshrc`:** Al abrir cualquier terminal interactiva (`kitty`, terminal de Hyprland o consola), Zsh verifica que no estés dentro de una sesión ni en un script no interactivo, y ejecuta:
   ```zsh
   exec tmux new-session -A -s devops
   ```
   *   Si la sesión `devops` ya existe, se adjunta al instante.
   *   Si no existe, la crea limpia.
   *   Al salir de Tmux, la ventana del terminal se cierra limpiamente sin dejar shells zombies.
2. **Protecciones integradas:** La integración detecta entornos de `Neovim` (`$NVIM`), subshells y scripts remotos (`scp`, `sftp`, `rsync`) para **nunca** interferir con transferencias automatizadas de archivos.
3. Si deseas abrir una terminal única sin Tmux para debugging rápido, puedes ejecutar:
   ```bash
   NO_TMUX=1 kitty
   ```

---

## 🔄 Persistencia de Sesiones con TPM (Resurrect & Continuum)

El repositorio incluye soporte para **TPM (Tmux Plugin Manager)** preconfigurado con:
*   `tmux-resurrect`: Guarda el estado completo de ventanas, paneles, rutas y procesos.
*   `tmux-continuum`: Guarda el estado automáticamente cada 15 minutos y lo restaura al iniciar.

### Atajos de TPM:
*   `Prefix + Ctrl-s` : Guardar manualmente el estado de las sesiones.
*   `Prefix + Ctrl-r` : Restaurar manualmente el estado guardado.
*   `Prefix + I` (Mayúscula) : Instalar plugins adicionales declarados en `tmux.conf`.

---

## 🛠️ Comandos Rápidos de DevOps (`tmx`)

Se han añadido los siguientes atajos y funciones al entorno:

```bash
# Abrir o conectar a la sesión por defecto 'devops'
tmx

# Crear o saltar a una sesión de proyecto específico (ej. k8s, docker, terraform)
tmx k8s
tmx terraform

# Listar sesiones activas
tls

# Conectar a una sesión existente por nombre
ta k8s

# Terminar una sesión
tks k8s

# Alternar sincronización de paneles vía comando
tsync
```
