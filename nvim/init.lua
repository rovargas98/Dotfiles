-- ==============================================================================
-- NEOVIM INIT - Berserk Manga Noir & DevOps Environment
-- ~/.config/nvim/init.lua
-- ==============================================================================

-- 1. Tecla líder (Leader Key)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Cargar opciones y atajos
require("config.options")
require("config.keymaps")

-- 4. Cargar plugins con lazy.nvim
require("lazy").setup("plugins", {
  defaults = { lazy = false },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- 5. Configuración Nativa de LSP (Neovim 0.11+)
pcall(function()
  vim.lsp.enable('pyright')
  vim.lsp.enable('bashls')
  vim.lsp.enable('dockerls')
  vim.lsp.config('yamlls', {
    settings = {
      yaml = {
        schemas = {
          ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.26.0-standalone-strict/all.json"] = "/*.k8s.yaml",
        },
      },
    },
  })
  vim.lsp.enable('yamlls')
end)
