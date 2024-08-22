-- https://github.com/rcarriga/nvim-dap-ui
-- A UI for nvim-dap which provides a good out of the box configuration.
------------------------------------------------------------------------------

require("dapui").setup()

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
    ...
})
