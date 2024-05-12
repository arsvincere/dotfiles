-- https://github.com/neovim/nvim-lspconfig
-- Language servers for autocomplete
------------------------------------------------------------------------------

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lsp server 'lua_ls'
require('lspconfig')['lua_ls'].setup { capabilities = capabilities }
require("lspconfig").rust_analyzer.setup {}

-- Language servers ----------------------------------------------------------

-- Python
require'lspconfig'.jedi_language_server.setup{}

-- С++
require'lspconfig'.clangd.setup{}

-- Markdown
require'lspconfig'.marksman.setup{}

