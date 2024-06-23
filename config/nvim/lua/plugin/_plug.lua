local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

    -- Theme -----------------------------------------------------------------
    Plug 'arsvincere/kanagawa-again.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug "rebelot/kanagawa.nvim"
    Plug 'AlexvZyl/nordic.nvim'
    Plug 'sho-87/kanagawa-paper.nvim'

    Plug 'nvim-lualine/lualine.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    -- Plug 'akinsho/bufferline.nvim'

    -- Navigation ------------------------------------------------------------
    Plug 'nvim-tree/nvim-tree.lua'
        Plug 'nvim-tree/nvim-web-devicons'
        Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-telescope/telescope.nvim'
        Plug 'nvim-lua/plenary.nvim'
    Plug 'famiu/bufdelete.nvim'

    -- IDE -------------------------------------------------------------------
    Plug 'numToStr/Comment.nvim'
    Plug 'anuvyklack/pretty-fold.nvim'
    Plug 'preservim/tagbar'
    Plug 'cohama/lexima.vim'
    Plug 'kylechui/nvim-surround'
    Plug 'nvim-treesitter/nvim-treesitter'
        Plug 'nvim-treesitter/nvim-treesitter-textobjects'

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

    -- git -------------------------------------------------------------------


    -- LaTex -----------------------------------------------------------------
    Plug 'lervag/vimtex'

    -- Other -----------------------------------------------------------------
    Plug 'powerman/vim-plugin-ruscmd'
    Plug 'wakatime/vim-wakatime'
    Plug 'norcalli/nvim-colorizer.lua'

vim.call('plug#end')

