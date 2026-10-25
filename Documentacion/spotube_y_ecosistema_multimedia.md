# 🎵 Documentación: Spotube & Ecosistema Multimedia DevOps

Esta guía detalla la arquitectura de aislamiento multiusuario, motor de extracción de audio, integración de plugins y conectividad remota para **Spotube** en CachyOS / Hyprland.

---

## 🛡️ 1. Arquitectura de Aislamiento Multiusuario

En sistemas compartidos (como el presente entorno con usuarios `devops` y `ro`), Spotube por defecto extrae el binario de YouTube `NewPipeCLI` en `/tmp/NewPipeCLI`. Cuando el primer usuario lo ejecuta con permisos de escritura restrictivos (`devops:devops 0700` o `0755`), el segundo usuario (`ro`) sufre colisiones de permisos, impidiendo abrir la app o reproduciendo ventanas en blanco con la barra superior congelada.

### Wrapper Protector (`~/.local/bin/spotube`)
Para resolver este problema de forma permanente, se diseñó un contenedor que:
1.  Aísla la variable `TMPDIR` en el directorio de ejecución privado de cada usuario:
    ```bash
    export TMPDIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/tmp"
    mkdir -p "$TMPDIR"
    ```
2.  Asegura que las utilidades locales (`yt-dlp`, `pnpm`, binarios de usuario) estén en el `$PATH`.
3.  Vigila y garantiza los permisos de ejecución (`chmod +x`) de `NewPipeCLI` para evitar fallos de lectura de firmas.
4.  Ejecuta el binario real `/usr/share/spotube-bin/spotube "$@"`.

---

## ⚡ 2. Motor de Audio: NewPipe vs. YoutubeExplode

En la base de datos de configuración de Spotube (`~/.local/share/oss.krtirtho.spotube/db.sqlite`):
*   **Problema de `youtubeExplode`:** El motor interno por defecto basado en Dart sufre bloqueos frecuentes de YouTube (errores HTTP 403, algoritmos de descifrado *n-sig* de YouTube cambiantes), dejando las canciones cargando infinitamente sin sonar.
*   **Solución con `newPipe`:** Se configuró en `preferences_table`:
    ```sql
    UPDATE preferences_table SET youtube_client_engine = 'newPipe' WHERE id = 0;
    ```
    Al utilizar `newPipe`, Spotube delega la resolución de streams en el ejecutable `NewPipeCLI`, el cual gestiona los desafíos criptográficos de Google y resuelve streams de forma instantánea.

---

## 🧩 3. Plugins Integrados

En `plugins_table` se encuentran activos:
1.  **Sonic Liberation Spotify (v0.2.2):**
    *   Habilitado para metadatos (`selected_for_metadata = 1`).
    *   Gestiona la búsqueda, artistas, álbumes y listas de reproducción oficiales.
2.  **YouTube Audio (v1.0.0):**
    *   Habilitado para extracción de audio (`selected_for_audio_source = 1`).
    *   Conectado al motor `newPipe`.

---

## 📱 4. Conectividad Móvil (Spotube Connect & KDE Connect)

Para permitir el control de la música desde el teléfono móvil en la red de área local:

1.  **Configuración en Spotube:**
    ```sql
    UPDATE preferences_table SET enable_connect = 1, connect_port = 9090 WHERE id = 0;
    ```
2.  **Script de Apertura de Cortafuegos (`scripts-SYS/enable-phone-connect.sh`):**
    *   Abre el puerto `9090/tcp` (Spotube Connect) restringido a la subred LAN (`192.168.1.0/24`).
    *   Abre los puertos `1714:1764` (TCP/UDP) requeridos para KDE Connect.
    *   Habilita y arranca el servicio `avahi-daemon` para descubrimiento de servicios mDNS/ZeroConf.
    *   Arranca `kdeconnectd` e indicador en segundo plano.

---

## ⌨️ 5. Integración con Hyprland & Pyprland

*   **Scratchpad flotante:** Mapeado en `SUPER + SHIFT + M` mediante Pyprland (`pypr toggle music`).
*   **Dimensiones:** 50% x 60% centrado flotante en pantalla, ocultable instantáneamente sin cerrar la reproducción en segundo plano.
*   **Regla de ventana:** Centrado automático y flotación forzada en `Dotfiles/hypr/hyprland.lua`.
