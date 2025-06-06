-- https://github.com/shaunsingh/nord.nvim
-- Color scheme
------------------------------------------------------------------------------

-- vim.cmd [[colorscheme nord]]

vim.cmd.colorscheme 'nord'

require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'nord'
    -- ... your lualine config
  }
}
