local map = vim.keymap.set
local opt = { noremap = true, silent = true }
local cmd = vim.cmd
local n, i, v, t = "n", "i", "v", "t"
local ni = { n, i }
local nv = { n, v }
local niv = { n, i, v }

-- Utils ------------------------------------------------------------------{{{
LAST_RUN = false
DAP_UI_ENABLED = false

local function split(inputstr, sep) -- {{{
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

-- }}}
local function file_name(file_path) -- {{{
  local parts = split(file_path, '/')
  return parts[#parts]
end

-- }}}
local function save_file_and_fold() -- {{{
  if vim.api.nvim_buf_get_option(0, "readonly") then return end

  local buftype = vim.api.nvim_buf_get_option(0, "buftype")
  if buftype == "nofile" or buftype == "prompt" then return end

  if vim.api.nvim_buf_get_option(0, "modifiable") then
    cmd("w!")
  end
end

-- }}}
local function tree_toggle() -- {{{
  local tree = require("nvim-tree.api").tree
  -- tree.toggle({ focus = false })
  tree.toggle({ focus = true })
end

-- }}}
local function diag_toggle() -- {{{
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

-- }}}
local function gitdiff_toggle() -- {{{
  local view = require("diffview.lib").get_current_view()
  print("hell")
  if view then
    cmd("DiffviewClose")
  else
    cmd("DiffviewOpen")
    cmd("BufferLineTabRename  diff")
  end
end

-- }}}
local function run() -- {{{
  cmd('wa!')
  local file_path = vim.api.nvim_buf_get_name(0)
  local name = file_name(file_path)

  local py = string.find(name, ".py")
  if py then
    LAST_RUN = tostring(':1TermExec cmd="python3 ' .. file_path .. '"')
  end

  local pytest = string.find(name, "test_")
  if pytest then
    LAST_RUN = tostring(':1TermExec cmd="pytest ' .. file_path .. ' -s"')
  end

  local rust = string.find(name, ".rs")
  if rust then
    LAST_RUN = tostring(':1TermExec cmd="cargo r"')
  end

  cmd(LAST_RUN)
end

-- }}}
local function re_run() -- {{{
  if LAST_RUN then
    cmd('wa!')
    cmd(LAST_RUN)
  end
end
-- }}}
local function run_pytest() -- {{{
  cmd('wa!')
  local file_path = vim.api.nvim_buf_get_name(0)
  local name = file_name(file_path)

  local py = string.find(name, ".py")
  if py then
    LAST_RUN = ':8TermExec cmd="pytest tests" name=pytest<CR>'
  end

  local rust = string.find(name, ".rs")
  if rust then
    LAST_RUN = ':8TermExec cmd="cargo test" name=cargo_test<CR>'
  end

  cmd(LAST_RUN)
end
-- }}}
local function run_debug() -- {{{
  cmd("tablast")
  if not DAP_UI_ENABLED then
    require("dapui").open()
    require("nvim-tree.api").tree.close()
    DAP_UI_ENABLED = not DAP_UI_ENABLED
    cmd("DapContinue")
    cmd("1")
  else
    cmd("DapContinue")
  end
  return
end
-- }}}
local function run_main() -- {{{
  cmd('wa!')
  -- local file_path = vim.api.nvim_buf_get_name(0)
  -- local name = file_name(file_path)
  --
  -- local py = string.find(name, ".py")
  -- if py then
  --   LAST_RUN = tostring(':1TermExec cmd="python3 main.py"')
  -- end

  LAST_RUN = tostring(':1TermExec cmd="python3 main.py"')
  cmd(LAST_RUN)
end

-- }}}
local function close_degug() -- {{{
  if DAP_UI_ENABLED then
    cmd("DapTerminate")
    require("dapui").close()
    require("nvim-tree.api").tree.open()
    DAP_UI_ENABLED = not DAP_UI_ENABLED
  end
  return
end
-- }}}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ -- {{{
  count = 11,
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  display_name = "git",
  start_in_insert = true,
  close_on_exit = true, -- close the terminal window when the process exits
  on_open = function(term)
    cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', "q", "<cmd>close<CR>", opt)
  end,
  -- function to run on closing the terminal
  -- on_close = function(term)
  --     cmd("startinsert!")
  -- end,
})
local function lazygit_toggle()
  lazygit:toggle()
end

-- }}}
-- local pgadmin = Terminal:new({ -- {{{
--   count = 11,
--   cmd = "pgadmin",
--   direction = "float",
--   display_name = "pgadmin",
--   hidden = true,
-- })

-- }}}

-- }}}
-- Keys -------------------------------------------------------------------{{{

-- No highlight search
map(n, '<Esc>', '<Esc>:nohlsearch<CR>', opt)

-- Terminal mode exit on escape
map(t, '<Esc>', '<C-\\><C-n>', opt)

-- Insert empty row
map(n, '<CR>', 'o<Esc>', opt)

-- Insert space
map(n, '<Space>', 'i<Space><Esc>', opt)

-- Insert mode from visual
map(v, 'i', 'I', opt)

-- Window resize
map(n, '<S-Left>', '<C-w><', opt)
map(n, '<S-Right>', '<C-w>>', opt)
map(n, '<S-Up>', '<C-w>+', opt)
map(n, '<S-Down>', '<C-w>-', opt)

-- Highlight word on cursor
map(n, '*', '*N', opt)
map(n, '#', '*N', opt)
-- map(v, '*', '*N<Esc>', opt)
-- map(v, '#', '*N<Esc>', opt)

-- Soft wrap navigation
-- http://vimcasts.org/episodes/soft-wrapping-text/
map(nv, 'j', 'gj', opt)
map(nv, 'k', 'gk', opt)
map(nv, '0', 'g0', opt)
map(nv, '$', 'g$', opt)
map(nv, '^', 'g^', opt)

map(n, "s", '<Plug>(leap-forward)', opt)
map(n, "S", '<Plug>(leap-backward)', opt)
map(n, 'gs', '<Plug>(leap-from-window)', opt)
require('leap.user').set_repeat_keys('<C-Enter>', '<M-Space>')

-- }}}
-- Ctrl -------------------------------------------------------------------{{{

-- Neorg follow link
map(n, "<C-CR>", "<Plug>(neorg.esupports.hop.hop-link)", opt)

-- save file and folding  [ru-en]
map(n, '<C-s>', save_file_and_fold, opt)
map(n, '<C-ы>', save_file_and_fold, opt)

-- save all
map(n, '<C-S-s>', ":wa!<CR>", opt)

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
map(n, '<C-р>', ':wincmd h<CR>', opt) -- [ru]
map(n, '<C-о>', ':wincmd j<CR>', opt) -- [ru]
map(n, '<C-л>', ':wincmd k<CR>', opt) -- [ru]
map(n, '<C-д>', ':wincmd l<CR>', opt) -- [ru]
map(t, '<C-h>', [[<Cmd>wincmd h<CR>]], opt)
map(t, '<C-j>', [[<Cmd>wincmd j<CR>]], opt)
map(t, '<C-k>', [[<Cmd>wincmd k<CR>]], opt)
map(t, '<C-l>', [[<Cmd>wincmd l<CR>]], opt)

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
-- Alt --------------------------------------------------------------------{{{
-- :ToggleTerm size=40 dir=~/Desktop direction=horizontal name=desktop
map(n, '<M-1>', ':1ToggleTerm<CR>', opt)
map(n, '<M-2>', ':2ToggleTerm<CR>', opt)
map(n, '<M-3>', ':3ToggleTerm<CR>', opt)
map(n, '<M-4>', ':4ToggleTerm size=80 direction=vertical<CR> ', opt)
map(n, '<M-5>', ':5ToggleTerm size=80 direction=vertical<CR> ', opt)
map(n, '<M-6>', ':6ToggleTerm size=80 direction=vertical<CR> ', opt)
map(n, '<M-7>', ':7ToggleTerm direction=tab<CR> ', opt)
map(n, '<M-8>', ':8ToggleTerm direction=tab<CR> ', opt)
map(n, '<M-9>', ':9ToggleTerm direction=tab<CR> ', opt)

-- Run last
map(n, '<M-r>', re_run, opt)
map(t, '<M-r>', re_run, opt)

-- Quick activate macros
map(n, '<M-n>', '@n', opt)
map(n, '<M-m>', '@m', opt)


-- }}}
-- Leader -----------------------------------------------------------------{{{
-- ',,' toggle term
map(n, '<leader><leader>', ':ToggleTerm<CR>', opt)
map(v, '<leader><leader>', ':ToggleTermSendVisualSelection<CR>', opt)

-- 'q' fuck them all!
map("n", "<leader>q", "<cmd>CellularAutomaton make_it_rain<CR>")

-- 'a' dbg py
map(n, '<leader>a',
  'o\
####\
from avin.utils import dbg, dbg_kv, break_point\
dbg()\
dbg_kv()\
break_point("")\
exit(100500)\
####\
<Esc>\
'
  , opt)

-- 's' search & replace
map(n, '<leader>s', ':%s///g<Left><Left>', { noremap = true, silent = false })
map(v, '<leader>s', ':s//', { noremap = true, silent = false })

-- 'd' close buffer without close window
-- 'D' toggle diagnostics view
map(n, '<leader>d', ':Bdelete<CR>', opt)
map(n, 'бв', ':Bdelete<CR>', opt) -- [ru]
vim.keymap.set('n', '<leader>D', diag_toggle, opt)

-- 'f' telescope files
-- 'F' telescope files home
map(n, "<leader>f", ":Telescope find_files<CR>", opt)
map(n, "<leader>F", ":Telescope find_files cwd=~<CR>", opt)

-- 'g' telescope grep
-- 'G' telescope grep word under cursor
map(n, '<leader>g', ":Telescope live_grep<CR>", opt)
map(n, '<leader>G', ":Telescope grep_string<CR>", opt)

-- 'z' Trouble: diag bufer
-- 'Z' Trouble: diag all
map(n, '<leader>z', ':Trouble diagnostics toggle focus=true filter.buf=0<CR>', opt)
map(n, '<leader>Z', ':Trouble diagnostics toggle focus=true <CR>', opt)

-- 'x' Trouble: quickfix buffer
-- 'X' Trouble: quickfix all
map(n, '<leader>x', ':Trouble quickfix toggle focus=true filter.buf=0<CR>', opt)
map(n, '<leader>X', ':Trouble todo toggle focus=true<CR>', opt)

-- 'c' lsp_lines toggle
-- 'C' Trouble: lsp all
map(n, "<leader>c", require("lsp_lines").toggle, opt)
map(n, '<leader>C', ':Trouble lsp toggle focus=true<CR>', opt)

-- 'v'
-- 'V'

-- 'b' telescope opened buffers
map(n, '<leader>b', ":Telescope buffers<CR>", opt)
map(n, 'бу', ":Telescope buffers<CR>", opt) -- [ru]-бб
-- 'B' breakpoint
map(n, '<leader>B', ':DapToggleBreakpoint<CR>', opt)

-- 'q'
-- 'w'
-- 'e'

-- 'r-' run ____
map(n, '<leader>rd', run_debug, opt)
map(n, '<leader>rt', run_pytest, opt)
-- map(n, '<leader>rp', ':12TermExec cmd="pgadmin" name=pgadmin<CR>', opt)

-- 't' toggle f-string
require('f-string-toggle').setup({
  key_binding = "<leader>t",
  key_binding_desc = "Toggle f-string"
})


-- -- '.' Neorg index
-- map(n, '<leader>.', ':Neorg index<CR>', opt)
-- -- 'j' Neorg journal
-- map(n, '<leader>j', ':Neorg journal today<CR>', opt)
-- -- 'n' Neorg ...
-- map(n, '<leader>n', ':Neorg', opt)
-- -- 'm' Neorg minimize
-- map(n, '<leader>m', ':Neorg return<CR>', opt)

-- }}}
-- <F1>..<F12> ------------------------------------------------------------{{{

-- <F1> TagBar
map(n, '<F1>', ':TagbarToggle<CR>', opt)

-- <F2> Trouble symbol
map(n, '<F2>', ':Trouble symbols toggle win.position=right win.size=0.2 focus=true<CR>', opt)

-- <F3> NvimTree
map(n, '<F3>', tree_toggle, opt)

-- <F4> Git diff
map(n, '<F4>', gitdiff_toggle, opt)

-- <F5> Run current buf
map(n, '<F5>', run, opt)
map(t, '<F5>', re_run, opt)
-- <Shift+F5> Run main.py
map(n, '<F17>', run_main, opt)
map(t, '<F17>', run_main, opt)

-- <F6>..<F10> Debug
map(n, '<F6>', run_debug, opt)
map(n, '<F7>', ':DapStepInto<CR>', opt)
map(n, '<F8>', ':DapStepOver<CR>', opt)
map(n, '<F9>', ':DapStepOut<CR>', opt)
map(n, '<F10>', close_degug, opt)

-- <F11> Lazygit
map(n, "<F11>", lazygit_toggle, opt)

-- <F12> source conf
map(n, '<F12>',
  ':so ~/.config/nvim/init.lua<CR>\
    :so ~/.config/nvim/lua/auto.lua<CR>\
    :so ~/.config/nvim/lua/core.lua<CR>\
    :so ~/.config/nvim/lua/plug.lua<CR>\
    :so ~/.config/nvim/lua/key.lua<CR>\
    ', opt)


-- }}}
-- Telescope --------------------------------------------------------------{{{
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
-- which-key --------------------------------------------------------------{{{
-- local wk = require("which-key")
-- wk.add({
--   { "<leader>f", group = "file" }, -- group
--   { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
--   { "<leader>fb", function() print("hello") end, desc = "Foobar" },
--   { "<leader>fn", desc = "New File" },
--   { "<leader>f1", hidden = true }, -- hide this keymap
--   { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
--   { "<leader>b", group = "buffers", expand = function()
--       return require("which-key.extras").expand.buf()
--     end
--   },
--   {
--     -- Nested mappings are allowed and can be added in any order
--     -- Most attributes can be inherited or overridden on any level
--     -- There's no limit to the depth of nesting
--     mode = { "n", "v" }, -- NORMAL and VISUAL mode
--     { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
--     { "<leader>w", "<cmd>w<cr>", desc = "Write" },
--   }
-- })}}}
-- AVIN session -----------------------------------------------------------{{{
map(n, '<End>',
  ':source ~/AVIN/Session.vim<CR>\
    :TodoQuickFix<CR>:sleep 200m<CR>:x<CR>\
    :BufferLineTabRename 󱃖 code<CR>\
    :NvimTreeOpen\
    :tabnext <CR>\
    :BufferLineTabRename  debug<CR>\
    :tabnext <CR>\
    :BufferLineTabRename  plan<CR>\
    :NvimTreeOpen\
    :tabnext<CR>\
    :TermExec cmd="source ~/AVIN/.venv/bin/activate" name=zsh\
    :wincmd l<CR>\
    ', opt)
-- }}}
-- AVIN-rs session -----------------------------------------------------------{{{
map(n, '<Home>',
  ':source /home/alex/avin/Session.vim<CR>\
    :TodoQuickFix<CR>:sleep 100m<CR>:x<CR>\
    :NvimTreeOpen\
    :wincmd l<CR>\
    :set foldmethod=syntax\
    :wincmd l<CR>\
    :set foldmethod=syntax\
    :wincmd h<CR>\
    :TermExec cmd="source ~/avin/src_py/.venv/bin/activate" name=zsh\
    ', opt)
-- }}}
-- Blog session -----------------------------------------------------------{{{
map(n, '<PageDown>', '\
    :source /home/alex/arsvincere.com/Session.vim<CR>\
    :NvimTreeToggle<CR><C-w><C-l>\
    ', opt)
-- }}}
