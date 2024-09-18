-- https://github.com/nvim-neorg/neorg?tab=readme-ov-file
-- The future of organizing your life in Neovim.
------------------------------------------------------------------------------

require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.promo"] = {},
        ["core.itero"] = {},
        ["core.summary"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    db = "~/!",
                    journal = "~/!/journal",
                    mind = "~/!/mind",
                },
                default_workspace = "db",
                index = "index.norg", -- The name of the main (root) .norg file
            }
        },
        ["core.concealer"] = {
            config = {
                icons = {
                    todo = {
                        undone = {
                            icon = ' ',
                        },
                    },
                    heading = {
                        --     󰄯  󰪥 󰺕 󰻃 󰄰   󰧞   󰧟     󰀨 󰲠
                        -- icons = { "✺", "◉", "◎", "○", "▶", "⤷" },
                        icons = { "", "󰄯", "󰪥", "󰺕", "󰻃", "󰄰", },
                    },
                },
            },
        },
        ["core.highlights"] = {
            highlights = {
                todo_items = {
                    cancelled = "+@operator",
                },
                -- Highlights for each individual heading level.
                headings = {
                    ["1"] = {
                        title = "+@operator",
                        prefix = "+@operator",
                    },
                    ["2"] = {
                        title = "+@constant",
                        prefix = "+@constant",
                    },
                    ["3"] = {
                        title = "+@constant",
                        prefix = "+@constant",
                    },
                    ["4"] = {
                        title = "+@function",
                        prefix = "+@function",
                    },
                    ["5"] = {
                        title = "+@label",
                        prefix = "+@label",
                    },
                    ["6"] = {
                        title = "+@constructor",
                        prefix = "+@constructor",
                    },
                },
            },
        },
    }
}
