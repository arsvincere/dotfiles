local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme
-- https://www.nordtheme.com/ports/vim
Plug 'shaunsingh/nord.nvim'                        -- color scheme
Plug 'AlexvZyl/nordic.nvim'                        -- color scheme
Plug 'rmehri01/onenord.nvim'                       -- color scheme
Plug 'fcancelinha/nordern.nvim'                    -- color scheme
Plug 'folke/tokyonight.nvim'                       -- color scheme
Plug 'catppuccin/nvim'                             -- color scheme
Plug "rebelot/kanagawa.nvim"                       -- color scheme
Plug 'sainnhe/gruvbox-material'                    -- color scheme
Plug 'sho-87/kanagawa-paper.nvim'                  -- color scheme
Plug 'arsvincere/kanagawa-again.nvim'              -- color scheme
Plug 'arsvincere/annual.nvim'                      -- color scheme
Plug 'nvim-lualine/lualine.nvim'                   -- status line
Plug 'akinsho/bufferline.nvim'                     -- buffers & tabs line
Plug 'lukas-reineke/indent-blankline.nvim'         -- hightlight code blocks
Plug 'nvimdev/dashboard-nvim'                      -- startup screen
Plug "m4xshen/smartcolumn.nvim"                    -- smart color column
-- Navigation
Plug 'nvim-tree/nvim-tree.lua'                     -- file manager
Plug 'nvim-tree/nvim-web-devicons'                 -- __dependency
Plug 'ryanoasis/vim-devicons'                      -- __dependency
Plug 'nvim-telescope/telescope.nvim'               -- buff, search, grep...
Plug 'nvim-lua/plenary.nvim'                       -- __dependency
Plug 'famiu/bufdelete.nvim'                        -- del buf not close window
-- IDE
Plug 'nvim-treesitter/nvim-treesitter'             -- parsing library
Plug 'nvim-treesitter/nvim-treesitter-textobjects' -- __dependency
Plug 'numToStr/Comment.nvim'                       -- comment any language
Plug 'kevinhwang91/nvim-ufo'                       -- very good folding
Plug 'kevinhwang91/promise-async'                  -- __dependency
Plug 'preservim/tagbar'                            -- panel: class, func...
Plug 'cohama/lexima.vim'                           -- auto pairs () [] {}
Plug 'kylechui/nvim-surround'                      -- replace '' "" () [] {}
Plug 'stevearc/conform.nvim'                       -- formatter
Plug 'mfussenegger/nvim-lint'                      -- linter  TODO: conf
Plug 'folke/trouble.nvim'                          -- list diag, fzf, lsp...
Plug 'folke/todo-comments.nvim'                    -- todo, fix -> trouble
-- Autocomplete
Plug 'williamboman/mason.nvim'                     -- manage language server
Plug 'williamboman/mason-lspconfig.nvim'           -- __dependency
Plug 'rshkarin/mason-nvim-lint'                    -- __dependency
Plug 'neovim/nvim-lspconfig'                       -- config language server
Plug 'hrsh7th/nvim-cmp'                            -- autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'                        -- __dependency
Plug 'hrsh7th/cmp-buffer'                          -- __dependency
Plug 'hrsh7th/cmp-path'                            -- __dependency
Plug 'hrsh7th/cmp-cmdline'                         -- __dependency
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'         -- __dependency
-- Debug
Plug 'mfussenegger/nvim-dap'                       -- debug
Plug 'mfussenegger/nvim-dap-python'                -- extension for python
Plug 'rcarriga/nvim-dap-ui'                        -- debug user interface
Plug 'nvim-neotest/nvim-nio'                       -- __dependency
Plug 'folke/neodev.nvim'                           -- __dependency
Plug 'mortepau/codicons.nvim'                      -- debug font icons
-- git
Plug 'sindrets/diffview.nvim'                      -- git diff
-- LaTex
Plug 'lervag/vimtex'                               -- latex
-- Other
Plug 'powerman/vim-plugin-ruscmd'                  -- commands on RU-layot
Plug 'wakatime/vim-wakatime'                       -- timer, statistic
Plug 'norcalli/nvim-colorizer.lua'                 -- color view utility

vim.call('plug#end')


-- Import plugin settings  ---------------------------------------------------
require('plugin.bufdelete')
require('plugin.bufferline')
require('plugin.comment')
require('plugin.conforn')
require('plugin.dashboard')
require('plugin.diffview')
require('plugin.gruvbox-material')
require('plugin.indent-blankline')
require('plugin.kanagawa-again')
require('plugin.lexima')
require('plugin.lspconfig')
require('plugin.lualine')
require('plugin.mason')
require('plugin.neodev')
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
require('plugin.vim-plugin-ruscmd')
-- require('plugin.vimtex')
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
-- Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
-- Plug 'karb94/neoscroll.nvim'
--
-- " Git
-- Plug 'ThePrimeagen/git-worktree.nvim'
-- Plug 'TimUntersberger/neogit'
-- Plug 'lewis6991/gitsigns.nvim'
--
-- " Edit
-- Plug 'windwp/nvim-autopairs'
--
-- " Misc
-- Plug 'renerocksai/telekasten.nvim'
