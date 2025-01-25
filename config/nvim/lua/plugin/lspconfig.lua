-- https://github.com/neovim/nvim-lspconfig
-- Language servers for autocomplete
------------------------------------------------------------------------------

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lsp server 'lua_ls'
require('lspconfig')['lua_ls'].setup { capabilities = capabilities }


-- Language servers ----------------------------------------------------------

-- Python
require('lspconfig').jedi_language_server.setup {}
-- Ruff linter/formatter for Python
require('lspconfig').ruff.setup {
  init_options = {
    settings = {
      logLevel = 'debug',
    }
  }
}

-- Rust
require("lspconfig").rust_analyzer.setup({
  cmd = { "rust-analyzer" },
})

-- С++
-- require('lspconfig').clangd.setup {}

-- Markdown
-- require('lspconfig').marksman.setup {}
