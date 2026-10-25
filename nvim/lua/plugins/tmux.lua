-- ==============================================================================
-- ⚔️ INTEGRACIÓN NEOVIM + TMUX (Vim-Tmux-Navigator)
-- ~/.config/nvim/lua/plugins/tmux.lua
-- ==============================================================================
-- Permite navegar transparentemente entre splits de Neovim y paneles de Tmux
-- usando Ctrl+h (izq), Ctrl+j (abajo), Ctrl+k (arriba), Ctrl+l (der)

return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Navegar al split/panel izquierdo" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Navegar al split/panel inferior" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Navegar al split/panel superior" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Navegar al split/panel derecho" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Navegar al split/panel previo" },
    },
  },
}
