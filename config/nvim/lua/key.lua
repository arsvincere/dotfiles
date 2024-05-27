local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Keymap --------------------------------------------------------------------

-- <Ctrl-s> save file and folding  [ru-en]
map('n', '<C-s>', ':w!<CR>:mkview<CR>', opts)
map('i', '<C-s>', '<Esc>:w!<CR>:mkview<CR>', opts)
map('n', '<C-ы>', ':w!<CR>:mkview<CR>', opts)
map('i', '<C-ы>', '<Esc>:w!<CR>:mkview<CR>', opts)

-- <Ctrl-a> [ru-en]
map('n', '<C-a>', 'ggVG', opts)
map('n', '<C-ф>', 'ggVG', opts)

-- <Ctrl-c> [ru-en]
map('v', '<C-c>', 'y', opts)    -- английская 'с'
map('v', '<C-с>', 'y', opts)    -- русская 'с'

-- Window navigation Ctrl+h, Ctrl+j, Ctrl+k, Ctrl+l [ru-en]
map('n', '<C-h>', '<C-w><C-h>', opts)
map('n', '<C-р>', '<C-w><C-h>', opts)
map('n', '<C-j>', '<C-w><C-j>', opts)
map('n', '<C-о>', '<C-w><C-j>', opts)
map('n', '<C-k>', '<C-w><C-k>', opts)
map('n', '<C-л>', '<C-w><C-k>', opts)
map('n', '<C-l>', '<C-w><C-l>', opts)
map('n', '<C-д>', '<C-w><C-l>', opts)

-- Window resize
map('n', '<Left>', '<C-w><', opts)
map('n', '<Right>', '<C-w>>', opts)
map('n', '<Up>', '<C-w>+', opts)
map('n', '<Down>', '<C-w>-', opts)

-- Insert empty row / space
map('n', '<CR>', 'o<Esc>', opts)
map('n', '<Space>', 'i<Space><Esc>', opts)

-- Copy string before by <C-y> in insert mode, [ru]-bind
map('i', '<C-н>', '<C-y>', opts)

-- Exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- Highlight word on cursor
map('n', '*', '*N', opts)

-- Search & replace
map('v', '<leader>s', ':s//', {noremap = true, silent = false})
map('n', '<leader>s', ':%s///g<Left><Left>', {noremap = true, silent = false})

-- Soft wrap navigation
-- http://vimcasts.org/episodes/soft-wrapping-text/
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('n', '0', 'g0', opts)
map('n', '$', 'g$', opts)
map('n', '^', 'g^', opts)
map('v', 'j', 'gj', opts)
map('v', 'k', 'gk', opts)
map('v', '0', 'g0', opts)
map('v', '$', 'g$', opts)
map('v', '^', 'g^', opts)

-- Fast activate macro
map('n', '<esc>r', '@r', opts)
map('n', '<esc>s', '@s', opts)
map('n', '<esc>d', '@d', opts)
map('n', '<esc>f', '@f', opts)
map('n', '<esc>c', '@c', opts)
map('n', '<esc>m', '@m', opts)

-- <F1> .. <F12> -------------------------------------------------------------

-- По F1 очищаем последний поиск с подсветкой
map('n', '<F1>', ':nohl<CR>', opts)

-- <F2> перечитать конфигурацию nvim Может не работать, если echo $TERM  xterm-256color
map('n', '<F2>', ':so ~/.config/nvim/init.lua<CR>\
    :so ~/.config/nvim/lua/core.lua<CR>\
    :so ~/.config/nvim/lua/key.lua<CR>\
    ', { noremap = true })

-- <F3> Дерево файлов.
map('n', '<F3>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', opts)

-- <F4>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<F4>', ':TagbarToggle<CR>', opts)

-- <F5> run in terminal
map('n', '<F5>', ':wa!<CR>@r', opts)

-- <F12> Открыть всю nvim конфигурацию для редактирования
map('n', '<F12>', '\
    :e ~/.config/nvim/init.lua<CR>\
    :e ~/.config/nvim/lua/core.lua<CR>\
    :e ~/.config/nvim/lua/key.lua<CR>\
    :e ~/.config/nvim/todo.md<CR>\
    ', { noremap = true })

-- Arsvincere session -------------------------------------------------------
map('n', '<PageUp>',
    ':source /home/alex/ya/arsvincere/dev/Session_avin.vim<CR>\
    :NvimTreeRefresh<CR>:NvimTreeToggle<CR>\
    <C-w><C-l><C-w><C-l>icd ya/arsvincere<CR>\
    source ~/ya/arsvincere/env/bin/activate<CR><C-\\><C-n>\
    :set nonu<CR><C-w><C-h>\
    ', opts)
    -- source ~/ve/bin/activate<CR>\

-- Blog session --------------------------------------------------------------
map('n', '<PageDown>',
    ':source /home/alex/ya/blog/Session_blog.vim<CR>\
    :NvimTreeToggle<CR><C-w><C-l><C-w><C-l>\
    :b3<CR>\
    <C-w><C-h>\
    ' , opts)

-- Diary session -------------------------------------------------------------
map('n', '<Home>',
    ':source /home/alex/ya/diary/Session_diary.vim<CR>\
    :NvimTreeRefresh<CR>:NvimTreeToggle<CR>\
    ', opts)

    -- :NvimTreeToggle<CR>\
    -- :NvimTreeRefresh<CR>:NvimTreeToggle<CR>\
