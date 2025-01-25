-- https://github.com/slugbyte/lackluster.nvim
-- Color scheme
------------------------------------------------------------------------------

vim.cmd.colorscheme 'lackluster'

require('lualine').setup({
  options = {
    theme = "lackluster",
  },
})
