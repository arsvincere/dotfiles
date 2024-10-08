-- https://github.com/folke/neodev.nvim
-- Neovim setup for init.lua and plugin development with full signature help,
-- docs and completion for the nvim lua API.
------------------------------------------------------------------------------

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
    -- add any options here, or leave empty to use the default settings
})
