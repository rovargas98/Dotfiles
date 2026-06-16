-- ~/.config/nvim/init.lua
-- nn Bootstrap lazy.nvim nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
"git", "clone", "--filter=blob:none",
"https://github.com/folke/lazy.nvim.git",
"--branch=stable",
lazypath,
})
end
vim.opt.rtp:prepend(lazypath)
-- nn Cargar configuración y plugins nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
require("config.options")
require("config.keymaps")
require("lazy").setup("plugins")
