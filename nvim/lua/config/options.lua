-- ==============================================================================
-- OPCIONES GLOBALES DE NEOVIM
-- ~/.config/nvim/lua/config/options.lua
-- ==============================================================================

local opt = vim.opt

-- Números de línea relativos y sobrios
opt.number = true
opt.relativenumber = true

-- Indentación estándar (2 espacios)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Color y estética
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.fillchars = { eob = " " } -- Quitar tildes (~) al final de archivos

-- Rendimiento y respuesta
opt.updatetime = 200
opt.timeoutlen = 300
opt.clipboard = "unnamedplus" -- Portapapeles compartido nativo con Wayland (wl-copy)
opt.undofile = true

-- Búsqueda inteligente
opt.ignorecase = true
opt.smartcase = true

-- Splits intuitivos
opt.splitbelow = true
opt.splitright = true
