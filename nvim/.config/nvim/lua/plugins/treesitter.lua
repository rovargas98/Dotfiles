return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = { 
      "lua", "vim", "vimdoc", "query", "bash", 
      "hyprlang", "markdown", "markdown_inline", "dockerfile" 
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    -- Ya no se requiere 'nvim-treesitter.configs'
    require("nvim-treesitter.configs").setup(opts)
  end,
}
