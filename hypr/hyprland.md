-- ==============================================================================
-- ARCHIVO MAESTRO HYPRLAND - Entorno DevOps Tokyo Night (LUA API 0.55+)
-- ==============================================================================

-- 1. Variables de Entorno (NVIDIA & Wayland)
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("XCURSOR_SIZE", "24")

-- 2. Autostart
hl.on("hyprland.start", function ()
   -- Agentes y servicios básicos
   hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
   hl.exec_cmd("wl-paste --type text --watch cliphist store")
   hl.exec_cmd("wl-paste --type image --watch cliphist store")

   -- Demonios del ecosistema Hypr (encadenados)
   hl.exec_cmd("waybar & mako & hyprpaper & hypridle & pypr")

   -- Filtro de luz azul (Temperatura 4500K)
   hl.exec_cmd("hyprsunset --temperature 4500") 

   -- Widgets y utilidades de usuario
   hl.exec_cmd("eww daemon & eww open-many command-center")
   hl.exec_cmd("hyperhdr") 
end)

-- 3. Monitores
hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-1", mode = "1920x1080@144", position = "2560x0", scale = 1 })

-- 4. Configuración Central
hl.config({
   input = {
	kb_layout = "us,es",
	kb_options = "grp:alt_shift_toggle",
	follow_mouse = 1
   },
   cursor = {
    no_hardware_cursors = 2
   },
   general = {
    layout = "dwindle",
    border_size = 2,
    gaps_in = 5,
    gaps_out = 10,
    -- Paleta Tokyo Night
    ["col.active_border"] = { colors = { "0xffbb9af7", "0xff7aa2f7" }, angle = 45 },
    ["col.inactive_border"] = "0xff414868"
   },
   dwindle = {
    preserve_split = true
   },
   decoration = {
    rounding = 7,
    active_opacity = 0.95,
    inactive_opacity = 0.60,
    blur = {
        enabled = true,
        size = 3,
        passes = 2
    }
   }
})

-- 5. Curvas y Animaciones
hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "myBezier", style = "popin" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "default", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "default" })

-- 6. Asignación de Workspaces
-- DP-2 (Monitor Principal - Impares)
hl.workspace_rule({ workspace = "1", monitor = "DP-2" })
hl.workspace_rule({ workspace = "3", monitor = "DP-2" })
hl.workspace_rule({ workspace = "5", monitor = "DP-2" })
hl.workspace_rule({ workspace = "7", monitor = "DP-2" })
hl.workspace_rule({ workspace = "9", monitor = "DP-2" })

-- DP-1 (Monitor Secundario - Pares)
hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "6", monitor = "DP-1" })
hl.workspace_rule({ workspace = "10", monitor = "DP-1" })

-- 7. Reglas de Ventanas (WindowRules V2)
-- CORRECCIÓN APLICADA: El tamaño ahora es un string entre comillas dobles
hl.window_rule({ match = { class = "^(virt-manager)$", title = "^(Localizar soporte ISO)$" }, size = "{800, 600}", center = true })
hl.window_rule({ match = { class = "^(scratch-term)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^(scratch-notes)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^(scratch-serial)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^(Spotify|spotify)$" }, float = true, center = true })

-- ==============================================================================
-- DEFINICIÓN DE LA TECLA MODIFICADORA PRINCIPAL
-- ==============================================================================
local mod = "SUPER"

-- ==============================================================================
-- LANZADOR Y UTILIDADES BÁSICAS
-- ==============================================================================
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + Q",      hl.dsp.window.close())
hl.bind(mod .. " + M",      hl.dsp.exit())
hl.bind(mod .. " + E",      hl.dsp.exec_cmd("kitty -e yazi"))
hl.bind(mod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + R",      hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mod .. " + F",      hl.dsp.window.fullscreen())
hl.bind(mod .. " + I",	    hl.dsp.exec_cmd("~/Dotfiles/hypr/scripts/keybinds.sh"))

-- ==============================================================================
-- NAVEGACIÓN Y FOCO
-- ==============================================================================
hl.bind(mod .. " + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "d" }))
hl.bind(mod .. " + H",     hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + L",     hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + K",     hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + J",     hl.dsp.focus({ direction = "d" }))

-- ==============================================================================
-- WORKSPACES
-- ==============================================================================
hl.bind(mod .. " + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind(mod .. " + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind(mod .. " + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind(mod .. " + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind(mod .. " + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind(mod .. " + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind(mod .. " + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind(mod .. " + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind(mod .. " + 9", hl.dsp.focus({ workspace = "9" }))

-- ==============================================================================
-- GESTIÓN DE LA CUADRÍCULA Y VENTANAS
-- ==============================================================================
hl.bind(mod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind(mod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind(mod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind(mod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind(mod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind(mod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind(mod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind(mod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind(mod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))

hl.bind(mod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + K",     hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "d" }))

hl.bind(mod .. " + CTRL + left",  hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + right", hl.dsp.window.resize({ x = 30,  y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + down",  hl.dsp.window.resize({ x = 0,  y = 30, relative = true }), { repeating = true })

-- ==============================================================================
-- SCRATCHPADS (Pyprland)
-- ==============================================================================
hl.bind(mod .. " + SHIFT + T", hl.dsp.exec_cmd("pypr toggle term"))
hl.bind(mod .. " + SHIFT + N", hl.dsp.exec_cmd("pypr toggle notes"))
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("pypr toggle music"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("pypr toggle serial"))

-- ==============================================================================
-- CAPTURAS DE PANTALLA Y MULTIMEDIA
-- ==============================================================================
hl.bind("Print",         hl.dsp.exec_cmd("grim ~/Pictures/screenshot_$(date +%s).png"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" ~/Pictures/region_$(date +%s).png'))
-- ==============================================================================
-- INTEGRACIÓN CON RATÓN (Pro Workflow)
-- ==============================================================================
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Teclas Multimedia 
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),  { locked = true })
