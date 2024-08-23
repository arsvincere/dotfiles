local map = vim.keymap.set
local opt = { noremap = true, silent = true }
local n, i, v, t = "n", "i", "v", "t"
local ni = { n, i }
local nv = { n, v }
local niv = { n, i, v }

-- Keys ----------------------------------------------------------------------{{{

-- Window resize
map(n, '<Left>', '<C-w><', opt)
map(n, '<Right>', '<C-w>>', opt)
map(n, '<Up>', '<C-w>+', opt)
map(n, '<Down>', '<C-w>-', opt)

-- Insert empty row / space
map(n, '<CR>', 'o<Esc>', opt)
map(n, '<Space>', 'i<Space><Esc>', opt)

-- Terminal mode exit on escape
map(t, '<Esc>', '<C-\\><C-n>', opt)

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
map(ni, '<C-s>', '<Esc>:w!<CR>:mkview<CR>', opt)
map(ni, '<C-ы>', '<Esc>:w!<CR>:mkview<CR>', opt)

-- select all [ru-en]
map(n, '<C-a>', 'ggVG', opt)
map(n, '<C-ф>', 'ggVG', opt)

-- copy [ru-en]
map(v, '<C-c>', 'y', opt) -- en 'с'
map(v, '<C-с>', 'y', opt) -- ru 'с'

-- <C-y> in insert mode [ru]-bind
map(i, '<C-н>', '<C-y>', opt)

-- Window navigation Ctrl+h, Ctrl+j, Ctrl+k, Ctrl+l [ru-en]
map(n, '<C-Esc>', ':x<CR>', opt)
map(n, '<C-h>', '<C-w><C-h>', opt)
map(n, '<C-р>', '<C-w><C-h>', opt)
map(n, '<C-j>', '<C-w><C-j>', opt)
map(n, '<C-о>', '<C-w><C-j>', opt)
map(n, '<C-k>', '<C-w><C-k>', opt)
map(n, '<C-л>', '<C-w><C-k>', opt)
map(n, '<C-l>', '<C-w><C-l>', opt)
map(n, '<C-д>', '<C-w><C-l>', opt)

-- Tab navigation [ru-en]
map(n, '<C-t>', ':tabnew<CR>', opt)
map(n, '<C-q>', ':tabclose<CR>', opt)
map(n, '<C-,>', ':tabprevious<CR>', opt)
map(n, '<C-.>', ':tabnext<CR>', opt)
map(n, '<C-е>', ':tabnew<CR>', opt)
map(n, '<C-й>', ':tabclose<CR>', opt)
map(n, '<C-б>', ':tabprevious<CR>', opt)
map(n, '<C-ю>', ':tabnext<CR>', opt)

-- }}}
-- Alt -----------------------------------------------------------------------{{{

-- Fast activate macros
map(n, '<M-m>', '@m', opt)

-- Split
map(n, '<M-h>', ':sp<CR>', opt)
map(n, '<M-v>', ':vs<CR>', opt)
map(n, '<M-x>', ':x<CR>', opt)
map(n, '<M-q>', ':q<CR>', opt)

-- }}}
-- Leader --------------------------------------------------------------------{{{

-- Search & replace
map(n, '<leader>s', ':%s///g<Left><Left>', { noremap = true, silent = false })
map(v, '<leader>s', ':s//', { noremap = true, silent = false })

-- }}}
-- <F1>..<F12> ---------------------------------------------------------------{{{

-- no highlight search
map(n, '<F1>', ':nohl<CR>', opt)

-- source nvim conf
map(n, '<F11>',
    ':so ~/.config/nvim/init.lua<CR>\
    :so ~/.config/nvim/lua/core.lua<CR>\
    :so ~/.config/nvim/lua/key.lua<CR>\
    :so ~/.config/nvim/lua/plug.lua<CR>',
    { noremap = true, silent = false })

-- edit nvim conf
map(n, '<F12>', '\
    :e ~/.config/nvim/lua/auto.lua<CR>\
    :e ~/.config/nvim/lua/core.lua<CR>\
    :e ~/.config/nvim/lua/key.lua<CR>\
    :e ~/.config/nvim/lua/plug.lua<CR>\
    ', { noremap = true })
-- }}}

-- AVIN session --------------------------------------------------------------{{{
map(n, '<PageUp>',
    ':source ~/AVIN/Session.vim<CR>\
    :NvimTreeToggle<CR>\
    <C-w><C-l><C-w><C-l><C-w><C-j>i source ~/env/bin/activate<CR><C-\\><C-n>\
    :set nonu<CR><C-w><C-h>\
    :BufferLineTabRename 󱃖 code<CR>\
    :tabnext<CR>\
    :BufferLineTabRename  tmp<CR>\
    :DiffviewOpen<CR>\
    :BufferLineTabRename  diff<CR>\
    :tabnext<CR>\
    :BufferLineTabRename  debug<CR>\
    :tabnext<CR>\
    :BufferLineTabRename  plan<CR>\
    :tabnext<CR>\
    ', opt)
-- }}}
-- Blog session --------------------------------------------------------------{{{
map(n, '<PageDown>',
    ':source /home/alex/ya/blog/Session_blog.vim<CR>\
    :NvimTreeToggle<CR><C-w><C-l><C-w><C-l>\
    :b3<CR>\
    <C-w><C-h>\
    ', opt)
-- }}}
-- Diary session -------------------------------------------------------------{{{
map(n, '<Home>',
    ':source /home/alex/ya/diary/Session_diary.vim<CR>\
    :NvimTreeRefresh<CR>:NvimTreeToggle<CR>\
    ', opt)
-- }}}
