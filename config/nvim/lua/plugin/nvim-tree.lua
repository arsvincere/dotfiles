-- https://github.com/nvim-tree/nvim-tree.lua
-- Навигация по файлам
------------------------------------------------------------------------------
-- NERD Font
-- Source Code Pro - ништячный
-- Шрифт качаем от сюда:
-- https://www.nerdfonts.com/font-downloads
-- Cкопировать шрифт сюда
-- ~/.local/share/fonts/
-- Или сюда:
-- /usr/local/share/fonts)
-- /usr/share/fonts/
------------------------------------------------------------------------------

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30, -- ширина окна
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        full_name = false,
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        special_files = { "LICENSE", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
        highlight_git = false,
        highlight_diagnostics = false,
        highlight_opened_files = "none",
        highlight_modified = "none",
        indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            web_devicons = {
                file = {
                    enable = true,
                    color = true,
                },
                folder = {
                    enable = false,
                    color = true,
                },
            },
            git_placement = "after", -- git icons after filename
            diagnostics_placement = "signcolumn",
            modified_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                diagnostics = true,
                modified = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "󰆤",
                modified = "●",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    filters = {
        dotfiles = true,     -- скрывать .dotfiles при запуске
        git_ignored = false, -- не скрывать .git_ignored файлы\папки
    },
}
)
