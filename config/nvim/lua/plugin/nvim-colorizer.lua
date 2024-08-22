-- https://github.com/norcalli/nvim-colorizer.lua
-- A high-performance color highlighter
------------------------------------------------------------------------------

-- Attaches to every FileType mode
-- require'colorizer'.setup()

-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
require 'colorizer'.setup {
    'css',
    'color',
    'javascript',
    'bg',

    lua = {
        mode = 'foreground',
    },
    html = {
        mode = 'foreground',
    },
    fg = {
        mode = 'foreground',
    }
}
