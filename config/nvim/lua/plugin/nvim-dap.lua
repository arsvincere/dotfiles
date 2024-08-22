-- https://github.com/mfussenegger/nvim-dap
-- Debug Adapter Protocol client implementation for Neovim
------------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<M-b>', ':DapToggleBreakpoint<CR>', opts)
map('n', '<M-r>', ':DapContinue<CR>', opts)
map('n', '<M-i>', ':DapStepIn<CR>', opts)
map('n', '<M-o>', ':DapStepOut<CR>', opts)
