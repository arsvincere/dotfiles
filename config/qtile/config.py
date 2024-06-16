# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
mod = "mod4"
terminal = guess_terminal()

keys = [
    # general
    Key([mod, "control"],   "u",        lazy.reload_config()),
    Key([mod, "control"],   "Escape",   lazy.shutdown()),
    Key([mod],              "Escape",   lazy.window.kill()),
    Key([mod],              "Space",    lazy.spawn(terminal)),
    Key([mod, "shift"],     "Return",   lazy.window.toggle_fullscreen()),
    Key([mod],              "Return",   lazy.next_layout()),
    Key([mod],              "Tab",      lazy.spawncmd()),
    Key([mod],              "u",        lazy.window.toggle_floating()),

    # switch
    Key([mod],              "h",        lazy.layout.left()),
    Key([mod],              "l",        lazy.layout.right()),
    Key([mod],              "j",        lazy.layout.down()),
    Key([mod],              "k",        lazy.layout.up()),

    # move
    Key([mod, "shift"],     "h",        lazy.layout.shuffle_left()),
    Key([mod, "shift"],     "l",        lazy.layout.shuffle_right()),
    Key([mod, "shift"],     "j",        lazy.layout.shuffle_down()),
    Key([mod, "shift"],     "k",        lazy.layout.shuffle_up()),

    # resize
    Key([mod, "control"],   "h",        lazy.layout.grow_left()),
    Key([mod, "control"],   "l",        lazy.layout.grow_right()),
    Key([mod, "control"],   "j",        lazy.layout.grow_down()),
    Key([mod, "control"],   "k",        lazy.layout.grow_up()),

    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key(
    #     [mod, "shift"],
    #     "Return",
    #     lazy.layout.toggle_split(),
    #     desc="Toggle between split and unsplit sides of stack",
    # ),
]

# -- Bar ---------------------------------------------------------------------{{{
screens = [
    Screen(
        top=bar.Bar([
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %H:%M"),
                widget.CurrentLayout(),
                widget.QuickExit(),
            ],
            18,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]
widget_defaults = dict(
    font="hack",
    fontsize=12,
    padding=2,
)
extension_defaults = widget_defaults.copy()
# }}}
# -- Groups ------------------------------------------------------------------{{{
group_names = [
    "note", "web", "edit", "read", "msg",
    "avin", "sh", "dev", "file", "git",
    "z", "x", "c", "v", "b",
    ]
groups = [Group(i) for i in group_names]

keys.extend([Key( [mod], "q", lazy.group["note"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "q", lazy.window.togroup("note", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "w", lazy.group["web"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "w", lazy.window.togroup("web", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "e", lazy.group["edit"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "e", lazy.window.togroup("edit", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "r", lazy.group["read"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "r", lazy.window.togroup("read", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "t", lazy.group["msg"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "t", lazy.window.togroup("msg", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "a", lazy.group["avin"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "a", lazy.window.togroup("avin", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "s", lazy.group["sh"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "s", lazy.window.togroup("sh", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "d", lazy.group["dev"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "d", lazy.window.togroup("dev", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "f", lazy.group["file"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "f", lazy.window.togroup("file", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "g", lazy.group["git"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "g", lazy.window.togroup("git", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "z", lazy.group["z"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "z", lazy.window.togroup("z", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "x", lazy.group["x"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "x", lazy.window.togroup("x", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "c", lazy.group["c"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "c", lazy.window.togroup("c", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "v", lazy.group["v"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "v", lazy.window.togroup("v", switch_group=True), desc="Move")
    ])
keys.extend([Key( [mod], "b", lazy.group["b"].toscreen(), desc="Switch",),
    Key( [mod, "shift"], "b", lazy.window.togroup("b", switch_group=True), desc="Move")
    ])
layouts = [
    layout.Columns(
        border_width=1,
        border_focus="#ffffff",
        border_focus_stack="#ffffff",
        border_normal="#000000",
        border_normal_stack="#000000",
        ),
    layout.Max(
        border_width=2,
        border_focus="999900",
        ),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=5),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
# }}}
# -- Mouse -------------------------------------------------------------------{{{
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
# }}}
# -- Other -------------------------------------------------------------------# {{{
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
# }}}

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
# for vt in range(1, 8):
#     keys.append(
#         Key(
#             ["control", "mod1"],
#             f"f{vt}",
#             lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
#             desc=f"Switch to VT{vt}",
#         )
#     )

