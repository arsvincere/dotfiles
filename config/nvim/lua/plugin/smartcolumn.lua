-- https://github.com/m4xshen/smartcolumn.nvim
-- A Neovim plugin hiding your colorcolumn when unneeded
------------------------------------------------------------------------------
---
require("smartcolumn").setup({
    colorcolumn = "78",
    disabled_filetypes = {
        "dashboard",
        "help", "text", "markdown", "adoc", "un",
        "NvimTree", "Trouble", "zsh", "mason", "checkhealth", "lspinfo",
        "Neorg", "calendar"
    },
    scope = "file"
})
