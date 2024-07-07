local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options
local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local autocmd = vim.api.nvim_create_autocmd


-- Main ----------------------------------------------------------------------{{{
g.mapleader = ','               -- <leader> key
opt.mouse = 'a'                 -- Включаем мышку
opt.number = true               -- Включаем нумерацию строк
opt.relativenumber = true
opt.colorcolumn = '79'          -- Разделитель на 78 символов, 79 highlight
opt.swapfile = false            -- Отключаем swap
opt.hidden = true               -- Отлючаем удаление буфера при закрытии
opt.undofile = true             -- Возможность отката назад
opt.history = 200               -- Количество команд history
opt.splitright = true           -- Vertical split вправо
opt.splitbelow = true           -- Horizontal split вниз
opt.cursorline = false          -- Подсветка строки с курсором откл.
opt.so=10                       -- 10 строк перед скоролом экрана
opt.linebreak = true            -- Переносить по словам
opt.clipboard = 'unnamedplus'   -- Используем системный буфер обмена
                                -- install xsel чтобы заработало

autocmd('BufRead',    { pattern = '*.un',    command = 'set filetype=un' })
autocmd('BufNewFile', { pattern = '*.un',    command = 'set filetype=un' })
autocmd('BufRead',    { pattern = '*.color', command = 'set filetype=color' })
autocmd('BufNewFile', { pattern = '*.color', command = 'set filetype=color' })
autocmd('BufRead',    { pattern = '*.bg', command = 'set filetype=bg' })
autocmd('BufNewFile', { pattern = '*.fg', command = 'set filetype=fg' })
-- }}}
-- Autosave ------------------------------------------------------------------{{{
-- Автосохранение при потере фокуса
-- autocmd('BufLeave', { pattern = '*.py', command = 'w!' })
-- autocmd('BufLeave', { pattern = '*.pyw', command = 'w!' })
-- autocmd('BufLeave', { pattern = '*.cpp', command = 'w!' })
-- autocmd('BufLeave', { pattern = '*.h', command = 'w!' })
-- autocmd('BufLeave', { pattern = '*.lua', command = 'w!' })
-- autocmd('BufLeave', { pattern = '*.json', command = 'w!' })
-- autocmd('BufLeave', { pattern = '*.csv', command = 'w!' })
autocmd('BufLeave', { pattern = '*.md', command = 'w!' })
autocmd('BufLeave', { pattern = '*.un', command = 'w!' })
autocmd('BufLeave', { pattern = '*.adoc', command = 'w!' })
-- }}}
-- Folding -------------------------------------------------------------------{{{
opt.foldenable = true            -- При открытии файла скрывать блоки
opt.foldmethod = 'marker'        -- Группировка по маркерам
-- }}}
-- Tab -----------------------------------------------------------------------{{{
opt.expandtab = true            -- use spaces instead of tabs
opt.shiftwidth = 4              -- shift 4 spaces when tab
opt.tabstop = 4                 -- 1 tab == 4 spaces
opt.smartindent = true          -- autoindent new lines
cmd([[
filetype indent plugin on
syntax enable
]])
-- }}}
-- Search --------------------------------------------------------------------{{{
opt.ignorecase = true           -- Регистронезависимый поиск
opt.smartcase = true            -- Зависимый если есть UppperCase
-- }}}
-- Other ---------------------------------------------------------------------{{{

-- Remove all trailing whitespace on save
autocmd('BufWritePre', { pattern = '*.py', command = [[%s/\s\+$//e]], })
autocmd('BufWritePre', { pattern = '*.lua', command = [[%s/\s\+$//e]], })
autocmd('BufWritePre', { pattern = '*.cpp', command = [[%s/\s\+$//e]], })
autocmd('BufWritePre', { pattern = '*.h', command = [[%s/\s\+$//e]], })
autocmd('BufWritePre', { pattern = '*.md', command = [[%s/\s\+$//e]], })
autocmd('BufWritePre', { pattern = '*.adoc', command = [[%s/\s\+$//e]], })
autocmd('BufWritePre', { pattern = '*.un', command = [[%s/\s\+$//e]], })

-- Remove line lenght marker for selected filetypes
cmd [[autocmd FileType html,xhtml,javascript setlocal cc=0]]

-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]

-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup end
]], false)
-- }}}

