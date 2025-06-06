-- https://github.com/ErichDonGubler/lsp_lines.nvim
-- renders diagnostics using virtual lines on top of the real line of code
------------------------------------------------------------------------------

require('lsp_lines').setup()

-- Config diagnostics
vim.diagnostic.config({
  virtual_text = false, -- сообщение (lsp_lines их заменяют)
  underline = false,    -- подчеркивание
  signs = true,         -- метка рядом с номером строки
})

-- enable diagnostics view on startup
vim.diagnostic.enable(true)
