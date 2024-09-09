-- Import general settings  --------------------------------------------------

require('core') -- vim settings
require('plug') -- install plugins
require('key')  -- keybindings
require('auto') -- autocomands


-- Rocks ------------------------------------------------------------------{{{
local rocks_config = {
    rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
    -- Remove the dylib and dll paths if you do not need macos or windows support
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "*", "*"))

-- }}}
-- -- neorg ------------------------------------------------------------------{{{
-- -- Bootstrap lazy.nvim
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--     local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--     local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
--     if vim.v.shell_error ~= 0 then
--         vim.api.nvim_echo({
--             { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--             { out,                            "WarningMsg" },
--             { "\nPress any key to exit..." },
--         }, true, {})
--         vim.fn.getchar()
--         os.exit(1)
--     end
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- -- Set up both the traditional leader (for keymaps) as well as the local leader (for norg files)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = ","
--
-- -- Setup lazy.nvim
-- require("lazy").setup({
--     spec = {
--         {
--             "rebelot/kanagawa.nvim", -- neorg needs a colorscheme with treesitter support
--             config = function()
--                 vim.cmd.colorscheme("kanagawa")
--             end,
--         },
--         {
--             "nvim-treesitter/nvim-treesitter",
--             build = ":TSUpdate",
--             opts = {
--                 ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
--                 highlight = { enable = true },
--             },
--             config = function(_, opts)
--                 require("nvim-treesitter.configs").setup(opts)
--             end,
--         },
--         {
--             "nvim-neorg/neorg",
--             lazy = false,
--             version = "*",
--             config = function()
--                 require("neorg").setup {
--                     load = {
--                         ["core.defaults"] = {},
--                         ["core.concealer"] = {},
--                         ["core.dirman"] = {
--                             config = {
--                                 workspaces = {
--                                     notes = "~/notes",
--                                 },
--                                 default_workspace = "notes",
--                             },
--                         },
--                     },
--                 }
--
--                 vim.wo.foldlevel = 99
--                 vim.wo.conceallevel = 2
--             end,
--         },
--     },
-- })
-- -- }}}
