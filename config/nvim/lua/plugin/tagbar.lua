-- https://github.com/preservim/tagbar
-- Навигация по классам и функциям
-- требует установки ctags
-- yay -S ctags
------------------------------------------------------------------------------

local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- Bind
map('n', '<F4>', ':TagbarToggle<CR>', opt)

-- Без пустых строк между функциями и классами
vim.g.tagbar_compact = 1

-- Сортировка по порядку как есть в коде, а не по алфавиту
vim.g.tagbar_sort = 0
