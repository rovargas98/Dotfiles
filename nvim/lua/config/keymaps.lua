-- ==============================================================================
-- ATAJOS DE TECLADO NEOVIM (KEYMAPS)
-- ~/.config/nvim/lua/config/keymaps.lua
-- ==============================================================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Teclas líder
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Guardar y salir rápido
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Guardar archivo" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Cerrar ventana" })
map("n", "<leader>x", "<cmd>x<cr>", { desc = "Guardar y salir" })

-- Navegación entre ventanas / splits (Estilo Neovim moderno)
map("n", "<C-h>", "<C-w>h", { desc = "Mover foco a split izquierdo" })
map("n", "<C-j>", "<C-w>j", { desc = "Mover foco a split inferior" })
map("n", "<C-k>", "<C-w>k", { desc = "Mover foco a split superior" })
map("n", "<C-l>", "<C-w>l", { desc = "Mover foco a split derecho" })

-- Redimensión de splits con flechas
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Navegación entre buffers abiertos
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Buffer siguiente" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Cerrar buffer actual" })

-- Mover líneas seleccionadas en modo visual (Estilo VSCode/Vim)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Mantener cursor centrado al avanzar páginas o buscar
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Limpiar resaltado de búsqueda con Escape
map("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)
