-- https://github.com/nvim-telescope/telescope.nvim
-- Нечеткий поиск по файлам, навигация по буферам и др.
------------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- todo-comments
local open_with_trouble = require("trouble.sources.telescope").open

-- telescope config
require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ['<C-d>'] = require('telescope.actions').delete_buffer,
                ['<d>'] = require('telescope.actions').delete_buffer,
                ["<C-t>"] = open_with_trouble
            }, -- n
            i = {
                ["<C-h>"] = "which_key",
                ['<C-d>'] = require('telescope.actions').delete_buffer,
                ["<C-t>"] = open_with_trouble
            } -- i
        }
    },
}


-- telescope bind -----------------------------------------------------------

-- Список открытых буферов: en - ',,'  |  ru - 'бб'
map('n', '<leader>,',
    [[ <cmd>lua require('telescope.builtin').buffers()<CR>]],
    opts)
map('n', 'бб',
    [[ <cmd>lua require('telescope.builtin').buffers()<CR>]],
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
