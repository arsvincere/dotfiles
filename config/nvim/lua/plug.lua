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
Plug 'nvim-tree/nvim-web-devicons'                 -- *dependency
Plug 'ryanoasis/vim-devicons'                      -- *dependency
Plug 'nvim-telescope/telescope.nvim'               -- buff, search, grep...
Plug 'nvim-lua/plenary.nvim'                       -- *dependency
Plug 'famiu/bufdelete.nvim'                        -- del buf not close window
-- IDE
Plug 'nvim-treesitter/nvim-treesitter'             -- parsing library
Plug 'nvim-treesitter/nvim-treesitter-textobjects' -- *dependency
Plug 'numToStr/Comment.nvim'                       -- comment any language
Plug 'kevinhwang91/nvim-ufo'                       -- very good folding
Plug 'kevinhwang91/promise-async'                  -- *dependency
Plug 'preservim/tagbar'                            -- panel: class, func...
Plug 'cohama/lexima.vim'                           -- auto pairs () [] {}
Plug 'kylechui/nvim-surround'                      -- replace '' "" () [] {}
Plug 'stevearc/conform.nvim'                       -- formatter
Plug 'mfussenegger/nvim-lint'                      -- linter  TODO: conf
Plug 'folke/trouble.nvim'                          -- list diag, fzf, lsp...
Plug 'folke/todo-comments.nvim'                    -- todo, fix -> trouble
-- Debug
Plug 'mfussenegger/nvim-dap'                       -- debug
Plug 'mfussenegger/nvim-dap-python'                -- extension for python
Plug 'mfussenegger/nvim-dap-ui'                    -- debug user interface
Plug 'nvim-neotest/nvim-nio'                       -- *dependency
Plug 'folke/neodev.nvim'                           -- *dependency
-- Autocomplete
Plug 'williamboman/mason.nvim'                     -- manage language server
Plug 'williamboman/mason-lspconfig.nvim'           -- *dependency
Plug 'rshkarin/mason-nvim-lint'                    -- *dependency
Plug 'neovim/nvim-lspconfig'                       -- config language server
Plug 'hrsh7th/nvim-cmp'                            -- autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'                        -- *dependency
Plug 'hrsh7th/cmp-buffer'                          -- *dependency
Plug 'hrsh7th/cmp-path'                            -- *dependency
Plug 'hrsh7th/cmp-cmdline'                         -- *dependency
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'         -- *dependency
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
-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})
require('plugin.bufdelete')
require('plugin.bufferline')
require('plugin.comment')
require('plugin.conforn') -- reinstall it!!!!!
require('plugin.dashboard')
require('plugin.diffview')
require('plugin.gruvbox-material')
require('plugin.indent-blankline')
require('plugin.kanagawa-again')
require('plugin.lexima')
require('plugin.lspconfig')
require('plugin.lualine')
require('plugin.mason')
require('plugin.nvim-cmp')
require('plugin.nvim-colorizer')
require('plugin.nvim-dap-python')
require('plugin.nvim-dap-ui')
require('plugin.nvim-dap')
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
