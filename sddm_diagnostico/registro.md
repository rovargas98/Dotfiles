# Registro de Diagnóstico de SDDM

Este archivo documenta los pasos para diagnosticar y solucionar el problema de la pantalla negra en SDDM.

Debido a que no tengo permisos de superusuario, he generado los archivos necesarios en este directorio. Deberás copiarlos a la ubicación del sistema y reiniciar el servicio manualmente.

---

### Paso 1: Aislar el problema del Tema Visual

**Acción:** Vamos a forzar a SDDM a usar el tema 'breeze', que es muy estable.

1.  Copia el archivo de configuración que he creado a su lugar correspondiente:
    ```bash
    sudo cp sddm_diagnostico/01_theme_fix.conf /etc/sddm.conf.d/99-debug-theme.conf
    ```

2.  Reinicia SDDM para aplicar el cambio:
    ```bash
    sudo systemctl restart sddm
    ```

**Análisis del resultado:**
*   **Si ves la pantalla de login:** El problema es el tema `tokyo-night-sddm`. Puedes intentar reinstalarlo o instalar sus dependencias (`qt5-graphicaleffects`, `qt5-quickcontrols2`).
*   **Si la pantalla sigue en negro:** El problema no es el tema. Procede al siguiente paso. Antes de continuar, elimina el archivo de prueba:
    ```bash
    sudo rm /etc/sddm.conf.d/99-debug-theme.conf
    ```

---

### Paso 2: Forzar el uso de X11

**Acción:** Si el paso anterior no funcionó, forzaremos a SDDM a usar el backend de X11 en lugar de Wayland.

1.  Copia el segundo archivo de configuración:
    ```bash
    sudo cp sddm_diagnostico/02_x11_fix.conf /etc/sddm.conf.d/99-debug-x11.conf
    ```

2.  Reinicia SDDM:
    ```bash
    sudo systemctl restart sddm
    ```

**Análisis del resultado:**
*   **Si ahora ves la pantalla de login:** El problema era un conflicto con Wayland en el greeter. Puedes dejar ese archivo de configuración (`99-debug-x11.conf`) de forma permanente para solucionar el problema.

---

### Paso 4: Identificación de la Causa Raíz (Falta de Plugins de Qt Wayland)

**Análisis de Logs Actuales:**
Tras el reinicio, he analizado los logs del sistema (`journalctl -u sddm`) y he encontrado el error definitivo:
```
sddm-greeter: Could not find the Qt platform plugin "wayland" in ""
This application failed to start because no Qt platform plugin could be initialized.
```

**Diagnóstico:**
1.  **SDDM está configurado para usar Wayland** (visto en `/etc/sddm.conf.d/00-global.conf`).
2.  **Faltan los paquetes de soporte de Wayland para Qt**, por lo que el "Greeter" (la pantalla de login) se cierra inmediatamente al intentar arrancar.
3.  El parámetro `nvidia-drm.modeset=1` ya está **correctamente activo**.

---

### SOLUCIÓN DEFINITIVA

Tienes dos opciones para solucionar esto. **Recomiendo la Opción A.**

#### Opción A: Instalar los plugins necesarios (Mantener Wayland)
Esta es la mejor opción si quieres que SDDM funcione de forma moderna con Wayland y NVIDIA.

1.  Instala los paquetes perdidos:
    ```bash
    sudo pacman -S qt5-wayland qt6-wayland
    ```

2.  Reinicia SDDM:
    ```bash
    sudo systemctl restart sddm
    ```

#### Opción B: Forzar el uso de X11 (Si la Opción A falla)
Si prefieres volver a la estabilidad de X11 para la pantalla de login:

1.  Copia el archivo de configuración que preparé anteriormente (asegúrate de que el nombre sea exacto):
    ```bash
    sudo cp sddm_diagnostico/02_x11_fix.conf /etc/sddm.conf.d/99-debug-x11.conf
    ```

2.  Reinicia SDDM:
    ```bash
    sudo systemctl restart sddm
    ```

---

### SOLUCIÓN CONFIRMADA (ÉXITO) ✅

Tras los pasos anteriores, se identificaron dos correcciones críticas finales que resolvieron el problema del "cierre fantasma" del Greeter:

#### 1. Compatibilidad de Qt6 en el Tema
El tema `tokyo-night-sddm` necesitaba declarar explícitamente su compatibilidad con Qt6 para que el demonio SDDM (que usa Qt6 en Arch) no lo abortara.

**Acción:**
Editar `/usr/share/sddm/themes/tokyo-night-sddm/metadata.desktop` y añadir/modificar:
```ini
QtVersion=6
```

#### 2. Dependencia de Layer Shell
Para que el compositor bajo Wayland funcione correctamente con la integración de SDDM, se requieren las librerías de Layer Shell.

**Acción:**
Instalar los paquetes necesarios:
```bash
sudo pacman -S layer-shell-qt
```

**Resultado:** SDDM ahora inicia correctamente en Wayland con el tema visual completo y sin errores de cierre prematuro.
