-- https://github.com/nvimdev/dashboard-nvim
-- Startup screen - dashboard
------------------------------------------------------------------------------

require('dashboard').setup {
    hide = {
      statusline = true,        -- hide statusline default is true
      tabline = true,           -- hide the tabline
      winbar = true,            -- hide winbar
    },
    shortcut_type = 'letter',   --  shorcut type 'letter' or 'number'
    change_to_vcs_root = true,     -- default is false,for open file in hyper mru.
                                -- it will change to the root of vcs

    theme = 'hyper',
    config = {
      -- header = {'-- AVIN --'},
      week_header = {
       enable = true,
      },
      packages = { enable = false }, -- show how many plugins neovim loaded
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'PlugUpdate', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
      -- project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
      -- mru = { limit = 10, icon = 'your icon', label = '', cwd_only = false },
      footer = {},
    },

    -- theme = 'doom',
    -- config = {
    --   header = {'AVIN'}, --your header
    --   center = {
    --     {
    --       icon = ' ',
    --       icon_hl = 'Title',
    --       desc = 'Find File           ',
    --       desc_hl = 'String',
    --       key = 'b',
    --       keymap = 'SPC f f',
    --       key_hl = 'Number',
    --       key_format = ' %s', -- remove default surrounding `[]`
    --       action = 'lua print(2)'
    --     },
    --     {
    --       icon = ' ',
    --       desc = 'Find Dotfiles',
    --       key = 'f',
    --       keymap = 'SPC f d',
    --       key_format = ' %s', -- remove default surrounding `[]`
    --       action = 'lua print(3)'
    --     },
    --   },
    -- }


}
