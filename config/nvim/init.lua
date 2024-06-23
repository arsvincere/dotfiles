-- Import general settings  --------------------------------------------------

require('core')                     -- vim settings
require('key')                      -- keybindings
require('plugin._plug')             -- install plugins

-- Import plugin settings  ---------------------------------------------------

-- Theme
require('plugin.kanagawa-again')    -- color scheme
require('plugin.gruvbox-material')  -- color scheme
-- require('plugin.nordic')            -- color scheme
-- require('plugin.kanagawa')          -- color scheme
-- require('plugin.kanagawa-paper')    -- color scheme
require('plugin.lualine')           -- status line
require('plugin.indent-blankline')  -- hightlight code blocks
-- require('plugin.bufferline')        -- tabs at the top

-- Navigation
require('plugin.nvim-tree')         -- file manager
require('plugin.telescope')         -- buff manager, search, grep...
require('plugin.bufdelete')         -- delete buffer without close window

-- IDE
require('plugin.comment')           -- comment any language
require('plugin.pretty-fold')       -- good folding labels
require('plugin.tagbar')            -- navigation: class, func, const...
require('plugin.lexima')            -- auto insert pairs () [] {}
require('plugin.nvim-surround')     -- powerful replace '' "" () [] {} etc.

-- Autocomplete
require('plugin.mason')             -- manage language server
require('plugin.lspconfig')         -- config language server
require('plugin.nvim-cmp')          -- autocomplete

-- Other
require('plugin.vim-plugin-ruscmd') -- support commands on RU-layot
require('plugin.wakatime')          -- timer, statistic, dashboard
require('plugin.nvim-colorizer')    -- color view utility

