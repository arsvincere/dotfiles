-- https://github.com/nvim-lualine/lualine.nvim
-- Информационная строка внизу
------------------------------------------------------------------------------

-- require('lualine').setup()

local function wordcount_readingtime()
    return tostring(
        '  ' .. vim.fn.wordcount().words .. 'w ' ..
        ' ' .. math.ceil(vim.fn.wordcount().words / 200.0) .. 'm'
    )
end

local function is_text()
    local check =
        vim.bo.filetype == "markdown" or
        vim.bo.filetype == "asciidoc" or
        vim.bo.filetype == "help" or
        vim.bo.filetype == "text" or
        vim.bo.filetype == "un"
    return check
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'kanagawa-paper',
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = '',
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
    sections = {
        lualine_a = {
            { 'mode', icon = '', separator = { left = '' } }
        },
        lualine_b = {
            {
                'filename',
                icon = ' ',
                path = 1,
                separator = { right = '' },
                symbols = {
                    modified = '[+]',      -- Text to show when the file is modified.
                    readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]',     -- Text to show for newly created file before first write
                }
            }
        },
        lualine_c = {
            { 'branch', icon = '  ' },
            {
                'diff',
                colored = false,
                symbols = { added = ' ', modified = ' ', removed = ' ' }
            },
            {
                'diagnostics',
                icon = '  diag:',
                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                -- or a function that returns a table as such:
                --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                sources = { 'nvim_diagnostic', 'nvim_lsp' },
                sections = { 'error', 'warn', 'info', 'hint' },
                diagnostics_color = {
                    error = 'DiagnosticLuaLineError',
                    warn  = 'DiagnosticLuaLineWarn',
                    info  = 'DiagnosticLuaLineInfo',
                    hint  = 'DiagnosticLuaLineHint',
                },
                -- symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                colored = true,
            },
        },
        lualine_x = {
            { wordcount_readingtime, cond = is_text },
            { 'filetype', colored = false },
            { 'encoding', icon = '' },
            { 'filesize', icon = '' },
        },
        lualine_y = {
            { icon = '󰉸', 'progress', separator = { left = '' } }
        },
        lualine_z = {
            { 'location', icon = { '', align = 'right' }, separator = { right = '' } }
        },
    },
    -- tabline = {
    --     lualine_a = {},
    --     lualine_b = { 'buffers' },
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {
    --         { 'tabs', separator = { left = '' }, show_modified_status = false },
    --         { 'os.date("  %H:%M   %a %e %B")', separator = { right = '' } }
    --     },
    --     lualine_z = {
    --     }
    -- },
    -- winbar = {},
    -- inactive_winbar = {},
    -- extensions = {}
    -- inactive_sections = {
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_c = { 'filename' },
    --     lualine_x = { 'location' },
    --     lualine_y = {},
    --     lualine_z = {}
    -- },
}
