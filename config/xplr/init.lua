version = '0.21.8'
xplr = xplr

-- Icons
-- =====
xplr.config.node_types.directory = { -- {{{
  meta = {
    icon = "",
  }
}
xplr.config.node_types.file = {
  meta = {
    icon = "",
  }
}
xplr.config.node_types.symlink = {
  meta = {
    icon = "",
  }
}

xplr.config.node_types.mime_essence = {
  application = {
    -- application/*
    ["*"] = { meta = { icon = "a" } },

    -- application/pdf
    pdf = { meta = { icon = "" }, style = { fg = "Blue" } },

    -- application/zip
    zip = { meta = { icon = "" } },
  },
}

xplr.config.node_types.special["Cargo.toml"] = { meta = { icon = "" } }
xplr.config.node_types.special["Downloads"] = { meta = { icon = "󰇚" }, style = { fg = "Blue" } }
-- }}}

-- Fzf mode
-- ========
xplr.config.modes.builtin.default.key_bindings.on_key["F"] = { -- {{{
  help = "fzf mode",
  messages = {
    { SwitchModeCustom = "fzxplr" },
  },
}
xplr.config.modes.custom.fzxplr = {
  name = "fzxplr",
  key_bindings = {
    on_key = {
      F = {
        help = "search",
        messages = {
          {
            BashExec = [===[
              PTH=$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}" | awk -F/ '{print $NF}' | fzf)
              if [ -d "$PTH" ]; then
                "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
              else
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              fi
            ]===]
          },
          "PopMode",
        },
      },
    },
    default = {
      messages = {
        "PopMode",
      },
    },
  },
}
-- }}}

-- Plugins
-- =======
-- https://github.com/dtomvan/xpm.xplr{{{
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
    .. ";"
    .. xpm_path
    .. "/?.lua;"
    .. xpm_path
    .. "/?/init.lua"
os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)
require("xpm").setup({
  plugins = {
    -- Let xpm manage itself
    'dtomvan/xpm.xplr',

    'Junker/nuke.xplr',

    'sayanarijit/dual-pane.xplr',
    'sayanarijit/tree-view.xplr',

    { name = 'sayanarijit/fzf.xplr' },
  },
  auto_install = true,
  auto_cleanup = true,

})
-- }}}
-- https://github.com/sayanarijit/dual-pane.xplr{{{
require("dual-pane").setup {
  active_pane_width = { Percentage = 50 },
  inactive_pane_width = { Percentage = 50 },
}
-- }}}
-- https://github.com/sayanarijit/tree-view.xplr{{{
require("tree-view").setup({
  mode = "switch_layout",
  key = "T",

  -- If you feel slowness, you might want to toggle back to the default view.
  toggle_layout_mode = "default",
  toggle_layout_key = "t",

  -- Press backspace to close all and back and close
  close_all_and_back_mode = "default",
  close_all_and_back_key = "backspace",

  -- Toggle expansion without entering
  toggle_expansion_mode = "default",
  toggle_expansion_key = "o",

  -- Toggle expansion of all the nodes under pwd
  toggle_expansion_all_mode = "default",
  toggle_expansion_all_key = "O",

  -- -- Focus on the next visible line, not compatible with up/down action
  -- focus_next_mode = "default",
  -- focus_next_key = "]",

  -- -- Focus on the previous visible line, not compatible with up/down action
  -- focus_prev_mode = "default",
  -- focus_prev_key = "[",

  -- -- Go to the next deep level directory that's open
  -- goto_next_open_mode = "default",
  -- goto_next_open_key = ")",

  -- -- Go to the previous deep level directory that's open
  -- goto_prev_open_mode = "default",
  -- goto_prev_open_key = "(",

  -- Whether to display the tree in full screen
  fullscreen = false,

  -- Indent for the branches of the tree
  indent = "  ",

  -- Start xplr with tree view layout
  as_initial_layout = false,

  -- Disables toggling layout.
  as_default_layout = false,

  -- Automatically fallback to this layout for better performance if the
  -- branch contains # of nodes more than the threshold value
  fallback_layout = "Table",
  fallback_threshold = 500, -- default: nil (disabled)
})
-- }}}
-- https://github.com/Junker/nuke.xplr  opener {{{
require("nuke").setup {
  pager = "more",           -- default: less -R
  open = {
    run_executables = true, -- default: false
    custom = {
      { extension = "md",         command = "helix {}" },
      { extension = "pdf",        command = "zathura {}" },
      { extension = "png",        command = "ristretto {}" },
      { extension = "jpg",        command = "ristretto {}" },
      { mime = "video/mp4",       command = "mpv {}" },
      { mime_regex = "^video/.*", command = "mpv {}" },
      { mime_regex = ".*",        command = "xdg-open {}" }
    }
  },
  view = {
    show_line_numbers = true, -- default: false
  },
  smart_view = {
    custom = {
      { extension = "so", command = "ldd -r {} | less" },
    }
  }
}
-- }}}

-- Binding
-- =======
local key = xplr.config.modes.builtin.default.key_bindings.on_key -- {{{

-- xplr.config.modes.builtin.default.key_bindings.on_key["e"] = {
--   help = "fzf mode",
--   messages = {
--     { SwitchModeCustom = "fzxplr" },
--   },
-- }

-- edit file in $EDITOR
key["e"] = xplr.config.modes.builtin.action.key_bindings.on_key.e

-- open
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o

-- xdg-open
key["x"] = xplr.config.modes.builtin.go_to.key_bindings.on_key.x

-- open as
key.O = {
  help = "nuke",
  messages = { "PopMode", { SwitchModeCustom = "nuke" } }
}

-- new FILE | DIR
key["n"] = xplr.config.modes.builtin.action.key_bindings.on_key.c

-- switch panel
key["tab"] = xplr.config.modes.builtin.switch_layout.key_bindings.on_key.w

-- fzf
key["F"] = xplr.config.modes.custom.fzxplr.key_bindings.on_key.F

-- view
key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v


-- xplr.config.modes.builtin.default.key_bindings.on_key["X"] = {
--   help = "open",
--   messages = {
--     {
--       BashExecSilently0 = [===[
--         xdg-open "${XPLR_FOCUS_PATH:?}"
--       ]===],
--     },
--   },
-- }
-- }}}

-- Bookmark
-- ========
-- With `export XPLR_BOOKMARK_FILE="$HOME/.config/xplr/bookmarks"`{{{
-- Bookmark: mode binding
xplr.config.modes.builtin.default.key_bindings.on_key["b"] = {
  help = "bookmark mode",
  messages = {
    { SwitchModeCustom = "bookmark" },
  },
}
xplr.config.modes.custom.bookmark = {
  name = "bookmark",
  key_bindings = {
    on_key = {
      m = {
        help = "bookmark dir",
        messages = {
          {
            BashExecSilently0 = [[
              PTH="${XPLR_FOCUS_PATH:?}"
              if [ -d "${PTH}" ]; then
                PTH="${PTH}"
              elif [ -f "${PTH}" ]; then
                PTH=$(dirname "${PTH}")
              fi
              PTH_ESC=$(printf %q "$PTH")
              if echo "${PTH:?}" >> "${XPLR_BOOKMARK_FILE:?}"; then
                "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC added to bookmarks"
              else
                "$XPLR" -m 'LogError: %q' "Failed to bookmark $PTH_ESC"
              fi
            ]],
          },
          "PopMode",
        },
      },
      g = {
        help = "go to bookmark",
        messages = {
          {
            BashExec0 = [===[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
              if [ "$PTH" ]; then
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              fi
            ]===],
          },
          "PopMode",
        },
      },
      d = {
        help = "delete bookmark",
        messages = {
          {
            BashExec0 = [[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
              sd "$PTH\n" "" "${XPLR_BOOKMARK_FILE:?}"
            ]],
          },
          "PopMode",
        },
      },
      esc = {
        help = "cancel",
        messages = {
          "PopMode",
        },
      },
    },
  },
}
-- }}}
