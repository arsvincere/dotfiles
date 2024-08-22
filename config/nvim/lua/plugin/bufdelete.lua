-- https://github.com/famiu/bufdelete.nvim
-- Удаление буфера без изменений разбивки окна :vs :split и тп
------------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Close buffer
map('n', '<leader>d', ':Bdelete<CR>', opt)
map('n', 'бв', ':Bdelete<CR>', opt)
