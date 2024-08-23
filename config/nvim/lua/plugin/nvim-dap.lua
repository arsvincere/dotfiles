-- https://github.com/mfussenegger/nvim-dap
-- Debug Adapter Protocol client implementation for Neovim
------------------------------------------------------------------------------

local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- DAP breakpoint
map('n', '<leader>b', ':DapToggleBreakpoint<CR>', opt)

-- <F5> run in terminal
map('n', '<F5>', '<esc>:wa!<CR><C-w>l<C-w>l<C-w>l<C-w>j<C-w>j<C-w>ji<Up><CR><C-\\><C-n>', opt)
map('t', '<F5>', '<C-\\><C-n>:wa!<CR>i<Up><CR><C-\\><C-n>', opt)

-- <F6> - <F10> debugger
map('n', '<F6>', ':wa!<CR>:tablast<CR>:DapContinue<CR>1<CR>', opt)
map('n', '<F7>', ':DapStepInto<CR>', opt)
map('n', '<F8>', ':DapStepOver<CR>', opt)
map('n', '<F9>', ':DapStepOut<CR>', opt)
map('n', '<F10>', ':DapTerminate<CR>', opt)
