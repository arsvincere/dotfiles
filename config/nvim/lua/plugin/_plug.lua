local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme -----------------------------------------------------------------
Plug 'arsvincere/kanagawa-again.nvim'
Plug 'sainnhe/gruvbox-material'
Plug "rebelot/kanagawa.nvim"
Plug 'sho-87/kanagawa-paper.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvimdev/dashboard-nvim'

-- Navigation ------------------------------------------------------------
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'famiu/bufdelete.nvim'

-- IDE -------------------------------------------------------------------
Plug 'numToStr/Comment.nvim'
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'preservim/tagbar'
Plug 'cohama/lexima.vim'
Plug 'kylechui/nvim-surround'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'stevearc/conform.nvim'

-- Autocomplete ----------------------------------------------------------
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'rshkarin/mason-nvim-lint'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
-- Plug 'neoclide/coc.nvim'

-- git -------------------------------------------------------------------

-- LaTex -----------------------------------------------------------------
Plug 'lervag/vimtex'

-- Other -----------------------------------------------------------------
Plug 'powerman/vim-plugin-ruscmd'
Plug 'wakatime/vim-wakatime'
Plug 'norcalli/nvim-colorizer.lua'

vim.call('plug#end')


-- Import plugin settings  ---------------------------------------------------

-- require('plugin.kanagawa')          -- color scheme
-- require('plugin.kanagawa-paper')    -- color scheme
require('plugin.kanagawa-again')    -- color scheme
require('plugin.gruvbox-material')  -- color scheme
require('plugin.lualine')           -- status line
require('plugin.bufferline')        -- buffers & tabs line
require('plugin.indent-blankline')  -- hightlight code blocks
require('plugin.dashboard')         -- startup screen
require('plugin.nvim-tree')         -- file manager
require('plugin.telescope')         -- buff manager, search, grep...
require('plugin.bufdelete')         -- delete buffer without close window
require('plugin.comment')           -- comment any language
require('plugin.nvim-ufo')          -- very good folding
require('plugin.tagbar')            -- navigation: class, func, const...
require('plugin.lexima')            -- auto insert pairs () [] {}
require('plugin.nvim-surround')     -- powerful replace '' "" () [] {} etc.
require('plugin.conforn')           -- formatter
require('plugin.mason')             -- manage language server
require('plugin.lspconfig')         -- config language server
require('plugin.nvim-cmp')          -- autocomplete
-- require('plugin.coc')               -- autocomplete
require('plugin.vim-plugin-ruscmd') -- support commands on RU-layot
require('plugin.wakatime')          -- timer, statistic, dashboard
require('plugin.nvim-colorizer')    -- color view utility
