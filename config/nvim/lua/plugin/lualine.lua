-- https://github.com/nvim-lualine/lualine.nvim
-- Информационная строка внизу
------------------------------------------------------------------------------

-- require('lualine').setup()

local function wordcount_readingtime()
    return tostring(
        '  ' ..
        vim.fn.wordcount().words ..
        'w  ' ..
        math.ceil(vim.fn.wordcount().words / 200.0) ..
        'm'
        )
end

local function is_text()
    local path = vim.api.nvim_buf_get_name(0)
    local check =
        vim.bo.filetype == "markdown" or
        vim.bo.filetype == "asciidoc" or
        vim.bo.filetype == "text" or
        string.find(path, ".un") ~= nil
    return check
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
            { wordcount_readingtime, cond = is_text },
            'encoding',
            -- 'fileformat',
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}



