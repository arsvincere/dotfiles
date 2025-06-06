-- https://github.com/stevearc/conform.nvim
-- Launch the formatters
------------------------------------------------------------------------------
vim = vim

require("conform").setup({
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },

    -- ruff_fix
    -- An extremely fast Python linter, written in Rust. Fix lint errors.
    -- ruff_format
    -- An extremely fast Python linter, written in Rust. Formatter subcommand.
    -- ruff_organize_imports
    -- An extremely fast Python linter, written in Rust. Organize imports.
    -- python = { "ruff_format", "ruff_organize_imports" },
    python = { "ruff_format", "ruff_organize_imports", 'ruff_fix' },

    rust = { "rustfmt", lsp_format = "fallback" },
  },
  -- You can use a function here to determine the formatters dynamically
  -- python = function(bufnr)
  --   if require("conform").get_formatter_info("ruff_format", bufnr).available then
  --     return { "ruff_format" }
  --   else
  --     return { "isort", "black" }
  --   end
  -- end,

  -- If this is set, Conform will run the formatter on save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  -- format_on_save = {
  --   -- I recommend these options. See :help conform.format for details.
  --   lsp_format = "fallback",
  --   timeout_ms = 500,
  -- },

  -- If this is set, Conform will run the formatter asynchronously after save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
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
