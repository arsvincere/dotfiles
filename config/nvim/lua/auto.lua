-- open help in right split
local help_group = vim.api.nvim_create_augroup("help_window_right", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = help_group,
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == "help" then
            vim.cmd.wincmd("L")
        end
    end,
    desc = "Open help pages in a vertical split",
})

-- -- insert mode when switching to terminal
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = "*",
--     callback = function()
--         vim.schedule(function()
--             local bufnr = vim.api.nvim_get_current_buf()
--             local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
--             local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
--
--             if buftype == "terminal" then
--                 vim.api.nvim_set_option_value("number", false, { scope = "local" })
--                 vim.api.nvim_set_option_value("relativenumber", false, { scope = "local" })
--                 vim.api.nvim_command("startinsert")
--             elseif filetype ~= "TelescopePrompt" and filetype ~= "alpha" then
--                 -- without this^, telescope will exit insert when no matches are found
--                 vim.api.nvim_command("stopinsert")
--             end
--         end)
--     end,
-- })
