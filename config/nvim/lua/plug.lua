local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Theme
-- https://www.nordtheme.com/ports/vim
Plug "rebelot/kanagawa.nvim"                       -- color scheme
Plug 'nvim-lualine/lualine.nvim'                   -- status line
Plug 'akinsho/bufferline.nvim'                     -- buffers & tabs line
Plug 'lukas-reineke/indent-blankline.nvim'         -- hightlight code blocks
Plug 'nvimdev/dashboard-nvim'                      -- startup screen
Plug "m4xshen/smartcolumn.nvim"                    -- smart color column
-- Navigation
Plug 'nvim-tree/nvim-tree.lua'                     -- file manager
Plug 'nvim-tree/nvim-web-devicons'                 ---- dependency
Plug 'ryanoasis/vim-devicons'                      ---- dependency
Plug 'nvim-telescope/telescope.nvim'               -- buff, search, grep...
Plug 'nvim-lua/plenary.nvim'                       ---- dependency
Plug 'famiu/bufdelete.nvim'                        -- del buf not close window
Plug 'ggandor/leap.nvim'                           -- fast text motion
-- IDE
Plug 'nvim-treesitter/nvim-treesitter'             -- parsing library
Plug 'nvim-treesitter/nvim-treesitter-textobjects' ---- dependency
Plug 'numToStr/Comment.nvim'                       -- comment any language
Plug 'kevinhwang91/nvim-ufo'                       -- very good folding
Plug 'kevinhwang91/promise-async'                  ---- dependency
Plug 'preservim/tagbar'                            -- panel: class, func...
Plug 'windwp/nvim-autopairs'                       -- auto pairs () [] {}
Plug 'kylechui/nvim-surround'                      -- replace '' "" () [] {}
Plug 'stevearc/conform.nvim'                       -- formatter
Plug 'mfussenegger/nvim-lint'                      -- linter
Plug 'folke/trouble.nvim'                          -- list diag, fzf, lsp...
Plug 'folke/todo-comments.nvim'                    -- todo, fix -> trouble
Plug 'akinsho/toggleterm.nvim'                     -- multiple terminals
-- Autocomplete
Plug 'williamboman/mason.nvim'                     -- manage language server
Plug 'williamboman/mason-lspconfig.nvim'           ---- dependency
Plug 'rshkarin/mason-nvim-lint'                    ---- dependency
Plug 'neovim/nvim-lspconfig'                       -- config language server
Plug 'hrsh7th/nvim-cmp'                            -- autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'                        ---- dependency
Plug 'hrsh7th/cmp-buffer'                          ---- dependency
Plug 'hrsh7th/cmp-path'                            ---- dependency
Plug 'hrsh7th/cmp-cmdline'                         ---- dependency
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'         ---- dependency
-- Debug
Plug 'mfussenegger/nvim-dap'                       -- debug
Plug 'mfussenegger/nvim-dap-python'                -- extension for python
Plug 'rcarriga/nvim-dap-ui'                        -- debug user interface
Plug 'nvim-neotest/nvim-nio'                       ---- dependency
Plug 'folke/neodev.nvim'                           ---- dependency
Plug 'mortepau/codicons.nvim'                      -- debug font icons
-- git
Plug 'sindrets/diffview.nvim'                      -- git diff
-- Python
Plug 'roobert/f-string-toggle.nvim'                -- f-string toggle
-- LaTex
Plug 'lervag/vimtex'                               -- latex
-- Other
Plug 'powerman/vim-plugin-ruscmd'                  -- commands on RU-layot
Plug 'wakatime/vim-wakatime'                       -- timer, statistic
Plug 'norcalli/nvim-colorizer.lua'                 -- color view utility
Plug 'eandrju/cellular-automaton.nvim'             -- fuck them all

vim.call('plug#end')


-- Import plugin settings  ---------------------------------------------------
require('plugin.bufdelete')
require('plugin.bufferline')
require('plugin.comment')
require('plugin.conforn')
require('plugin.dashboard')
require('plugin.diffview')
require('plugin.f-string-toggle')
require('plugin.indent-blankline')
require('plugin.kanagawa')
require('plugin.leap')
require('plugin.lspconfig')
require('plugin.lualine')
require('plugin.mason')
require('plugin.neodev')
require('plugin.nvim-autopairs')
require('plugin.nvim-cmp')
require('plugin.nvim-colorizer')
require('plugin.nvim-dap-python')
require('plugin.nvim-dap-ui')
require('plugin.nvim-dap')
require('plugin.nvim-lint')
require('plugin.nvim-surround')
require('plugin.nvim-tree')
require('plugin.nvim-ufo')
require('plugin.smartcolumn')
require('plugin.tagbar')
require('plugin.telescope')
require('plugin.treesitter')
require('plugin.trouble')
require('plugin.todo-comments')
require('plugin.toggleterm')
require('plugin.vim-plugin-ruscmd')
require('plugin.vimtex')
require('plugin.wakatime')

-- " Language
-- Plug 'j-hui/fidget.nvim'
-- Plug 'L3MON4D3/LuaSnip'
-- Plug 'saadparwaiz1/cmp_luasnip'
-- Plug 'rafamadriz/friendly-snippets'
-- Plug 'ray-x/lsp_signature.nvim'
--
-- " Debug and test
-- Plug 'nvim-neotest/neotest'
-- Plug 'nvim-neotest/neotest-go'
--
-- " Base
-- Plug 'akinsho/toggleterm.nvim'
-- Plug 'antoinemadec/FixCursorHold.nvim'
--
-- " View
-- Plug 'Mofiqul/vscode.nvim'
--
-- " Navigation

-- Plug 'karb94/neoscroll.nvim'
--
-- " Git
-- Plug 'ThePrimeagen/git-worktree.nvim'
-- Plug 'TimUntersberger/neogit'
-- Plug 'lewis6991/gitsigns.nvim'
--
-- " Misc
-- Plug 'renerocksai/telekasten.nvim'
