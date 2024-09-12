-- https://github.com/nvim-neorg/neorg?tab=readme-ov-file
-- The future of organizing your life in Neovim.
------------------------------------------------------------------------------

require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.concealer"] = {
            config = {
                icons = {
                    todo = {
                        undone = {
                            icon = ' ',
                        },
                    },
                    heading = {
                        -- icons = { "◉", "◎", "○", "✺", "▶", "⤷" },
                        icons = { "✺", "◉", "◎", "○", "▶", "⤷" },
                    },
                },
            },
        },
        ["core.promo"] = {},
        ["core.itero"] = {},
        ["core.summary"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    db = "~/db",
                    noetic = "~/db/noetic",
                    avin = "~/db/avin",
                },
                default_workspace = "db",
                index = "index.norg", -- The name of the main (root) .norg file
            }
        },
    }
}
