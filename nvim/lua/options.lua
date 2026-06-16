-- ~/.config/nvim/lua/config/options.lua
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.clipboard = "unnamedplus" -- Compartir portapapeles con Wayland
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
