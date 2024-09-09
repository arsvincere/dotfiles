-- https://github.com/nvim-neorg/neorg?tab=readme-ov-file
-- The future of organizing your life in Neovim.
------------------------------------------------------------------------------

require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    db = "~/db",
                    diary = "~/db/diary",
                    noetic = "~/db/noetic",
                },
                default_workspace = "db",
                index = "index.norg", -- The name of the main (root) .norg file
            }
        }
    }
}
