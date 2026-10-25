# 🏮 Documentación Completa: Waybar - Cyberpunk Berserk Noir

Esta guía documenta la arquitectura, módulos, scripts de telemetría y especificación estética de la barra superior **Waybar** integrada en el entorno DevOps Tokyo Night / Cyberpunk Berserk.

---

## 🎨 1. Filosofía de Diseño y Estética Cyberpunk Berserk

La barra está estructurada como un conjunto de **islas flotantes (*floating capsules*)** con acabado carbón manga, detalles de alta tecnología (*Cyberpunk Neon*) y acentos escarlata inspirados en la Marca del Sacrificio de Berserk:

*   **Fondo de las Islas (`.modules-left`, `.modules-center`, `.modules-right`):**
    *   Color: Carbón Manga Profundo `rgba(12, 13, 18, 0.92)`.
    *   Borde: Contorno carmesí Berserk sutil `1px solid rgba(255, 42, 58, 0.35)`.
    *   Sombra: `0 4px 18px rgba(0, 0, 0, 0.75), 0 0 10px rgba(255, 42, 58, 0.15)`.
*   **Contenedores de Módulos:**
    *   Fondo: Grafito oscuro `rgba(18, 19, 26, 0.75)`.
    *   Borde: `1px solid rgba(75, 82, 99, 0.25)`.
    *   Radio de esquinas: `8px`.
*   **Código de Colores de Módulos:**
    *   **Ventana activa & Red Wi-Fi:** *Neon Cyan* (`#56b6c2`).
    *   **Audio (PulseAudio) & RAM:** *Cyber Violet* (`#c678dd` / `#bb9af7`).
    *   **Disco:** *Manga Slate* (`#abb2bf`).
    *   **Reloj & Fechador:** Blanco puro de alto contraste (`#ffffff`).
    *   **Música (MPRIS):** Texto marfil (`#d5d6db`) con corte lateral escarlata Berserk (`border-left: 3px solid #ff2a3a`).
    *   **Escritorio Activo (*Workspace*):** Fondo Rojo Berserk (`#ff2a3a`) con resplandor carmesí (`box-shadow: 0 0 10px rgba(255, 42, 58, 0.60)`).
    *   **Botón Centro de Control (Eww):** *Cyan HUD* (`#56b6c2`) con hover invertido.
    *   **Botón de Apagado (*Power*):** Rojo Berserk puro (`#ff2a3a`) con resplandor activo.

---

## ⚖️ 2. Arquitectura Antibalanceo (*Anti-Jitter*)

Para evitar que la barra "baile" o se mueva lateralmente al refrescarse la telemetría en tiempo real:

1.  **Eliminación de Ancho Dinámico en Red:**
    *   Se eliminó la tasa de transferencia en vivo (`{bandwidthDownBytes} ⇣ {bandwidthUpBytes} ⇡`) del texto visible de la barra.
    *   El módulo `network` muestra una etiqueta estática con el ESSID de la red (`  DIGIFIBRA-PLUS-Xyku`) o `󰈀  LAN`.
    *   La velocidad y métricas detalladas se preservan en el **tooltip** al pasar el ratón.
2.  **Relleno Forzado a Dos Dígitos (`%02d`):**
    *   Tanto `cpu-telemetry.sh` como `gpu-telemetry.sh` formatean los porcentajes y temperaturas con relleno de ceros: `02% 35°C`, `15% 42°C`, garantizando una longitud de caracteres estrictamente constante.
3.  **Números Tabulares en CSS (`font-feature-settings: "tnum"`):**
    *   Todos los números se renderizan con ancho monoespaciado exacto (`tabular-nums`), impidiendo que dígitos como el `1` ocupen menos píxeles que el `8`.
4.  **Anchos Mínimos Fijos (`min-width`):**
    *   Se definieron anchos mínimos en CSS para los módulos que varían periódicamente:
        *   `#custom-cpu_telemetry, #custom-gpu_telemetry`: `min-width: 122px;`
        *   `#memory, #disk`: `min-width: 65px;`
        *   `#pulseaudio`: `min-width: 72px;`
        *   `#clock`: `min-width: 168px;`

---

## 💻 3. Scripts de Telemetría

### CPU Telemetry (`waybar/scripts/cpu-telemetry.sh`)
*   **Fuente:** Lectura directa del kernel en `/proc/stat` mediante cálculo de deltas en 0.5s (independiente del idioma del sistema operativo).
*   **Temperatura:** Expresión regular PCRE filtrando sensores `Tctl`, `Core 0` o `Package id 0`.
*   **Formato de salida:**
    ```json
    {"text": " 03%  37°C", "class": "cold"}
    ```

### GPU Telemetry (`waybar/scripts/gpu-telemetry.sh`)
*   **Fuente:** `nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits`.
*   **Formato de salida:**
    ```json
    {"text": "󰢮 15%  44°C", "class": "cold"}
    ```

### Escala Térmica Dinámica (Clases CSS)
Ambos scripts clasifican la temperatura en clases dinámicas aplicadas automáticamente a Waybar:
*   `< 50°C` $\rightarrow$ `.cold` (*Neon Cyan* `#56b6c2`).
*   `50°C - 70°C` $\rightarrow$ `.normal` (*Jade Óptimo* `#98c379`).
*   `70°C - 85°C` $\rightarrow$ `.warm` (*Amber Ciberpunk* `#e5c07b`).
*   `> 85°C` $\rightarrow$ `.hot` (*Rojo Berserk Alerta* `#ff2a3a` con fondo `rgba(255, 42, 58, 0.25)` y borde carmesí).

---

## 🔧 4. Control y Recarga
*   **Recarga en caliente:**
    ```bash
    killall -SIGUSR2 waybar
    ```
*   **Revisión de logs:**
    ```bash
    journalctl --user -u waybar -b 0
    ```
