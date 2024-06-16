-- https://github.com/nvim-telescope/telescope.nvim
-- Нечеткий поиск по файлам, навигация по буферам и др.
------------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Удаление буферов из списка по Ctrl+d
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      n = {
    	  ['<C-d>'] = require('telescope.actions').delete_buffer,
          ['<d>'] = require('telescope.actions').delete_buffer
      }, -- n
      i = {
        ["<C-h>"] = "which_key",
        ['<C-d>'] = require('telescope.actions').delete_buffer
      } -- i
    }
  },
}

-- Список открытых буферов: en - ',,'  |  ru - 'бб'
map('n', '<leader>,',
    [[ <cmd>lua require('telescope.builtin').buffers()<CR><Esc>]],
    opts)
map('n', 'бб',
    [[ <cmd>lua require('telescope.builtin').buffers()<CR><Esc>]],
    opts)

-- Открыть поиск по имени файла ,f
map('n', '<leader>f',
    [[ <cmd>lua require('telescope.builtin').find_files()<CR>]],
    opts)

-- Grep
map('n', '<leader>g',
    [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
    opts)

-- Grep слова под курсором
map('n', '<leader>G',
    [[<cmd>lua require('telescope.builtin').grep_string()<CR><Esc>]],
    opts)

