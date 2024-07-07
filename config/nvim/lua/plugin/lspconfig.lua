-- https://github.com/neovim/nvim-lspconfig
-- Language servers for autocomplete
------------------------------------------------------------------------------

-- -- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lsp server 'lua_ls'
require('lspconfig')['lua_ls'].setup { capabilities = capabilities }
require("lspconfig").rust_analyzer.setup {}

-- Language servers ----------------------------------------------------------

-- Python
require'lspconfig'.jedi_language_server.setup{}

-- Set linters
require('lint').linters_by_ft = {
  python = {'pylint'}
}
-- Set running linters on buffer save
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end,
})
-- Set pylint to work in virtualenv
require('lint').linters.pylint.cmd = 'python'
require('lint').linters.pylint.args = {'-m', 'pylint', '-f', 'json'}

-- С++
require'lspconfig'.clangd.setup{}

-- Markdown
require'lspconfig'.marksman.setup{}

