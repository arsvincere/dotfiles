-- https://github.com/sho-87/kanagawa-paper.nvim
-- Color scheme
------------------------------------------------------------------------------
vim = vim

require('kanagawa-again').setup({
  undercurl = true,
  transparent = false,
  gutter = false,
  dimInactive = false, -- disabled when transparent
  terminalColors = true,
  commentStyle = { italic = true },
  functionStyle = { italic = false },
  keywordStyle = { italic = false, bold = false },
  statementStyle = { italic = false, bold = false },
  typeStyle = { italic = false },
  colors = { theme = {}, palette = {} }, -- override default palette and theme colors
  overrides = function()                 -- override highlight groups
    return {}
  end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa-again")
