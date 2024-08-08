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
    local check =
        vim.bo.filetype == "markdown" or
        vim.bo.filetype == "asciidoc" or
        vim.bo.filetype == "text" or
        vim.bo.filetype == "un"
    return check
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = '',
        -- section_separators = { left = '', right = '' },
        section_separators = '',

        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    -- searchcount (number of search matches when hlsearch is active)
    -- selectioncount (number of selected characters or lines)
    sections = {
        lualine_a = { { 'mode', separator = { left = '' } } },
        lualine_b = { { 'branch', 'diff', 'diagnostics', separator = { right = '' } } },
        lualine_c = { 'filename' },
        lualine_x = {
            { wordcount_readingtime, cond = is_text },
            'encoding',
            -- 'fileformat',
            --
            { icon = '', 'filesize' },
            'filetype'
        },
        lualine_y = {
            { 'searchcount', 'progress', separator = { left = '' } }
        },
        lualine_z = { { 'location', separator = { right = '' } } },
    },
    -- inactive_sections = {
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_c = { 'filename' },
    --     lualine_x = { 'location' },
    --     lualine_y = {},
    --     lualine_z = {}
    -- },
    tabline = {
        lualine_a = { { 'buffers', separator = { left = '', right = '' } } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { icon = '󰓩 ', 'tabs', separator = { left = '', right = '' } } }
    },
    -- winbar = {},
    -- inactive_winbar = {},
    -- extensions = {}
}
