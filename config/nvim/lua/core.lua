local g = vim.g                -- global variables
local opt = vim.opt            -- global/buffer/windows-scoped options
local cmd = vim.cmd            -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local acmd = vim.api.nvim_create_autocmd


-- Main -------------------------------------------------------------------{{{
g.mapleader = ','                 -- <leader> key
opt.mouse = 'a'                   -- Включаем мышку
opt.number = true                 -- Включаем нумерацию строк
opt.relativenumber = true         -- Относительная нумерация строк
opt.cursorline = true             -- Подсветка строки с курсором
opt.cursorlineopt = "number"      -- Подсветить только номер
opt.signcolumn = "yes"            -- E, W, !, etc...
-- opt.colorcolumn = '79'         -- Разделитель на 78 символов, 79 highlight
opt.swapfile = false              -- Отключаем swap
opt.hidden = true                 -- Отлючаем удаление буфера при закрытии
opt.undofile = true               -- Возможность отката назад
opt.history = 300                 -- Количество команд history
opt.splitright = true             -- Vertical split вправо
opt.splitbelow = true             -- Horizontal split вниз
opt.background = "dark"           -- используется некоторыми темами
opt.so = 20                       -- 20 строк перед скоролом экрана
opt.linebreak = true              -- Переносить по словам
opt.spelllang = { 'en_us', 'ru' } -- Словари рус eng
opt.clipboard = 'unnamedplus'     -- Cистемный буфер обмена (yay -S xsel)

acmd('BufRead', { pattern = '*.un', command = 'set filetype=un' })
acmd('BufNewFile', { pattern = '*.un', command = 'set filetype=un' })
acmd('BufRead', { pattern = '*.color', command = 'set filetype=color' })
acmd('BufNewFile', { pattern = '*.color', command = 'set filetype=color' })
acmd('BufRead', { pattern = '*.bg', command = 'set filetype=bg' })
acmd('BufNewFile', { pattern = '*.fg', command = 'set filetype=fg' })
-- }}}
-- Autosave ---------------------------------------------------------------{{{
-- Автосохранение при потере фокуса
acmd('BufLeave', { pattern = '*.py', command = 'silent w!' })
acmd('BufLeave', { pattern = '*.md', command = 'silent w!' })
acmd('BufLeave', { pattern = '*.un', command = 'silent w!' })
acmd('BufLeave', { pattern = '*.adoc', command = 'silent w!' })
-- }}}
-- Folding ----------------------------------------------------------------{{{
opt.foldenable = true     -- При открытии файла скрывать блоки
opt.foldmethod = 'marker' -- Фолдинг по маркерам
-- }}}
-- Tab --------------------------------------------------------------------{{{
opt.expandtab = true   -- use spaces instead of tabs
opt.shiftwidth = 4     -- shift 4 spaces when tab
opt.tabstop = 4        -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType html,lua setlocal shiftwidth=2 tabstop=2
]]
cmd([[
filetype indent plugin on
syntax enable
]])
-- }}}
-- Search -----------------------------------------------------------------{{{
opt.ignorecase = true -- Регистронезависимый поиск
opt.smartcase = true  -- Зависимый если есть UppperCase
-- }}}
-- Other ------------------------------------------------------------------{{{

-- Automatically remove trailing whitespace.
cmd([[
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * %s/\s\+$//e
]])

-- Remove line lenght marker for selected filetypes
cmd([[
autocmd FileType html,markdown,adoc,un,text setlocal cc=0
]])

-- Запоминает где nvim последний раз редактировал файл
cmd([[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=128}
augroup end
]], false)
-- }}}
