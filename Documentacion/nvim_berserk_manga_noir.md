# 🗡️ Documentación: Neovim - Berserk Manga Noir & DevOps Stack

Esta guía documenta la unificación de la arquitectura de configuración de **Neovim (v0.11+)**, el tema Berserk Manga Noir con Lualine personalizado y la infraestructura de servidores de lenguaje (LSP) mediante Mason y PNPM.

---

## 🏛️ 1. Estructura Unificada de Directorios

Se eliminó la duplicidad anidada que existía previamente en `.config/nvim/.config/nvim`, centralizando toda la configuración de forma limpia bajo el estándar `lazy.nvim`:

```
Dotfiles/nvim/
├── init.lua                 # Punto de entrada maestro y gestor de Lazy.nvim
├── lazy-lock.json           # Bloqueo de versiones determinista de plugins
└── lua/
    ├── config/
    │   ├── keymaps.lua      # Atajos DevOps y navegación de buffers
    │   └── options.lua      # Opciones generales (números relativos, tabs 2/4, clipboard)
    └── plugins/
        ├── lsp.lua          # Configuración de LSP Nativo + Mason
        ├── telescope.lua    # Búsqueda difusa y explorador de archivos
        ├── theme.lua        # Tema Berserk Manga Noir + Lualine Cyberpunk
        └── treesitter.lua   # Resaltado sintáctico de alto rendimiento
```

---

## 🎨 2. Especificación Estética: Berserk Manga Noir

El editor está optimizado para trabajar en administración de sistemas y desarrollo sin fatiga visual, combinando fondos neutros de cómic japonés con acentos de sangre Berserk:

*   **Fondo del editor:** Carbón puro `#0c0d12` con soporte de transparencia.
*   **Texto normal:** Marfil manga `#d5d6db` de alto contraste.
*   **Cursor & Acentos activos:** Rojo Marca del Sacrificio `#ff2a3a`.
*   **Colores de Sintaxis de Código:** Colores estándar ANSI y Tokyo Night nítidos (código legible para Python, YAML, Dockerfiles y Bash).

### Barra de Estado Personalizada (Lualine)
En [theme.lua](file:///home/devops/Dotfiles/nvim/lua/plugins/theme.lua):
*   Modo Normal: Insignia Escarlata Berserk (`#ff2a3a`).
*   Modo Insertar: *Cyber Neon Cyan* (`#56b6c2`).
*   Modo Visual: *Cyber Violet* (`#c678dd`).
*   Separadores angulares sutiles con telemetría de diagnósticos LSP, codificación UTF-8 y posición del cursor en tiempo real.

---

## 🧠 3. Infraestructura LSP & Entorno de Ejecución (Mason)

### Requisito de Runtime Node.js / PNPM
Algunos servidores de lenguaje esenciales para DevOps (`bash-language-server`, `dockerfile-language-server`, `yaml-language-server`, `ansible-language-server`) requieren un entorno Node.js / npm para su compilación e instalación.

Para evitar ensuciar el sistema con paquetes huérfanos de pacman:
1.  Se aprovisionó el runtime mediante **pnpm** en:
    ```
    /home/devops/.local/share/pnpm/bin/
    ```
2.  Dicha ruta se exporta en el `$PATH` de la sesión de Neovim y el compositor.
3.  Servidores instalados y validados en `:Mason`:
    *   `bash-language-server` (`bashls`): Validación de scripts Shell/Bash.
    *   `dockerfile-language-server` (`dockerls`): Sintaxis de imágenes y contenedores.
    *   `yaml-language-server` (`yamlls`): Manifiestos de Kubernetes con validación estricta.
    *   `ansible-language-server` (`ansiblels`): Automatización de infraestructura.
    *   `pyright`: Análisis estático para herramientas y scripts de Python.

---

## ⚡ 4. Atajos Clave en Neovim
*   `<Space>ff`: Buscar archivos mediante Telescope.
*   `<Space>fg`: Búsqueda de texto global (*live grep*).
*   `K`: Mostrar documentación flotante de la función o parámetro (LSP Hover).
*   `gd`: Ir a la definición de la función o variable.
*   `<Space>ca`: Acciones de código (*Code Actions* / corrección rápida).
