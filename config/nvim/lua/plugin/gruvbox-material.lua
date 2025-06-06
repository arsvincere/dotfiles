-- https://github.com/sainnhe/gruvbox-material
-- Color scheme
------------------------------------------------------------------------------
vim = vim

vim.opt.termguicolors = true --  24-bit RGB colors
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_cursor = 'red'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_transparent_background = 0

-- Note: the configuration options should be placed before
vim.cmd 'colorscheme gruvbox-material'


-- path theme ----------------------------------------------------------------
-- File:
-- /home/alex/.local/share/nvim/plugged/gruvbox-material/autoload/gruvbox_material.vim
-- добавить цвет 'fg_fold' #938056  223
--   if a:foreground ==# 'material' "
--     if &background ==# 'dark'
--       let palette2 = {
--             \ 'fg0':              ['#d4be98',   '223'],
--             \ 'fg1':              ['#ddc7a1',   '223'],
--             \ 'fg_fold':          ['#938056',   '223'],
--             \ 'red':              ['#ea6962',   '167'],
--             \ 'orange':           ['#e78a4e',   '208'],
--             \ 'yellow':           ['#d8a657',   '214'],
--             \ 'green':            ['#a9b665',   '142'],
--             \ 'aqua':             ['#89b482',   '108'],
--             \ 'blue':             ['#7daea3',   '109'],
--             \ 'purple':           ['#d3869b',   '175'],
--             \ 'bg_red':           ['#ea6962',   '167'],
--             \ 'bg_green':         ['#a9b665',   '142'],
--             \ 'bg_yellow':        ['#d8a657',   '214']
--             \ }



-- File:
-- /home/alex/.local/share/nvim/plugged/gruvbox-material/colors/gruvbox-material.vim

-- изменить эти две строки
-- второй аргументе - цвет шрифта на fg_fold
-- третий аргументе - цвет фона на none

--   call gruvbox_material#highlight('Folded', s:palette.fg_fold, s:palette.none)
--   call gruvbox_material#highlight('Folded', s:palette.fg_fold, s:palette.none)
