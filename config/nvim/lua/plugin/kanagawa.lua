-- https://github.com/sho-87/kanagawa-paper.nvim
-- Color scheme
------------------------------------------------------------------------------
vim = vim

-- Default options:
require('kanagawa').setup({
  theme = "wave",    -- Load "wave" theme when 'background' option is not set
  background = {     -- map the value of 'background' option to a theme
    dark = "dragon", -- try "dragon" !
    light = "lotus"
  },
  compile = false,  -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,   -- do not set background color
  gutter = false,
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {
    -- change all usages of these colors
    palette = {
      -- sumiInk0 = "#000000",
      -- fujiWhite = "#FFFFFF",
    },
    -- change specific usages for a certain theme, or for all of them
    theme = {
      wave = {
      },
      dragon = {
        ui = {
          bg_gutter = "none"
        }
      },
      all = {
      }
    }
  },
  overrides = function(colors) -- add/modify highlights
    return {}
  end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
