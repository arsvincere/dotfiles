-- https://github.com/lukas-reineke/indent-blankline.nvim
-- Подсветка блоков
------------------------------------------------------------------------------

local cmd = vim.cmd -- execute Vim commands
local autocmd = vim.api.nvim_create_autocmd

require("ibl").setup({
  scope = { enabled = false },
})

cmd [[autocmd FileType dashboard IBLDisable]]
cmd [[autocmd FileType txt IBLDisable]]
autocmd('BufRead', { pattern = '*.py', command = 'IBLEnable' })
autocmd('BufRead', { pattern = '*.pyw', command = 'IBLEnable' })
