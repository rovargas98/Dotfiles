-- ==============================================================================
-- TEMA BERSERK MANGA NOIR & STATUSLINE
-- ~/.config/nvim/lua/plugins/theme.lua
-- ==============================================================================

return {
  -- 1. Colorescheme Tokyonight adaptado a Berserk Manga Noir
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "dark",
      },
      on_colors = function(colors)
        -- Fondo Manga carbón / tinta profunda
        colors.bg = "#0c0d12"
        colors.bg_dark = "#08090c"
        colors.bg_float = "#111218"
        colors.bg_highlight = "#181924"
        colors.border = "#252736"

        -- Acentos Berserk (Marca del Sacrificio)
        colors.red = "#ff2a3a"
        colors.red1 = "#ff4b5c"

        -- Colores habituales de sintaxis (100% legibles y estándar)
        colors.blue = "#7aa2f7"
        colors.cyan = "#7dcfff"
        colors.green = "#9ece6a"
        colors.magenta = "#bb9af7"
        colors.orange = "#ff9e64"
        colors.yellow = "#e0af68"
        colors.comment = "#565f89" -- Grafito manga sobrio
      end,
      on_highlights = function(hl, colors)
        -- Chasis de la ventana: Manga sobrio con acento carmesí
        hl.CursorLineNr = { fg = "#ff2a3a", bold = true }
        hl.LineNr = { fg = "#3b4261" }
        hl.Cursor = { bg = "#ff2a3a", fg = "#0c0d12" }
        hl.CursorLine = { bg = "#12131b" }
        hl.SignColumn = { bg = "NONE" }

        -- Separadores de splits limpios y oscuros
        hl.WinSeparator = { fg = "#202230", bold = false }

        -- Ventanas flotantes y Telescope
        hl.FloatBorder = { fg = "#383b4d", bg = "#111218" }
        hl.NormalFloat = { bg = "#111218" }
        hl.TelescopeBorder = { fg = "#282a3a" }
        hl.TelescopePromptBorder = { fg = "#ff2a3a" }
        hl.TelescopePromptPrefix = { fg = "#ff2a3a", bold = true }

        -- Diagnósticos y Git
        hl.DiagnosticError = { fg = "#ff2a3a" }
        hl.DiagnosticWarn = { fg = "#e0af68" }
        hl.DiagnosticInfo = { fg = "#7aa2f7" }
        hl.DiagnosticHint = { fg = "#7dcfff" }
        hl.GitSignsAdd = { fg = "#9ece6a" }
        hl.GitSignsChange = { fg = "#7aa2f7" }
        hl.GitSignsDelete = { fg = "#ff2a3a" }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- 2. Barra de Estado (Lualine) Berserk Edition
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      -- Tema custom Manga Noir para Lualine
      local manga_theme = {
        normal = {
          a = { bg = "#ff2a3a", fg = "#0c0d12", gui = "bold" }, -- Insignia Berserk
          b = { bg = "#181924", fg = "#d5d6db" },
          c = { bg = "#0c0d12", fg = "#565f89" },
        },
        insert = {
          a = { bg = "#73daca", fg = "#0c0d12", gui = "bold" },
          b = { bg = "#181924", fg = "#d5d6db" },
          c = { bg = "#0c0d12", fg = "#565f89" },
        },
        visual = {
          a = { bg = "#bb9af7", fg = "#0c0d12", gui = "bold" },
          b = { bg = "#181924", fg = "#d5d6db" },
          c = { bg = "#0c0d12", fg = "#565f89" },
        },
        replace = {
          a = { bg = "#ff9e64", fg = "#0c0d12", gui = "bold" },
          b = { bg = "#181924", fg = "#d5d6db" },
          c = { bg = "#0c0d12", fg = "#565f89" },
        },
        command = {
          a = { bg = "#e0af68", fg = "#0c0d12", gui = "bold" },
          b = { bg = "#181924", fg = "#d5d6db" },
          c = { bg = "#0c0d12", fg = "#565f89" },
        },
        inactive = {
          a = { bg = "#12131a", fg = "#565f89" },
          b = { bg = "#12131a", fg = "#565f89" },
          c = { bg = "#0c0d12", fg = "#3b4261" },
        },
      }

      return {
        options = {
          theme = manga_theme,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = { { "mode", icon = "󰞋" } },
          lualine_b = { { "branch", icon = "" }, "diff" },
          lualine_c = { { "filename", path = 1, symbols = { modified = " ●", readonly = " " } } },
          lualine_x = { "diagnostics", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { { "location", icon = "" } },
        },
      }
    end,
  },
}
