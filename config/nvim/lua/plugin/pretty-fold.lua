-- https://github.com/anuvyklack/pretty-fold.nvim
-- Красиовое сворачивание кода
------------------------------------------------------------------------------

require('pretty-fold').setup(
  {
    sections = {
      left = {
        'content',
      },
      right = {
        ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
        function(config) return config.fill_char:rep(3) end
      }
    },
    -- fill_char = '•',
    fill_char = '⋅',

    remove_fold_markers = true,

    -- Keep the indentation of the content of the fold string.
    keep_indentation = true,

    -- Possible values:
    -- "delete" : Delete all comment signs from the fold string.
    -- "spaces" : Replace all comment signs with equal number of spaces.
    -- false    : Do nothing with comment signs.
    process_comment_signs = 'spaces',

    -- Comment signs additional to the value of `&commentstring` option.
    comment_signs = {},

    -- List of patterns that will be removed from content foldtext section.
    stop_words = {
      '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
    },

    add_close_pattern = true, -- true, 'last_line' or false

    matchup_patterns = {
      { '{',  '}' },
      { '%(', ')' }, -- % to escape lua pattern char
      { '%[', ']' }, -- % to escape lua pattern char
    },

    ft_ignore = { 'neorg' },
  }
)

-- Patch ---------------------------------------------------------------------
-- for error with 'curwin_col_off'

-- File
-- /home/alex/.local/share/nvim/plugged/pretty-fold.nvim/lua/pretty-fold/init.lua

-- diff --git a/lua/pretty-fold/init.lua b/lua/pretty-fold/init.lua
-- index b0b3788..09776ae 100644
-- --- a/lua/pretty-fold/init.lua
-- +++ b/lua/pretty-fold/init.lua
-- @@ -3,7 +3,11 @@ local wo = vim.wo
--  local fn = vim.fn
--  local api = vim.api
--
-- -ffi.cdef('int curwin_col_off(void);')
-- +ffi.cdef [[
-- +  typedef struct window_S win_T;
-- +  int win_col_off(win_T *wp);
-- +  extern win_T *curwin;
-- +]]
--
--  local M = {
--     foldtext = {}, -- Table with all 'foldtext' functions.
-- @@ -82,7 +86,7 @@ local function fold_text(config)
--     ---The width of offset of a window, occupied by line number column,
--     ---fold column and sign column.
--     ---@type number
-- -   local gutter_width = ffi.C.curwin_col_off()
-- +   local gutter_width = ffi.C.win_col_off(ffi.C.curwin)
--
--     local visible_win_width = api.nvim_win_get_width(0) - gutter_width
