local map = vim.keymap.set
local opt = { noremap = true, silent = true }
local cmd = vim.cmd
local n, i, v, t = "n", "i", "v", "t"
local ni = { n, i }
local nv = { n, v }
local niv = { n, i, v }

-- Utils ---------------------------------------------------------------------{{{

function save_file_and_fold()
    if vim.api.nvim_buf_get_option(0, "readonly") then return end

    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "nofile" or buftype == "prompt" then return end

    if vim.api.nvim_buf_get_option(0, "modifiable") then
        cmd("w!")
        cmd("mkview")
    end
end

function tree_toggle()
    local tree = require("nvim-tree.api").tree
    tree.toggle({ focus = false })
end

function diag_toggle()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

function gitdiff_toggle()
    local view = require("diffview.lib").get_current_view()
    print("hell")
    if view then
        vim.cmd("DiffviewClose")
    else
        vim.cmd("DiffviewOpen")
        vim.cmd("BufferLineTabRename  diff")
    end
end

local Terminal = require('toggleterm.terminal').Terminal
-- local lazygit  = Terminal:new({
--     cmd = "lazygit",
--     hidden = true,
--     display_name = "git", -- the name of the terminal
--     -- direction = string -- the layout for the terminal, same as the main config options
--     -- dir = string -- the directory for the terminal
--     close_on_exit = true, -- close the terminal window when the process exits
--     -- highlights = table -- a table with highlights
--     -- env = table -- key:value table with environmental variables passed to jobstart()
--     -- clear_env = bool -- use only environmental variables from `env`, passed to jobstart()
--     -- on_open = fun(t: Terminal) -- function to run when the terminal opens
--     -- on_close = fun(t: Terminal) -- function to run when the terminal closes
--     -- auto_scroll = boolean -- automatically scroll to the bottom on terminal output
--     -- callbacks for processing the output
--     -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
--     -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
--     -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
--
-- })
--


local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    -- float_opts = {
    --     border = "double",
    -- },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    -- on_close = function(term)
    --     vim.cmd("startinsert!")
    -- end,
})

function lazygit_toggle()
    lazygit:toggle()
end

map(n, "<leader>C", lazygit_toggle, { noremap = true, silent = true })



DAP_UI_ENABLED = false
local function dap_ui_toggle()
    require("dapui").toggle()
    DAP_UI_ENABLED = not DAP_UI_ENABLED
    if DAP_UI_ENABLED then
        require("nvim-tree.api").tree.close()
    else
        require("nvim-tree.api").tree.open()
    end
    return
end


-- }}}
-- Keys ----------------------------------------------------------------------{{{

-- No highlight search
map(n, '<Esc>', '<Esc>:nohlsearch<CR>', opt)

-- Terminal mode exit on escape
map(t, '<Esc>', '<C-\\><C-n>', opt)

-- Insert empty row / space
map(n, '<CR>', 'o<Esc>', opt)
map(n, '<Space>', 'i<Space><Esc>', opt)

-- Window resize
map(n, '<Left>', '<C-w><', opt)
map(n, '<Right>', '<C-w>>', opt)
map(n, '<Up>', '<C-w>+', opt)
map(n, '<Down>', '<C-w>-', opt)

-- Highlight word on cursor
map(n, '*', '*N', opt)
map(n, '#', '*N', opt)

-- Soft wrap navigation
-- http://vimcasts.org/episodes/soft-wrapping-text/
map(nv, 'j', 'gj', opt)
map(nv, 'k', 'gk', opt)
map(nv, '0', 'g0', opt)
map(nv, '$', 'g$', opt)
map(nv, '^', 'g^', opt)

-- }}}
-- Ctrl ----------------------------------------------------------------------{{{

-- save file and folding  [ru-en]
map(ni, '<C-s>', save_file_and_fold, opt)
map(ni, '<C-ы>', save_file_and_fold, opt)

-- select all [ru-en]
map(n, '<C-a>', 'ggVG', opt)
map(n, '<C-ф>', 'ggVG', opt)

-- <C-y> in insert mode [ru]-bind
map(i, '<C-н>', '<C-y>', opt)

-- Window navigation
map(n, '<C-h>', ':wincmd h<CR>', opt)
map(n, '<C-j>', ':wincmd j<CR>', opt)
map(n, '<C-k>', ':wincmd k<CR>', opt)
map(n, '<C-l>', ':wincmd l<CR>', opt)
map(t, '<C-h>', '<C-\\><C-n>:wincmd h<CR>', opt)
map(t, '<C-j>', '<C-\\><C-n>:wincmd j<CR>', opt)
map(t, '<C-k>', '<C-\\><C-n>:wincmd k<CR>', opt)
map(t, '<C-l>', '<C-\\><C-n>:wincmd l<CR>', opt)
map(n, '<C-р>', ':wincmd h>', opt) -- [ru]
map(n, '<C-о>', ':wincmd j>', opt) -- [ru]
map(n, '<C-л>', ':wincmd k>', opt) -- [ru]
map(n, '<C-д>', ':wincmd l>', opt) -- [ru]

-- Split / close
map(n, '<C-m>', ':split<CR>', opt)
map(n, '<C-/>', ':vsplit<CR>', opt)
map(n, '<C-x>', ':x<CR>', opt)
map(n, '<C-q>', ':q<CR>', opt)

-- Tab navigation [ru-en]
map(n, '<C-,>', ':tabprevious<CR>', opt)
map(n, '<C-.>', ':tabnext<CR>', opt)
map(n, '<C-б>', ':tabprevious<CR>', opt)
map(n, '<C-ю>', ':tabnext<CR>', opt)
map(n, '<C-t>', ':tabnew<CR>', opt)
map(n, '<C-c>', ':tabclose<CR>', opt)

-- }}}
-- Alt -----------------------------------------------------------------------{{{

-- Run
map(n, '<M-r>', ':wa!<CR><C-w>l<C-w>l<C-w>j<C-w>ji<Up><CR><C-\\><C-n>', opt)
map(t, '<M-r>', '<C-\\><C-n>:wa!<CR>i<Up><CR><C-\\><C-n>', opt)

-- Quick activate macros 'm'
map(n, '<M-m>', '@m', opt)



-- }}}
-- Leader --------------------------------------------------------------------{{{

-- ',' telescope buffers
map(n, '<leader>,', ":Telescope buffers<CR>", opt)
map(n, 'бб', ":Telescope buffers<CR>", opt) -- [ru]-бб

-- 'a'

-- 's' search & replace
map(n, '<leader>s', ':%s///g<Left><Left>', opt)
map(v, '<leader>s', ':s//', opt)

-- 'd' close buffer without close window
-- 'D' toggle diagnostics view
map(n, '<leader>d', ':Bdelete<CR>', opt)
map(n, 'бв', ':Bdelete<CR>', opt) -- [ru]
vim.keymap.set('n', '<leader>D', diag_toggle, opt)

-- 'f' telescope files
-- 'F' telescope files home
map(n, "<leader>f", "<Cmd>Telescope find_files<CR>", opt)
map(n, "<leader>F", "<Cmd>Telescope find_files cwd=~<CR>", opt)

-- 'g' telescope grep
-- 'G' telescope grep word under cursor
map(n, '<leader>g', ":Telescope live_grep<CR>", opt)
map(n, '<leader>G', ":Telescope grep_string<CR>", opt)

-- 'z' diag bufer
-- 'Z' diag all
map(n, '<leader>z', ':Trouble diagnostics toggle focus=true filter.buf=0<CR>', opt)
map(n, '<leader>Z', ':Trouble diagnostics toggle focus=true <CR>', opt)

-- 'x' quickfix buffer
-- 'X' quickfix all
map(n, '<leader>x',
    ':TodoQuickFix<CR>:sleep 200m<CR>:x<CR>\
    :Trouble quickfix toggle focus=true filter.buf=0<CR>', opt)
map(n, '<leader>X',
    ':Trouble todo toggle focus=true<CR>', opt)

-- 'c' lsp
map(n, '<leader>c', ':Trouble lsp toggle focus=true<CR>', opt)

-- 'v' toggle term
map(n, '<leader>v', ':ToggleTerm<CR>', opt)
map(n, '<leader>V', ':ToggleTermSendVisualSelection<CR>', opt)

-- 'b' breakpoint
map(n, '<leader>b', ':DapToggleBreakpoint<CR>', opt)

-- }}}
-- <F1>..<F12> ---------------------------------------------------------------{{{

-- <F1> NvimTree
map(n, '<F1>', tree_toggle, opt)

-- <F2> TagBar
map(n, '<F2>', ':TagbarToggle<CR>', opt)

-- <F3> Trouble symbol
map(n, '<F3>', ':Trouble symbols toggle focus=true<CR>', opt)

-- <F4> git diff
map(n, '<F4>', gitdiff_toggle, opt)
-- <F16> lazygit
map(n, '<F16>', lazygit_toggle, opt)

-- <F5>..<F10> Debug
map(n, '<F5>', dap_ui_toggle, opt)
map(n, '<F6>', ':DapContinue<CR>1<CR>', opt)
map(n, '<F7>', ':DapStepInto<CR>', opt)
map(n, '<F8>', ':DapStepOver<CR>', opt)
map(n, '<F9>', ':DapStepOut<CR>', opt)
map(n, '<F10>', ':DapTerminate<CR>', opt)

-- <F11>
map(n, '<F11>', '\
    :e ~/.config/nvim/lua/auto.lua<CR>\
    :e ~/.config/nvim/lua/core.lua<CR>\
    :e ~/.config/nvim/lua/key.lua<CR>\
    :e ~/.config/nvim/lua/plug.lua<CR>\
    ', opt)

-- <F12> source conf
map(n, '<F12>',
    ':so ~/.config/nvim/init.lua<CR>\
    :so ~/.config/nvim/lua/auto.lua<CR>\
    :so ~/.config/nvim/lua/core.lua<CR>\
    :so ~/.config/nvim/lua/plug.lua<CR>\
    :so ~/.config/nvim/lua/key.lua<CR>\
    ', opt)

-- -- <F23> edit conf
-- map(n, '<F11>', '\
--     :e ~/.config/nvim/lua/auto.lua<CR>\
--     :e ~/.config/nvim/lua/core.lua<CR>\
--     :e ~/.config/nvim/lua/key.lua<CR>\
--     :e ~/.config/nvim/lua/plug.lua<CR>\
--     ', opt)
--

-- }}}
-- Diary session -------------------------------------------------------------{{{
map(n, '<Home>',
    ':source /home/alex/ya/diary/Session_diary.vim<CR>\
    :NvimTreeRefresh<CR>:NvimTreeToggle<CR>\
    ', opt)
-- }}}
-- AVIN session --------------------------------------------------------------{{{
map(n, '<End>',
    ':source ~/AVIN/Session.vim<CR>\
    :NvimTreeToggle<CR>\
    <C-w><C-l><C-w><C-l><C-w><C-j>i source ~/env/bin/activate<CR><C-\\><C-n>\
    :set nonu<CR><C-w><C-h>\
    :BufferLineTabRename 󱃖 code<CR>\
    :tabnext<CR>\
    :BufferLineTabRename  tmp<CR>\
    :tabnext<CR>\
    :BufferLineTabRename  debug<CR>\
    :tabnext<CR>\
    :BufferLineTabRename  plan<CR>\
    :tabnext<CR>',
    opt)
-- :DiffviewOpen<CR>\
-- :BufferLineTabRename  diff<CR>\
-- }}}
-- Blog session --------------------------------------------------------------{{{
map(n, '<PageDown>',
    ':source /home/alex/ya/blog/Session_blog.vim<CR>\
    :NvimTreeToggle<CR><C-w><C-l><C-w><C-l>\
    :b3<CR>\
    <C-w><C-h>',
    opt)
-- }}}
-- Telescope ----------------------------------------------------------------{{{
local open_with_trouble = require("trouble.sources.telescope").open
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
-- }}}
