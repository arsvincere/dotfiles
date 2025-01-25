-- https://github.com/ggandor/leap.nvim
-- Leap is a general-purpose motion plugin for Neovim
------------------------------------------------------------------------------

-- require('leap').create_default_mappings()
-- vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
-- vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
-- vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')


-- Disable auto-jumping to the first match
require('leap').opts.safe_labels = {}

-- Highlight
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
-- vim.api.nvim_set_hl(0, 'LeapMatch', {
--     -- For light themes, set to 'black' or similar.
--     fg = 'white',
--     bold = true,
--     nocombine = true,
-- })
