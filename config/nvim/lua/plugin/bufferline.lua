-- https://github.com/akinsho/bufferline.nvim
-- Bufferline
------------------------------------------------------------------------------
vim = vim

vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "󱏒  Project files:",
                highlight = "Directory",
                separator = true,
                text_align = "left",
            }
        },
        color_icons = true,
        sort_by = 'extension',
        buffer_close_icon = '󰅖',
        close_icon = '', -- hide tabs close icon
        custom_areas = {
            right = function()
                local result = {}

                -- table.insert(result, { text = "󰣇 Arch Linux ", link = "Text" })
                -- table.insert(result, { text = " NeoVim the best! ", link = "Text" })
                table.insert(result, { text = " NeoVim ", link = "Text" })

                return result
            end,
        }
    }
}
