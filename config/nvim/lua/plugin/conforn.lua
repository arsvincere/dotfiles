-- https://github.com/stevearc/conform.nvim
-- Launch the formatters
------------------------------------------------------------------------------
vim = vim

require("conform").setup({
    formatters_by_ft = {
        -- lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        -- rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },

    -- -- If this is set, Conform will run the formatter on save.
    -- -- It will pass the table to conform.format().
    -- -- This can also be a function that returns the table.
    format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_format = "fallback",
        timeout_ms = 500,
    },

    -- If this is set, Conform will run the formatter asynchronously after save.
    -- It will pass the table to conform.format().
    -- This can also be a function that returns the table.
    -- если перед сохранением не успел форматтер отработать за 500мс таймаут
    -- будет запущен после сохранения, асинхронно
    format_after_save = {
        lsp_format = "fallback",
    },


})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
