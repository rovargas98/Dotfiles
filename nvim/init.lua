-- ==========================================
-- Configuración Nativa de LSP (Neovim 0.11+)
-- ==========================================

-- Para servidores que no requieren configuración extra, solo los "encendemos"
vim.lsp.enable('pyright')
vim.lsp.enable('bashls')
vim.lsp.enable('dockerls')

-- Para servidores con configuración específica, primero definimos la config y luego lo encendemos
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
