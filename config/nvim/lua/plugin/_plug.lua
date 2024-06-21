local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

    -- Theme -----------------------------------------------------------------
    Plug 'sainnhe/gruvbox-material'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    -- Plug 'akinsho/bufferline.nvim'
    -- Plug 'xiyaowong/transparent.nvim'

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

vim.call('plug#end')

