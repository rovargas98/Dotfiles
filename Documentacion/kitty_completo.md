# Mappable actions

The actions described below can be mapped to any key press or mouse
action using the `map` and `mouse_map` directives in
`kitty.conf`{.interpreted-text role="file"}. For configuration examples,
see the default shortcut links for each action. To read about keyboard
mapping in more detail, see `mapping`{.interpreted-text role="doc"}.

You can also browse and trigger these actions by pressing
`command_palette`{.interpreted-text role="sc"} to run the
`/kittens/command-palette`{.interpreted-text role="doc"}.
# Tabs and Windows

[\|kitty\|](##SUBST##|kitty|) is capable of running multiple programs
organized into tabs and windows. The top level of organization is the
`OS window <os_window>`{.interpreted-text role="term"}. Each OS window
consists of one or more `tabs <tab>`{.interpreted-text role="term"}.
Each tab consists of one or more
`kitty windows <window>`{.interpreted-text role="term"}. The kitty
windows can be arranged in multiple different
`layouts <layout>`{.interpreted-text role="term"}, like windows are
organized in a tiling window manager. The keyboard controls (which are
`all customizable
<conf-kitty-shortcuts>`{.interpreted-text role="ref"}) for tabs and
windows are:

## Scrolling

  Action                      Shortcut
  --------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------
  Line up                     `scroll_line_up`{.interpreted-text role="sc"} (also `⌥+⌘+⇞`{.interpreted-text role="kbd"} and `⌘+↑`{.interpreted-text role="kbd"} on macOS)
  Line down                   `scroll_line_down`{.interpreted-text role="sc"} (also `⌥+⌘+⇟`{.interpreted-text role="kbd"} and `⌘+↓`{.interpreted-text role="kbd"} on macOS)
  Page up                     `scroll_page_up`{.interpreted-text role="sc"} (also `⌘+⇞`{.interpreted-text role="kbd"} on macOS)
  Page down                   `scroll_page_down`{.interpreted-text role="sc"} (also `⌘+⇟`{.interpreted-text role="kbd"} on macOS)
  Top                         `scroll_home`{.interpreted-text role="sc"} (also `⌘+↖`{.interpreted-text role="kbd"} on macOS)
  Bottom                      `scroll_end`{.interpreted-text role="sc"} (also `⌘+↘`{.interpreted-text role="kbd"} on macOS)
  Previous shell prompt       `scroll_to_previous_prompt`{.interpreted-text role="sc"} (see `shell_integration`{.interpreted-text role="ref"})
  Next shell prompt           `scroll_to_next_prompt`{.interpreted-text role="sc"} (see `shell_integration`{.interpreted-text role="ref"})
  Browse scrollback in less   `show_scrollback`{.interpreted-text role="sc"}
  Browse last cmd output      `show_last_command_output`{.interpreted-text role="sc"} (see `shell_integration`{.interpreted-text role="ref"})
  Search scrollback in less   `search_scrollback`{.interpreted-text role="sc"} (also `⌘+F`{.interpreted-text role="kbd"} on macOS)

The scroll actions only take effect when the terminal is in the main
screen. When the alternate screen is active (for example when using a
full screen program like an editor) the key events are instead passed to
program running in the terminal.

## Tabs

  Action              Shortcut
  ------------------- ---------------------------------------------------------------------------------------------------------------------------------------------
  New tab             `new_tab`{.interpreted-text role="sc"} (also `⌘+t`{.interpreted-text role="kbd"} on macOS)
  Close tab           `close_tab`{.interpreted-text role="sc"} (also `⌘+w`{.interpreted-text role="kbd"} on macOS)
  Next tab            `next_tab`{.interpreted-text role="sc"} (also `⌃+⇥`{.interpreted-text role="kbd"} and `⇧+⌘+]`{.interpreted-text role="kbd"} on macOS)
  Previous tab        `previous_tab`{.interpreted-text role="sc"} (also `⇧+⌃+⇥`{.interpreted-text role="kbd"} and `⇧+⌘+[`{.interpreted-text role="kbd"} on macOS)
  Next layout         `next_layout`{.interpreted-text role="sc"}
  Move tab forward    `move_tab_forward`{.interpreted-text role="sc"}
  Move tab backward   `move_tab_backward`{.interpreted-text role="sc"}
  Set tab title       `set_tab_title`{.interpreted-text role="sc"} (also `⇧+⌘+i`{.interpreted-text role="kbd"} on macOS)

## Windows

  Action                  Shortcut
  ----------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  New window              `new_window`{.interpreted-text role="sc"} (also `⌘+↩`{.interpreted-text role="kbd"} on macOS)
  New OS window           `new_os_window`{.interpreted-text role="sc"} (also `⌘+n`{.interpreted-text role="kbd"} on macOS)
  Close window            `close_window`{.interpreted-text role="sc"} (also `⇧+⌘+d`{.interpreted-text role="kbd"} on macOS)
  Resize window           `start_resizing_window`{.interpreted-text role="sc"} (also `⌘+r`{.interpreted-text role="kbd"} on macOS)
  Next window             `next_window`{.interpreted-text role="sc"}
  Previous window         `previous_window`{.interpreted-text role="sc"}
  Move window forward     `move_window_forward`{.interpreted-text role="sc"}
  Move window backward    `move_window_backward`{.interpreted-text role="sc"}
  Move window to top      `move_window_to_top`{.interpreted-text role="sc"}
  Visually focus window   `focus_visible_window`{.interpreted-text role="sc"}
  Visually swap window    `swap_with_window`{.interpreted-text role="sc"}
  Focus specific window   `first_window`{.interpreted-text role="sc"}, `second_window`{.interpreted-text role="sc"} \... `tenth_window`{.interpreted-text role="sc"} (also `⌘+1`{.interpreted-text role="kbd"}, `⌘+2`{.interpreted-text role="kbd"} \... `⌘+9`{.interpreted-text role="kbd"} on macOS) (clockwise from the top-left)

Additionally, you can define shortcuts in `kitty.conf`{.interpreted-text
role="file"} to focus neighboring windows and move windows around
(similar to window movement in `vim`{.interpreted-text role="program"}):

    map ctrl+left neighboring_window left
    map shift+left move_window right
    map ctrl+down neighboring_window down
    map shift+down move_window up
    ...

You can also define a shortcut to switch to the previously active
window:

    map ctrl+p nth_window -1

`nth_window`{.interpreted-text role="ac"} will focus the nth window for
positive numbers (starting from zero) and the previously active windows
for negative numbers.

To switch to the nth OS window, you can define
`nth_os_window`{.interpreted-text role="ac"}. Only positive numbers are
accepted, starting from one.

::: {#detach_window}
You can define shortcuts to detach the current window and move it to
another tab or another OS window:

    # moves the window into a new OS window
    map ctrl+f2 detach_window
    # moves the window into a new tab
    map ctrl+f3 detach_window new-tab
    # moves the window into the previously active tab
    map ctrl+f3 detach_window tab-prev
    # moves the window into the tab at the left of the active tab
    map ctrl+f3 detach_window tab-left
    # moves the window into a new tab created to the left of the active tab
    map ctrl+f3 detach_window new-tab-left
    # asks which tab to move the window into
    map ctrl+f4 detach_window ask
:::

Similarly, you can detach the current tab, with:

    # moves the tab into a new OS window
    map ctrl+f2 detach_tab
    # asks which OS Window to move the tab into
    map ctrl+f4 detach_tab ask

Note that tabs can be re-arranged, detached and moved to another OS
Window in the same kitty instance using drag and drop.

Finally, you can define a shortcut to close all windows in a tab other
than the currently active window:

    map f9 close_other_windows_in_tab

# Other keyboard shortcuts

The full list of actions that can be mapped to key presses is available
`here </actions>`{.interpreted-text role="doc"}. To learn how to do more
sophisticated keyboard mappings, such as modal mappings, per application
mappings, etc. see `mapping`{.interpreted-text role="doc"}.

  Action                                               Shortcut
  ---------------------------------------------------- ------------------------------------------------------------------------------------------------------------------
  Show this help                                       `show_kitty_doc`{.interpreted-text role="sc"}
  Copy to clipboard                                    `copy_to_clipboard`{.interpreted-text role="sc"} (also `⌘+c`{.interpreted-text role="kbd"} on macOS)
  Paste from clipboard                                 `paste_from_clipboard`{.interpreted-text role="sc"} (also `⌘+v`{.interpreted-text role="kbd"} on macOS)
  Paste from selection                                 `paste_from_selection`{.interpreted-text role="sc"}
  Pass selection to program                            `pass_selection_to_program`{.interpreted-text role="sc"}
  Increase font size                                   `increase_font_size`{.interpreted-text role="sc"} (also `⌘++`{.interpreted-text role="kbd"} on macOS)
  Decrease font size                                   `decrease_font_size`{.interpreted-text role="sc"} (also `⌘+-`{.interpreted-text role="kbd"} on macOS)
  Restore font size                                    `reset_font_size`{.interpreted-text role="sc"} (also `⌘+0`{.interpreted-text role="kbd"} on macOS)
  Toggle fullscreen                                    `toggle_fullscreen`{.interpreted-text role="sc"} (also `⌃+⌘+f`{.interpreted-text role="kbd"} on macOS)
  Toggle maximized                                     `toggle_maximized`{.interpreted-text role="sc"}
  Input Unicode character                              `input_unicode_character`{.interpreted-text role="sc"} (also `⌃+⌘+space`{.interpreted-text role="kbd"} on macOS)
  Open URL in web browser                              `open_url`{.interpreted-text role="sc"}
  Reset the terminal                                   `reset_terminal`{.interpreted-text role="sc"} (also `⌥+⌘+r`{.interpreted-text role="kbd"} on macOS)
  Edit `kitty.conf`{.interpreted-text role="file"}     `edit_config_file`{.interpreted-text role="sc"} (also `⌘+,`{.interpreted-text role="kbd"} on macOS)
  Reload `kitty.conf`{.interpreted-text role="file"}   `reload_config_file`{.interpreted-text role="sc"} (also `⌃+⌘+,`{.interpreted-text role="kbd"} on macOS)
  Debug `kitty.conf`{.interpreted-text role="file"}    `debug_config`{.interpreted-text role="sc"} (also `⌥+⌘+,`{.interpreted-text role="kbd"} on macOS)
  Open a [\|kitty\|](##SUBST##|kitty|) shell           `kitty_shell`{.interpreted-text role="sc"}
  Increase background opacity                          `increase_background_opacity`{.interpreted-text role="sc"}
  Decrease background opacity                          `decrease_background_opacity`{.interpreted-text role="sc"}
  Full background opacity                              `full_background_opacity`{.interpreted-text role="sc"}
  Reset background opacity                             `reset_background_opacity`{.interpreted-text role="sc"}
# Install kitty

## Binary install

You can install pre-built binaries of [\|kitty\|](##SUBST##|kitty|) if
you are on macOS or Linux using the following simple command:

``` sh
_kitty_install_cmd
```

The binaries will be installed in the standard location for your OS,
`/Applications/kitty.app`{.interpreted-text role="file"} on macOS and
`~/.local/kitty.app`{.interpreted-text role="file"} on Linux. The
installer only touches files in that directory. To update kitty, simply
re-run the command.

:::: warning
::: title
Warning
:::

**Do not** copy the kitty binary out of the installation folder. If you
want to add it to your `PATH`{.interpreted-text role="envvar"}, create a
symlink in `~/.local/bin`{.interpreted-text role="file"} or
`/usr/bin`{.interpreted-text role="file"} or wherever. You should create
a symlink for the `kitten`{.interpreted-text role="file"} binary as
well. Whichever folder you choose to create the symlink in should be in
the **systemwide** PATH, a folder added to the PATH in your shell rc
files will not work when running kitty from your desktop environment.
::::

## Manually installing

If something goes wrong or you simply do not want to run the installer,
you can manually download and install [\|kitty\|](##SUBST##|kitty|) from
the [GitHub releases
page](https://github.com/kovidgoyal/kitty/releases). If you are on
macOS, download the `.dmg`{.interpreted-text role="file"} and install as
normal. If you are on Linux, download the tarball and extract it into a
directory. The [\|kitty\|](##SUBST##|kitty|) executable will be in the
`bin`{.interpreted-text role="file"} sub-directory.

## Desktop integration on Linux

If you want the kitty icon to appear in the taskbar and an entry for it
to be present in the menus, you will need to install the
`kitty.desktop`{.interpreted-text role="file"} file. The details of the
following procedure may need to be adjusted for your particular desktop,
but it should work for most major desktop environments.

``` sh
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' > ~/.config/xdg-terminals.list
```

:::: note
::: title
Note
:::

In `kitty-open.desktop`{.interpreted-text role="file"}, kitty is
registered to handle some supported MIME types. This will cause kitty to
take precedence on some systems where the default apps are not
explicitly set. For example, if you expect to use other GUI file
managers to open dir paths when using commands such as
`xdg-open`{.interpreted-text role="program"}, you should configure the
default opener for the MIME type `inode/directory`:

xdg-mime default org.kde.dolphin.desktop inode/directory
::::

:::: note
::: title
Note
:::

If you use the venerable [stow](https://www.gnu.org/software/stow/)
command to manage your manual installations, the following takes care of
the above for you (use with `dest=~/.local/stow`):

cd \~/.local/stow stow -v kitty.app
::::

## Customizing the installation

::: {#nightly}
-   You can install the latest nightly kitty build with `installer`:

    ``` sh
    _kitty_install_cmd \
        installer=nightly
    ```

    If you want to install it in parallel to the released kitty specify
    a different install locations with `dest`:

    ``` sh
    _kitty_install_cmd \
        installer=nightly dest=/some/other/location
    ```

-   You can specify a specific version to install, with:

    ``` sh
    _kitty_install_cmd \
        installer=version-0.35.2
    ```

-   You can tell the installer not to launch
    [\|kitty\|](##SUBST##|kitty|) after installing it with `launch=n`:

    ``` sh
    _kitty_install_cmd \
        launch=n
    ```

-   You can use a previously downloaded dmg/tarball, with `installer`:

    ``` sh
    _kitty_install_cmd \
        installer=/path/to/dmg or tarball
    ```
:::

## Uninstalling

All the installer does is copy the kitty files into the install
directory. To uninstall, simply delete that directory.

## Building from source

[\|kitty\|](##SUBST##|kitty|) is easy to build from source, follow the
`instructions <build>`{.interpreted-text role="doc"}.
# Build from source

[![Build status](https://github.com/kovidgoyal/kitty/workflows/CI/badge.svg)](https://github.com/kovidgoyal/kitty/actions?query=workflow%3ACI)

:::: note
::: title
Note
:::

If you just want to test the latest changes to kitty, you don\'t need to
build from source. Instead install the
`latest nightly build <nightly>`{.interpreted-text role="ref"}.
::::

[\|kitty\|](##SUBST##|kitty|) is designed to run from source, for easy
hack-ability. All you need to get started is a C compiler and the [go
compiler](https://go.dev/doc/install) (on Linux, the
`X11 development libraries <x11-dev-libs>`{.interpreted-text role="ref"}
as well). After installing those, run the following commands:

``` sh
git clone https://github.com/kovidgoyal/kitty.git && cd kitty
./dev.sh build
```

That\'s it, kitty will be built from source, magically. You can run it
as `kitty/launcher/kitty`{.interpreted-text role="file"}.

This works, because the `./dev.sh build` command downloads all the major
dependencies of kitty as pre-built binaries for your platform and builds
kitty to use these rather than system libraries. The few required system
libraries are X11 and DBUS on Linux.

If you make changes to kitty code, simply re-run `./dev.sh build` to
build kitty with your changes.

:::: note
::: title
Note
:::

If you plan to run kitty from source long-term, there are a couple of
caveats to be aware of. You should occasionally run `./dev.sh deps` to
have the dependencies re-downloaded as they are updated periodically.
Also, the built kitty executable assumes it will find source in whatever
directory you first ran `./dev.sh build` in. If you move/rename the
directory, run `make clean && ./dev.sh build`. You should also create
symlinks to the `kitty`{.interpreted-text role="file"} and
`kitten`{.interpreted-text role="file"} binaries from somewhere in your
PATH so that they can be conveniently launched.
::::

:::: note
::: title
Note
:::

On macOS, you can use `kitty/launcher/kitty.app`{.interpreted-text
role="file"} to run kitty as well, but note that this is an unsigned
kitty.app so some functionality such as notifications will not work as
Apple disallows this. If you need this functionality, you can try
signing the built `kitty.app`{.interpreted-text role="file"} with a self
signed certificate, see for example,
[here](https://stackoverflow.com/questions/27474751/how-can-i-codesign-an-app-without-being-in-the-mac-developer-program/27474942).
::::

## Building in debug mode

The following will build with debug symbols:

``` sh
./dev.sh build --debug
```

To build with sanitizers and debug symbols:

``` sh
./dev.sh build --debug --sanitize
```

For more help on the various options supported by the build script:

``` sh
./dev.sh build -h
```

### Building the documentation

To have the kitty documentation available locally, run:

``` sh
./dev.sh deps -for-docs && ./dev.sh docs
```

To develop the docs, with live reloading, use:

``` sh
./dev.sh deps -for-docs && ./dev.sh docs -live-reload
```

### Dependencies

These dependencies are needed when building against system libraries
only.

Run-time dependencies:

-   `python`
-   `harfbuzz` \>= 2.2.0
-   `zlib`
-   `libpng`
-   `liblcms2`
-   `libxxhash`
-   `openssl`
-   `pixman` (not needed on macOS)
-   `cairo` (not needed on macOS)
-   `freetype` (not needed on macOS)
-   `fontconfig` (not needed on macOS)
-   `libcanberra` (not needed on macOS)
-   `libsystemd` (optional, not needed on non systemd systems)
-   `ImageMagick` (optional, needed to display uncommon image formats in
    the terminal)

Build-time dependencies:

-   `gcc` or `clang`

-   `simde`

-   `go` \>= [build_go_version]{#build_go_version} (see
    `go.mod`{.interpreted-text role="file"} for go packages used during
    building)

-   `pkg-config`

-   Symbols NERD Font Mono either installed system-wide or placed in
    `fonts/SymbolsNerdFontMono-Regular.ttf`{.interpreted-text
    role="file"}

-   For building on Linux in addition to the above dependencies you
    might also need to install the following packages, if they are not
    already installed by your distro:

    -   `liblcms2-dev`
    -   `libfontconfig-dev`
    -   `libssl-dev`
    -   `libpython3-dev`
    -   `libxxhash-dev`
    -   `libsimde-dev`
    -   `libcairo2-dev`

    ::: {#x11-dev-libs}
    Also, the X11 development libraries:
    :::

    -   `libdbus-1-dev`
    -   `libxcursor-dev`
    -   `libxrandr-dev`
    -   `libxi-dev`
    -   `libxinerama-dev`
    -   `libgl1-mesa-dev`
    -   `libxkbcommon-x11-dev`
    -   `libfontconfig-dev`
    -   `libx11-xcb-dev`

### Build and run from source with Nix

On NixOS or any other Linux or macOS system with the Nix package manager
installed, execute
[nix-shell](https://nixos.org/guides/nix-pills/developing-with-nix-shell.html)
to create the correct environment to build kitty or use
`nix-shell --pure` instead to eliminate most of the influence of the
outside system, e.g. globally installed packages. `nix-shell` will
automatically fetch all required dependencies and make them available in
the newly spawned shell.

Then proceed with `make` or `make app` according to the platform
specific instructions above.

### Notes for Linux/macOS packagers {#packagers}

The released [\|kitty\|](##SUBST##|kitty|) source code is available as a
[tarball]() from [the GitHub releases
page](https://github.com/kovidgoyal/kitty/releases).

While [\|kitty\|](##SUBST##|kitty|) does use Python, it is not a
traditional Python package, so please do not install it in
site-packages. Instead run:

``` sh
make linux-package
```

This will install [\|kitty\|](##SUBST##|kitty|) into the directory
`linux-package`{.interpreted-text role="file"}. You can run
[\|kitty\|](##SUBST##|kitty|) with
`linux-package/bin/kitty`{.interpreted-text role="file"}. All the files
needed to run kitty will be in
`linux-package/lib/kitty`{.interpreted-text role="file"}. The terminfo
file will be installed into
`linux-package/share/terminfo`{.interpreted-text role="file"}. Simply
copy these files into `/usr`{.interpreted-text role="file"} to install
[\|kitty\|](##SUBST##|kitty|). In other words,
`linux-package`{.interpreted-text role="file"} is the staging area into
which [\|kitty\|](##SUBST##|kitty|) is installed. You can choose a
different staging area, by passing the `--prefix` argument to
`setup.py`{.interpreted-text role="file"}.

You should probably split [\|kitty\|](##SUBST##|kitty|) into three
packages:

`kitty-terminfo`

:   Installs the terminfo file

`kitty-shell-integration`

:   Installs the shell integration scripts (the contents of the
    shell-integration directory in the kitty source code), probably to
    `/usr/share/kitty/shell-integration`{.interpreted-text role="file"}

`kitty`

:   Installs the main program

This allows users to install the terminfo and shell integration files on
servers into which they ssh, without needing to install all of
[\|kitty\|](##SUBST##|kitty|). The shell integration files **must**
still be present in `lib/kitty/shell-integration`{.interpreted-text
role="file"} when installing the kitty main package as the kitty program
expects to find them there.

:::: note
::: title
Note
:::

You need a couple of extra dependencies to build linux-package.
`tic`{.interpreted-text role="file"} to compile terminfo files, usually
found in the development package of `ncurses`{.interpreted-text
role="file"}. Also, if you are building from a git checkout instead of
the released source code tarball, you will need to install the
dependencies from `docs/requirements.txt`{.interpreted-text role="file"}
to build the kitty documentation. They can be installed most easily with
`python -m pip -r docs/requirements.txt`.
::::

This applies to creating packages for [\|kitty\|](##SUBST##|kitty|) for
macOS package managers such as Homebrew or MacPorts as well.

### Cross compilation

While cross compilation is neither officially supported, nor
recommended, as it means the test suite cannot be run for the cross
compiled build, there is some support for cross compilation. Basically,
run:

``` sh
make prepare-for-cross-compile
```

Then setup the cross compile environment (CC, CFLAGS, PATH, etc.) and
run:

``` sh
make cross-compile
```

This will create the cross compiled build in the
`linux-package`{.interpreted-text role="file"} directory.
# Changelog

[\|kitty\|](##SUBST##|kitty|) is a feature-rich, cross-platform, *fast*,
GPU based terminal. To update [\|kitty\|](##SUBST##|kitty|),
`follow the instructions <binary>`{.interpreted-text role="doc"}.

## Recent major new features

### Drag and drop for terminal programs \[0.47\]

kitty now has a new `/kittens/dnd`{.interpreted-text role="doc"} kitten
that allows you to seamlessly drag and drop files between kitty and any
GUI program like the OS file manager or a webapp. It even works over
SSH! It is powered by a new `protocol
</dnd-protocol>`{.interpreted-text role="doc"} allowing the use of drag
and drop from any TUI program.

### Mousing \[0.46\]

kitty already had excellent mouse support, but now it is taking it to
the next level. The kitty scrollback buffer grew support for
`smooth scrolling
<pixel_scroll>`{.interpreted-text role="opt"} and
`momentum based scrolling <momentum_scroll>`{.interpreted-text
role="opt"} for a natural, smooth and kinetic scrolling experience.

Additionally, you can now
`drag kitty tabs around <drag_threshold>`{.interpreted-text role="opt"}
with the mouse to re-order them, move them to another kitty OS Window or
even detach them into their own OS Window.

Finally, a long requested feature, the ability to resize kitty windows
(aka splits) with the mouse was implemented.

### Choose files, fast \[0.45\]

A new `kitten to select files at the speed of thought
</kittens/choose-files>`{.interpreted-text role="doc"} with a keyboard
first interface and support for content previews of text files with
syntax highlighting, images, videos, e-books and more. Allows you to
select files for use at the shell prompt or other terminal workflows
with just a few keystrokes, similar to how fuzzy finders like
[fzf](https://github.com/junegunn/fzf/) operate, but designed for files
in particular, leveraging the various innovations of kitty such as image
display and variable sized text.

On Linux, it can even be used as a
`drop in replacement </kittens/desktop-ui>`{.interpreted-text
role="doc"} for the File Open/Save dialog boxes in GUI programs.

### Sessions \[0.43\]

kitty has long had support for `sessions`{.interpreted-text role="doc"},
aka simple text files where you can define what tabs, windows and
programs you wish to run in kitty. Now in addition to that kitty has the
ability to `create and switch between
sessions <goto_session>`{.interpreted-text role="ref"} with a single
keypress and also to manually setup some tabs/windows in kitty and
`save it as a session file <complex_sessions>`{.interpreted-text
role="ref"}, for seamless and intuitive session file creation.

### A scrollbar for the kitty scrollback \[0.43\]

A long requested feature, kitty has finally
`gotten a scrollbar <8945>`{.interpreted-text role="pull"} that can be
used with the mouse for browsing its scrollback. The bar appear
automatically when you start scrolling backwards and is `extensively
configurable <scrollbar>`{.interpreted-text role="opt"} in kitty.conf.
Note that the old `scrollback_indicator_opacity` option is deprecated.

### Multiple cursors \[0.43\]

kitty has pioneered a new `escape code protocol
<multiple-cursors-protocol>`{.interpreted-text role="doc"} that allows
terminal applications to use multiple cursors, rendered natively. These
are typically used in editors to make the same edit at multiple
locations. Now terminal based editors can use properly rendered native
cursors, just like their GUI cousins, at last.

### Access kitty with a single keypress \[0.42\]

.. sidebar:

    .. only:: not man

        **Screenshots**

        .. figure:: /screenshots/quake-macos.webp
            :alt: Screenshot, showing the kitty floating quick access terminal above the background which is the program btop, running inside kitty, on macOS
            :align: center
            :width: 100%

            macOS


        .. figure:: /screenshots/quake-hypr.webp
            :alt: Screenshot, showing the kitty floating quick access terminal above the background which is the program btop, running inside kitty, on Hyprland in Linux
            :align: center
            :width: 100%

            Linux

        .. figure:: /screenshots/panel.png
            :alt: Screenshot, showing a sample panel
            :align: center
            :width: 100%

            A sample panel on Linux

        How the screenshots :ref:`were generated <quake_ss>`.

kitty now has a Quake like floating, translucent terminal window, so you
can access all that kitty goodness instantly with a single keypress.

See the screenshots on the side and head over to the
`kitten page for details
on how to set it up </kittens/quick-access-terminal>`{.interpreted-text
role="doc"}.

### Multiple sized text \[0.40\]

kitty is the first major terminal to introduce the concept of multiple
sized text. Terminal programs running in kitty can now opt-in to use and
display text in multiple font sizes both larger and smaller than the
base font size. This is done in a backwards compatible, opt-in way that
does not affect how traditional terminal programs work at all. For
details on the new feature and how to use it, see
`text-sizing-protocol`{.interpreted-text role="doc"}.

### Cursor trails \[0.37\]

Show an animated trail when the text cursor makes large jumps making it
easy to follow cursor movements. Inspired by the similar feature in
neovide, but works with terminal multiplexers and kitty windows as well.
See `the pull
request <7970>`{.interpreted-text role="pull"} for a demonstration
video. This feature is optional and must be turned on by the
`cursor_trail`{.interpreted-text role="opt"} option in
`kitty.conf`{.interpreted-text role="file"}.

### Variable font support \[0.36\]

Terminal aficionados spend all day staring at text, so getting text
rendering just right is very important. In that spirit, kitty now
supports [OpenType Variable
fonts](https://en.wikipedia.org/wiki/Variable_font). These allow precise
customisation of font characteristics, such as weight and spacing. Not
only that, kitty now has a new `choose-fonts
<kittens/choose-fonts>`{.interpreted-text role="doc"} kitten that
provides a UI for choosing fonts with support for font features,
variable fonts and previews of how the font will look. This is in
addition to its existing best-in-class font customization abilities,
such as: `symbol_map`{.interpreted-text role="opt"},
`text_composition_strategy`{.interpreted-text role="opt"},
`font_features`{.interpreted-text role="opt"} and
`modify_font`{.interpreted-text role="opt"}. kitty knows text rendering
is important, and goes the extra mile for it.

### Desktop notifications \[0.36\]

[\|kitty\|](##SUBST##|kitty|) now has a
`notify </kittens/notify>`{.interpreted-text role="doc"} kitten that can
be used to display desktop notifications from the command line, even
over SSH. It has support for icons, buttons, updating notifications,
waiting till the notification is closed, etc. The underlying
`desktop-notifications`{.interpreted-text role="doc"} protocol has been
expanded to support all these features.

### Wayland goodies \[0.34\]

Wayland users should rejoice as kitty now comes with major Wayland
quality-of-life improvements:

-   Draw GPU accelerated
    `desktop panels and background </kittens/panel>`{.interpreted-text
    role="doc"} running arbitrary terminal programs. For example, run
    [btop](https://github.com/aristocratos/btop/) as your desktop
    background
-   Background blur for transparent windows is now supported under KDE
    using a custom KDE specific protocol
-   The kitty window decorations in GNOME are now fully functional with
    buttons and they follow system dark/light mode automatically
-   kitty now supports fractional scaling in Wayland which means pixel
    perfect rendering when you use a fractional scale with no wasted
    performance on resizing an overdrawn pixmap in the compositor

With this release kitty\'s Wayland support is now on par with X11,
provided you use a decent Wayland compositor.

### Cheetah speed 🐆 \[0.33\]

kitty has grown up and become a cheetah. It now parses data it receives
in parallel
`using SIMD vector CPU instructions <7005>`{.interpreted-text
role="iss"} for a 2x speedup in benchmarks and a 10%-50% real world
speedup depending on workload. There is a new benchmarking kitten
`kitten __benchmark__` that can be used to measure terminal throughput.
There is also `a table <throughput>`{.interpreted-text role="ref"}
showing kitty is much faster than other terminal emulators based on the
benchmark kitten. While kitty was already so fast that its performance
was never a bottleneck, this improvement makes it even faster and more
importantly reduces the energy consumption to do the same tasks.

## Detailed list of changes

### 0.47.1 \[future\]

-   Fix a regression in the previous release that caused
    `copy_or_noop`{.interpreted-text role="ac"} to stop working
    correctly (`10041`{.interpreted-text role="pull"})
-   macOS: Fix a regression in the previous release that caused URLs to
    be quoted when dropping into shells (`10054`{.interpreted-text
    role="iss"})
-   Fix a regression in the previous release that broke automatic color
    scheme changes when using a background image
    (`10058`{.interpreted-text role="iss"})
-   Fix `auto_reload_config`{.interpreted-text role="opt"} not working
    when `kitty.conf`{.interpreted-text role="file"} is a symlink
    (`10066`{.interpreted-text role="iss"})

### 0.47.0 \[2026-05-19\]

-   A new `Drag and drop kitten </kittens/dnd>`{.interpreted-text
    role="doc"} to allow drag and drop of files from your shell to any
    GUI program even across SSH (`9984`{.interpreted-text role="iss"})
-   A new option `palette_generate`{.interpreted-text role="opt"} to
    automatically generate the 256 color palette from the first 16
    colors (`9426`{.interpreted-text role="pull"})
-   For builtin key mappings automatically
    `fallback <mapping-fallback>`{.interpreted-text role="ref"} to
    matching the US-PC layout key when the pressed key has no matches
    and is a non-English character (`9671`{.interpreted-text
    role="pull"})
-   Allow drag and drop of windows to re-arrange them, move them to
    another tab/OS Window or detach them into a new OS Window. See
    `toggle_window_title_bars`{.interpreted-text role="ac"} to
    temporarily show window title bars to drag them around
    (`9626`{.interpreted-text role="pull"})
-   Have `scroll_line_up`{.interpreted-text role="ac"} and
    `scroll_line_down`{.interpreted-text role="ac"} smooth scroll by
    default. Can be restored to old behavior by re-mapping without the
    `smooth` argument (`9689`{.interpreted-text role="iss"})
-   Draw a progress bar at the top of the window when a program reports
    progress using the OSC 9;4 escape sequence, controlled by
    `progress_bar`{.interpreted-text role="opt"}
    (`9777`{.interpreted-text role="iss"})
-   Automatically reload configuration on changes, controlled by
    `auto_reload_config`{.interpreted-text role="opt"}
-   Allow specifying multiple background images for
    `background_image`{.interpreted-text role="opt"} that are stored on
    GPU to allow fast image switching (`9836`{.interpreted-text
    role="pull"})
-   `Remote control <remote-control>`{.interpreted-text role="doc"}:
    Expose `session_name` and `last_focused_at` in the output of
    `kitten @ ls` for each window (`9732`{.interpreted-text role="iss"},
    `9799`{.interpreted-text role="iss"})
-   Allow optionally dragging URLs with the mouse, see
    `start_simple_selection`{.interpreted-text role="sc"}
    (`9804`{.interpreted-text role="pull"})
-   Change `focus_follows_mouse`{.interpreted-text role="opt"} to switch
    the active window only when the mouse crosses into a different
    window, instead of on every mouse motion event. Prevents accidental
    mouse bumps from undoing a keyboard-driven window switch.
-   Wayland: Use hold gestures to cancel momentum scrolling when fingers
    are placed on the trackpad, for a more natural kinetic scrolling
    experience (`9863`{.interpreted-text role="iss"})
-   macOS: Switch to new Tahoe style application icon with different
    background in light and dark modes
-   Fix thickness of diagonal lines in box drawing characters not the
    same as horizontal/vertical lines (`9719`{.interpreted-text
    role="iss"})
-   Graphics protocol: Fix crash when handling invalid PNG image with
    direct transmission (`2026-33633`{.interpreted-text role="cve"})
-   Graphics protocol: Fix crash when handling invalid offset values in
    graphics compose commands (`2026-33642`{.interpreted-text
    role="cve"})
-   X11: Fix a regression in the previous release that caused an
    occasional crash on input device removal (`9723`{.interpreted-text
    role="iss"})
-   XWayland: Fix a regression where some wheel mice were not scrolling
    properly (`9770`{.interpreted-text role="pull"})
-   Command palette: Improve searching to use word level matching
    (`9727`{.interpreted-text role="pull"})
-   hints kitten: A new option to set the background color of matched
    text (`9745`{.interpreted-text role="pull"})
-   The `show_hyperlink_targets`{.interpreted-text role="opt"} option
    now allows specifying a keyboard modifier so that target URLs are
    only shown on hover when the modifier is pressed
    (`9741`{.interpreted-text role="pull"})
-   Fix a spurious mouse button release event being sent when dragging
    out of an OS window causes focus loss
-   Fix scrollbar hover/interaction not working when the scrollbar is
    drawn in the window margin area (`9756`{.interpreted-text
    role="iss"})
-   Fix completion for `edit-in-kitty` not including some common text
    file types
-   Allow holding the `Alt`{.interpreted-text role="kbd"} key and
    triple-clicking to select from the first cell even if it is empty
    (`9758`{.interpreted-text role="pull"})
-   Fix double click to rename tab being triggered too easily
    (`9774`{.interpreted-text role="iss"})
-   Fix a crash when user tries to select while the client program is
    using synchronised rendering and generating large amounts of output
    (`9778`{.interpreted-text role="iss"})
-   macOS: Add Copy and Paste menu items to the Edit menu in the global
    menu bar (`9780`{.interpreted-text role="iss"})
-   Fix dragging of splits layout borders sometimes moving in the wrong
    direction or having no effect (`9447`{.interpreted-text
    role="pull"})
-   Fix triple-click line selection and double-click word selection not
    extending wrapped lines beyond the edges of the viewport
-   Password input in kittens: hide the cursor and display a blinking 🔒
    at the end of typed characters to make it visually clear the user is
    entering a password
-   edit-in-kitty: Ignore environment variables as some editors execute
    code present in env vars. Similarly ignore conf file specifications
    for colors (`2026-42851`{.interpreted-text role="cve"})
-   Command palette `command_palette`{.interpreted-text role="sc"}:
    nicer grouping of aliases and combined actions
    (`9819`{.interpreted-text role="pull"})
-   hints kitten: Fix trailing punctuation not being removed from URLs
    (`9828`{.interpreted-text role="pull"})
-   Fix copy/paste dropping spaces at soft-wrap boundaries when
    `strip_trailing_spaces`{.interpreted-text role="opt"} is set
    (`9834`{.interpreted-text role="iss"})
-   Allow setting negative values for
    `inactive_text_alpha`{.interpreted-text role="opt"} to control
    whether to only fade inactive windows or unfocused windows
    (`9837`{.interpreted-text role="pull"})
-   A new option
    `macos_fullscreen_ignore_safe_area_insets`{.interpreted-text
    role="opt"} to control whether to ignore the notch space when using
    `macos_traditional_fullscreen`{.interpreted-text role="opt"}
    (`9841`{.interpreted-text role="pull"})
-   Fix some responses from terminal sometimes leaking into shell after
    kitten exit (`9839`{.interpreted-text role="iss"})
-   Render block elements from the Unicode Symbols for Legacy Computing
    Supplement block (U+1CC00--U+1CEBF): separated block quadrants,
    separated block sextants, one sixteenth blocks, and one quarter
    block partial fills (`9849`{.interpreted-text role="disc"})
-   Improve performance of using active process data when rendering the
    tab bar by only scanning processes once per second
    (`9862`{.interpreted-text role="iss"})
-   macOS: Fix occasional phantom cursors being drawn on screen
    (`9725`{.interpreted-text role="iss"})
-   diff kitten: Keep the current (topmost) filename visible when
    scrolling, controlled by a new option
    `kitten-diff.sticky_header`{.interpreted-text role="opt"}
    (`9891`{.interpreted-text role="pull"})
-   Add an option to `focus_follows_mouse`{.interpreted-text role="opt"}
    to only switch focus on drops rather than movement
    (`9896`{.interpreted-text role="pull"})
-   Fix setting `momentum_scroll`{.interpreted-text role="opt"} to zero
    not *fully* disabling momentum scrolling (`9904`{.interpreted-text
    role="iss"})
-   macOS: Fix args passed via `open --args` being ignored when
    `macos-launch-services-cmdline`{.interpreted-text role="file"} is
    present (`9910`{.interpreted-text role="iss"})
-   `save_as_session`{.interpreted-text role="ac"}: when the filename
    input by the user has no extension, automatically add the
    `.kitty-session` extension (`9919`{.interpreted-text role="pull"})
-   Linux: Workaround bug in Nvidia drivers that caused color corruption
    when resuming after suspend (`9844`{.interpreted-text role="iss"})
-   choose-files kitten: Output a trailing newline when writing to a tty
    in text format (`9982`{.interpreted-text role="iss"})
-   ssh kitten: Sanitize user controlled data in error messages that
    might leak to shell (`2026-42850`{.interpreted-text role="cve"})
-   Linux: Respect the fontconfig matrix setting commonly used for fake
    slant with fonts that do not have italic variants
    (`9990`{.interpreted-text role="pull"})

### 0.46.2 \[2026-03-21\]

-   Watchers: Add an [on_quit]{.title-ref} event to global watchers
    (`9675`{.interpreted-text role="iss"})
-   Wayland: Fix a crash on some compositors when dragging a tab between
    OS Windows (`9677`{.interpreted-text role="iss"})
-   Fix incorrect behavior when using the actions to move tab
    forward/backward with a tab[bar_filter]{#bar_filter} active
    (`9672`{.interpreted-text role="iss"})
-   Prevent stacking of multiple rename tab windows
    (`9691`{.interpreted-text role="iss"})
-   choose files kitten: Fix a regression that caused incorrect
    highlight of matched letters
-   macOS: When using `macos_traditional_fullscreen`{.interpreted-text
    role="opt"} do not render content under the notch
    (`9678`{.interpreted-text role="pull"})
-   X11: Fix massive scroll when switching focus between kitty and
    another application (`9703`{.interpreted-text role="iss"})
-   Markers: Fix marking not working for multicell characters
    (`9705`{.interpreted-text role="iss"})
-   Fix a regression in 0.46 that broke drag select in unfocused windows
    (`9713`{.interpreted-text role="iss"})

### 0.46.1 \[2026-03-16\]

-   diff kitten: Highlight moved lines using a different background
    color (`kitten-diff.mark_moved_lines`{.interpreted-text role="opt"})
    (`3241`{.interpreted-text role="iss"})
-   Fix a regression that broke `kitten update-self`
    (`9642`{.interpreted-text role="iss"})
-   macOS: Clear bell alert badge on dock icon on mouse/keyboard
    activity (`9640`{.interpreted-text role="iss"})
-   Fix a regression that broke accept anyway shortcut in the paste
    confirmation dialog (`9640`{.interpreted-text role="pull"})
-   Fix kitty hanging on startup on Intel macs (`9643`{.interpreted-text
    role="iss"})
-   X11: Fix a regression that caused some high res scroll devices to be
    treated as line based scroll devices (`9649`{.interpreted-text
    role="iss"})
-   Wayland: Fix momentum scrolling not working on compositors that send
    a stop frame with no axis information (`9653`{.interpreted-text
    role="iss"})
-   Linux: Fix regression that broke drag and drop from GTK applications
    (`9656`{.interpreted-text role="iss"})
-   macOS: Fix using Fn key for start dictation not working
    (`9661`{.interpreted-text role="iss"})
-   Don\'t use neighboring tab colors for tab bar margins in translucent
    windows (`9663`{.interpreted-text role="iss"})
-   macOS: Fix OS window focus not restored when switching spaces
    (`9665`{.interpreted-text role="iss"})

### 0.46.0 \[2026-03-11\]

-   Pixel scrolling for the kitty scrollback buffer controlled via
    `pixel_scroll`{.interpreted-text role="opt"}
    (`9330`{.interpreted-text role="pull"})
-   Linux: momentum scrolling in the kitty scrollback buffer for
    touchpads and touchscreens, see `momentum_scroll`{.interpreted-text
    role="opt"}
-   X11: support high resolution scroll events from touchpads, etc
-   macOS: Implement support for Apple dictation to input text in kitty
    (`3732`{.interpreted-text role="iss"})
-   Allow dragging tabs (opt:\`drag[threshold]{#threshold}[) in the tab
    bar to re-order, move to another OS Window or detach
    (:pull:\`9296]{.title-ref})
-   Allow dragging window borders to resize kitty windows in all the
    different layouts, controlled by
    `window_drag_tolerance`{.interpreted-text role="opt"}
    (`9447`{.interpreted-text role="pull"})
-   Allow showing
    `configurable window titles <window_title_bar>`{.interpreted-text
    role="opt"} for individual kitty windows via a window title bar
    (`9450`{.interpreted-text role="pull"})
-   A command palette (`command_palette`{.interpreted-text role="sc"})
    to browse and trigger all mapped and unmapped actions
    (`9545`{.interpreted-text role="pull"})
-   choose-files kitten: Fix JXL image preview not working
    (`9323`{.interpreted-text role="iss"})
-   Fix tab bar rendering glitches when using
    `tab_bar_filter`{.interpreted-text role="opt"} in some circumstances
    (`9328`{.interpreted-text role="iss"})
-   Add support for specifying colors in `kitty.conf`{.interpreted-text
    role="file"} in OKLCH and LAB color spaces (`9325`{.interpreted-text
    role="pull"})
-   Fix a regression that broke using line numbers with the
    edit-in-kitty command (`9346`{.interpreted-text role="pull"})
-   Key maps: Allow specifying a timeout for multi key mappings and
    keyboard modes (`9551`{.interpreted-text role="pull"})
-   macOS: Fix changes to `macos_titlebar_color`{.interpreted-text
    role="opt"} while in full screen not being applied after exiting
    fullscreen (`9350`{.interpreted-text role="iss"})
-   ncurses: Fix ncurses not using dim because it is missing from the
    sgr property in terminfo even though it is present in the dim
    property.
-   Fix a regression in the previous release that caused moving between
    neighbors in the vertical and horizontal layouts to go in the
    opposite direction (`9355`{.interpreted-text role="iss"})
-   Fix `goto_session`{.interpreted-text role="ac"} not respecting the
    focus[tab]{#tab} session directive when creating a session in an
    existing OS window (`9366`{.interpreted-text role="iss"})
-   Wayland: Fix a regression in the previous release that caused
    doubled key repeats on compositors that implement compositor side
    key repeat events (`9374`{.interpreted-text role="iss"})
-   icat: Fix a regression in the previous release when rendering GIF
    animations with frames that dispose onto background with non-zero
    delay using the native engine (`9376`{.interpreted-text role="iss"})
-   Wayland: Remove usage of the Wayland color management protocol to
    inform compositors of the color space used by kitty
    (`9341`{.interpreted-text role="iss"})
-   Linux: Fix a regression in 0.40 that caused horizontal alignment for
    emoji to be incorrect in some cases (`9395`{.interpreted-text
    role="iss"})
-   icat kitten: When catting multiple images display the images in
    input order (`9413`{.interpreted-text role="iss"})
-   kitten @: Fix relative paths for \--password-file being resolved
    relative to CWD instead of the kitty config directory
-   kitten choose-files: Add a new binding of
    `Alt+Enter`{.interpreted-text role="kbd"} to modify the name of an
    existing file when choosing a save file name
    (`9387`{.interpreted-text role="iss"})
-   kitten choose-files: Fix TAB completion in the choose save file name
    prompt not working with respect to the current working directory
    (`9387`{.interpreted-text role="iss"})
-   Fix line-at-once selection not extending wrapped lines into
    scrollback (`9437`{.interpreted-text role="iss"})
-   ssh kitten: Restore keyboard mode even if the ssh connection drops
-   edit-in-kitty: Handle connection drop more gracefully
    (`9480`{.interpreted-text role="pull"})
-   macOS: Fix changing window title with global menubar menu open
    causes menu to get stuck (`9490`{.interpreted-text role="pull"})
-   Fix `focus_follows_mouse`{.interpreted-text role="opt"} not working
    during a drag and drop (`9497`{.interpreted-text role="iss"})
-   `goto_session`{.interpreted-text role="ac"}: Add a `--active-only`
    option to select from only active sessions (`9503`{.interpreted-text
    role="pull"})
-   Shell integration: Allow sending click events to shells using y
    co-ordinates relative to prompts (`9500`{.interpreted-text
    role="iss"})
-   A new action
    `copy_selection_or_last_command_output`{.interpreted-text role="ac"}
    (`9512`{.interpreted-text role="pull"})
-   Wayland: Add support for the background blur extension
    (`9534`{.interpreted-text role="iss"})
-   macOS: A new option `macos_dock_badge_on_bell`{.interpreted-text
    role="opt"} to show a badge on the kitty dock icon when a bell
    occurs (`9529`{.interpreted-text role="pull"})
-   macOS: Workaround for yet another Tahoe bug causing rendering to
    fail (`9520`{.interpreted-text role="pull"})
-   URL detection: Allow trailing asterisks in URLs
    (`9543`{.interpreted-text role="iss"})
-   Wayland: Add support for `titlebar-only` in
    `hide_window_decorations`{.interpreted-text role="opt"} to hide the
    titlebar while keeping shadows for window resizing.
    (`9486`{.interpreted-text role="pull"})
-   Text sizing protocol: Fix alignment/cropping issues when rendering
    text with a fractional scale (`9471`{.interpreted-text role="iss"})
-   macOS: Fix a crash when using
    `macos_traditional_fullscreen`{.interpreted-text role="opt"} with
    split view (`9573`{.interpreted-text role="pull"})
-   macOS: Fix flickering during OS Window resize
    (`9582`{.interpreted-text role="disc"})
-   Cursor trail: Show a cursor trail when switching tabs
    (`9588`{.interpreted-text role="pull"})
-   Make shift+left click extend the current selection instead of
    starting a new selection when the mouse is not grabbed by the TUI
    application (`9608`{.interpreted-text role="disc"})
-   Allow double clicking on a tab to rename it
    (`9609`{.interpreted-text role="pull"})
-   `remote_control_script`{.interpreted-text role="ac"} resolve
    relative paths with respect to kitty config directory
    (`9625`{.interpreted-text role="iss"})
-   Splits layout: Add new mappable actions to maximize a window in the
    splits layout (`9629`{.interpreted-text role="iss"})

### 0.45.0 \[2025-12-24\]

-   A new
    `kitten to select files at the speed of thought </kittens/choose-files>`{.interpreted-text
    role="doc"} with a keyboard first interface and support for content
    previews of text files with syntax highlighting, images, videos,
    e-books and more (`9263`{.interpreted-text role="iss"})
-   Add support for the [paste events
    protocol](https://rockorager.dev/misc/bracketed-paste-mime/)
    (`9183`{.interpreted-text role="iss"})
-   icat kitten: Add support for animated PNG and animated WebP, netPBM
    images, ICC color profiles and CCIP color space metadata to the
    builtin engine
-   icat kitten: Add a new flag
    `kitty +kitten icat --fit`{.interpreted-text role="option"} to
    control how images are scaled to fit the screen
    (`9201`{.interpreted-text role="iss"})
-   icat kitten: The `kitty +kitten icat --scale-up`{.interpreted-text
    role="option"} flag now takes effect when not using
    `kitty +kitten icat --place`{.interpreted-text role="option"} as
    well
-   Add a mappable action `copy_last_command_output`{.interpreted-text
    role="ac"} to copy the output of the last command to the clipboard
    (`9185`{.interpreted-text role="pull"})
-   ssh kitten: Fix a bug where automatic login was not working
    (`9187`{.interpreted-text role="iss"})
-   Graphics: Fix overwrite composition mode for animation frames not
    being honored
-   Automatic color scheme switching: Fix title bar and scroll bar
    colors not being updated (`9167`{.interpreted-text role="iss"})
-   macOS: Fix cycle through OS windows only swapping between the two
    most recent OS Windows. Also add a cycle through OS Windows
    backwards action. (`9215`{.interpreted-text role="iss"})
-   `goto_session`{.interpreted-text role="ac"}: allow specifying a
    directory to select a session file from the directory
    (`9219`{.interpreted-text role="pull"})
-   Have reloading config also reload the custom tab bar python modules
    (`9221`{.interpreted-text role="disc"})
-   kitten @ ls: Also output the neighbors for every window
    (`9225`{.interpreted-text role="disc"})
-   Have the `kitty --start-as`{.interpreted-text role="option"} flag be
    respected when used with `kitty --single-instance`{.interpreted-text
    role="option"} (`9228`{.interpreted-text role="iss"})
-   When expanding environment variables in
    `listen_on`{.interpreted-text role="opt"} allow the
    `env`{.interpreted-text role="opt"} directive to take effect
-   macOS: Fix closing an OS Window when another OS Window is minimized
    causing the minimized window to be un-minimized
    (`8913`{.interpreted-text role="iss"})
-   Do not rewrap the text in the alternate screen buffer. Avoids
    flicker during live resize with no
    `resize_debounce_time`{.interpreted-text role="opt"}
    (`9142`{.interpreted-text role="disc"})
-   Add a default mapping `search_scrollback`{.interpreted-text
    role="ac"} to open the scrollback in a pager in search mode. If any
    text is currently selected it is automatically searched for.
-   Wayland: Fix spurious key repeat events when some user defined
    callback takes a long time to execute (`9224`{.interpreted-text
    role="iss"})
-   When moving windows to a new tab/OS Window fix overlay windows not
    being grouped with their parent windows (`9266`{.interpreted-text
    role="iss"})
-   Linux: Fix a bug causing colors to occasionally all go black when
    using mesa \>= 25.3.0 with nouveau GPU driver
    (`9235`{.interpreted-text role="iss"})
-   Fix `tab_bar_min_tabs`{.interpreted-text role="opt"} not respecting
    `tab_bar_filter`{.interpreted-text role="opt"}
    (`9278`{.interpreted-text role="iss"})
-   macOS: Workaround for regression in Tahoe 26.2 that breaks
    `kitty --detach`{.interpreted-text role="option"}
    (`9288`{.interpreted-text role="iss"})
-   macOS: Workaround for yet another Tahoe regression causing macOS to
    start an AutoFill helper process and not shut it down on application
    exit (`9299`{.interpreted-text role="iss"})

### 0.44.0 \[2025-11-03\]

-   Allow kitty to read a specified set of environment variables from
    your login shell at startup using the `env`{.interpreted-text
    role="opt"} directive in kitty.conf (`9042`{.interpreted-text
    role="iss"})
-   A new option
    `draw_window_borders_for_single_window`{.interpreted-text
    role="opt"} to force kitty to always draw a window border even when
    only a single window is present (`9112`{.interpreted-text
    role="pull"})
-   Fix a regression in 0.43.0 that caused a black flicker when closing
    a tab in the presence of a background image
    (`9060`{.interpreted-text role="iss"})
-   Further improvements to rounded corner rendering, especially at low
    DPI (`9091`{.interpreted-text role="pull"})
-   Splits layout: Fix a bug that could cause a corrupted layout in some
    circumstances (`9059`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that broke
    `goto_session -1`
-   Fix rendering broken on ancient GPU drivers that do not support
    rendering to 16 bit textures (`9068`{.interpreted-text role="iss"})
-   Fix tab bar sometimes showing incorrect tabs when it is filtered to
    show only tabs from the current session (`9079`{.interpreted-text
    role="iss"})
-   macOS: Workaround for bug in macOS Tahoe that caused OS Windows that
    are fullscreen to crash kitty when returning from sleep on some
    machines (`8983`{.interpreted-text role="iss"})
-   Graphics: Fix animated images sometimes not auto playing or auto
    playing at the wrong start frame if the same image id is used for a
    subsequent image
-   Fix a regression in 0.43.0 that caused high CPU usage when
    `disable_ligatures`{.interpreted-text role="opt"} was set to
    `cursor` and the tab bar was visible (`9071`{.interpreted-text
    role="iss"})
-   macOS: Handle dropping of file promises into kitty in addition to
    file paths (`9084`{.interpreted-text role="pull"})
-   macOS: Fix indeterminate progress bar displayed on dock icon
    increasing speed when indeterminate progress is set without being
    cleared first (`9114`{.interpreted-text role="iss"})
-   macOS: Performance and power usage improvements of about 5-10%
    (`9131`{.interpreted-text role="pull"})
-   macOS: Add an item to the global menu to Cycle through OS windows
-   macOS: Quick access terminal: Fix a crash when changing font size
    (`9178`{.interpreted-text role="iss"})
-   Wayland: Fix `center-sized` panels not working on smithay based
    compositors (`9117`{.interpreted-text role="pull"})
-   Wayland: Fix scrolling using some mouse wheels that produce
    \"VALUE120\" based scroll events too fast on some compositors
    (`9128`{.interpreted-text role="pull"})
-   Add support for Unicode 17
-   Fix a regression in 0.43.0 that caused
    `tab_bar_margin_width`{.interpreted-text role="opt"} to be doubled
    on the right edge of the tab bar (`9154`{.interpreted-text
    role="iss"})
-   Session files: Add a new `focus_tab` command to specify which tab
    should be active when a session is loaded. Accepts either a plain
    number (0-based index) or a match expression for flexible tab
    selection, allowing sessions to preserve the active tab state
    (`sessions`{.interpreted-text role="doc"})
-   `save_as_session`{.interpreted-text role="ac"}: Add `--base-dir`
    option to specify a base directory for saving session files with
    relative paths, useful when the current working directory is not the
    desired location (`sessions`{.interpreted-text role="doc"})
-   Add `state:focused_os_window` match query to select all windows in
    the currently focused OS window (`search_syntax`{.interpreted-text
    role="ref"})
-   Session saving now preserves visual tab order and active tab rather
    than tab activation history as this is generally more important. In
    the future may have it save tab history as well
    (`9163`{.interpreted-text role="pull"})
-   The `reset_terminal`{.interpreted-text role="sc"} shortcut to reset
    the terminal now also resets termios state

### 0.43.1 \[2025-10-01\]

-   ssh kitten: Allow specifying a password and/or TOTP authentication
    secret to automate interactive logins in scenarios where public key
    authentication is not supported (`9020`{.interpreted-text
    role="pull"})
-   macOS: Fix a bug where the color of a transparent titlebar was off
    when running in the release build versus the build from source. Also
    fix using a transparent titlebar causing the background opacity to
    be doubled.
-   Fix a regression in the previous release that caused the incorrect
    tab to be active when loading a session (`9025`{.interpreted-text
    role="iss"})
-   macOS: Workaround for bug in macOS Tahoe that caused closed OS
    Windows to remain as invisible rectangles that intercept mouse
    events (`8952`{.interpreted-text role="iss"})
-   macOS: Fix a regression in the previous release that broke automatic
    switching of dark/light mode when setting
    `macos_titlebar_color`{.interpreted-text role="opt"} to an arbitrary
    color (`9034`{.interpreted-text role="iss"})
-   `goto_session`{.interpreted-text role="ac"}: Add
    `--sort-by=alphabetical` to have the interactive session picker list
    the sessions in a fixed order rather than by most recent
    (`9033`{.interpreted-text role="disc"})
-   Fix a regression in the previous release that caused the cursor
    trail to not be hidden properly (`9039`{.interpreted-text
    role="iss"})
-   Session files: Fix a regression in the previous release that broke
    matching on windows in the current tab (`9037`{.interpreted-text
    role="iss"})
-   Fix a regression in the previous release that broke clearing screen
    lines when in margin mode (`9049`{.interpreted-text role="iss"})

### 0.43.0 \[2025-09-28\]

-   New support for creating and switching to
    `sessions`{.interpreted-text role="doc"} easily, allowing users to
    define and use sessions/projects efficiently
    (`8911`{.interpreted-text role="iss"})
-   Add a configurable `scrollbar`{.interpreted-text role="opt"} for the
    kitty scrollback (`8945`{.interpreted-text role="pull"})
-   A new protocol for
    `multiple cursors <multiple-cursors-protocol>`{.interpreted-text
    role="doc"} in the terminal (`8927`{.interpreted-text role="iss"})
-   macOS: Allow the window title bar to be semi-transparent when
    `background_opacity`{.interpreted-text role="opt"} is less than one
    and `macos_titlebar_color`{.interpreted-text role="opt"} is set to
    `background` (`8906`{.interpreted-text role="pull"})
-   A new `cursor_trail_color`{.interpreted-text role="opt"} setting to
    independently control the color of cursor trails
    (`8830`{.interpreted-text role="pull"})
-   macOS: Add the default `Cmd+L`{.interpreted-text role="kbd"} mapping
    from Terminal.app to erase the last command and its output
    (`6040`{.interpreted-text role="disc"})
-   Fix `background_opacity`{.interpreted-text role="opt"} being
    non-linear especially with light color themes. Note that this might
    require you to adjust the value of this setting to get back your
    current look. (`8869`{.interpreted-text role="iss"})
-   **backward incompatibility**: `background_opacity`{.interpreted-text
    role="opt"} no longer applies to
    `background_image`{.interpreted-text role="opt"} instead add an
    alpha channel to the image itself
-   Add support for blinking text. Text marked as blinking now blinks in
    exact rhythm with the cursor. The blinking animation and max
    duration are controlled by `cursor_blink_interval`{.interpreted-text
    role="opt"} and `cursor_stop_blinking_after`{.interpreted-text
    role="opt"}. (`8551`{.interpreted-text role="pull"})
-   Allow using a custom python function to draw tab titles in the tab
    bar, see `tab_title_template`{.interpreted-text role="opt"}
-   Wayland: Fix incorrect window size calculation when transitioning
    from full screen to non-full screen with client side decorations
    (`8826`{.interpreted-text role="iss"})
-   macOS: Fix hiding quick access terminal window not restoring focus
    to previously active application (`8840`{.interpreted-text
    role="disc"})
-   macOS: Fix showing the quick access terminal on a space other than
    the space it was last active on, after full screening some
    application causes the quick access terminal to appear on the old
    space (`8740`{.interpreted-text role="iss"})
-   macOS: When toggling open the quick access terminal move it to the
    currently active monitor (the monitor with the mouse pointer on it)
    (`9003`{.interpreted-text role="iss"})
-   macOS: Fix closing an OS Window when another OS Window is minimized
    causing the minimized window to be un-minimized
    (`8913`{.interpreted-text role="iss"})
-   Allow using backspace to move the cursor onto the previous line in
    cooked mode. This is indicated by the [bw]{.title-ref} property in
    kitty\'s terminfo (`8841`{.interpreted-text role="iss"})
-   Watchers: A new event for global watchers corresponding to the tab
    bar being changed (`8842`{.interpreted-text role="disc"})
-   Fix a regression in 0.40.0 that broke handling of the VS16 variation
    selector when it caused a character to flow to the next line
    (`8848`{.interpreted-text role="iss"})
-   Fix rendering of underlines when using larger text sizes with the
    space and en-space characters (`8950`{.interpreted-text role="iss"})
-   Fix updating panel configuration on visibility toggle and via remote
    control not working (`8984`{.interpreted-text role="iss"})
-   Improve rendering of rounded rectangles (`9000`{.interpreted-text
    role="pull"})
-   Wayland: Update bundled copy of libwayland to 1.24 from 1.23.1
    because the just released mesa 25.2.0 breaks with libwayland \< 1.24
    (`8884`{.interpreted-text role="iss"})
-   macOS: Pass the `Cmd+C`{.interpreted-text role="kbd"} shortcut to
    the application running in the terminal when no text is selected
    (`8946`{.interpreted-text role="pull"})
-   macOS: Workaround for bug in macOS Tahoe that caused OS Windows that
    are fullscreen on a monitor that is disconnected while macOS is
    asleep to crash kitty (`8983`{.interpreted-text role="iss"})

### 0.42.2 \[2025-07-16\]

-   A new `protocol extension <mouse_leave_window>`{.interpreted-text
    role="ref"} to notify terminal programs that have turned on SGR
    Pixel mouse reporting when the mouse leaves the window
    (`8808`{.interpreted-text role="disc"})
-   clipboard kitten: Can now optionally take a password to avoid
    repeated permission prompts when accessing the clipboard. Based on a
    `protocol extension <clipboard_repeated_permission>`{.interpreted-text
    role="ref"}. (`8789`{.interpreted-text role="iss"})
-   A new `launch --hold-after-ssh`{.interpreted-text role="option"} to
    not close a launched window that connects directly to a remote host
    because of `launch --cwd`{.interpreted-text role="option"}`=current`
    when the connection ends (`8807`{.interpreted-text role="pull"})
-   Fix `remember_window_position`{.interpreted-text role="opt"} not
    working because of a stupid typo (`8646`{.interpreted-text
    role="iss"})
-   A new `kitty --grab-keyboard`{.interpreted-text role="option"} that
    can be used to grab the keyboard so that global shortcuts are sent
    to kitty instead
-   Remote control: Fix holding a remote control socket open causing the
    kitty I/O thread to go into a loop and not respond on other remote
    control sockets (`8670`{.interpreted-text role="disc"})
-   hints kitten: Preserve line breaks when the hint is over a line
    break (`8674`{.interpreted-text role="iss"})
-   Fix a segfault when using the
    `copy_ansi_to_clipboard`{.interpreted-text role="ac"} action
    (`8682`{.interpreted-text role="iss"})
-   Fix a crash when using linear easing curves for animations
    (`8692`{.interpreted-text role="iss"})
-   Graphics protocol: Add a note clarifying image update behavior on
    re-transmission (`8701`{.interpreted-text role="iss"})
-   Wayland GNOME: Fix incorrect OS Window tracking because GNOME has
    started activating windows on non-current workspaces
    (`8716`{.interpreted-text role="iss"})
-   Fix a regression in 0.40.0 that broke rendering of VS15 variation
    selectors in some circumstances (`8731`{.interpreted-text
    role="iss"}, `8794`{.interpreted-text role="iss"})
-   Fix a regression in 0.40.0 that broke serialization of tab
    characters as ANSI text (`8741`{.interpreted-text role="iss"})
-   Fix a regression in 0.40.0 that broke erasing of characters in a
    line in the presence of wide characters (`8758`{.interpreted-text
    role="iss"})
-   Fix a regression in 0.40.0 that broke hyperlinking of wide
    characters (`8796`{.interpreted-text role="iss"})
-   Fix a regression that broke using `esc`{.interpreted-text
    role="kbd"} to exit visual select window mode
    (`8767`{.interpreted-text role="iss"})
-   kitten run-shell: Fix SIGINT blocked when execing the shell
    (`8754`{.interpreted-text role="iss"})

### 0.42.1 \[2025-05-17\]

-   Fix ambiguous width and private use characters not being rendered
    when used with variable width text-sizing protocol escape codes
-   Quick access terminal: Restore focus to previously active window
    when hiding the quick access terminal window on macOS
    (`8627`{.interpreted-text role="iss"})
-   Wayland: Fix an abort if the terminal program sets a window title
    longer than 2KB that contains CSI escape sequences and multibyte
    UTF-8 (`8619`{.interpreted-text role="iss"})
-   Quick access terminal: Allow toggling the window to full screen
    using the standard kitty `toggle_fullscreen`{.interpreted-text
    role="sc"} shortcut (`8626`{.interpreted-text role="iss"})
-   Quick access terminal: Allow configuring the monitor to display the
    panel on in Wayland/X11 (`8630`{.interpreted-text role="iss"})
-   A new setting `remember_window_position`{.interpreted-text
    role="opt"} to optionally use the position of the last closed kitty
    OS Window as the position of the first kitty OS Window when running
    a new kitty instance (`8601`{.interpreted-text role="pull"})
-   Panel kitten: A new `center-sized` value for
    `--edge <kitty +kitten panel --edge>`{.interpreted-text
    role="option"} to allow easily creating sized and centered panels
-   Wayland: The [kitty \--name]{.title-ref} flag now sets the XDG
    *window tag* on compositors that support the
    [xdg-toplevel-tag](https://wayland.app/protocols/xdg-toplevel-tag-v1)
    protocol.

### 0.42.0 \[2025-05-11\]

-   A new kitten:
    `quick-access-terminal </kittens/quick-access-terminal>`{.interpreted-text
    role="doc"} to `quake`{.interpreted-text role="ref"}
-   The `panel kitten </kittens/panel>`{.interpreted-text role="doc"}
    works on macOS and X11 as well as Wayland (`2590`{.interpreted-text
    role="iss"})
-   **Behavior change**: Now kitty does full grapheme segmentation
    following the Unicode 16 spec when splitting text into cells
    (`8533`{.interpreted-text role="iss"})
-   **Behavior change**: The
    `automatic color switching functionality <auto_color_scheme>`{.interpreted-text
    role="ref"} now also controls background image settings
    (`8603`{.interpreted-text role="iss"})
-   panel kitten: Allow using
    `kitty +kitten panel --single-instance`{.interpreted-text
    role="option"} to create multiple panels in one process
    (`8549`{.interpreted-text role="iss"})
-   launch: Allow creating desktop panels such as those created by the
    `panel kitten </kittens/panel>`{.interpreted-text role="doc"}
    (`8549`{.interpreted-text role="iss"})
-   Remote control: Allow modifying desktop panels and showing/hiding OS
    Windows using the `kitten @ resize-os-window` command
    (`8550`{.interpreted-text role="iss"})
-   Remote control launch: Allow waiting for a program launched in a new
    window to exit and get the exit code via the [kitty +launch
    \--wait-for-child-to-exit]{.title-ref} command line flag
    (`8573`{.interpreted-text role="disc"})
-   Allow starting kitty with the OS window hidden via
    `kitty --start-as=hidden <kitty --start-as>`{.interpreted-text
    role="option"}, useful for single instance mode
    (`3466`{.interpreted-text role="iss"})
-   Allow configuring the mouse unhide behavior when using
    `mouse_hide_wait`{.interpreted-text role="opt"}
    (`8508`{.interpreted-text role="pull"})
-   diff kitten: Add half page and full page scroll vim-like bindings
    (`8514`{.interpreted-text role="pull"})
-   diff kitten: Allow diffing named pipes (`8597`{.interpreted-text
    role="iss"})
-   Fix a regression that caused automatic color themes to not be
    re-applied after config file reload (`8530`{.interpreted-text
    role="iss"})
-   Wayland: When the compositor supports the
    [xdg-system-bell](https://wayland.app/protocols/xdg-system-bell-v1)
    protocol use it to play the default bell sound
-   panel kitten: Allow specifying panel size in pixels in addition to
    cells
-   Fix a regression in 0.36.0 that caused using = with single letter
    command line flags to no longer work correctly
    (`8556`{.interpreted-text role="iss"})
-   Single instance: Preserve environment variables from invoking
    environment in newly created window (`8567`{.interpreted-text
    role="disc"})
-   Single instance: Reset OS Window class and name in new single
    instance OS windows (`8567`{.interpreted-text role="disc"})
-   macOS: Fix text color in visual window select ignoring the color
    theme (`8579`{.interpreted-text role="iss"})
-   Launch action: Allow using an env var that resolves to a full
    command-line as the program to launch (`8613`{.interpreted-text
    role="pull"})
-   `change_font_size`{.interpreted-text role="ac"} allow
    multiplying/dividing the current font size in addition to
    incrementing it (`8616`{.interpreted-text role="iss"})
-   Box drawing: Improve appearance of rounder corners, giving them a
    uniform line width (`8299`{.interpreted-text role="iss"})

### 0.41.1 \[2025-04-03\]

-   Fix a regression in the previous release that caused rendering of
    emoji using the VS16 variation selector to fail with some fonts
    (`8495`{.interpreted-text role="iss"})
-   Fix a regression in 0.40.0 that caused tab bar margins to not be
    properly blanked when the tab bar is at the bottom
    (`8494`{.interpreted-text role="iss"})
-   Wayland: panel kitten: Fix incorrect initial font size on
    compositors such as Hyprland that set scale late in the window
    creation process (`8496`{.interpreted-text role="iss"})
-   Fix a regression in 0.40.1 that caused hyperlink underline on hover
    to remain on screen when the screen is scrolled

### 0.41.0 \[2025-03-29\]

-   A new mode of operation for
    `text_fg_override_threshold`{.interpreted-text role="opt"} to
    override foreground colors so as to maintain a minimum contrast
    between foreground and background text colors. Works in a perceptual
    color space for best color accuracy (`8420`{.interpreted-text
    role="pull"})
-   A 15% improvement in throughput when processing text thanks to using
    a multi-stage table for Unicode property lookups
-   `kitty +open <launch_actions>`{.interpreted-text role="ref"}: Ask
    for confirmation by default when running executables to work around
    some badly designed programs that try to open links in documents
    that point to executable files. Can be overridden by specifying your
    own `launch-actions.conf`{.interpreted-text role="file"}.
-   Fix a regression in version 0.40.0 causing a crash when the
    underline thickness of the font is zero (`8443`{.interpreted-text
    role="iss"})
-   Fix a regression in version 0.40.0 causing a hang on resizing with a
    wide character at the right edge of a line that needs to be moved
    onto the next line (`8464`{.interpreted-text role="iss"})
-   Fix a regression in 0.40.1 that caused copying to clipboard via OSC
    52 from applications that don\'t specify a destination in the escape
    code not working (`8459`{.interpreted-text role="iss"})
-   Wayland: Fix a regression in the previous release that caused
    crashes on compositors that don\'t support the xdg-toplevel-icon
    protocol and the user has set a custom kitty icon
    (`8471`{.interpreted-text role="iss"})

### 0.40.1 \[2025-03-18\]

-   Do not count background processes by default for
    `confirm_os_window_close`{.interpreted-text role="opt"}
    (`8358`{.interpreted-text role="iss"})
-   A new option `clear_selection_on_clipboard_loss`{.interpreted-text
    role="opt"} to clear selections when they no longer reflect the
    contents of the clipboard
-   Fix a regression in the previous release that caused empty lines to
    be skipped when copying text from a selection
    (`8435`{.interpreted-text role="iss"})
-   Fix flickering of hyperlink underline when client program
    continuously redraws on mouse movement (`8414`{.interpreted-text
    role="iss"})
-   Wayland: Allow overriding the kitty OS Window icon on compositors
    that implement the xdg-toplevel-icon protocol
-   macOS: When the program running in kitty reports progress
    information for a task, show a progress bar on the kitty dock icon
-   macOS: Fix a regression causing a crash when using
    `focus_follows_mouse`{.interpreted-text role="opt"}
    (`8437`{.interpreted-text role="iss"})
-   OSC 52: Fix specifying both clipboard and primary in OSC 52 requests
    not supported

### 0.40.0 \[2025-03-08\]

-   `Allow terminal programs to use text in different font sizes <text-sizing-protocol>`{.interpreted-text
    role="doc"} (`8226`{.interpreted-text role="iss"})
-   When rendering underlines add gaps around text descenders (parts of
    the text that overlap with the underline). Controlled by the new
    option `underline_exclusion`{.interpreted-text role="opt"}
    (`8226`{.interpreted-text role="iss"})
-   Finally fix the issue of text-width mismatches that has been
    plaguing the terminal ecosystem for decades by allowing terminal
    programs to specify how many cells to render a piece of text in
    (`8226`{.interpreted-text role="iss"})
-   **Behavior change**: The `notify_on_cmd_finish`{.interpreted-text
    role="opt"} option now uses OS Window visibility instead of focus
    state when set to `invisible` on platforms that support querying OS
    window visibility (`8320`{.interpreted-text role="iss"})
-   launch: Add options `launch --source-window`{.interpreted-text
    role="option"} and `launch --next-to`{.interpreted-text
    role="option"} to allow specifying which window is used as the data
    source and destination location independently of the currently
    active window (`8295`{.interpreted-text role="iss"})
-   Linux: Add support for
    [COLRv1](https://nabla.typearture.com/whatisCOLRV1.html) fonts.
    These are typically emoji fonts that use vector images for emoji
-   Add support for the octant box-drawing characters
-   Speed up rendering of box drawing characters by moving the
    implementation to native code
-   When confirming if a window should be closed consider it active if
    it has running background processes (`8358`{.interpreted-text
    role="iss"})
-   Remote control: \`kitten @ scroll-window\`: Allow scrolling to
    previous/next prompt
-   macOS: Fix fallback font rendering for bold/italic text not working
    for some symbols that are present in the Menlo regular face but not
    the bold/italic faces (`8282`{.interpreted-text role="iss"})
-   XTGETTCAP: Fix response invalid for empty string capabilities
    (`8304`{.interpreted-text role="pull"})
-   ssh kitten: Fix incorrect copying of data files when using the
    python interpreter and also fix incorrect hard link detection
    (`8308`{.interpreted-text role="disc"})
-   Fix a regression in the previous release that broke setting of
    nullable colors
-   Fix a regression in 0.39.0 that caused a crash on invalid Unicode
    with a large number of combining characters in a single cell
    (`8318`{.interpreted-text role="iss"})
-   Fix `--hold` always restoring cursor to block shape instead of
    respecting the value of `cursor_shape`{.interpreted-text role="opt"}
    (`8344`{.interpreted-text role="disc"})
-   When dragging in rectangle select mode use a crosshair mouse cursor
    configurable via `pointer_shape_when_dragging`{.interpreted-text
    role="opt"}
-   macOS: notify kitten: Fix waiting for result from desktop
    notification not working (`8379`{.interpreted-text role="disc"})
-   Wayland: Fix mouse pointer position update not being sent when focus
    regained (:iss\`8397\`, `8398`{.interpreted-text role="iss"})
-   Fix cursor blink animation when
    `background_opacity`{.interpreted-text role="opt"} is less than one
    (`8401`{.interpreted-text role="iss"})
-   Wayland: panel kitten: Add a `center` mode for creating panels to
    ease creation of centered popups in Wayland
    (`8411`{.interpreted-text role="pull"})

### 0.39.1 \[2025-02-01\]

-   Splits layout: Allow setting the bias of the current split using
    `layout_action bias` (`8222`{.interpreted-text role="iss"})
-   hints kitten: Workaround for some broken light color themes that
    make the hints text color too low contrast to read
    (`7330`{.interpreted-text role="iss"})
-   Wayland niri: Fix 250ms delay on startup when using scale 1
    (`8236`{.interpreted-text role="iss"})
-   `Watchers <watchers>`{.interpreted-text role="ref"}: Add a new event
    `on_color_scheme_preference_change` (`8246`{.interpreted-text
    role="iss"})

### 0.39.0 \[2025-01-16\]

-   `diff kitten <kittens/diff>`{.interpreted-text role="doc"}:
    Automatically use dark/light color scheme based on the color scheme
    of the parent terminal. Can be controlled via the new
    `kitten-diff.color_scheme`{.interpreted-text role="opt"} option.
    Note that this is a **default behavior change**
    (`8170`{.interpreted-text role="iss"})
-   Allow dynamically generating configuration by running an arbitrary
    program using the new `geninclude` directive in
    `kitty.conf`{.interpreted-text role="file"}
-   When a program running in kitty reports progress of a task display
    it as a percentage in the tab title. Controlled by the
    `tab_title_template`{.interpreted-text role="opt"} option
-   When mapping a custom kitten allow using shell escaping for the
    kitten path (`8178`{.interpreted-text role="iss"})
-   Fix border colors not being changed by auto light/dark themes at
    startup (`8180`{.interpreted-text role="iss"})
-   ssh kitten: Fix kitten not being on PATH when SSHing into Debian
    systems (`7160`{.interpreted-text role="iss"})
-   diff kitten: Abort when run inside a terminal that does not support
    the kitty keyboard protocol (`8185`{.interpreted-text role="iss"})
-   `query kitten <kittens/query_terminal>`{.interpreted-text
    role="doc"}: Add support for reporting name of the OS the terminal
    emulator is running on (`8201`{.interpreted-text role="iss"})
-   macOS: Allow using the Passwords app to autofill passwords via the
    Edit-\>Autofill menu mimicking other macOS applications
    (`8195`{.interpreted-text role="pull"})
-   macOS: Add menu items to the Edit menu to clear the screen and
    scrollback
-   Fix the
    `clear_terminal scrollback <clear_terminal>`{.interpreted-text
    role="ac"} action also clearing screen, not just the scrollback
-   When reloading configuration fix auto color themes not being
    re-applied (`8203`{.interpreted-text role="iss"})

### 0.38.1 \[2024-12-26\]

-   macOS: Fix a regression in the previous release that broke rendering
    of Emoji using the VS16 variation selector (`8130`{.interpreted-text
    role="iss"})
-   When automatically changing colors based on OS color preference,
    first reset all colors to default before applying the new theme so
    that even colors not specified in the theme are correct
    (`8124`{.interpreted-text role="iss"})
-   Graphics: Fix deleted but not freed images without any placements
    being incorrectly freed on a subsequent delete command
    (`8129`{.interpreted-text role="disc"})
-   Graphics: Fix deletion of images by id not working for images with
    no placements (`8129`{.interpreted-text role="disc"})
-   Add support for [escape code
    protocol](https://github.com/contour-terminal/contour/blob/master/docs/vt-extensions/color-palette-update-notifications.md)
    for notifying applications on dark/light color scheme change
-   Cursor trails: Fix pure vertical movement sometimes not triggering a
    trail and holding down a key in nvim causing the trail to be glitchy
    (`8152`{.interpreted-text role="pull"}, `8153`{.interpreted-text
    role="pull"})
-   macOS: Fix mouse cursor shape not always being reset to text cursor
    when mouse re-enters kitty (`8155`{.interpreted-text role="iss"})
-   clone-in-kitty: Fix `KITTY_WINDOW_ID`{.interpreted-text
    role="envvar"} being cloned and thus having incorrect value
    (`8161`{.interpreted-text role="iss"})

### 0.38.0 \[2024-12-15\]

-   Allow
    `specifying individual color themes <auto_color_scheme>`{.interpreted-text
    role="ref"} to use so that kitty changes colors automatically
    following the OS dark/light mode
-   `notify_on_cmd_finish`{.interpreted-text role="opt"}: Automatically
    remove notifications when the window gains focus or the next
    notification is shown. Clearing behavior can be configured
    (`8100`{.interpreted-text role="pull"})
-   Discard OSC 9 notifications that start with `4;` because some
    misguided software is using it for \"progress reporting\"
    (`8011`{.interpreted-text role="iss"})
-   Wayland GNOME: Workaround bug in mutter causing double tap on
    titlebar to not always work (`8054`{.interpreted-text role="iss"})
-   clipboard kitten: Fix a bug causing kitten to hang in filter mode
    when input data size is not divisible by 3 and larger than 8KB
    (`8059`{.interpreted-text role="iss"})
-   Wayland: Fix an abort when a client program tries to set an invalid
    title containing interleaved escape codes and UTF-8 multi-byte
    characters (`8067`{.interpreted-text role="iss"})
-   Graphics protocol: Fix delete by number not deleting newest image
    with the specified number (`8071`{.interpreted-text role="iss"})
-   Fix dashed and dotted underlines not being drawn at the same y
    position as straight underlines at all font sizes
    (`8074`{.interpreted-text role="iss"})
-   panel kitten: Allow creating floating and on-top panels with
    arbitrary placement and size on Wayland (`8068`{.interpreted-text
    role="pull"})
-   `remote_control_password`{.interpreted-text role="opt"}: Fix using a
    password without any actions not working (`8082`{.interpreted-text
    role="iss"})
-   Fix enlarging window when a long line is wrapped between the first
    line of the scrollback buffer and the screen inserting a spurious
    newline (`7033`{.interpreted-text role="iss"})
-   When re-attaching a detached tab preserve internal layout state such
    as biases and orientations (`8106`{.interpreted-text role="iss"})
-   hints/unicode[input]{#input} kittens: Do not lose keypresses that
    are sent very rapidly via an automation tool immediately after the
    kitten is launched (`7089`{.interpreted-text role="iss"})

### 0.37.0 \[2024-10-30\]

-   A new optional
    `text cursor movement animation <cursor_trail>`{.interpreted-text
    role="opt"} that shows a \"trail\" following the movement of the
    cursor making it easy to follow large cursor jumps
    (`7970`{.interpreted-text role="pull"})
-   Custom kittens: Add `a framework <kitten_main_rc>`{.interpreted-text
    role="ref"} for easily and securely using remote control from within
    a kitten\'s `main()` function
-   kitten icat: Fix the
    `kitty +kitten icat --no-trailing-newline`{.interpreted-text
    role="option"} not working when using unicode placeholders
    (`7948`{.interpreted-text role="iss"})
-   `tab_title_template`{.interpreted-text role="opt"} allow using the
    256 terminal colors for formatting (`7976`{.interpreted-text
    role="disc"})
-   Fix resizing window when alternate screen is active does not
    preserve trailing blank output line in the main screen
    (`7978`{.interpreted-text role="iss"})
-   Wayland: Fix `background_opacity`{.interpreted-text role="opt"} less
    than one causing flicker on startup when the Wayland compositor
    supports single pixel buffers (`7987`{.interpreted-text role="iss"})
-   Fix background image flashing when closing a tab
    (`7999`{.interpreted-text role="iss"})
-   When running a kitten that modifies the kitty config file if no
    config file exists create a commented out default config file and
    then modify it (`7991`{.interpreted-text role="iss"})

### 0.36.4 \[2024-09-27\]

-   Fix a regression in the previous release that caused window padding
    to be rendered opaque even when
    `background_opacity`{.interpreted-text role="opt"} is less than 1
    (`7895`{.interpreted-text role="iss"})
-   Wayland GNOME: Fix a crash when using multiple monitors with
    different scales and starting on or moving to the monitor with lower
    scale (`7894`{.interpreted-text role="iss"})
-   macOS: Fix a regression in the previous release that caused junk to
    be rendered in font previews in the choose fonts kitten and crash on
    Intel macs (`7892`{.interpreted-text role="iss"})

### 0.36.3 \[2024-09-25\]

-   The option `second_transparent_bg` has been removed and replaced by
    `transparent_background_colors`{.interpreted-text role="opt"} which
    allows setting up to seven additional colors that will be
    transparent, with individual opacities per color
    (`7646`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that broke use of the `cd`
    command in session files (`7829`{.interpreted-text role="iss"})
-   macOS: Fix shortcuts that become entries in the global menubar being
    reported as removed shortcuts in the debug output
-   macOS: Fix `macos_option_as_alt`{.interpreted-text role="opt"} not
    working when `caps lock`{.interpreted-text role="kbd"} is engaged
    (`7836`{.interpreted-text role="iss"})
-   Fix a regression when tinting of background images was introduced
    that caused window borders to have
    `background_opacity`{.interpreted-text role="opt"} applied to them
    (`7850`{.interpreted-text role="iss"})
-   Fix a regression that broke writing to the clipboard using the OSC
    5522 protocol (`7858`{.interpreted-text role="iss"})
-   macOS: Fix a regression in the previous release that caused kitty to
    fail to run after an unclean shutdown/crash when using
    \--single-instance (`7846`{.interpreted-text role="iss"})
-   kitten @ ls: Fix the `--self` flag not working
    (`7864`{.interpreted-text role="iss"})
-   Remote control: Fix `--match state:self` not working
    (`7886`{.interpreted-text role="disc"})
-   Splits layout: Allow setting the `split_axis` option to `auto` so
    that all new windows have their split axis chosen automatically
    unless explicitly specified in the launch command
    (`7887`{.interpreted-text role="iss"})

### 0.36.2 \[2024-09-06\]

-   Linux: Fix a regression in 0.36.0 that caused font features defined
    via fontconfig to be ignored (`7773`{.interpreted-text role="iss"})
-   `goto_tab`{.interpreted-text role="ac"}: Allow numbers less than
    `-1` to go to the Nth previously active tab
-   Wayland: Fix for upcoming explicit sync changes in Wayland
    compositors breaking kitty (`7767`{.interpreted-text role="iss"})
-   Remote control: When listening on a UNIX domain socket only allow
    connections from processes having the same user id
    (`7777`{.interpreted-text role="pull"})
-   kitten @: Fix a regression connecting to TCP sockets using plain IP
    addresses rather than hostnames (`7794`{.interpreted-text
    role="iss"})
-   diff kitten: Fix a regression that broke diffing against remote
    files (`7797`{.interpreted-text role="iss"})

### 0.36.1 \[2024-08-24\]

-   Allow specifying that the
    `cursor shape for unfocused windows <cursor_shape_unfocused>`{.interpreted-text
    role="opt"} should remain unchanged (`7728`{.interpreted-text
    role="pull"})
-   MacOS Intel: Fix a crash in the choose-fonts kitten when displaying
    previews of variable fonts (`7734`{.interpreted-text role="iss"})
-   Remote control: Fix a regression causing an escape code to leak when
    using @ launch with `--no-response` over the TTY
    (`7752`{.interpreted-text role="iss"})
-   OSC 52: Fix a regression in the previous release that broke handling
    of invalid base64 encoded data in OSC 52 requests
    (`7757`{.interpreted-text role="iss"})
-   macOS: Fix a regression in the previous release that caused
    `kitty --single-instance`{.interpreted-text role="option"} to not
    work when using `macos-launch-services-cmdline`{.interpreted-text
    role="file"}

### 0.36.0 \[2024-08-17\]

-   Support [OpenType Variable
    fonts](https://en.wikipedia.org/wiki/Variable_font)
    (`3711`{.interpreted-text role="iss"})
-   A new `choose-fonts </kittens/choose-fonts>`{.interpreted-text
    role="doc"} kitten that provides a UI with font previews to ease
    selection of fonts. Also has support for font features and variable
    fonts
-   Allow animating the blinking of the cursor. See
    `cursor_blink_interval`{.interpreted-text role="opt"} for how to
    configure it
-   Add NERD fonts builtin so that users don\'t have to install them to
    use NERD symbols in kitty. The builtin font is used only if the
    symbols are not available in some system font
-   launch command: A new `launch --bias`{.interpreted-text
    role="option"} option to adjust the size of newly created windows
    declaratively (`7634`{.interpreted-text role="iss"})
-   A new option `transparent_background_colors`{.interpreted-text
    role="opt"} to make a second background color semi-transparent via
    `background_opacity`{.interpreted-text role="opt"}. Useful for
    things like cursor line highlight in editors
    (`7646`{.interpreted-text role="iss"})
-   A new `notify </kittens/notify>`{.interpreted-text role="doc"}
    kitten to show desktop notifications from the command line with
    support for icons, buttons and more.
-   Desktop notifications protocol: Add support for icons, buttons,
    closing of notifications, expiry of notifications, updating of
    notifications and querying if the terminal emulator supports the
    protocol (`7657`{.interpreted-text role="iss"},
    `7658`{.interpreted-text role="iss"}, `7659`{.interpreted-text
    role="iss"})
-   A new option `filter_notification`{.interpreted-text role="opt"} to
    filter out or perform arbitrary actions on desktop notifications
    based on sophisticated criteria (`7670`{.interpreted-text
    role="iss"})
-   A new protocol to allow terminal applications to change colors in
    the terminal more robustly than with the legacy XTerm protocol
    (`color_control`{.interpreted-text role="ref"})
-   Sessions: A new command `focus_matching_window` to shift focus to a
    specific window, useful when creating complex layouts with splits
    (`7635`{.interpreted-text role="disc"})
-   Speed up loading of large background images by caching the decoded
    image data. Also allow using images in JPEG/WEBP/TIFF/GIF/BMP
    formats in addition to PNG
-   Wayland: Allow fractional scales less than one
    (`7549`{.interpreted-text role="pull"})
-   Wayland: Fix specifying the output name for the panel kitten not
    working (`7573`{.interpreted-text role="iss"})
-   icat kitten: Add an option
    `kitty +kitten icat --no-trailing-newline`{.interpreted-text
    role="option"} to leave the cursor to the right of the image
    (`7574`{.interpreted-text role="iss"})
-   Speed up `kitty --version` and `kitty --single-instance` (for all
    subsequent instances). They are now the fastest of all terminal
    emulators with similar functionality
-   macOS: Fix rendering of the unicode hyphen (U+2010) character when
    using a font that does not include a glyph for it
    (`7525`{.interpreted-text role="iss"})
-   macOS 15: Handle Fn modifier when detecting global shortcuts
    (`7582`{.interpreted-text role="iss"})
-   Dispatch any clicks waiting for `click_interval`{.interpreted-text
    role="opt"} on key events (`7601`{.interpreted-text role="iss"})
-   `kitten run-shell`: Automatically add the directory containing the
    kitten binary to PATH if needed. Controlled via the
    `--inject-self-onto-path` option (\`disc\`:7668\`)
-   Wayland: Fix an issue with mouse selections not being stopped when
    there are multiple OS windows (`7381`{.interpreted-text role="iss"})
-   Splits layout: Fix the `move_to_screen_edge` action breaking when
    only a single window is present (`7621`{.interpreted-text
    role="iss"})
-   Add support for in-band window resize notifications
    (`7642`{.interpreted-text role="iss"})
-   Allow controlling the easing curves used for
    `visual_bell_duration`{.interpreted-text role="opt"}
-   New special rendering for font symbols useful in drawing commit
    graphs (`7681`{.interpreted-text role="pull"})
-   diff kitten: Add bindings to jump to next and previous file
    (`7683`{.interpreted-text role="pull"})
-   Wayland GNOME: Fix the font size in the OS Window title bar changing
    with the size of the text in the window (`7677`{.interpreted-text
    role="disc"})
-   Wayland GNOME: Fix a small rendering artifact when docking a window
    at a screen edge or maximizing it (`7701`{.interpreted-text
    role="iss"})
-   When `shell`{.interpreted-text role="opt"} is set to `.` respect the
    SHELL environment variable in the environment in which kitty is
    launched (`7714`{.interpreted-text role="pull"})
-   macOS: Bump the minimum required macOS version to Catalina released
    five years ago.
-   Fix a regression in `notify_on_cmd_finish`{.interpreted-text
    role="opt"} that caused notifications to appear for every command
    after the first (`7725`{.interpreted-text role="iss"})

### 0.35.2 \[2024-06-22\]

-   A new option, `window_logo_scale`{.interpreted-text role="opt"} to
    specify how window logos are scaled with respect to the size of the
    window containing the logo (`7534`{.interpreted-text role="pull"})
-   A new option, `cursor_shape_unfocused`{.interpreted-text role="opt"}
    to specify the shape of the text cursor in unfocused OS windows
    (`7544`{.interpreted-text role="pull"})
-   Remote control: Fix empty password not working
    (`7538`{.interpreted-text role="iss"})
-   Wayland: Fix regression in 0.34.0 causing flickering on window
    resize on NVIDIA drivers (`7493`{.interpreted-text role="iss"})
-   Wayland labwc: Fix kitty timing out waiting for compositor to quit
    fucking around with scales on labwc (`7540`{.interpreted-text
    role="iss"})
-   Fix `scrollback_indicator_opacity` not actually controlling the
    opacity (`7557`{.interpreted-text role="iss"})
-   URL detection: Fix IPv6 hostnames breaking URL detection
    (`7565`{.interpreted-text role="iss"})

### 0.35.1 \[2024-05-31\]

-   Wayland: Fix a regression in 0.34 that caused the tab bar to not
    render in second and subsequent OS Windows under Hyprland
    (`7413`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that caused horizontal
    scrolling via touchpad in fullscreen applications to be reversed on
    non-Wayland platforms (`7475`{.interpreted-text role="iss"},
    `7481`{.interpreted-text role="iss"})
-   Fix a regression in the previous release causing an error when
    setting background[opacity]{#opacity} to zero
    (`7483`{.interpreted-text role="iss"})
-   Image display: Fix cursor movement and image hit region incorrect
    for image placements that specify only a number of rows or columns
    to display in (`7479`{.interpreted-text role="iss"})

### 0.35.0 \[2024-05-25\]

-   kitten @ run: A new remote control command to run a process on the
    machine kitty is running on and get its output
    (`7429`{.interpreted-text role="iss"})
-   `notify_on_cmd_finish`{.interpreted-text role="opt"}: Show the
    actual command that was finished (`7420`{.interpreted-text
    role="iss"})
-   hints kitten: Allow clicking on matched text to select it in
    addition to typing the hint
-   Shell integration: Make the currently executing cmdline available as
    a window variable in kitty
-   `paste_actions`{.interpreted-text role="opt"}: Fix `replace-newline`
    not working with `confirm` (`7374`{.interpreted-text role="iss"})
-   Graphics: Fix aspect ratio of images not being preserved when only a
    single dimension of the destination rectangle is specified
    (`7380`{.interpreted-text role="iss"})
-   `focus_visible_window`{.interpreted-text role="ac"}: Fix selecting
    with mouse click leaving keyboard in unusable state
    (`7390`{.interpreted-text role="iss"})
-   Wayland: Fix infinite loop causing bad performance when using IME
    via fcitx5 due to a change in fcitx5 (`7396`{.interpreted-text
    role="iss"})
-   Desktop notifications protocol: Add support for specifying urgency
-   Improve rendering of Unicode shade character to avoid Moire patterns
    (`7401`{.interpreted-text role="pull"})
-   kitten @ send-key: Fix some keys being sent in kitty keyboard
    protocol encoding when not using socket for remote control
-   Dont clear selections on erase in screen commands unless the erased
    region intersects a selection (`7408`{.interpreted-text role="iss"})
-   Wayland: save energy by not rendering \"suspended\" windows on
    compositors that support that
-   Allow more types of alignment for
    `placement_strategy`{.interpreted-text role="opt"}
    (`7419`{.interpreted-text role="pull"})
-   Add some more box-drawing characters from the \"Geometric shapes\"
    Unicode block (`7433`{.interpreted-text role="iss"})
-   Linux: Run all child processes in their own systemd scope to prevent
    the OOM killer from harvesting kitty when a child process misbehaves
    (`7427`{.interpreted-text role="iss"})
-   Mouse reporting: Fix horizontal scroll events inverted
    (`7439`{.interpreted-text role="iss"})
-   Remote control: @ action: Fix some actions being performed on the
    active window instead of the matched window
    (`7438`{.interpreted-text role="iss"})
-   Scrolling with mouse wheel when a selection is active should update
    the selection (`7453`{.interpreted-text role="iss"})
-   Fix kitten @ set-background-opacity limited to min opacity of 0.1
    instead of 0 (`7463`{.interpreted-text role="iss"})
-   launch \--hold: Fix hold not working if kernel signals process group
    with SIGINT (`7466`{.interpreted-text role="iss"})
-   macOS: Fix \--start-as=fullscreen not working when another window is
    already fullscreen (`7448`{.interpreted-text role="iss"})
-   Add option `kitten @ detach-window --stay-in-tab`{.interpreted-text
    role="option"} to keep focus in the currently active tab when moving
    windows (`7468`{.interpreted-text role="iss"})
-   macOS: Fix changing window chrome/colors while in traditional
    fullscreen causing the titlebar to become visible
    (`7469`{.interpreted-text role="iss"})

### 0.34.1 \[2024-04-19\]

-   Wayland KDE: Fix window background blur not adapting when window is
    grown. Also fix turning it on and off not working.
    (`7351`{.interpreted-text role="iss"})
-   Wayland GNOME: Draw the titlebar buttons without using a font
    (`7349`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that caused incorrect font
    selection when using variable fonts on Linux
    (`7361`{.interpreted-text role="iss"})

### 0.34.0 \[2024-04-15\]

-   Wayland: `panel kitten <kittens/panel>`{.interpreted-text
    role="doc"}: Add support for drawing desktop background and bars
    using the panel kitten for all compositors that support the
    [requisite Wayland
    protocol](https://wayland.app/protocols/wlr-layer-shell-unstable-v1)
    which is practically speaking all of them but GNOME
    (`2590`{.interpreted-text role="pull"})
-   Show a small scrollback indicator along the right window edge when
    viewing the scrollback to keep track of scroll position
    (`2502`{.interpreted-text role="iss"})
-   Wayland: Support fractional scales so that there is no wasted
    drawing at larger scale followed by resizing in the compositor
-   Wayland KDE: Support `background_blur`{.interpreted-text role="opt"}
-   Wayland GNOME: The window titlebar now has buttons to
    minimize/maximize/close the window
-   Wayland GNOME: The window titlebar color now follows the system
    light/dark color scheme preference, see
    `wayland_titlebar_color`{.interpreted-text role="opt"}
-   Wayland KDE: Fix mouse cursor hiding not working in Plasma 6
    (`7265`{.interpreted-text role="iss"})
-   Wayland IME: Fix a bug with handling synthetic keypresses generated
    by ZMK keyboard + fcitx (`7283`{.interpreted-text role="pull"})
-   A new option `terminfo_type`{.interpreted-text role="opt"} to allow
    passing the terminfo database embedded into the
    `TERMINFO`{.interpreted-text role="envvar"} env var directly instead
    of via a file
-   Mouse reporting: Fix drag release event outside the window not being
    reported in legacy mouse reporting modes (`7244`{.interpreted-text
    role="iss"})
-   macOS: Fix a regression in the previous release that broke rendering
    of some symbols on some systems (`7249`{.interpreted-text
    role="iss"})
-   Fix handling of tab character when cursor is at end of line and
    wrapping is enabled (`7250`{.interpreted-text role="iss"})
-   Splits layout: Fix `move_window_forward`{.interpreted-text
    role="ac"} not working (`7264`{.interpreted-text role="iss"})
-   macOS: Fix an abort due to an assertion when a program tries to set
    an invalid window title (`7271`{.interpreted-text role="iss"})
-   fish shell integration: Fix clicking at the prompt causing
    autosuggestions to be accepted, needs fish \>= 3.8.0
    (`7168`{.interpreted-text role="iss"})
-   Linux: Fix for a regression in 0.32.0 that caused some CJK fonts to
    not render glyphs (`7263`{.interpreted-text role="iss"})
-   Wayland: Support preferred integer scales
-   Wayland: A new option `wayland_enable_ime`{.interpreted-text
    role="opt"} to turn off Input Method Extensions which add latency
    and create bugs
-   Wayland: Fix `hide_window_decorations`{.interpreted-text role="opt"}
    not working on non GNOME desktops
-   When asking for quit confirmation because of a running program,
    mention the program name (`7331`{.interpreted-text role="iss"})
-   Fix flickering of prompt during window resize
    (`7324`{.interpreted-text role="iss"})

### 0.33.1 \[2024-03-21\]

-   Fix a regression in the previous release that caused requesting data
    from the clipboard via OSC 52 to instead return data from the
    primary selection (`7213`{.interpreted-text role="iss"})
-   Splits layout: Allow resizing until one of the halves in a split is
    minimally sized (`7220`{.interpreted-text role="iss"})
-   macOS: Fix text rendered with fallback fonts not respecting
    bold/italic styling (`7241`{.interpreted-text role="disc"})
-   macOS: When CoreText fails to find a fallback font for a character
    in the first Private Use Unicode Area, preferentially use the NERD
    font, if available, for it (`6043`{.interpreted-text role="iss"})

### 0.33.0 \[2024-03-12\]

-   `Cheetah speed <throughput>`{.interpreted-text role="ref"} with a
    redesigned render loop and a 2x faster escape code parser that uses
    SIMD CPU vector instruction to parse data in parallel
    (`7005`{.interpreted-text role="iss"})
-   A new benchmark kitten (`kitten __benchmark__`) to measure terminal
    throughput performance
-   Graphics protocol: Add a new delete mode for deleting images whose
    ids fall within a range. Useful for bulk deletion
    (`7080`{.interpreted-text role="iss"})
-   Keyboard protocol: Fix the `Enter`{.interpreted-text role="kbd"},
    `Tab`{.interpreted-text role="kbd"} and
    `Backspace`{.interpreted-text role="kbd"} keys generating spurious
    release events even when report all keys as escape codes is not set
    (`7136`{.interpreted-text role="iss"})
-   macOS: The command line args from
    `macos-launch-services-cmdline`{.interpreted-text role="file"} are
    now prefixed to any args from `open --args` rather than overwriting
    them (`7135`{.interpreted-text role="iss"})
-   Allow specifying where the new tab is created for
    `detach_window`{.interpreted-text role="ac"}
    (`7134`{.interpreted-text role="pull"})
-   hints kitten: The option to set the text color for hints now allows
    arbitrary colors (`7150`{.interpreted-text role="pull"})
-   icat kitten: Add a command line argument to override terminal window
    size detection (`7165`{.interpreted-text role="iss"})
-   A new action `toggle_tab`{.interpreted-text role="ac"} to easily
    switch to and back from a tab with a single shortcut
    (`7203`{.interpreted-text role="iss"})
-   When `clearing terminal <clear_terminal>`{.interpreted-text
    role="ac"} add a new type `to_cursor_scroll` which can be used to
    clear to prompt while moving cleared lines into the scrollback
-   Fix a performance bottleneck when dealing with thousands of small
    images (`7080`{.interpreted-text role="iss"})
-   kitten @ ls: Return the timestamp at which the window was created
    (`7178`{.interpreted-text role="iss"})
-   hints kitten: Use default editor rather than hardcoding vim to open
    file at specific line (`7186`{.interpreted-text role="iss"})
-   Remote control: Fix `--match` argument not working for \@ls,
    \@send-key, \@set-background-image (`7192`{.interpreted-text
    role="iss"})
-   Keyboard protocol: Do not deliver a fake key release events on OS
    window focus out for engaged modifiers (`7196`{.interpreted-text
    role="iss"})
-   Ignore `startup_session`{.interpreted-text role="opt"} when kitty is
    invoked with command line options specifying a command to run
    (`7198`{.interpreted-text role="pull"})
-   Box drawing: Specialize rendering for the Fira Code progress
    bar/spinner glyphs

### 0.32.2 \[2024-02-12\]

-   kitten @ load-config: Allow (re)loading kitty.conf via remote
    control
-   Remote control: Allow running mappable actions via remote control
    ([kitten @ action]{.title-ref})
-   kitten @ send-text: Add a new option to automatically wrap the sent
    text in bracketed paste escape codes if the program in the
    destination window has turned on bracketed paste.
-   Fix a single key mapping not overriding a previously defined
    multi-key mapping
-   macOS: Fix `kitten @ select-window` leaving the keyboard in a
    partially functional state (`7074`{.interpreted-text role="iss"})
-   Graphics protocol: Improve display of images using Unicode
    placeholders or row/column boxes by resizing them using linear
    instead of nearest neighbor interpolation on the GPU
    (`7070`{.interpreted-text role="iss"})
-   When matching URLs use the definition of legal characters in URLs
    from the [WHATWG spec](https://url.spec.whatwg.org/#url-code-points)
    rather than older standards (`7095`{.interpreted-text role="iss"})
-   hints kitten: Respect the kitty
    `url_excluded_characters`{.interpreted-text role="opt"} option
    (`7075`{.interpreted-text role="iss"})
-   macOS: Fix an abort when changing OS window chrome for a full screen
    window via remote control or the themes kitten
    (`7106`{.interpreted-text role="iss"})
-   Special case rendering of some more box drawing characters using
    shades from the block of symbols for legacy computing
    (`7110`{.interpreted-text role="iss"})
-   A new action `close_other_os_windows`{.interpreted-text role="ac"}
    to close non active OS windows (`7113`{.interpreted-text
    role="disc"})

### 0.32.1 \[2024-01-26\]

-   macOS: Fix a regression in the previous release that broke
    overriding keyboard shortcuts for actions present in the global menu
    bar (`7016`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that caused multi-key
    sequences to not abort when pressing an unknown key
    (`7022`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that caused [kitten @
    launch \--cwd=current]{.title-ref} to fail over SSH
    (`7028`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that caused [kitten @
    send-text]{.title-ref} with a match tab parameter to send text twice
    to the active window (`7027`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that caused overriding of
    existing multi-key mappings to fail (`7044`{.interpreted-text
    role="iss"}, `7058`{.interpreted-text role="iss"})
-   Wayland+NVIDIA: Do not request an sRGB output buffer as a bug in
    Wayland causes kitty to not start (`7021`{.interpreted-text
    role="iss"})

### 0.32.0 \[2024-01-19\]

-   `conditional_mappings`{.interpreted-text role="ref"}
-   Support for `modal_mappings`{.interpreted-text role="ref"} such as
    in modal editors like vim
-   A new option `notify_on_cmd_finish`{.interpreted-text role="opt"} to
    show a desktop notification when a long running command finishes
    (`6817`{.interpreted-text role="pull"})
-   A new action `send_key`{.interpreted-text role="ac"} to simplify
    mapping key presses to other keys without needing
    `send_text`{.interpreted-text role="ac"}
-   Allow focusing previously active OS windows via
    `nth_os_window`{.interpreted-text role="ac"}
    (`7009`{.interpreted-text role="pull"})
-   Wayland: Fix a regression in the previous release that broke copying
    to clipboard under wl-roots based compositors in some circumstances
    (`6890`{.interpreted-text role="iss"})
-   macOS: Fix some combining characters not being rendered
    (`6898`{.interpreted-text role="iss"})
-   macOS: Fix returning from full screen via the button when the
    titlebar is hidden not hiding the buttons (`6883`{.interpreted-text
    role="iss"})
-   macOS: Fix newly created OS windows not always appearing on the
    \"active\" monitor (`6932`{.interpreted-text role="pull"})
-   Font fallback: Fix the font used to render a character sometimes
    dependent on the order in which characters appear on screen
    (`6865`{.interpreted-text role="iss"})
-   panel kitten: Fix rendering with non-zero margin/padding in
    kitty.conf (`6923`{.interpreted-text role="iss"})
-   kitty keyboard protocol: Specify the behavior of the modifier bits
    during modifier key events (`6913`{.interpreted-text role="iss"})
-   Wayland: Enable support for the new cursor-shape protocol so that
    the mouse cursor is always rendered at the correct size in
    compositors that support this protocol (`6914`{.interpreted-text
    role="iss"})
-   GNOME Wayland: Fix remembered window size smaller than actual size
    (`6946`{.interpreted-text role="iss"})
-   Mouse reporting: Fix incorrect position reported for windows with
    padding (`6950`{.interpreted-text role="iss"})
-   Fix `focus_visible_window`{.interpreted-text role="ac"} not
    switching to other window in stack layout when only two windows are
    present (`6970`{.interpreted-text role="iss"})

### 0.31.0 \[2023-11-08\]

-   Allow
    `easily running arbitrarily complex remote control scripts <remote_control_script>`{.interpreted-text
    role="ac"} without needing to turn on remote control
    (`6712`{.interpreted-text role="iss"})
-   A new option `menu_map`{.interpreted-text role="opt"} that allows
    adding entries to the global menubar on macOS
    (`6680`{.interpreted-text role="disc"})
-   A new `escape code <pointer-shapes>`{.interpreted-text role="doc"}
    that can be used by programs running in the terminal to change the
    shape of the mouse pointer (`6711`{.interpreted-text role="iss"})
-   Graphics protocol: Support for positioning
    `images relative to other images <relative_image_placement>`{.interpreted-text
    role="ref"} (`6400`{.interpreted-text role="iss"})
-   A new option `single_window_padding_width`{.interpreted-text
    role="opt"} to use a different padding when only a single window is
    visible (`6734`{.interpreted-text role="iss"})
-   A new mouse action `mouse_selection word_and_line_from_point` to
    select the current word under the mouse cursor and extend to end of
    line (`6663`{.interpreted-text role="pull"})
-   A new option `underline_hyperlinks`{.interpreted-text role="opt"} to
    control when hyperlinks are underlined (`6766`{.interpreted-text
    role="iss"})
-   Allow using the full range of standard mouse cursor shapes when
    customizing the mouse cursor
-   macOS: When running the default shell with the login program fix
    `~/.hushlogin`{.interpreted-text role="file"} not being respected
    when opening windows not in the home directory
    (`6689`{.interpreted-text role="iss"})
-   macOS: Fix poor performance when using ligatures with some fonts,
    caused by slow harfbuzz shaping (`6743`{.interpreted-text
    role="iss"})
-   `kitten @ set-background-opacity --toggle`{.interpreted-text
    role="option"} - a new flag to easily switch opacity between the
    specified value and the default (`6691`{.interpreted-text
    role="iss"})
-   Fix a regression caused by rewrite of kittens to Go that made
    various kittens reset colors in a terminal when the colors were
    changed by escape code (`6708`{.interpreted-text role="iss"})
-   Fix trailing bracket not ignored when detecting a multi-line URL
    with the trailing bracket as the first character on the last line
    (`6710`{.interpreted-text role="iss"})
-   Fix the `kitten @ launch --copy-env`{.interpreted-text
    role="option"} option not copying current environment variables
    (`6724`{.interpreted-text role="iss"})
-   Fix a regression that broke `kitten update-self`{.interpreted-text
    role="program"} (`6729`{.interpreted-text role="iss"})
-   Two new event types for `watchers <watchers>`{.interpreted-text
    role="ref"}, `on_title_change` and `on_set_user_var`
-   When pasting, if the text contains terminal control codes ask the
    user for permission. See `paste_actions`{.interpreted-text
    role="opt"} for details. Thanks to David Leadbeater for discovering
    this.
-   Render Private Use Unicode symbols using two cells if the second
    cell contains an en-space as well as a normal space
-   macOS: Fix a regression in the previous release that caused kitten @
    ls to not report the environment variables for the default shell
    (`6749`{.interpreted-text role="iss"})
-   `Desktop notification protocol </desktop-notifications>`{.interpreted-text
    role="doc"}: Allow applications sending notifications to specify
    that the notification should only be displayed if the window is
    currently unfocused (`6755`{.interpreted-text role="iss"})
-   `unicode_input kitten </kittens/unicode_input>`{.interpreted-text
    role="doc"}: Fix a regression that broke the \"Emoticons\" tab
    (`6760`{.interpreted-text role="iss"})
-   Shell integration: Fix `sudo --edit` not working and also fix
    completions for sudo not working in zsh (`6754`{.interpreted-text
    role="iss"}, `6771`{.interpreted-text role="iss"})
-   A new action `set_window_title`{.interpreted-text role="ac"} to
    interactively change the title of the active window
-   ssh kitten: Fix a regression that broken
    `ctrl+space`{.interpreted-text role="kbd"} mapping in zsh
    (`6780`{.interpreted-text role="iss"})
-   Wayland: Fix primary selections not working with the river
    compositor (`6785`{.interpreted-text role="iss"})

### 0.30.1 \[2023-10-05\]

-   Shell integration: Automatically alias sudo to make the kitty
    terminfo files available in the sudo environment. Can be turned off
    via `shell_integration`{.interpreted-text role="opt"}
-   ssh kitten: Fix a regression in 0.28.0 that caused using `--kitten`
    to override `ssh.conf`{.interpreted-text role="file"} not inheriting
    settings from `ssh.conf`{.interpreted-text role="file"}
    (`6639`{.interpreted-text role="iss"})
-   themes kitten: Allow absolute paths for `--config-file-name`
    (`6638`{.interpreted-text role="iss"})
-   Expand environment variables in the `shell`{.interpreted-text
    role="opt"} option (`6511`{.interpreted-text role="iss"})
-   macOS: When running the default shell, run it via the login program
    so that calls to `getlogin()` work (`6511`{.interpreted-text
    role="iss"})
-   X11: Fix a crash on startup when the ibus service returns errors and
    the GLFW[IM_MODULE]{#im_module} env var is set to ibus
    (`6650`{.interpreted-text role="iss"})

### 0.30.0 \[2023-09-18\]

-   A new `transfer kitten </kittens/transfer>`{.interpreted-text
    role="doc"} that can be used to transfer files efficiently over the
    TTY device
-   ssh kitten: A new configuration directive
    `to automatically forward the kitty remote control socket <kitten-ssh.forward_remote_control>`{.interpreted-text
    role="opt"}
-   Allow `easily building kitty from source </build>`{.interpreted-text
    role="doc"} needing the installation of only C and Go compilers. All
    other dependencies are automatically vendored
-   kitten @ set-user-vars: New remote control command to set user
    variables on a window (`6502`{.interpreted-text role="iss"})
-   kitten @ ls: Add user variables set on windows to the output
    (`6502`{.interpreted-text role="iss"})
-   kitten @ ls: Allow limiting output to matched windows/tabs
    (`6520`{.interpreted-text role="iss"})
-   kitten icat: Fix image being displayed one cell to the right when
    using both `--place` and `--unicode-placeholder`
    (`6556`{.interpreted-text role="iss"})
-   kitten run-shell: Make kitty terminfo database available if needed
    before starting the shell
-   macOS: Fix keyboard shortcuts in the Apple global menubar not being
    changed when reloading the config
-   Fix a crash when resizing an OS Window that is displaying more than
    one image and the new size is smaller than the image needs
    (`6555`{.interpreted-text role="iss"})
-   Remote control: Allow using a random TCP port as the remote control
    socket and also allow using TCP sockets in
    `listen_on`{.interpreted-text role="opt"}
-   unicode[input]{#input} kitten: Add an option to specify the startup
    tab (`6552`{.interpreted-text role="iss"})
-   X11: Print an error to `STDERR`{.interpreted-text role="file"}
    instead of refusing to start when the user sets a custom window icon
    larger than 128x128 (`6507`{.interpreted-text role="iss"})
-   Remote control: Allow matching by neighbor of active window. Useful
    for navigation plugins like vim-kitty-navigator
-   Fix a regression that caused changing
    `text_fg_override_threshold`{.interpreted-text role="opt"} or
    `text_composition_strategy`{.interpreted-text role="opt"} via config
    reload causing incorrect rendering (`6559`{.interpreted-text
    role="iss"})
-   When running a shell for `--hold` set the env variable
    `KITTY_HOLD=1` to allow users to customize what happens
    (`6587`{.interpreted-text role="disc"})
-   When multiple confirmable close requests are made focus the existing
    close confirmation window instead of opening a new one for each
    request (`6601`{.interpreted-text role="iss"})
-   Config file format: allow splitting lines by starting subsequent
    lines with a backslash (`6603`{.interpreted-text role="pull"})
-   ssh kitten: Fix a regression causing hostname directives in
    `ssh.conf`{.interpreted-text role="file"} not matching when username
    is specified (`6609`{.interpreted-text role="disc"})
-   diff kitten: Add support for files that are identical apart from
    mode changes (`6611`{.interpreted-text role="iss"})
-   Wayland: Do not request idle inhibition for full screen windows
    (`6613`{.interpreted-text role="iss"})
-   Adjust the workaround for non-linear blending of transparent pixels
    in compositors to hopefully further reduce fringing around text with
    certain color issues (`6534`{.interpreted-text role="iss"})

### 0.29.2 \[2023-07-27\]

-   macOS: Fix a performance regression on M1 machines using outdated
    macOS versions (`6479`{.interpreted-text role="iss"})
-   macOS: Disable OS window shadows for transparent windows as they
    cause rendering artifacts due to Cocoa bugs
    (`6439`{.interpreted-text role="iss"})
-   Detect .tex and Makefiles as plain text files
    (`6492`{.interpreted-text role="iss"})
-   unicode[input]{#input} kitten: Fix scrolling over multiple screens
    not working (`6497`{.interpreted-text role="iss"})

### 0.29.1 \[2023-07-17\]

-   A new value for `background_image_layout`{.interpreted-text
    role="opt"} to scale the background image while preserving its
    aspect ratio. Also have centered images work even for images larger
    than the window size (`6458`{.interpreted-text role="pull"})
-   Fix a regression that caused using unicode placeholders to display
    images to break and also partially offscreen images to sometimes be
    slightly distorted (`6467`{.interpreted-text role="iss"})
-   macOS: Fix a regression that caused rendering to hang when
    transitioning to full screen with
    `macos_colorspace`{.interpreted-text role="opt"} set to `default`
    (`6435`{.interpreted-text role="iss"})
-   macOS: Fix a regression causing *burn-in* of text when resizing
    semi-transparent OS windows (`6439`{.interpreted-text role="iss"})
-   macOS: Add a new value `titlebar-and-corners` for
    `hide_window_decorations`{.interpreted-text role="opt"} that
    emulates the behavior of `hide_window_decorations yes` in older
    versions of kitty
-   macOS: Fix a regression in the previous release that caused
    `hide_window_decorations`{.interpreted-text role="opt"} = `yes` to
    prevent window from being resizable (`6436`{.interpreted-text
    role="iss"})
-   macOS: Fix a regression that caused the titlebar to be translucent
    even for non-translucent windows (`6450`{.interpreted-text
    role="iss"})
-   GNOME: Fix `wayland_titlebar_color`{.interpreted-text role="opt"}
    not being applied until the color is changed at least once
    (`6447`{.interpreted-text role="iss"})
-   Remote control launch: Fix `--env` not implemented when using
    `--cwd=current` with the SSH kitten (`6438`{.interpreted-text
    role="iss"})
-   Allow using a custom OS window icon on X11 as well as macOS
    (`6475`{.interpreted-text role="pull"})

### 0.29.0 \[2023-07-10\]

-   A new escape code `<ESC>[22J` that moves the current contents of the
    screen into the scrollback before clearing it
-   A new kitten `run-shell <run_shell>`{.interpreted-text role="ref"}
    to allow creating sub-shells with shell integration enabled
-   A new option `background_blur`{.interpreted-text role="opt"} to blur
    the background for transparent windows (`6135`{.interpreted-text
    role="pull"})
-   The `--hold`{.interpreted-text role="option"} flag now holds the
    window open at a shell prompt instead of asking the user to press a
    key
-   A new option `text_fg_override_threshold`{.interpreted-text
    role="opt"} to force text colors to have high contrast regardless of
    color scheme (`6283`{.interpreted-text role="pull"})
-   When resizing OS Windows make the animation less jerky. Also show
    the window size in cells during the resize (`6341`{.interpreted-text
    role="iss"})
-   unicode[input]{#input} kitten: Fix a regression in 0.28.0 that
    caused the order of recent and favorites entries to not be respected
    (`6214`{.interpreted-text role="iss"})
-   unicode[input]{#input} kitten: Fix a regression in 0.28.0 that
    caused editing of favorites to sometimes hang
-   clipboard kitten: Fix a bug causing the last MIME type available on
    the clipboard not being recognized when pasting
-   clipboard kitten: Dont set clipboard when getting clipboard in
    filter mode (`6302`{.interpreted-text role="iss"})
-   Fix regression in 0.28.0 causing color fringing when rendering in
    transparent windows on light backgrounds (`6209`{.interpreted-text
    role="iss"})
-   show[key]{#key} kitten: In kitty mode show the actual bytes sent by
    the terminal rather than a re-encoding of the parsed key event
-   hints kitten: Fix a regression in 0.28.0 that broke using sub-groups
    in regexp captures (`6228`{.interpreted-text role="iss"})
-   hints kitten: Fix a regression in 0.28.0 that broke using
    lookahead/lookbehind in regexp captures (`6265`{.interpreted-text
    role="iss"})
-   diff kitten: Fix a regression in 0.28.0 that broke using relative
    paths as arguments to the kitten (`6325`{.interpreted-text
    role="iss"})
-   Fix re-using the image id of an animated image for a still image
    causing a crash (`6244`{.interpreted-text role="iss"})
-   kitty +open: Ask for permission before executing script files that
    are not marked as executable. This prevents accidental execution of
    script files via MIME type association from programs that
    unconditionally \"open\" attachments/downloaded files
-   edit-in-kitty: Fix running edit-in-kitty with elevated privileges to
    edit a restricted file not working (`6245`{.interpreted-text
    role="disc"})
-   ssh kitten: Fix a regression in 0.28.0 that caused interrupt during
    setup to not be handled gracefully (`6254`{.interpreted-text
    role="iss"})
-   ssh kitten: Allow configuring the ssh kitten to skip some hosts via
    a new `delegate` config directive
-   Graphics: Move images up along with text when the window is shrunk
    vertically (`6278`{.interpreted-text role="iss"})
-   Fix a regression in 0.28.0 that caused a buffer overflow when
    clearing the screen (`6306`{.interpreted-text role="iss"},
    `6308`{.interpreted-text role="pull"})
-   Fix a regression in 0.27.0 that broke setting of specific edge
    padding/margin via remote control (`6333`{.interpreted-text
    role="iss"})
-   macOS: Fix window shadows not being drawn for transparent windows
    (`2827`{.interpreted-text role="iss"}, `6416`{.interpreted-text
    role="pull"})
-   Do not echo invalid DECRQSS queries back, behavior inherited from
    xterm (CVE-2008-2383). Similarly, fix an echo bug in the file
    transfer protocol due to insufficient sanitization of safe strings.

### 0.28.1 \[2023-04-21\]

-   Fix a regression in the previous release that broke the remote file
    kitten (`6186`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that broke handling of some
    keyboard shortcuts in some kittens on some keyboard layouts
    (`6189`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that broke usage of custom
    themes (`6191`{.interpreted-text role="iss"})

### 0.28.0 \[2023-04-15\]

-   **Text rendering change**: Use sRGB correct linear gamma blending
    for nicer font rendering and better color accuracy with transparent
    windows. See the option
    `text_composition_strategy`{.interpreted-text role="opt"} for
    details. The obsolete `macos_thicken_font`{.interpreted-text
    role="opt"} will make the font too thick and needs to be removed
    manually if it is configured. (`5969`{.interpreted-text
    role="pull"})
-   icat kitten: Support display of images inside tmux \>= 3.3
    (`5664`{.interpreted-text role="pull"})
-   Graphics protocol: Add support for displaying images inside programs
    that do not support the protocol such as vim and tmux
    (`5664`{.interpreted-text role="pull"})
-   diff kitten: Add support for selecting multi-line text with the
    mouse
-   Fix a regression in 0.27.0 that broke `kitty @ set-font-size 0`
    (`5992`{.interpreted-text role="iss"})
-   launch: When using `--cwd=current` for a remote system support
    running non shell commands as well (`5987`{.interpreted-text
    role="disc"})
-   When changing the cursor color via escape codes or remote control to
    a fixed color, do not reset cursor[text_color]{#text_color}
    (`5994`{.interpreted-text role="iss"})
-   Input Method Extensions: Fix incorrect rendering of IME in-progress
    and committed text in some situations (`6049`{.interpreted-text
    role="pull"}, `6087`{.interpreted-text role="pull"})
-   Linux: Reduce minimum required OpenGL version from 3.3 to 3.1 +
    extensions (`2790`{.interpreted-text role="iss"})
-   Fix a regression that broke drawing of images below cell backgrounds
    (`6061`{.interpreted-text role="iss"})
-   macOS: Fix the window buttons not being hidden after exiting the
    traditional full screen (`6009`{.interpreted-text role="iss"})
-   When reloading configuration, also reload custom MIME types from
    `mime.types`{.interpreted-text role="file"} config file
    (`6012`{.interpreted-text role="pull"})
-   launch: Allow specifying the state (full screen/maximized/minimized)
    for newly created OS Windows (`6026`{.interpreted-text role="iss"})
-   Sessions: Allow specifying the OS window state via the
    `os_window_state` directive (`5863`{.interpreted-text role="iss"})
-   macOS: Display the newly created OS window in specified state to
    avoid or reduce the window transition animations
    (`6035`{.interpreted-text role="pull"})
-   macOS: Fix the maximized window not taking up full space when the
    title bar is hidden or when `resize_in_steps`{.interpreted-text
    role="opt"} is configured (`6021`{.interpreted-text role="iss"})
-   Linux: A new option `linux_bell_theme`{.interpreted-text role="opt"}
    to control which sound theme is used for the bell sound
    (`4858`{.interpreted-text role="pull"})
-   ssh kitten: Change the syntax of glob patterns slightly to match
    common usage elsewhere. Now the syntax is the same as
    \"extendedglob\" in most shells.
-   hints kitten: Allow copying matches to named buffers
    (`6073`{.interpreted-text role="disc"})
-   Fix overlay windows not inheriting the per-window padding and margin
    settings of their parents (`6063`{.interpreted-text role="iss"})
-   Wayland KDE: Fix selecting in un-focused OS window not working
    correctly (`6095`{.interpreted-text role="iss"})
-   Linux X11: Fix a crash if the X server requests clipboard data after
    we have relinquished the clipboard (`5650`{.interpreted-text
    role="iss"})
-   Allow stopping of URL detection at newlines via
    `url_excluded_characters`{.interpreted-text role="opt"}
    (`6122`{.interpreted-text role="iss"})
-   Linux Wayland: Fix animated images not being animated continuously
    (`6126`{.interpreted-text role="iss"})
-   Keyboard input: Fix text not being reported as unicode codepoints
    for multi-byte characters in the kitty keyboard protocol
    (`6167`{.interpreted-text role="iss"})

### 0.27.1 \[2023-02-07\]

-   Fix `modify_font`{.interpreted-text role="opt"} not working for
    strikethrough position (`5946`{.interpreted-text role="iss"})
-   Fix a regression causing the `edit-in-kitty` command not working if
    `kitten`{.interpreted-text role="file"} is not added to PATH
    (`5956`{.interpreted-text role="iss"})
-   icat kitten: Fix a regression that broke display of animated GIFs
    over SSH (`5958`{.interpreted-text role="iss"})
-   Wayland GNOME: Fix for ibus not working when using XWayland
    (`5967`{.interpreted-text role="iss"})
-   Fix regression in previous release that caused incorrect entries in
    terminfo for modifier+F3 key combinations (`5970`{.interpreted-text
    role="pull"})
-   Bring back the deprecated and removed `kitty +complete` and delegate
    it to `kitten`{.interpreted-text role="program"} for backward
    compatibility (`5977`{.interpreted-text role="pull"})
-   Bump the version of Go needed to build kitty to `1.20` so we can use
    the Go stdlib ecdh package for crypto.

### 0.27.0 \[2023-01-31\]

-   A new statically compiled, standalone executable, `kitten` (written
    in Go) that can be used on all UNIX-like servers for remote control
    (`kitten @`), viewing images (`kitten icat`), manipulating the
    clipboard (`kitten clipboard`), etc.
-   `clipboard kitten </kittens/clipboard>`{.interpreted-text
    role="doc"}: Allow copying arbitrary data types to/from the
    clipboard, not just plain text
-   Speed up the `kitty @` executable by \~10x reducing the time for
    typical remote control commands from \~50ms to \~5ms
-   icat kitten: Speed up by using POSIX shared memory when possible to
    transfer image data to the terminal. Also support common image
    formats GIF/PNG/JPEG/WEBP/TIFF/BMP out of the box without needing
    ImageMagick.
-   Option `show_hyperlink_targets`{.interpreted-text role="opt"} to
    show the target of terminal hyperlinks when hovering over them with
    the mouse (`5830`{.interpreted-text role="pull"})
-   Keyboard protocol: Remove `CSI R` from the allowed encodings of the
    `F3`{.interpreted-text role="kbd"} key as it conflicts with the
    *Cursor Position Report* escape code (`5813`{.interpreted-text
    role="disc"})
-   Allow using the cwd of the original process for
    `launch --cwd`{.interpreted-text role="option"}
    (`5672`{.interpreted-text role="iss"})
-   Session files: Expand environment variables
    (`5917`{.interpreted-text role="disc"})
-   Pass key events mapped to scroll actions to the program running in
    the terminal when the terminal is in alternate screen mode
    (`5839`{.interpreted-text role="iss"})
-   Implement `edit-in-kitty <edit_file>`{.interpreted-text role="ref"}
    using the new `kitten` static executable (`5546`{.interpreted-text
    role="iss"}, `5630`{.interpreted-text role="iss"})
-   Add an option `background_tint_gaps`{.interpreted-text role="opt"}
    to control background image tinting for window gaps
    (`5596`{.interpreted-text role="iss"})
-   A new option `undercurl_style`{.interpreted-text role="opt"} to
    control the rendering of undercurls (`5883`{.interpreted-text
    role="pull"})
-   Bash integration: Fix `clone-in-kitty` not working on bash \>= 5.2
    if environment variable values contain newlines or other special
    characters (`5629`{.interpreted-text role="iss"})
-   A new `sleep`{.interpreted-text role="ac"} action useful in combine
    based mappings to make kitty sleep before executing the next action
-   Wayland GNOME: Workaround for latest mutter release breaking full
    screen for semi-transparent kitty windows (`5677`{.interpreted-text
    role="iss"})
-   A new option `tab_title_max_length`{.interpreted-text role="opt"} to
    limit the length of tab (`5718`{.interpreted-text role="iss"})
-   When drawing the tab bar have the default left and right margins
    drawn in a color matching the neighboring tab
    (`5719`{.interpreted-text role="iss"})
-   When using the `include` directive in `kitty.conf`{.interpreted-text
    role="file"} make the environment variable
    `KITTY_OS`{.interpreted-text role="envvar"} available for OS
    specific config
-   Wayland: Fix signal handling not working with some GPU drivers
    (`4636`{.interpreted-text role="iss"})
-   Remote control: When matching windows allow using negative id
    numbers to match recently created windows (`5753`{.interpreted-text
    role="iss"})
-   ZSH Integration: Bind `alt+left`{.interpreted-text role="kbd"} and
    `alt+right`{.interpreted-text role="kbd"} to move by word if not
    already bound. This mimics the default bindings in Terminal.app
    (`5793`{.interpreted-text role="iss"})
-   macOS: Allow to customize `Hide <hide_macos_app>`{.interpreted-text
    role="sc"}, `Hide Others <hide_macos_other_apps>`{.interpreted-text
    role="sc"}, `Minimize <minimize_macos_window>`{.interpreted-text
    role="sc"}, and `Quit <quit>`{.interpreted-text role="sc"} global
    menu shortcuts. Note that `clear_all_shortcuts`{.interpreted-text
    role="opt"} will remove these shortcuts now (`948`{.interpreted-text
    role="iss"})
-   When a multi-key sequence does not match any action, send all key
    events to the child program (`5841`{.interpreted-text role="pull"})
-   broadcast kitten: Allow pressing a key to stop echoing of input into
    the broadcast window itself (`5868`{.interpreted-text role="disc"})
-   When reporting unused activity in a window, ignore activity that
    occurs soon after a window resize (`5881`{.interpreted-text
    role="iss"})
-   Fix using `cursor`{.interpreted-text role="opt"} = `none` not
    working on text that has reverse video (`5897`{.interpreted-text
    role="iss"})
-   Fix ssh kitten not working on FreeBSD (`5928`{.interpreted-text
    role="iss"})
-   macOS: Export kitty selected text to the system for use with
    services that accept it (patch by Sertaç Ö. Yıldız)

### 0.26.5 \[2022-11-07\]

-   Splits layout: Add a new mappable action to move the active window
    to the screen edge (`5643`{.interpreted-text role="iss"})
-   ssh kitten: Allow using absolute paths for the location of
    transferred data (`5607`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that caused a
    `resize_draw_strategy` of `static` to not work
    (`5601`{.interpreted-text role="iss"})
-   Wayland KDE: Fix abort when pasting into Firefox
    (`5603`{.interpreted-text role="iss"})
-   Wayland GNOME: Fix ghosting when using
    `background_tint`{.interpreted-text role="opt"}
    (`5605`{.interpreted-text role="iss"})
-   Fix cursor position at x=0 changing to x=1 on resize
    (`5635`{.interpreted-text role="iss"})
-   Wayland GNOME: Fix incorrect window size in some circumstances when
    switching between windows with window decorations disabled
    (`4802`{.interpreted-text role="iss"})
-   Wayland: Fix high CPU usage when using some input methods
    (`5369`{.interpreted-text role="pull"})
-   Remote control: When matching window by [state:focused]{.title-ref}
    and no window currently has keyboard focus, match the window
    belonging to the OS window that was last focused
    (`5602`{.interpreted-text role="iss"})

### 0.26.4 \[2022-10-17\]

-   macOS: Allow changing the kitty icon by placing a custom icon in the
    kitty config folder (`5464`{.interpreted-text role="pull"})
-   Allow centering the `background_image`{.interpreted-text role="opt"}
    (`5525`{.interpreted-text role="iss"})
-   X11: Fix a regression in the previous release that caused pasting
    from GTK based applications to have extra newlines
    (`5528`{.interpreted-text role="iss"})
-   Tab bar: Improve empty space management when some tabs have short
    titles, allocate the saved space to the active tab
    (`5548`{.interpreted-text role="iss"})
-   Fix `background_tint`{.interpreted-text role="opt"} not applying to
    window margins and padding (`3933`{.interpreted-text role="iss"})
-   Wayland: Fix background image scaling using tiled mode on high DPI
    screens
-   Wayland: Fix an abort when changing background colors with
    `wayland_titlebar_color`{.interpreted-text role="opt"} set to
    `background` (`5562`{.interpreted-text role="iss"})
-   Update to Unicode 15.0 (`5542`{.interpreted-text role="pull"})
-   GNOME Wayland: Fix a memory leak in gnome-shell when using client
    side decorations

### 0.26.3 \[2022-09-22\]

-   Wayland: Mark windows in which a bell occurs as urgent on
    compositors that support the xdg-activation protocol
-   Allow passing null bytes through the system clipboard
    (`5483`{.interpreted-text role="iss"})
-   ssh kitten: Fix `KITTY_PUBLIC_KEY`{.interpreted-text role="envvar"}
    not being encoded properly when transmitting
    (`5496`{.interpreted-text role="iss"})
-   Sessions: Allow controlling which OS Window is active via the
    `focus_os_window` directive
-   Wayland: Fix for bug in NVIDIA drivers that prevents transparency
    working (`5479`{.interpreted-text role="iss"})
-   Wayland: Fix for a bug that could cause kitty to become
    non-responsive when using multiple OS windows in a single instance
    on some compositors (`5495`{.interpreted-text role="iss"})
-   Wayland: Fix for a bug preventing kitty from starting on Hyprland
    when using a non-unit scale (`5467`{.interpreted-text role="iss"})
-   Wayland: Generate a XDG[ACTIVATION_TOKEN]{#activation_token} when
    opening URLs or running programs in the background via the launch
    action
-   Fix a regression that caused kitty not to restore SIGPIPE after
    python nukes it when launching children. Affects bash which does not
    sanitize its signal mask. (`5500`{.interpreted-text role="iss"})
-   Fix a use-after-free when handling fake mouse clicks and the action
    causes windows to be removed/re-allocated (`5506`{.interpreted-text
    role="iss"})

### 0.26.2 \[2022-09-05\]

-   Allow creating `overlay-main` windows, which are treated as the
    active window unlike normal overlays (`5392`{.interpreted-text
    role="iss"})
-   hints kitten: Allow using `launch`{.interpreted-text role="doc"} as
    the program to run, to open the result in a new kitty
    tab/window/etc. (`5462`{.interpreted-text role="iss"})
-   hyperlinked[grep]{#grep} kitten: Allow control over which parts of
    `rg` output are hyperlinked (`5428`{.interpreted-text role="pull"})
-   Fix regression in 0.26.0 that caused launching kitty without working
    STDIO handles to result in high CPU usage and prewarming failing
    (`5444`{.interpreted-text role="iss"})
-   `/launch`{.interpreted-text role="doc"}: Allow setting the margin
    and padding for newly created windows (`5463`{.interpreted-text
    role="iss"})
-   macOS: Fix regression in 0.26.0 that caused asking the user for a
    line of input such as for `set_tab_title`{.interpreted-text
    role="ac"} to not work (`5447`{.interpreted-text role="iss"})
-   hints kitten: hyperlink matching: Fix hints occasionally matching
    text on subsequent line as part of hyperlink
    (`5450`{.interpreted-text role="pull"})
-   Fix a regression in 0.26.0 that broke mapping of native keys whose
    key codes did not fit in 21 bits (`5452`{.interpreted-text
    role="iss"})
-   Wayland: Fix remembering window size not accurate when client side
    decorations are present
-   Fix an issue where notification identifiers were not sanitized
    leading to code execution if the user clicked on a notification
    popup from a malicious source. Thanks to Carter Sande for
    discovering this vulnerability.

### 0.26.1 \[2022-08-30\]

-   ssh kitten: Fix executable permission missing from kitty bootstrap
    script (`5438`{.interpreted-text role="iss"})
-   Fix a regression in 0.26.0 that caused kitty to no longer set the
    `LANG` environment variable on macOS (`5439`{.interpreted-text
    role="iss"})
-   Allow specifying a title when using the
    `set_tab_title`{.interpreted-text role="ac"} action
    (`5441`{.interpreted-text role="iss"})

### 0.26.0 \[2022-08-29\]

-   A new option `remote_control_password`{.interpreted-text role="opt"}
    to use fine grained permissions for what can be remote controlled
    (`5320`{.interpreted-text role="disc"})
-   Reduce startup latency by \~30 milliseconds when running kittens via
    key bindings inside kitty (`5159`{.interpreted-text role="iss"})
-   A new option `modify_font`{.interpreted-text role="opt"} to adjust
    various font metrics like underlines, cell sizes etc.
    (`5265`{.interpreted-text role="pull"})
-   A new shortcut `show_kitty_doc`{.interpreted-text role="sc"} to
    display the kitty docs in a browser
-   Graphics protocol: Only delete temp files if they have the string
    `tty-graphics-protocol` in their file paths. This prevents deletion
    of arbitrary files in `/tmp`{.interpreted-text role="file"}.
-   Deprecate the `adjust_baseline`, `adjust_line_height` and
    `adjust_column_width` options in favor of
    `modify_font`{.interpreted-text role="opt"}
-   Wayland: Fix a regression in the previous release that caused mouse
    cursor animation and keyboard repeat to stop working when switching
    seats (`5188`{.interpreted-text role="iss"})
-   Allow resizing windows created in session files
    (`5196`{.interpreted-text role="pull"})
-   Fix horizontal wheel events not being reported to client programs
    when they grab the mouse (`2819`{.interpreted-text role="iss"})
-   macOS: Remote control: Fix unable to launch a new OS window or
    background process when there is no OS window
    (`5210`{.interpreted-text role="iss"})
-   macOS: Fix unable to open new tab or new window when there is no OS
    window (`5276`{.interpreted-text role="iss"})
-   kitty @ set-colors: Fix changing
    inactive[tab_foreground]{#tab_foreground} not working
    (`5214`{.interpreted-text role="iss"})
-   macOS: Fix a regression that caused switching keyboard input using
    Eisu and Kana keys not working (`5232`{.interpreted-text
    role="iss"})
-   Add a mappable action to toggle the mirrored setting for the tall
    and fat layouts (`5344`{.interpreted-text role="pull"})
-   Add a mappable action to switch between predefined bias values for
    the tall and fat layouts (`5352`{.interpreted-text role="pull"})
-   Wayland: Reduce flicker at startup by not using render frames
    immediately after a resize (`5235`{.interpreted-text role="iss"})
-   Linux: Update cursor position after all key presses not just
    pre-edit text changes (`5241`{.interpreted-text role="iss"})
-   ssh kitten: Allow ssh kitten to work from inside tmux, provided the
    tmux session inherits the correct KITTY env vars
    (`5227`{.interpreted-text role="iss"})
-   ssh kitten: A new option `--symlink-strategy` to control how
    symlinks are copied to the remote machine (`5249`{.interpreted-text
    role="iss"})
-   ssh kitten: Allow pressing `Ctrl+C`{.interpreted-text role="kbd"} to
    abort ssh before the connection is completed
    (`5271`{.interpreted-text role="iss"})
-   Bash integration: Fix declare not creating global variables in
    .bashrc (`5254`{.interpreted-text role="iss"})
-   Bash integration: Fix the inherit[errexit]{#errexit} option being
    set by shell integration (`5349`{.interpreted-text role="iss"})
-   `kitty @ scroll-window`{.interpreted-text role="command"} allow
    scrolling by fractions of a screen (`5294`{.interpreted-text
    role="iss"})
-   remote files kitten: Fix working with files whose names have
    characters that need to be quoted in shell scripts
    (`5313`{.interpreted-text role="iss"})
-   Expand \~ in paths configured in `editor`{.interpreted-text
    role="opt"} and `exe_search_path`{.interpreted-text role="opt"}
    (`5298`{.interpreted-text role="disc"})
-   Allow showing the working directory of the active window in tab
    titles (`5314`{.interpreted-text role="pull"})
-   ssh kitten: Allow completion of ssh options between the destination
    and command (`5322`{.interpreted-text role="iss"})
-   macOS: Fix speaking selected text not working
    (`5357`{.interpreted-text role="iss"})
-   Allow ignoring failure to close windows/tabs via rc commands
    (`5406`{.interpreted-text role="disc"})
-   Fix hyperlinks not present when fetching text from the history
    buffer (`5427`{.interpreted-text role="iss"})

### 0.25.2 \[2022-06-07\]

-   A new command `edit-in-kitty`{.interpreted-text role="command"} to
    `edit_file`{.interpreted-text role="ref"}
-   Allow getting the last non-empty command output easily via an action
    or remote control (`4973`{.interpreted-text role="pull"})
-   Fix a bug that caused `macos_colorspace`{.interpreted-text
    role="opt"} to always be `default` regardless of its actual value
    (`5129`{.interpreted-text role="iss"})
-   diff kitten: A new option
    `kitten-diff.ignore_name`{.interpreted-text role="opt"} to exclude
    files and directories from being scanned (`5171`{.interpreted-text
    role="pull"})
-   ssh kitten: Fix bash not being executed as a login shell since kitty
    0.25.0 (`5130`{.interpreted-text role="iss"})
-   macOS: When pasting text and the clipboard has a filesystem path,
    paste the full path instead of the text, which is sometimes just the
    file name (`5142`{.interpreted-text role="pull"})
-   macOS: Allow opening executables without a file extension with kitty
    as well (`5160`{.interpreted-text role="iss"})
-   Themes kitten: Add a tab to show user defined custom color themes
    separately (`5150`{.interpreted-text role="pull"})
-   Iosevka: Fix incorrect rendering when there is a combining char that
    does not group with its neighbors (`5153`{.interpreted-text
    role="iss"})
-   Weston: Fix client side decorations flickering on slow computers
    during window resize (`5162`{.interpreted-text role="iss"})
-   Remote control: Fix commands with large or asynchronous payloads
    like `kitty @ set-background-image`{.interpreted-text
    role="command"}, `kitty @ set-window-logo`{.interpreted-text
    role="command"} and `kitty @ select-window`{.interpreted-text
    role="command"} not working correctly when using a socket
    (`5165`{.interpreted-text role="iss"})
-   hints kitten: Fix surrounding quotes/brackets and embedded carriage
    returns not being removed when using line number processing
    (`5170`{.interpreted-text role="iss"})

### 0.25.1 \[2022-05-26\]

-   Shell integration: Add a command to `clone_shell`{.interpreted-text
    role="ref"}
-   Remote control: Allow using
    `Boolean operators <search_syntax>`{.interpreted-text role="ref"}
    when constructing queries to match windows or tabs
-   Sessions: Fix `os_window_size` and `os_window_class` not applying to
    the first OS Window (`4957`{.interpreted-text role="iss"})
-   Allow using the cwd of the oldest as well as the newest foreground
    process for `launch --cwd`{.interpreted-text role="option"}
    (`4869`{.interpreted-text role="disc"})
-   Bash integration: Fix the value of
    `shell_integration`{.interpreted-text role="opt"} not taking effect
    if the integration script is sourced in bashrc
    (`4964`{.interpreted-text role="pull"})
-   Fix a regression in the previous release that caused mouse move
    events to be incorrectly reported as drag events even when a button
    is not pressed (`4992`{.interpreted-text role="iss"})
-   remote file kitten: Integrate with the ssh kitten for improved
    performance and robustness. Re-uses the control master connection of
    the ssh kitten to avoid round-trip latency.
-   Fix tab selection when closing a new tab not correct in some
    scenarios (`4987`{.interpreted-text role="iss"})
-   A new action `open_url`{.interpreted-text role="ac"} to open the
    specified URL (`5004`{.interpreted-text role="pull"})
-   A new option `select_by_word_characters_forward`{.interpreted-text
    role="opt"} that allows changing which characters are considered
    part of a word to the right when double clicking to select words
    (`5103`{.interpreted-text role="pull"})
-   macOS: Make the global menu shortcut to open kitty website
    configurable (`5004`{.interpreted-text role="pull"})
-   macOS: Add the `macos_colorspace`{.interpreted-text role="opt"}
    option to control what color space colors are rendered in
    (`4686`{.interpreted-text role="iss"})
-   Fix reloading of config not working when
    `kitty.conf`{.interpreted-text role="file"} does not exist when
    kitty is launched (`5071`{.interpreted-text role="iss"})
-   Fix deleting images by row not calculating image bounds correctly
    (`5081`{.interpreted-text role="iss"})
-   Increase the max number of combining chars per cell from two to
    three, without increasing memory usage.
-   Linux: Load libfontconfig at runtime to allow the binaries to work
    for running kittens on servers without FontConfig
-   GNOME: Fix for high CPU usage caused by GNOME\'s text input
    subsystem going into an infinite loop when IME cursor position is
    updated after a done event (`5105`{.interpreted-text role="iss"})

### 0.25.0 \[2022-04-11\]

-   `kittens/ssh`{.interpreted-text role="doc"}: automatic shell
    integration when using SSH. Easily clone local shell and editor
    configuration on remote machines, and automatic re-use of existing
    connections to avoid connection setup latency.
-   When pasting URLs at shell prompts automatically quote them. Also
    allow filtering pasted text and confirm pastes. See
    `paste_actions`{.interpreted-text role="opt"} for details.
    (`4873`{.interpreted-text role="iss"})
-   Change the default value of
    `confirm_os_window_close`{.interpreted-text role="opt"} to ask for
    confirmation when closing windows that are not sitting at shell
    prompts
-   A new value `last_reported` for `launch --cwd`{.interpreted-text
    role="option"} to use the current working directory last reported by
    the program running in the terminal
-   macOS: When using Apple\'s less as the pager for viewing scrollback
    strip out OSC codes as it can\'t parse them
    (`4788`{.interpreted-text role="iss"})
-   diff kitten: Fix incorrect rendering in rare circumstances when
    scrolling after changing the context size (`4831`{.interpreted-text
    role="iss"})
-   icat kitten: Fix a regression that broke
    `kitty +kitten icat --print-window-size`{.interpreted-text
    role="option"} (`4818`{.interpreted-text role="pull"})
-   Wayland: Fix `hide_window_decorations`{.interpreted-text role="opt"}
    causing docked windows to be resized on blur
    (`4797`{.interpreted-text role="iss"})
-   Bash integration: Prevent shell integration code from running twice
    if user enables both automatic and manual integration
-   Bash integration: Handle existing PROMPT[COMMAND]{#command} ending
    with a literal newline
-   Fix continued lines not having their continued status reset on line
    feed (`4837`{.interpreted-text role="iss"})
-   macOS: Allow the New kitty Tab/Window Here services to open multiple
    selected folders. (`4848`{.interpreted-text role="pull"})
-   Wayland: Fix a regression that broke IME when changing windows/tabs
    (`4853`{.interpreted-text role="iss"})
-   macOS: Fix Unicode paths not decoded correctly when dropping files
    (`4879`{.interpreted-text role="pull"})
-   Avoid flicker when starting kittens such as the hints kitten
    (`4674`{.interpreted-text role="iss"})
-   A new action `scroll_prompt_to_top`{.interpreted-text role="ac"} to
    move the current prompt to the top (`4891`{.interpreted-text
    role="pull"})
-   `select_tab`{.interpreted-text role="ac"}: Use stable numbers when
    selecting the tab (`4792`{.interpreted-text role="iss"})
-   Only check for updates in the official binary builds. Distro
    packages or source builds will no longer check for updates,
    regardless of the value of `update_check_interval`{.interpreted-text
    role="opt"}.
-   Fix `inactive_text_alpha`{.interpreted-text role="opt"} still being
    applied to the cursor hidden window after focus
    (`4928`{.interpreted-text role="iss"})
-   Fix resizing window that is extra tall/wide because of left-over
    cells not working reliably (`4913`{.interpreted-text role="iss"})
-   A new action `close_other_tabs_in_os_window`{.interpreted-text
    role="ac"} to close other tabs in the active OS window
    (`4944`{.interpreted-text role="pull"})

### 0.24.4 \[2022-03-03\]

-   Shell integration: Fix the default Bash `$HISTFILE` changing to
    `~/.sh_history`{.interpreted-text role="file"} instead of
    `~/.bash_history`{.interpreted-text role="file"}
    (`4765`{.interpreted-text role="iss"})
-   Linux binaries: Fix binaries not working on systems with older
    Wayland client libraries (`4760`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that broke kittens launched
    with `STDIN` not connected to a terminal (`4763`{.interpreted-text
    role="iss"})
-   Wayland: Fix surface configure events not being acknowledged before
    commit the resized buffer (`4768`{.interpreted-text role="pull"})

### 0.24.3 \[2022-02-28\]

-   Bash integration: No longer modify `~/.bashrc`{.interpreted-text
    role="file"} to load
    `shell integration <shell_integration>`{.interpreted-text
    role="ref"}. It is recommended to remove the lines used to load the
    shell integration from `~/.bashrc`{.interpreted-text role="file"} as
    they are no-ops.
-   macOS: Allow kitty to handle various URL types. Can be configured
    via `launch_actions`{.interpreted-text role="ref"}
    (`4618`{.interpreted-text role="pull"})
-   macOS: Add a new service `Open with kitty` to open file types that
    are not recognized by the system (`4641`{.interpreted-text
    role="pull"})
-   Splits layout: A new value for `launch --location`{.interpreted-text
    role="option"} to auto-select the split axis when splitting existing
    windows. Wide windows are split side-by-side and tall windows are
    split one-above-the-other
-   hints kitten: Fix a regression that broke recognition of
    path:linenumber:colnumber (`4675`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that broke
    `active_tab_foreground`{.interpreted-text role="opt"}
    (`4620`{.interpreted-text role="iss"})
-   Fix `show_last_command_output`{.interpreted-text role="ac"} not
    working when the output is stored partially in the scrollback pager
    history buffer (`4435`{.interpreted-text role="iss"})
-   When dropping URLs/files onto kitty at a shell prompt insert them
    appropriately quoted and space separated (`4734`{.interpreted-text
    role="iss"})
-   Improve CWD detection when there are multiple foreground processes
    in the TTY process group
-   A new option `narrow_symbols`{.interpreted-text role="opt"} to turn
    off opportunistic wide rendering of private use codepoints
-   ssh kitten: Fix location of generated terminfo files on NetBSD
    (`4622`{.interpreted-text role="iss"})
-   A new action to clear the screen up to the line containing the
    cursor, see `clear_terminal`{.interpreted-text role="ac"}
-   A new action `copy_ansi_to_clipboard`{.interpreted-text role="ac"}
    to copy the current selection with ANSI formatting codes
    (`4665`{.interpreted-text role="iss"})
-   Linux: Do not rescale fallback fonts to match the main font cell
    height, instead just set the font size and let FreeType take care of
    it. This matches rendering on macOS (`4707`{.interpreted-text
    role="iss"})
-   macOS: Fix a regression in the previous release that broke switching
    input sources by keyboard (`4621`{.interpreted-text role="iss"})
-   macOS: Add the default shortcut `cmd+k`{.interpreted-text
    role="kbd"} to clear the terminal screen and scrollback up to the
    cursor (`4625`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that broke strikethrough
    (`4632`{.interpreted-text role="disc"})
-   A new action `scroll_prompt_to_bottom`{.interpreted-text role="ac"}
    to move the current prompt to the bottom, filling in the window from
    the scrollback (`4634`{.interpreted-text role="pull"})
-   Add two special arguments `@first-line-on-screen` and
    `@last-line-on-screen` for the `launch <launch>`{.interpreted-text
    role="doc"} command to be used for pager positioning.
    (`4462`{.interpreted-text role="iss"})
-   Linux: Fix rendering of emoji when using scalable fonts such as
    Segoe UI Emoji
-   Shell integration: bash: Dont fail if an existing
    PROMPT[COMMAND]{#command} ends with a semi-colon
    (`4645`{.interpreted-text role="iss"})
-   Shell integration: bash: Fix rendering of multiline prompts with
    more than two lines (`4681`{.interpreted-text role="iss"})
-   Shell integration: fish: Check fish version 3.3.0+ and exit on
    outdated versions (`4745`{.interpreted-text role="pull"})
-   Shell integration: fish: Fix pipestatus being overwritten
    (`4756`{.interpreted-text role="pull"})
-   Linux: Fix fontconfig alias not being used if the aliased font is
    dual spaced instead of monospaced (`4649`{.interpreted-text
    role="iss"})
-   macOS: Add an option
    `macos_menubar_title_max_length`{.interpreted-text role="opt"} to
    control the max length of the window title displayed in the global
    menubar (`2132`{.interpreted-text role="iss"})
-   Fix `touch_scroll_multiplier`{.interpreted-text role="opt"} also
    taking effect in terminal programs such as vim that handle mouse
    events themselves (`4680`{.interpreted-text role="iss"})
-   Fix symbol/PUA glyphs loaded via `symbol_map`{.interpreted-text
    role="opt"} instead of as fallbacks not using following spaces to
    render larger versions (`4670`{.interpreted-text role="iss"})
-   macOS: Fix regression in previous release that caused Apple\'s
    global shortcuts to not work if they had never been configured on a
    particular machine (`4657`{.interpreted-text role="iss"})
-   Fix a fast *click, move mouse, click* sequence causing the first
    click event to be discarded (`4603`{.interpreted-text role="iss"})
-   Wayland: Fix wheel mice with line based scrolling being incorrectly
    handled as high precision devices (`4694`{.interpreted-text
    role="iss"})
-   Wayland: Fix touchpads and high resolution wheels not scrolling at
    the same speed on monitors with different scales
    (`4703`{.interpreted-text role="iss"})
-   Add an option `wheel_scroll_min_lines`{.interpreted-text role="opt"}
    to set the minimum number of lines for mouse wheel scrolling when
    using a mouse with a wheel that generates very small offsets when
    slow scrolling (`4710`{.interpreted-text role="pull"})
-   macOS: Make the shortcut to toggle full screen configurable
    (`4714`{.interpreted-text role="pull"})
-   macOS: Fix the mouse cursor being set to arrow after switching
    desktops or toggling full screen (`4716`{.interpreted-text
    role="pull"})
-   Fix copying of selection after selection has been scrolled off
    history buffer raising an error (`4713`{.interpreted-text
    role="iss"})

### 0.24.2 \[2022-02-03\]

-   macOS: Allow opening text files, images and directories with kitty
    when launched using \"Open with\" in Finder
    (`4460`{.interpreted-text role="iss"})
-   Allow including config files matching glob patterns in
    `kitty.conf`{.interpreted-text role="file"}
    (`4533`{.interpreted-text role="iss"})
-   Shell integration: Fix bash integration not working when
    `PROMPT_COMMAND` is used to change the prompt variables
    (`4476`{.interpreted-text role="iss"})
-   Shell integration: Fix cursor shape not being restored to default
    when running commands in the shell
-   Improve the UI of the ask kitten (`4545`{.interpreted-text
    role="iss"})
-   Allow customizing the placement and formatting of the
    `tab_activity_symbol`{.interpreted-text role="opt"} and
    `bell_on_tab`{.interpreted-text role="opt"} symbols by adding them
    to the `tab_title_template`{.interpreted-text role="opt"}
    (`4581`{.interpreted-text role="iss"}, `4507`{.interpreted-text
    role="pull"})
-   macOS: Persist \"Secure Keyboard Entry\" across restarts to match
    the behavior of Terminal.app (`4471`{.interpreted-text role="iss"})
-   hints kitten: Fix common single letter extension files not being
    detected (`4491`{.interpreted-text role="iss"})
-   Support dotted and dashed underline styles (`4529`{.interpreted-text
    role="pull"})
-   For the vertical and horizontal layouts have the windows arranged on
    a ring rather than a plane. This means the first and last window are
    considered neighbors (`4494`{.interpreted-text role="iss"})
-   A new action to clear the current selection
    (`4600`{.interpreted-text role="iss"})
-   Shell integration: fish: Fix cursor shape not working with fish\'s
    vi mode (`4508`{.interpreted-text role="iss"})
-   Shell integration: fish: Dont override fish\'s native title setting
    functionality. See
    [discussion](https://github.com/fish-shell/fish-shell/issues/8641).
-   macOS: Fix hiding via `cmd+h`{.interpreted-text role="kbd"} not
    working on macOS 10.15.7 (`4472`{.interpreted-text role="iss"})
-   Draw the dots for braille characters more evenly spaced at all font
    sizes (`4499`{.interpreted-text role="iss"})
-   icat kitten: Add options to mirror images and remove their
    transparency before displaying them (`4513`{.interpreted-text
    role="iss"})
-   macOS: Respect the users system-wide global keyboard shortcut
    preferences (`4501`{.interpreted-text role="iss"})
-   macOS: Fix a few key-presses causing beeps from Cocoa\'s text input
    system (`4489`{.interpreted-text role="iss"})
-   macOS: Fix using shortcuts from the global menu bar as subsequent
    key presses in a multi key mapping not working
    (`4519`{.interpreted-text role="iss"})
-   Fix getting last command output not working correctly when the
    screen is scrolled (`4522`{.interpreted-text role="pull"})
-   Show number of windows per tab in the `select_tab`{.interpreted-text
    role="ac"} action (`4523`{.interpreted-text role="pull"})
-   macOS: Fix the shift key not clearing pre-edit text in IME
    (`4541`{.interpreted-text role="iss"})
-   Fix clicking in a window to focus it and typing immediately
    sometimes having unexpected effects if at a shell prompt
    (`4128`{.interpreted-text role="iss"})
-   themes kitten: Allow writing to a different file than
    `kitty.conf`{.interpreted-text role="file"}.

### 0.24.1 \[2022-01-06\]

-   Shell integration: Work around conflicts with some zsh plugins
    (`4428`{.interpreted-text role="iss"})
-   Have the zero width space and various other characters from the
    *Other, formatting* Unicode category be treated as combining
    characters (`4439`{.interpreted-text role="iss"})
-   Fix using `--shell-integration` with `setup.py`{.interpreted-text
    role="file"} broken (`4434`{.interpreted-text role="iss"})
-   Fix showing debug information not working if kitty\'s
    `STDIN`{.interpreted-text role="file"} is not a tty
    (`4424`{.interpreted-text role="iss"})
-   Linux: Fix a regression that broke rendering of emoji with variation
    selectors (`4444`{.interpreted-text role="iss"})

### 0.24.0 \[2022-01-04\]

-   Integrate kitty closely with common shells such as zsh, fish and
    bash. This allows lots of niceties such as jumping to previous
    prompts, opening the output of the last command in a new window,
    etc. See `shell_integration`{.interpreted-text role="ref"} for
    details. Packagers please read `packagers`{.interpreted-text
    role="ref"}.
-   A new shortcut `focus_visible_window`{.interpreted-text role="sc"}
    to visually focus a window using the keyboard. Pressing it causes
    numbers to appear over each visible window and you can press the
    number to focus the corresponding window (`4110`{.interpreted-text
    role="iss"})
-   A new facility `window_logo_path`{.interpreted-text role="opt"} to
    draw an arbitrary PNG image as logo in the corner of a kitty window
    (`4167`{.interpreted-text role="pull"})
-   Allow rendering the cursor with a *reverse video* effect. See
    `cursor`{.interpreted-text role="opt"} for details
    (`126`{.interpreted-text role="iss"})
-   Allow rendering the mouse selection with a *reverse video* effect.
    See `selection_foreground`{.interpreted-text role="opt"}
    (`646`{.interpreted-text role="iss"})
-   A new option `tab_bar_align`{.interpreted-text role="opt"} to draw
    the tab bar centered or right aligned (`3946`{.interpreted-text
    role="iss"})
-   Allow the user to supply a custom Python function to draw tab bar.
    See `tab_bar_style`{.interpreted-text role="opt"}
-   A new remote control command to `change the tab color <kitty @
    set-tab-color>`{.interpreted-text role="program"}
    (`1287`{.interpreted-text role="iss"})
-   A new remote control command to `visually select a window <kitty @
    select-window>`{.interpreted-text role="program"}
    (`4165`{.interpreted-text role="iss"})
-   Add support for reporting mouse events with pixel coordinates using
    the `SGR_PIXEL_PROTOCOL` introduced in xterm 359
-   When programs ask to read from the clipboard prompt, ask the user to
    allow the request by default instead of denying it by default. See
    `clipboard_control`{.interpreted-text role="opt"} for details
    (`4022`{.interpreted-text role="iss"})
-   A new mappable action `swap_with_window` to swap the current window
    with another window in the tab, visually
-   A new
    `remote control command <kitty @ set-enabled-layouts>`{.interpreted-text
    role="program"} to change the enabled layouts in a tab
    (`4129`{.interpreted-text role="iss"})
-   A new option `bell_path`{.interpreted-text role="opt"} to specify
    the path to a sound file to use as the bell sound
-   A new option `exe_search_path`{.interpreted-text role="opt"} to
    modify the locations kitty searches for executables to run
    (`4324`{.interpreted-text role="iss"})
-   broadcast kitten: Show a \"fake\" cursor in all windows being
    broadcast too (`4225`{.interpreted-text role="iss"})
-   Allow defining `aliases <action_alias>`{.interpreted-text
    role="opt"} for more general actions, not just kittens
    (`4260`{.interpreted-text role="pull"})
-   Fix a regression that caused `kitty --title`{.interpreted-text
    role="option"} to not work when opening new OS windows using
    `kitty --single-instance`{.interpreted-text role="option"}
    (`3893`{.interpreted-text role="iss"})
-   icat kitten: Fix display of JPEG images that are rotated via EXIF
    data and larger than available screen size (`3949`{.interpreted-text
    role="iss"})
-   macOS: Fix SIGUSR1 quitting kitty instead of reloading the config
    file (`3952`{.interpreted-text role="iss"})
-   Launch command: Allow specifying the OS window title
-   broadcast kitten: Allow broadcasting `ctrl+c`{.interpreted-text
    role="kbd"} (`3956`{.interpreted-text role="pull"})
-   Fix space ligatures not working with Iosevka for some characters in
    the Enclosed Alphanumeric Supplement (`3954`{.interpreted-text
    role="iss"})
-   hints kitten: Fix a regression that caused using the default open
    program to trigger open actions instead of running the program
    (`3968`{.interpreted-text role="iss"})
-   Allow deleting environment variables in `env`{.interpreted-text
    role="opt"} by specifying just the variable name, without a value
-   Fix `active_tab_foreground`{.interpreted-text role="opt"} not being
    honored when `tab_bar_style`{.interpreted-text role="opt"} is
    `slant` (`4053`{.interpreted-text role="iss"})
-   When a `tab_bar_background`{.interpreted-text role="opt"} is
    specified it should extend to the edges of the OS window
    (`4054`{.interpreted-text role="iss"})
-   Linux: Fix IME with fcitx5 not working after fcitx5 is restarted
    (`4059`{.interpreted-text role="pull"})
-   Various improvements to IME integration (`4219`{.interpreted-text
    role="iss"})
-   Remote file transfer: Fix transfer not working if custom ssh port or
    identity is specified on the command line (`4067`{.interpreted-text
    role="iss"})
-   Unicode input kitten: Implement scrolling when more results are
    found than the available display space (`4068`{.interpreted-text
    role="pull"})
-   Allow middle clicking on a tab to close it (`4151`{.interpreted-text
    role="iss"})
-   The command line option `--watcher` has been deprecated in favor of
    the `watcher`{.interpreted-text role="opt"} option in
    `kitty.conf`{.interpreted-text role="file"}. It has the advantage of
    applying to all windows, not just the initially created ones. Note
    that `--watcher` now also applies to all windows, not just initially
    created ones.
-   **Backward incompatibility**: No longer turn on the kitty extended
    keyboard protocol\'s disambiguate mode when the client sends the
    XTMODKEYS escape code. Applications must use the dedicated escape
    code to turn on the protocol. (`4075`{.interpreted-text role="iss"})
-   Fix soft hyphens not being preserved when round tripping text
    through the terminal
-   macOS: Fix `ctrl+shift`{.interpreted-text role="kbd"} with
    `Esc`{.interpreted-text role="kbd"} or `F1`{.interpreted-text
    role="kbd"} - `F12`{.interpreted-text role="kbd"} not working
    (`4109`{.interpreted-text role="iss"})
-   macOS: Fix `resize_in_steps`{.interpreted-text role="opt"} not
    working correctly on high DPI screens (`4114`{.interpreted-text
    role="iss"})
-   Fix the
    `resize OS Windows <kitty @ resize-os-window>`{.interpreted-text
    role="program"} setting a slightly incorrect size on high DPI
    screens (`4114`{.interpreted-text role="iss"})
-   `kitty @ launch`{.interpreted-text role="program"} - when creating
    tabs with the `--match` option create the tab in the OS Window
    containing the result of the match rather than the active OS Window
    (`4126`{.interpreted-text role="iss"})
-   Linux X11: Add support for 10bit colors (`4150`{.interpreted-text
    role="iss"})
-   Fix various issues with changing
    `tab_bar_background`{.interpreted-text role="opt"} by remote control
    (`4152`{.interpreted-text role="iss"})
-   A new option `tab_bar_margin_color`{.interpreted-text role="opt"} to
    control the color of the tab bar margins
-   A new option `visual_bell_color`{.interpreted-text role="opt"} to
    customize the color of the visual bell (`4181`{.interpreted-text
    role="pull"})
-   Add support for OSC 777 based desktop notifications
-   Wayland: Fix pasting from applications that use a MIME type of
    \"text/plain\" rather than \"text/plain;charset=utf-8\" not working
    (`4183`{.interpreted-text role="iss"})
-   A new mappable action to close windows with a confirmation
    (`4195`{.interpreted-text role="iss"})
-   When remembering OS window sizes for full screen windows use the
    size before the window became fullscreen (`4221`{.interpreted-text
    role="iss"})
-   macOS: Fix keyboard input not working after toggling fullscreen till
    the window is clicked in
-   A new mappable action `nth_os_window` to focus the specified nth OS
    window. (`4316`{.interpreted-text role="pull"})
-   macOS: The kitty window can be scrolled by the mouse wheel when OS
    window not in focus. (`4371`{.interpreted-text role="pull"})
-   macOS: Light or dark system appearance can be specified in
    `macos_titlebar_color`{.interpreted-text role="opt"} and used in
    kitty themes. (`4378`{.interpreted-text role="pull"})

### 0.23.1 \[2021-08-17\]

-   macOS: Fix themes kitten failing to download themes because of
    missing SSL root certificates (`3936`{.interpreted-text role="iss"})
-   A new option `clipboard_max_size`{.interpreted-text role="opt"} to
    control the maximum size of data that kitty will transmit to the
    system clipboard on behalf of programs running inside it
    (`3937`{.interpreted-text role="iss"})
-   When matching windows/tabs in kittens or using remote control, allow
    matching by recency. `recent:0` matches the active window/tab,
    `recent:1` matches the previous window/tab and so on
-   themes kitten: Fix only the first custom theme file being loaded
    correctly (`3938`{.interpreted-text role="iss"})

### 0.23.0 \[2021-08-16\]

-   A new `themes kitten </kittens/themes>`{.interpreted-text
    role="doc"} to easily change kitty themes. Choose from almost two
    hundred themes in the [kitty themes
    repository](https://github.com/kovidgoyal/kitty-themes)
-   A new style for the tab bar that makes tabs looks like the tabs in a
    physical tabbed file, see `tab_bar_style`{.interpreted-text
    role="opt"}
-   Make the visual bell flash more gentle, especially on dark themes
    (`2937`{.interpreted-text role="pull"})
-   Fix `kitty --title`{.interpreted-text role="option"} not overriding
    the OS Window title when multiple tabs are present. Also this option
    is no longer used as the default title for windows, allowing
    individual tabs/windows to have their own titles, even when the OS
    Window has a fixed overall title (`3893`{.interpreted-text
    role="iss"})
-   Linux: Fix some very long ligatures being rendered incorrectly at
    some font sizes (`3896`{.interpreted-text role="iss"})
-   Fix shift+middle click to paste sending a mouse press event but no
    release event which breaks some applications that grab the mouse but
    can\'t handle mouse events (`3902`{.interpreted-text role="iss"})
-   macOS: When the language is set to English and the country to one
    for which an English locale does not exist, set
    `LANG`{.interpreted-text role="envvar"} to `en_US.UTF-8`
    (`3899`{.interpreted-text role="iss"})
-   terminfo: Fix \"cnorm\" the property for setting the cursor to
    normal using a solid block rather than a blinking block cursor
    (`3906`{.interpreted-text role="iss"})
-   Add `clear_all_mouse_actions`{.interpreted-text role="opt"} to clear
    all mouse actions defined to that point (`3907`{.interpreted-text
    role="iss"})
-   Fix the remote file kitten not working when using \-- with ssh. The
    ssh kitten was recently changed to do this (`3929`{.interpreted-text
    role="iss"})
-   When dragging word or line selections, ensure the initially selected
    item is never deselected. This matches behavior in most other
    programs (`3930`{.interpreted-text role="iss"})
-   hints kitten: Make copy/paste with the `kitty +kitten hints
    --program`{.interpreted-text role="option"} option work when using
    the `self` `kitty +kitten hints --linenum-action`{.interpreted-text
    role="option"} (`3931`{.interpreted-text role="iss"})

### 0.22.2 \[2021-08-02\]

-   macOS: Fix a long standing bug that could cause kitty windows to
    stop updating, that got worse in the previous release
    (`3890`{.interpreted-text role="iss"} and `2016`{.interpreted-text
    role="iss"})
-   Wayland: A better fix for compositors like sway that can toggle
    client side decorations on and off (`3888`{.interpreted-text
    role="iss"})

### 0.22.1 \[2021-07-31\]

-   Fix a regression in the previous release that broke `kitty --help`
    (`3869`{.interpreted-text role="iss"})
-   Graphics protocol: Fix composing onto currently displayed frame not
    updating the frame on the GPU (`3874`{.interpreted-text role="iss"})
-   Fix switching to previously active tab after detaching a tab not
    working (`3871`{.interpreted-text role="pull"})
-   macOS: Fix an error on Apple silicon when enumerating monitors
    (`3875`{.interpreted-text role="pull"})
-   detach[window]{#window}: Allow specifying the previously active tab
    or the tab to the left/right of the active tab
    (`3877`{.interpreted-text role="disc"})
-   broadcast kitten: Fix a regression in `0.20.0` that broke sending of
    some keys, such as backspace
-   Linux binary: Remove any RPATH build artifacts from bundled
    libraries
-   Wayland: If the compositor turns off server side decorations after
    turning them on do not draw client side decorations
    (`3888`{.interpreted-text role="iss"})

### 0.22.0 \[2021-07-26\]

-   Add a new `toggle_layout`{.interpreted-text role="ac"} action to
    easily zoom/unzoom a window
-   When right clicking to extend a selection, move the nearest
    selection boundary rather than the end of the selection. To restore
    previous behavior use
    `mouse_map right press ungrabbed mouse_selection move-end`.
-   When opening hyperlinks, allow defining open actions for directories
    (`3836`{.interpreted-text role="pull"})
-   When using the OSC 52 escape code to copy to clipboard allow large
    copies (up to 8MB) without needing a kitty specific chunking
    protocol. Note that if you used the chunking protocol in the past,
    it will no longer work and you should switch to using the unmodified
    protocol which has the advantage of working with all terminal
    emulators.
-   Fix a bug in the implementation of the synchronized updates escape
    code that could cause incorrect parsing if either the pending buffer
    capacity or the pending timeout were exceeded
    (`3779`{.interpreted-text role="iss"})
-   A new remote control command to `resize the OS Window <kitty @
    resize-os-window>`{.interpreted-text role="program"}
-   Graphics protocol: Add support for composing rectangles from one
    animation frame onto another (`3809`{.interpreted-text role="iss"})
-   diff kitten: Remove limit on max line length of 4096 characters
    (`3806`{.interpreted-text role="iss"})
-   Fix turning off cursor blink via escape codes not working
    (`3808`{.interpreted-text role="iss"})
-   Allow using neighboring window operations in the stack layout. The
    previous window is considered the left and top neighbor and the next
    window is considered the bottom and right neighbor
    (`3778`{.interpreted-text role="iss"})
-   macOS: Render colors in the sRGB colorspace to match other macOS
    terminal applications (`2249`{.interpreted-text role="iss"})
-   Add a new variable `{num_window_groups}` for the
    `tab_title_template`{.interpreted-text role="opt"}
    (`3837`{.interpreted-text role="iss"})
-   Wayland: Fix
    `initial_window_width/height <remember_window_size>`{.interpreted-text
    role="opt"} specified in cells not working on High DPI screens
    (`3834`{.interpreted-text role="iss"})
-   A new theme for the kitty website with support for dark mode.
-   Render ┄ ┅ ┆ ┇ ┈ ┉ ┊ ┋ with spaces at the edges. Matches rendering
    in most other programs and allows long chains of them to look better
    (`3844`{.interpreted-text role="iss"})
-   hints kitten: Detect paths and hashes that appear over multiple
    lines. Note that this means that all line breaks in the text are no
    longer n soft breaks are instead r. If you use a custom regular
    expression that is meant to match over line breaks, you will need to
    match over both. (`3845`{.interpreted-text role="iss"})
-   Allow leading or trailing spaces in
    `tab_activity_symbol`{.interpreted-text role="opt"}
-   Fix mouse actions not working when caps lock or num lock are engaged
    (`3859`{.interpreted-text role="iss"})
-   macOS: Fix automatic detection of bold/italic faces for fonts that
    use the family name as the full face name of the regular font not
    working (`3861`{.interpreted-text role="iss"})
-   clipboard kitten: fix copies to clipboard not working without the
    `kitty +kitten clipboard --wait-for-completion`{.interpreted-text
    role="option"} option

### 0.21.2 \[2021-06-28\]

-   A new `adjust_baseline` option to adjust the vertical alignment of
    text inside a line (`3734`{.interpreted-text role="pull"})
-   A new `url_excluded_characters`{.interpreted-text role="opt"} option
    to exclude additional characters when detecting URLs under the mouse
    (`3738`{.interpreted-text role="pull"})
-   Fix a regression in 0.21.0 that broke rendering of private use
    Unicode symbols followed by spaces, when they also exist not
    followed by spaces (`3729`{.interpreted-text role="iss"})
-   ssh kitten: Support systems where the login shell is a non-POSIX
    shell (`3405`{.interpreted-text role="iss"})
-   ssh kitten: Add completion (`3760`{.interpreted-text role="iss"})
-   ssh kitten: Fix \"Connection closed\" message being printed by ssh
    when running remote commands
-   Add support for the XTVERSION escape code
-   macOS: Fix a regression in 0.21.0 that broke middle-click to paste
    from clipboard (`3730`{.interpreted-text role="iss"})
-   macOS: Fix shortcuts in the global menu bar responding slowly when
    cursor blink is disabled/timed out (`3693`{.interpreted-text
    role="iss"})
-   When displaying scrollback ensure that the window does not quit if
    the amount of scrollback is less than a screen and the user has the
    `--quit-if-one-screen` option enabled for less
    (`3740`{.interpreted-text role="iss"})
-   Linux: Fix Emoji/bitmapped fonts not use able in symbol[map]{#map}
-   query terminal kitten: Allow querying font face and size information
    (`3756`{.interpreted-text role="iss"})
-   hyperlinked grep kitten: Fix context options not generating
    contextual output (`3759`{.interpreted-text role="iss"})
-   Allow using superscripts in tab titles (`3763`{.interpreted-text
    role="iss"})
-   Unicode input kitten: Fix searching when a word has more than 1024
    matches (`3773`{.interpreted-text role="iss"})

### 0.21.1 \[2021-06-14\]

-   macOS: Fix a regression in the previous release that broke rendering
    of strikeout (`3717`{.interpreted-text role="iss"})
-   macOS: Fix a crash when rendering ligatures larger than 128
    characters (`3724`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that could cause a crash
    when changing layouts and mousing (`3713`{.interpreted-text
    role="iss"})

### 0.21.0 \[2021-06-12\]

-   Allow reloading the `kitty.conf`{.interpreted-text role="file"}
    config file by pressing `reload_config_file`{.interpreted-text
    role="sc"}. (`1292`{.interpreted-text role="iss"})
-   Allow clicking URLs to open them without needing to also hold
    `ctrl+shift`{.interpreted-text role="kbd"}
-   Allow remapping all mouse button press/release events to perform
    arbitrary actions.
    `See details <conf-kitty-mouse.mousemap>`{.interpreted-text
    role="ref"} (`1033`{.interpreted-text role="iss"})
-   Support infinite length ligatures (`3504`{.interpreted-text
    role="iss"})
-   **Backward incompatibility**: The options to control which modifiers
    keys to press for various mouse actions have been removed, if you
    used these options, you will need to replace them with configuration
    using the new
    `mouse actions framework <conf-kitty-mouse.mousemap>`{.interpreted-text
    role="ref"} as they will be ignored. The options were:
    `terminal_select_modifiers`, `rectangle_select_modifiers` and
    `open_url_modifiers`.
-   Add a configurable mouse action
    (`ctrl+alt+triplepress`{.interpreted-text role="kbd"} to select from
    the clicked point to the end of the line. (`3585`{.interpreted-text
    role="iss"})
-   Add the ability to un-scroll the screen to the
    `kitty @ scroll-window` remote control command
    (`3604`{.interpreted-text role="iss"})
-   A new option, `tab_bar_margin_height`{.interpreted-text role="opt"}
    to add margins around the top and bottom edges of the tab bar
    (`3247`{.interpreted-text role="iss"})
-   Unicode input kitten: Fix a regression in 0.20.0 that broke keyboard
    handling when the NumLock or CapsLock modifiers were engaged.
    (`3587`{.interpreted-text role="iss"})
-   Fix a regression in 0.20.0 that sent incorrect bytes for the
    `F1`{.interpreted-text role="kbd"}-`F4`{.interpreted-text
    role="kbd"} keys in rmkx mode (`3586`{.interpreted-text role="iss"})
-   macOS: When the Apple Color Emoji font lacks an emoji glyph search
    for it in other installed fonts (`3591`{.interpreted-text
    role="iss"})
-   macOS: Fix rendering getting stuck on some machines after
    sleep/screensaver (`2016`{.interpreted-text role="iss"})
-   macOS: Add a new `Shell` menu to the global menubar with some
    commonly used actions (`3653`{.interpreted-text role="pull"})
-   macOS: Fix the baseline for text not matching other CoreText based
    applications for some fonts (`2022`{.interpreted-text role="iss"})
-   Add a few more special commandline arguments for the launch command.
    Now all `KITTY_PIPE_DATA` is also available via command line
    argument substitution (`3593`{.interpreted-text role="iss"})
-   Fix dynamically changing the background color in a window causing
    rendering artifacts in the tab bar (`3595`{.interpreted-text
    role="iss"})
-   Fix passing STDIN to launched background processes causing them to
    not inherit environment variables (`3603`{.interpreted-text
    role="pull"})
-   Fix deleting windows that are not the last window via remote control
    leaving no window focused (`3619`{.interpreted-text role="iss"})
-   Add an option `kitten @ get-text --add-cursor`{.interpreted-text
    role="option"} to also get the current cursor position and state as
    ANSI escape codes (`3625`{.interpreted-text role="iss"})
-   Add an option
    `kitten @ get-text --add-wrap-markers`{.interpreted-text
    role="option"} to add line wrap markers to the output
    (`3633`{.interpreted-text role="pull"})
-   Improve rendering of curly underlines on HiDPI screens
    (`3637`{.interpreted-text role="pull"})
-   ssh kitten: Mimic behavior of ssh command line client more closely
    by executing any command specified on the command line via the
    users\' shell just as ssh does (`3638`{.interpreted-text
    role="iss"})
-   Fix trailing parentheses in URLs not being detected
    (`3688`{.interpreted-text role="iss"})
-   Tab bar: Use a lower contrast color for tab separators
    (`3666`{.interpreted-text role="pull"})
-   Fix a regression that caused using the `title` command in session
    files to stop working (`3676`{.interpreted-text role="iss"})
-   macOS: Fix a rare crash on exit (`3686`{.interpreted-text
    role="iss"})
-   Fix ligatures not working with the
    [Iosevka](https://github.com/be5invis/Iosevka) font (requires
    Iosevka \>= 7.0.4) (`297`{.interpreted-text role="iss"})
-   Remote control: Allow matching tabs by index number in currently
    active OS Window (`3708`{.interpreted-text role="iss"})
-   ssh kitten: Fix non-standard properties in terminfo such as the ones
    used for true color not being copied (`312`{.interpreted-text
    role="iss"})

### 0.20.3 \[2021-05-06\]

-   macOS: Distribute universal binaries with both ARM and Intel
    architectures
-   A new `show_key` kitten to easily see the bytes generated by the
    terminal for key presses in the various keyboard modes
    (`3556`{.interpreted-text role="pull"})
-   Linux: Fix keyboard layout change keys defined via compose rules not
    being ignored
-   macOS: Fix Spotlight search of global menu not working in
    non-English locales (`3567`{.interpreted-text role="pull"})
-   Fix tab activity symbol not appearing if no other changes happen in
    tab bar even when there is activity in a tab
    (`3571`{.interpreted-text role="iss"})
-   Fix focus changes not being sent to windows when focused window
    changes because of the previously focused window being closed
    (`3571`{.interpreted-text role="iss"})

### 0.20.2 \[2021-04-28\]

-   A new protocol extension to `unscroll <unscroll>`{.interpreted-text
    role="ref"} text from the scrollback buffer onto the screen. Useful,
    for example, to restore the screen after showing completions below
    the shell prompt.
-   A new remote control command `at-env`{.interpreted-text role="ref"}
    to change the default environment passed to newly created windows
    (`3529`{.interpreted-text role="iss"})
-   Linux: Fix binary kitty builds not able to load fonts in WOFF2
    format (`3506`{.interpreted-text role="iss"})
-   macOS: Prevent `option`{.interpreted-text role="kbd"} based
    shortcuts for being used for global menu actions
    (`3515`{.interpreted-text role="iss"})
-   Fix `kitty @ close-tab` not working with pipe based remote control
    (`3510`{.interpreted-text role="iss"})
-   Fix removal of inactive tab that is before the currently active tab
    causing the highlighted tab to be incorrect
    (`3516`{.interpreted-text role="iss"})
-   icat kitten: Respect EXIF orientation when displaying JPEG images
    (`3518`{.interpreted-text role="iss"})
-   GNOME: Fix maximize state not being remembered when focus changes
    and window decorations are hidden (`3507`{.interpreted-text
    role="iss"})
-   GNOME: Add a new `wayland_titlebar_color`{.interpreted-text
    role="opt"} option to control the color of the kitty window title
    bar
-   Fix reading `kitty --session`{.interpreted-text role="option"} from
    `STDIN` not working when the `kitty --detach` option is used
    (`3523`{.interpreted-text role="iss"})
-   Special case rendering of the few remaining Powerline box drawing
    chars (`3535`{.interpreted-text role="iss"})
-   Fix `kitty @ set-colors` not working for the
    `active_tab_foreground`{.interpreted-text role="opt"}.

### 0.20.1 \[2021-04-19\]

-   icat: Fix some broken GIF images with no frame delays not being
    animated (`3498`{.interpreted-text role="iss"})
-   hints kitten: Fix sending hyperlinks to their default handler not
    working (`3500`{.interpreted-text role="pull"})
-   Wayland: Fix regression in previous release causing window
    decorations to be drawn even when compositor supports server side
    decorations (`3501`{.interpreted-text role="iss"})

### 0.20.0 \[2021-04-19\]

-   Support display of animated images
    `kitty +kitten icat animation.gif`. See
    `animation_protocol`{.interpreted-text role="ref"} for details on
    animation support in the kitty graphics protocol.
-   A new keyboard reporting protocol with various advanced features
    that can be used by full screen terminal programs and even games,
    see `keyboard-protocol`{.interpreted-text role="doc"}
    (`3248`{.interpreted-text role="iss"})
-   **Backward incompatibility**: Session files now use the full
    `launch <launch>`{.interpreted-text role="doc"} command with all its
    capabilities. However, the syntax of the command is slightly
    different from before. In particular watchers are now specified
    directly on launch and environment variables are set using `--env`.
-   Allow setting colors when creating windows using the
    `launch <launch>`{.interpreted-text role="doc"} command.
-   A new option `tab_powerline_style`{.interpreted-text role="opt"} to
    control the appearance of the tab bar when using the powerline tab
    bar style.
-   A new option `scrollback_fill_enlarged_window`{.interpreted-text
    role="opt"} to fill extra lines in the window when the window is
    expanded with lines from the scrollback (`3371`{.interpreted-text
    role="pull"})
-   diff kitten: Implement recursive diff over SSH
    (`3268`{.interpreted-text role="iss"})
-   ssh kitten: Allow using python instead of the shell on the server,
    useful if the shell used is a non-POSIX compliant one, such as fish
    (`3277`{.interpreted-text role="iss"})
-   Add support for the color settings stack that XTerm copied from us
    without acknowledgement and decided to use incompatible escape codes
    for.
-   Add entries to the terminfo file for some user capabilities that are
    shared with XTerm (`3193`{.interpreted-text role="pull"})
-   The launch command now does more sophisticated resolving of
    executables to run. The system-wide PATH is used first, then system
    specific default paths, and finally the PATH inside the shell.
-   Double clicking on empty tab bar area now opens a new tab
    (`3201`{.interpreted-text role="iss"})
-   kitty @ ls: Show only environment variables that are different for
    each window, by default.
-   When passing a directory or a non-executable file as the program to
    run to kitty opens it with the shell or by parsing the shebang,
    instead of just failing.
-   Linux: Fix rendering of emoji followed by the graphics variation
    selector not being colored with some fonts (`3211`{.interpreted-text
    role="iss"})
-   Unicode input: Fix using index in select by name mode not working
    for indices larger than 16. Also using an index does not filter the
    list of matches. (`3219`{.interpreted-text role="pull"})
-   Wayland: Add support for the text input protocol
    (`3410`{.interpreted-text role="iss"})
-   Wayland: Fix mouse handling when using client side decorations
-   Wayland: Fix un-maximizing a window not restoring its size to what
    it was before being maximized
-   GNOME/Wayland: Improve window decorations the titlebar now shows the
    window title. Allow running under Wayland on GNOME by default.
    (`3284`{.interpreted-text role="iss"})
-   Panel kitten: Allow setting WM[CLASS]{#class}
    (`3233`{.interpreted-text role="iss"})
-   macOS: Add menu items to close the OS window and the current tab
    (`3240`{.interpreted-text role="pull"}, `3246`{.interpreted-text
    role="iss"})
-   macOS: Allow opening script and command files with kitty
    (`3366`{.interpreted-text role="iss"})
-   Also detect `gemini://` URLs when hovering with the mouse
    (`3370`{.interpreted-text role="iss"})
-   When using a non-US keyboard layout and pressing
    `ctrl+key`{.interpreted-text role="kbd"} when the key matches an
    English key, send that to the program running in the terminal
    automatically (`2000`{.interpreted-text role="iss"})
-   When matching shortcuts, also match on shifted keys, so a shortcut
    defined as `ctrl+plus`{.interpreted-text role="kbd"} will match a
    keyboard where you have to press `shift+equal`{.interpreted-text
    role="kbd"} to get the plus key (`2000`{.interpreted-text
    role="iss"})
-   Fix extra space at bottom of OS window when using the fat layout
    with the tab bar at the top (`3258`{.interpreted-text role="iss"})
-   Fix window icon not working on X11 with 64bits
    (`3260`{.interpreted-text role="iss"})
-   Fix OS window sizes under 100px resulting in scaled display
    (`3307`{.interpreted-text role="iss"})
-   Fix rendering of ligatures in the latest release of Cascadia code,
    which for some reason puts empty glyphs after the ligature glyph
    rather than before it (`3313`{.interpreted-text role="iss"})
-   Improve handling of infinite length ligatures in newer versions of
    FiraCode and CascadiaCode. Now such ligatures are detected based on
    glyph naming convention. This removes the gap in the ligatures at
    cell boundaries (`2695`{.interpreted-text role="iss"})
-   macOS: Disable the native operating system tabs as they are
    non-functional and can be confusing (`3325`{.interpreted-text
    role="iss"})
-   hints kitten: When using the linenumber action with a background
    action, preserve the working directory (`3352`{.interpreted-text
    role="iss"})
-   Graphics protocol: Fix suppression of responses not working for
    chunked transmission (`3375`{.interpreted-text role="iss"})
-   Fix inactive tab closing causing active tab to change
    (`3398`{.interpreted-text role="iss"})
-   Fix a crash on systems using musl as libc (`3395`{.interpreted-text
    role="iss"})
-   Improve rendering of rounded corners by using a rectircle equation
    rather than a cubic bezier (`3409`{.interpreted-text role="iss"})
-   Graphics protocol: Add a control to allow clients to specify that
    the cursor should not move when displaying an image
    (`3411`{.interpreted-text role="iss"})
-   Fix marking of text not working on lines that contain zero cells
    (`3403`{.interpreted-text role="iss"})
-   Fix the selection getting changed if the screen contents scroll
    while the selection is in progress (`3431`{.interpreted-text
    role="iss"})
-   X11: Fix `resize_in_steps`{.interpreted-text role="opt"} being
    applied even when window is maximized (`3473`{.interpreted-text
    role="iss"})

### 0.19.3 \[2020-12-19\]

-   Happy holidays to all kitty users!
-   A new `broadcast <kittens/broadcast>`{.interpreted-text role="doc"}
    kitten to type in all kitty windows simultaneously
    (`1569`{.interpreted-text role="iss"})
-   Add a new mappable [select_tab]{.title-ref} action to choose a tab
    to switch to even when the tab bar is hidden
    (`3115`{.interpreted-text role="iss"})
-   Allow specifying text formatting in
    `tab_title_template`{.interpreted-text role="opt"}
    (`3146`{.interpreted-text role="iss"})
-   Linux: Read `font_features`{.interpreted-text role="opt"} from the
    FontConfig database as well, so that they can be configured in a
    single, central location (`3174`{.interpreted-text role="pull"})
-   Graphics protocol: Add support for giving individual image
    placements their own ids and for asking the terminal emulator to
    assign ids for images. Also allow suppressing responses from the
    terminal to commands. These are backwards compatible protocol
    extensions. (`3133`{.interpreted-text role="iss"},
    `3163`{.interpreted-text role="iss"})
-   Distribute extra pixels among all eight-blocks rather than adding
    them all to the last block (`3097`{.interpreted-text role="iss"})
-   Fix drawing of a few sextant characters incorrect
    (`3105`{.interpreted-text role="pull"})
-   macOS: Fix minimize not working for chromeless windows
    (`3112`{.interpreted-text role="iss"})
-   Preserve lines in the scrollback if a scrolling region is defined
    that is contiguous with the top of the screen
    (`3113`{.interpreted-text role="iss"})
-   Wayland: Fix key repeat being stopped by the release of an unrelated
    key (`2191`{.interpreted-text role="iss"})
-   Add an option, `detect_urls`{.interpreted-text role="opt"} to
    control whether kitty will detect URLs when the mouse moves over
    them (`3118`{.interpreted-text role="pull"})
-   Graphics protocol: Dont return filename in the error message when
    opening file fails, since filenames can contain control characters
    (`3128`{.interpreted-text role="iss"})
-   macOS: Partial fix for traditional fullscreen not working on Big Sur
    (`3100`{.interpreted-text role="iss"})
-   Fix one ANSI formatting escape code not being removed from the pager
    history buffer when piping it as plain text
    (`3132`{.interpreted-text role="iss"})
-   Match the save/restore cursor behavior of other terminals, for the
    sake of interoperability. This means that doing a DECRC without a
    prior DECSC is now undefined (`1264`{.interpreted-text role="iss"})
-   Fix mapping `remote_control send-text` not working
    (`3147`{.interpreted-text role="iss"})
-   Add a `right` option for `tab_switch_strategy`{.interpreted-text
    role="opt"} (`3155`{.interpreted-text role="pull"})
-   Fix a regression in 0.19.0 that caused a rare crash when using the
    optional `scrollback_pager_history_size`{.interpreted-text
    role="opt"} (`3049`{.interpreted-text role="iss"})
-   Full screen kittens: Fix incorrect cursor position after kitten
    quits (`3176`{.interpreted-text role="iss"})

### 0.19.2 \[2020-11-13\]

-   A new `kittens/query_terminal`{.interpreted-text role="doc"} kitten
    to easily query the running kitty via escape codes to detect its
    version, and the values of configuration options that enable or
    disable terminal features.
-   Options to control mouse pointer shape,
    `default_pointer_shape`{.interpreted-text role="opt"}, and
    `pointer_shape_when_dragging`{.interpreted-text role="opt"}
    (`3041`{.interpreted-text role="pull"})
-   Font independent rendering for braille characters, which ensures
    they are properly aligned at all font sizes.
-   Fix a regression in 0.19.0 that caused borders not to be drawn when
    setting `window_margin_width`{.interpreted-text role="opt"} and
    keeping `draw_minimal_borders`{.interpreted-text role="opt"} on
    (`3017`{.interpreted-text role="iss"})
-   Fix a regression in 0.19.0 that broke rendering of one-eight bar
    unicode characters at very small font sizes
    (`3025`{.interpreted-text role="iss"})
-   Wayland: Fix a crash under GNOME when using multiple OS windows
    (`3066`{.interpreted-text role="pull"})
-   Fix selections created by dragging upwards not being auto-cleared
    when screen contents change (`3028`{.interpreted-text role="pull"})
-   macOS: Fix kitty not being added to PATH automatically when using
    pre-built binaries (`3063`{.interpreted-text role="iss"})
-   Allow adding MIME definitions to kitty by placing a `mime.types`
    file in the kitty config directory (`3056`{.interpreted-text
    role="iss"})
-   Dont ignore `--title`{.interpreted-text role="option"} when using a
    session file that defines no windows (`3055`{.interpreted-text
    role="iss"})
-   Fix the send[text]{#text} action not working in URL handlers
    (`3081`{.interpreted-text role="iss"})
-   Fix last character of URL not being detected if it is the only
    character on a new line (`3088`{.interpreted-text role="iss"})
-   Don\'t restrict the ICH,DCH,REP control codes to only the current
    scroll region (`3090`{.interpreted-text role="iss"},
    `3096`{.interpreted-text role="iss"})

### 0.19.1 \[2020-10-06\]

-   hints kitten: Add an `ip` type for easy selection of IP addresses
    (`3009`{.interpreted-text role="pull"})
-   Fix a regression that caused a segfault when using
    `scrollback_pager_history_size`{.interpreted-text role="opt"} and it
    needs to be expanded (`3011`{.interpreted-text role="iss"})
-   Fix update available notifications repeating
    (`3006`{.interpreted-text role="pull"})

### 0.19.0 \[2020-10-04\]

-   Add support for [hyperlinks from terminal
    programs](https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda).
    Controlled via `allow_hyperlinks`{.interpreted-text role="opt"}
    (`68`{.interpreted-text role="iss"})
-   Add support for easily editing or downloading files over SSH
    sessions without the need for any special software, see
    `kittens/remote_file`{.interpreted-text role="doc"}
-   A new `kittens/hyperlinked_grep`{.interpreted-text role="doc"}
    kitten to easily search files and open the results at the matched
    line by clicking on them.
-   Allow customizing the
    `actions kitty takes <open_actions>`{.interpreted-text role="doc"}
    when clicking on URLs
-   Improve rendering of borders when using minimal borders. Use less
    space and do not display a box around active windows
-   Add a new extensible escape code to allow terminal programs to
    trigger desktop notifications. See
    `notifications_on_the_desktop`{.interpreted-text role="ref"}
    (`1474`{.interpreted-text role="iss"})
-   Implement special rendering for various characters from the set of
    \"Symbols for Legacy Computing\" from the Unicode 13 standard
-   Unicode input kitten: Allow choosing symbols from the NERD font as
    well. These are mostly Private Use symbols not in any standard,
    however are common. (`2972`{.interpreted-text role="iss"})
-   Allow specifying border sizes in either pts or pixels. Change the
    default to 0.5pt borders as this works best with the new minimal
    border style
-   Add support for displaying correct colors with non-sRGB PNG files
    (Adds a dependency on liblcms2)
-   hints kitten: Add a new
    `kitty +kitten hints --type`{.interpreted-text role="option"} of
    `hyperlink` useful for activating hyperlinks using just the keyboard
-   Allow tracking focus change events in watchers
    (`2918`{.interpreted-text role="iss"})
-   Allow specifying watchers in session files and via a command line
    argument (`2933`{.interpreted-text role="iss"})
-   Add a setting `tab_activity_symbol`{.interpreted-text role="opt"} to
    show a symbol in the tab title if one of the windows has some
    activity after it was last focused (`2515`{.interpreted-text
    role="iss"})
-   macOS: Switch to using the User Notifications framework for
    notifications. The current notifications framework has been
    deprecated in Big Sur. The new framework only allows notifications
    from signed and notarized applications, so people using kitty from
    homebrew/source are out of luck. Complain to Apple.
-   When in the main screen and a program grabs the mouse, do not use
    the scroll wheel events to scroll the scrollback buffer, instead
    send them to the program (`2939`{.interpreted-text role="iss"})
-   Fix unfocused windows in which a bell occurs not changing their
    border color to red until a relayout
-   Linux: Fix automatic detection of bold/italic faces for fonts such
    as IBM Plex Mono that have the regular face with a full name that is
    the same as the family name (`2951`{.interpreted-text role="iss"})
-   Fix a regression that broke `kitten_alias`{.interpreted-text
    role="opt"} (`2952`{.interpreted-text role="iss"})
-   Fix a regression that broke the `move_window_to_top` action
    (`2953`{.interpreted-text role="pull"})
-   Fix a memory leak when changing font sizes
-   Fix some lines in the scrollback buffer not being properly rendered
    after a window resize/font size change (`2619`{.interpreted-text
    role="iss"})

### 0.18.3 \[2020-08-11\]

-   hints kitten: Allow customizing hint colors
    (`2894`{.interpreted-text role="pull"})
-   Wayland: Fix a typo in the previous release that broke reading mouse
    cursor size (`2895`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that could cause an
    exception during startup in rare circumstances
    (`2896`{.interpreted-text role="iss"})
-   Fix image leaving behind a black rectangle when switch away and back
    to alternate screen (`2901`{.interpreted-text role="iss"})
-   Fix one pixel misalignment of rounded corners when either the cell
    dimensions or the thickness of the line is an odd number of pixels
    (`2907`{.interpreted-text role="iss"})
-   Fix a regression that broke specifying OS window size in the session
    file (`2908`{.interpreted-text role="iss"})

### 0.18.2 \[2020-07-28\]

-   X11: Improve handling of multiple keyboards. Now pressing a modifier
    key in one keyboard and a normal key in another works
    (`2362`{.interpreted-text role="iss"}). Don\'t rebuild keymaps on
    new keyboard events that only change geometry
    (`2787`{.interpreted-text role="iss"}). Better handling of multiple
    keyboards with incompatible layouts (`2726`{.interpreted-text
    role="iss"})
-   Improve anti-aliasing of triangular box drawing characters,
    noticeable on low-resolution screens (`2844`{.interpreted-text
    role="iss"})
-   Fix `kitty @ send-text` not working reliably when using a socket for
    remote control (`2852`{.interpreted-text role="iss"})
-   Implement support for box drawing rounded-corners characters
    (`2240`{.interpreted-text role="iss"})
-   Allow setting the class for new OS windows in a session file
-   When a character from the Unicode Dingbat block is followed by a
    space, use the extra space to render a larger version of the
    character (`2850`{.interpreted-text role="iss"})
-   macOS: Fix the LC[CTYPE]{#ctype} env var being set to UTF-8 on
    systems in which the language and country code do not form a valid
    locale (`1233`{.interpreted-text role="iss"})
-   macOS: Fix `cmd+plus`{.interpreted-text role="kbd"} not changing
    font size (`2839`{.interpreted-text role="iss"})
-   Make neighboring window selection in grid and splits layouts more
    intelligent (`2840`{.interpreted-text role="pull"})
-   Allow passing the current selection to kittens
    (`2796`{.interpreted-text role="iss"})
-   Fix pre-edit text not always being cleared with ibus input
    (`2862`{.interpreted-text role="iss"})
-   Allow setting the `background_opacity`{.interpreted-text role="opt"}
    of new OS windows created via
    `kitty --single-instance`{.interpreted-text role="option"} using the
    `kitty --override`{.interpreted-text role="option"} command line
    argument (`2806`{.interpreted-text role="iss"})
-   Fix the CSI J (Erase in display ED) escape code not removing line
    continued markers (`2809`{.interpreted-text role="iss"})
-   hints kitten: In linenumber mode expand paths that starts with \~
    (`2822`{.interpreted-text role="iss"})
-   Fix `launch --location=last` not working (`2841`{.interpreted-text
    role="iss"})
-   Fix incorrect centering when a PUA or symbol glyph is followed by
    more than one space
-   Have the `confirm_os_window_close`{.interpreted-text role="opt"}
    option also apply when closing tabs with multiple windows
    (`2857`{.interpreted-text role="iss"})
-   Add support for legacy DECSET codes 47, 1047 and 1048
    (`2871`{.interpreted-text role="pull"})
-   macOS: no longer render emoji 20% below the baseline. This caused
    some emoji to be cut-off and also look misaligned with very high
    cells (`2873`{.interpreted-text role="iss"})
-   macOS: Make the window id of OS windows available in the `WINDOWID`
    environment variable (`2877`{.interpreted-text role="pull"})
-   Wayland: Fix a regression in 0.18.0 that could cause crashes related
    to mouse cursors in some rare circumstances
    (`2810`{.interpreted-text role="iss"})
-   Fix change in window size that does not change number of cells not
    being reported to the kernel (`2880`{.interpreted-text role="iss"})

### 0.18.1 \[2020-06-23\]

-   macOS: Fix for diff kitten not working with python 3.8
    (`2780`{.interpreted-text role="iss"})

### 0.18.0 \[2020-06-20\]

-   Allow multiple overlay windows per normal window
-   Add an option `confirm_os_window_close`{.interpreted-text
    role="opt"} to ask for confirmation when closing an OS window with
    multiple kitty windows.
-   Tall and Fat layouts: Add a `mirrored` option to put the full size
    window on the opposite edge of the screen (`2654`{.interpreted-text
    role="iss"})
-   Tall and Fat layouts: Add mappable actions to increase or decrease
    the number of full size windows (`2688`{.interpreted-text
    role="iss"})
-   Allow sending arbitrary signals to the current foreground process in
    a window using either a mapping in kitty.conf or via remote control
    (`2778`{.interpreted-text role="iss"})
-   Allow sending the back and forward mouse buttons to terminal
    applications (`2742`{.interpreted-text role="pull"})
-   **Backwards incompatibility**: The numbers used to encode mouse
    buttons for the `send_mouse_event` function that can be used in
    kittens have been changed (see `send_mouse_event`{.interpreted-text
    role="ref"}).
-   Add a new mappable `quit` action to quit kitty completely.
-   Fix marks using different colors with regexes using only a single
    color (`2663`{.interpreted-text role="pull"})
-   Linux: Workaround for broken Nvidia drivers for old cards
    (`456`{.interpreted-text role="iss"})
-   Wayland: Fix kitty being killed on some Wayland compositors if a
    hidden window has a lot of output (`2329`{.interpreted-text
    role="iss"})
-   BSD: Fix controlling terminal not being established
    (`2686`{.interpreted-text role="pull"})
-   Add support for the CSI REP escape code (`2702`{.interpreted-text
    role="pull"})
-   Wayland: Fix mouse cursor rendering on HiDPI screens
    (`2709`{.interpreted-text role="pull"})
-   X11: Recompile keymaps on XkbNewKeyboardNotify events
    (`2726`{.interpreted-text role="iss"})
-   X11: Reduce startup time by \~25% by only querying GLX for
    framebuffer configurations once (`2754`{.interpreted-text
    role="iss"})
-   macOS: Notarize the kitty application bundle
    (`2040`{.interpreted-text role="iss"})
-   Fix the kitty shell launched via a mapping needlessly requiring
    `allow_remote_control`{.interpreted-text role="opt"} to be turned
    on.

### 0.17.4 \[2020-05-09\]

-   Allow showing the name of the current layout and the number of
    windows in tab titles (`2634`{.interpreted-text role="iss"})
-   macOS: Fix a regression in the previous release that caused
    ligatures to be not be centered horizontally
    (`2591`{.interpreted-text role="iss"})
-   By default, double clicking no longer considers the : as part of
    words, see `select_by_word_characters`{.interpreted-text role="opt"}
    (`2602`{.interpreted-text role="iss"})
-   Fix a regression that caused clicking in the padding/margins of
    windows in the stack layout to switch the window to the first window
    (`2604`{.interpreted-text role="iss"})
-   macOS: Fix a regression that broke drag and drop
    (`2605`{.interpreted-text role="iss"})
-   Report modifier key state when sending wheel events to the terminal
    program
-   Fix kitty @ send-text not working with text larger than 1024 bytes
    when using `kitty --listen-on`{.interpreted-text role="option"}
    (`2607`{.interpreted-text role="iss"})
-   Wayland: Fix OS window title not updating for hidden windows
    (`2629`{.interpreted-text role="iss"})
-   Fix `background_tint`{.interpreted-text role="opt"} making the
    window semi-transparent (`2618`{.interpreted-text role="iss"})

### 0.17.3 \[2020-04-23\]

-   Allow individually setting margins and padding for each edge (left,
    right, top, bottom). Margins can also be controlled per window via
    remote control (`2546`{.interpreted-text role="iss"})
-   Fix reverse video not being rendered correctly when using
    transparency or a background image (`2419`{.interpreted-text
    role="iss"})
-   Allow mapping arbitrary remote control commands to key presses in
    `kitty.conf`{.interpreted-text role="file"}
-   X11: Fix crash when doing drag and drop from some applications
    (`2505`{.interpreted-text role="iss"})
-   Fix `launch --stdin-add-formatting`{.interpreted-text role="option"}
    not working (`2512`{.interpreted-text role="iss"})
-   Update to Unicode 13.0 (`2513`{.interpreted-text role="iss"})
-   Render country flags designated by a pair of unicode codepoints in
    two cells instead of four.
-   diff kitten: New option to control the background color for filler
    lines in the margin (`2518`{.interpreted-text role="iss"})
-   Fix specifying options for layouts in the startup session file not
    working (`2520`{.interpreted-text role="iss"})
-   macOS: Fix incorrect horizontal positioning of some full-width East
    Asian characters (`1457`{.interpreted-text role="iss"})
-   macOS: Render multi-cell PUA characters centered, matching behavior
    on other platforms
-   Linux: Ignore keys if they are designated as layout/group/mode
    switch keys (`2519`{.interpreted-text role="iss"})
-   Marks: Fix marks not handling wide characters and tab characters
    correctly (`2534`{.interpreted-text role="iss"})
-   Add a new `listen_on`{.interpreted-text role="opt"} option in
    kitty.conf to set `kitty --listen-on`{.interpreted-text
    role="option"} globally. Also allow using environment variables in
    this option (`2569`{.interpreted-text role="iss"}).
-   Allow sending mouse events in kittens (`2538`{.interpreted-text
    role="pull"})
-   icat kitten: Fix display of 16-bit depth images
    (`2542`{.interpreted-text role="iss"})
-   Add ncurses specific terminfo definitions for strikethrough
    (`2567`{.interpreted-text role="pull"})
-   Fix a regression in 0.17 that broke displaying graphics over SSH
    (`2568`{.interpreted-text role="iss"})
-   Fix `--title`{.interpreted-text role="option"} not being applied at
    window creation time (`2570`{.interpreted-text role="iss"})

### 0.17.2 \[2020-03-29\]

-   Add a `launch --watcher`{.interpreted-text role="option"} option
    that allows defining callbacks that are called for various events in
    the window\'s life-cycle (`2440`{.interpreted-text role="iss"})
-   Fix a regression in 0.17 that broke drawing of borders with
    non-minimal borders (`2474`{.interpreted-text role="iss"})
-   Hints kitten: Allow copying to primary selection as well as
    clipboard (`2487`{.interpreted-text role="pull"})
-   Add a new mappable action `close_other_windows_in_tab` to close all
    but the active window (`2484`{.interpreted-text role="iss"})
-   Hints kitten: Adjust the default regex used to detect line numbers
    to handle line+column numbers (`2268`{.interpreted-text role="iss"})
-   Fix blank space at the start of tab bar in the powerline style when
    first tab is inactive (`2478`{.interpreted-text role="iss"})
-   Fix regression causing incorrect rendering of separators in tab bar
    when defining a tab bar background color (`2480`{.interpreted-text
    role="pull"})
-   Fix a regression in 0.17 that broke the kitty @ launch remote
    command and also broke the \--tab-title option when creating a new
    tab. (`2488`{.interpreted-text role="iss"})
-   Linux: Fix selection of fonts with multiple width variants not
    preferring the normal width faces (`2491`{.interpreted-text
    role="iss"})

### 0.17.1 \[2020-03-24\]

-   Fix `cursor_underline_thickness`{.interpreted-text role="opt"} not
    working (`2465`{.interpreted-text role="iss"})
-   Fix a regression in 0.17 that caused tab bar background to be
    rendered after the last tab as well (`2464`{.interpreted-text
    role="iss"})
-   macOS: Fix a regression in 0.17 that caused incorrect variants to be
    automatically selected for some fonts (`2462`{.interpreted-text
    role="iss"})
-   Fix a regression in 0.17 that caused kitty @ set-colors to require
    setting cursor[text_color]{#text_color} (`2470`{.interpreted-text
    role="iss"})

### 0.17.0 \[2020-03-24\]

-   `splits_layout`{.interpreted-text role="ref"} to arrange windows in
    arbitrary splits (`2308`{.interpreted-text role="iss"})
-   Add support for specifying a background image, see
    `background_image`{.interpreted-text role="opt"}
    (`163`{.interpreted-text role="iss"} and `2326`{.interpreted-text
    role="pull"}; thanks to Fredrick Brennan.)
-   A new `background_tint`{.interpreted-text role="opt"} option to
    darken the background under the text area when using background
    images and/or transparent windows.
-   Allow selection of single cells with the mouse. Also improve mouse
    selection to follow semantics common to most programs
    (`945`{.interpreted-text role="iss"})
-   New options `cursor_beam_thickness`{.interpreted-text role="opt"}
    and `cursor_underline_thickness`{.interpreted-text role="opt"} to
    control the thickness of the beam and underline cursors
    (`2337`{.interpreted-text role="iss"} and `2342`{.interpreted-text
    role="pull"})
-   When the application running in the terminal grabs the mouse, pass
    middle clicks to the application unless
    [terminal_select_modifiers]{.title-ref} are pressed
    (`2368`{.interpreted-text role="iss"})
-   A new `copy_and_clear_or_interrupt` function
    (`2403`{.interpreted-text role="iss"})
-   X11: Fix arrow mouse cursor using right pointing instead of the
    default left pointing arrow (`2341`{.interpreted-text role="iss"})
-   Allow passing the currently active kitty window id in the launch
    command (`2391`{.interpreted-text role="iss"})
-   unicode input kitten: Allow pressing `ctrl+tab`{.interpreted-text
    role="kbd"} to change the input mode (`2343`{.interpreted-text
    role="iss"})
-   Fix a bug that prevented using custom functions with the new marks
    feature (`2344`{.interpreted-text role="iss"})
-   Make the set of URL prefixes that are recognized while hovering with
    the mouse configurable (`2416`{.interpreted-text role="iss"})
-   Fix border/margin/padding sizes not being recalculated on DPI change
    (`2346`{.interpreted-text role="iss"})
-   diff kitten: Fix directory diffing with removed binary files failing
    (`2378`{.interpreted-text role="iss"})
-   macOS: Fix menubar title not updating on OS Window focus change
    (`2350`{.interpreted-text role="iss"})
-   Fix rendering of combining characters with fonts that have glyphs
    for precomposed characters but not decomposed versions
    (`2365`{.interpreted-text role="iss"})
-   Fix incorrect rendering of selection when using rectangular select
    and scrolling (`2351`{.interpreted-text role="iss"})
-   Allow setting WM[CLASS]{#class} and WM[NAME]{#name} when creating
    new OS windows with the launch command
    (`launch --os-window-class`{.interpreted-text role="option"})
-   macOS: When switching input method while a pending multi-key input
    is in progress, clear the pending input (`2358`{.interpreted-text
    role="iss"})
-   Fix a regression in the previous release that broke switching to
    neighboring windows in the Grid layout when there are less than four
    windows (`2377`{.interpreted-text role="iss"})
-   Fix colors in scrollback pager off if the window has redefined
    terminal colors using escape codes (`2381`{.interpreted-text
    role="iss"})
-   Fix selection not updating properly while scrolling
    (`2442`{.interpreted-text role="iss"})
-   Allow extending selections by dragging with right button pressed
    (`2445`{.interpreted-text role="iss"})
-   Workaround for bug in less that causes colors to reset at wrapped
    lines (`2381`{.interpreted-text role="iss"})
-   X11/Wayland: Allow drag and drop of text/plain in addition to
    text/uri-list (`2441`{.interpreted-text role="iss"})
-   Dont strip `&` and `-` from the end of URLs
    (`2436`{.interpreted-text role="iss"})
-   Fix `@selection` placeholder not working with launch command
    (`2417`{.interpreted-text role="iss"})
-   Drop support for python 3.5
-   Wayland: Fix a crash when drag and dropping into kitty
    (`2432`{.interpreted-text role="iss"})
-   diff kitten: Fix images lingering as blank rectangles after the
    kitten quits (`2449`{.interpreted-text role="iss"})
-   diff kitten: Fix images losing position when scrolling using mouse
    wheel/touchpad

### 0.16.0 \[2020-01-28\]

-   A new `marks`{.interpreted-text role="doc"} feature that allows
    highlighting and scrolling to arbitrary text in the terminal window.
-   hints kitten: Allow pressing `goto_file_line`{.interpreted-text
    role="sc"} to quickly open the selected file at the selected line in
    vim or a configurable editor (`2268`{.interpreted-text role="iss"})
-   Allow having more than one full height window in the `tall` layout
    (`2276`{.interpreted-text role="iss"})
-   Allow choosing OpenType features for individual fonts via the
    `font_features`{.interpreted-text role="opt"} option.
    (`2248`{.interpreted-text role="pull"})
-   Wayland: Fix a freeze in rare circumstances when having multiple OS
    Windows (`2307`{.interpreted-text role="iss"} and
    `1722`{.interpreted-text role="iss"})
-   Wayland: Fix window titles being set to very long strings on the
    order of 8KB causing a crash (`1526`{.interpreted-text role="iss"})
-   Add an option `force_ltr`{.interpreted-text role="opt"} to turn off
    the display of text in RTL scripts in right-to-left order
    (`2293`{.interpreted-text role="pull"})
-   Allow opening new tabs/windows before the current tab/window as well
    as after it with the `launch --location`{.interpreted-text
    role="option"} option.
-   Add a `resize_in_steps`{.interpreted-text role="opt"} option that
    can be used to resize the OS window in steps as large as character
    cells (`2131`{.interpreted-text role="pull"})
-   When triple-click+dragging to select multiple lines, extend the
    selection of the first line to match the rest on the left
    (`2284`{.interpreted-text role="pull"})
-   macOS: Add a `titlebar-only` setting to
    `hide_window_decorations`{.interpreted-text role="opt"} to only hide
    the title bar (`2286`{.interpreted-text role="pull"})
-   Fix a segfault when using `--debug-config` with maps
    (`2270`{.interpreted-text role="iss"})
-   `goto_tab` now maps numbers larger than the last tab to the last tab
    (`2291`{.interpreted-text role="iss"})
-   Fix URL detection not working for urls of the form scheme:///url
    (`2292`{.interpreted-text role="iss"})
-   When windows are semi-transparent and all contain graphics,
    correctly render them. (`2310`{.interpreted-text role="iss"})

### 0.15.1 \[2019-12-21\]

-   Fix a crash/incorrect rendering when detaching a window in some
    circumstances (`2173`{.interpreted-text role="iss"})
-   hints kitten: Add an option
    `kitty +kitten hints --ascending`{.interpreted-text role="option"}
    to control if the hints numbers increase or decrease from top to
    bottom
-   Fix `background_opacity`{.interpreted-text role="opt"} incorrectly
    applying to selected text and reverse video text
    (`2177`{.interpreted-text role="iss"})
-   Add a new option `tab_bar_background`{.interpreted-text role="opt"}
    to specify a different color for the tab bar
    (`2198`{.interpreted-text role="iss"})
-   Add a new option `active_tab_title_template`{.interpreted-text
    role="opt"} to specify a different template for active tab titles
    (`2198`{.interpreted-text role="iss"})
-   Fix lines at the edge of the window at certain windows sizes when
    drawing images on a transparent window (`2079`{.interpreted-text
    role="iss"})
-   Fix window not being rendered for the first time until some input
    has been received from child process (`2216`{.interpreted-text
    role="iss"})

### 0.15.0 \[2019-11-27\]

-   Add a new action `detach_window <detach_window>`{.interpreted-text
    role="ref"} that can be used to move the current window into a
    different tab (`1310`{.interpreted-text role="iss"})
-   Add a new action `launch <launch>`{.interpreted-text role="doc"}
    that unifies launching of processes in new kitty windows/tabs.
-   Add a new style `powerline` for tab bar rendering, see
    `tab_bar_style`{.interpreted-text role="opt"}
    (`2021`{.interpreted-text role="pull"})
-   Allow changing colors by mapping a keyboard shortcut to read a kitty
    config file with color definitions. See the
    `FAQ <faq>`{.interpreted-text role="doc"} for details
    (`2083`{.interpreted-text role="iss"})
-   hints kitten: Allow completely customizing the matching and actions
    performed by the kitten using your own script
    (`2124`{.interpreted-text role="iss"})
-   Wayland: Fix key repeat not being stopped when focus leaves window.
    This is expected behavior on Wayland, apparently
    (`2014`{.interpreted-text role="iss"})
-   When drawing unicode symbols that are followed by spaces, use
    multiple cells to avoid resized or cut-off glyphs
    (`1452`{.interpreted-text role="iss"})
-   diff kitten: Allow diffing remote files easily via ssh
    (`727`{.interpreted-text role="iss"})
-   unicode input kitten: Add an option `kitty +kitten unicode_input
    --emoji-variation`{.interpreted-text role="option"} to control the
    presentation variant of selected emojis (`2139`{.interpreted-text
    role="iss"})
-   Add specialised rendering for a few more box powerline and unicode
    symbols (`2074`{.interpreted-text role="pull"} and
    `2021`{.interpreted-text role="pull"})
-   Add a new socket only mode for
    `allow_remote_control`{.interpreted-text role="opt"}. This makes it
    possible for programs running on the local machine to control kitty
    but not programs running over ssh.
-   hints kitten: Allow using named groups in the regular expression.
    The named groups are passed to the invoked program for further
    processing.
-   Fix a regression in 0.14.5 that caused rendering of private use
    glyphs with and without spaces to be identical
    (`2117`{.interpreted-text role="iss"})
-   Wayland: Fix incorrect scale used when first creating an OS window
    (`2133`{.interpreted-text role="iss"})
-   macOS: Disable mouse hiding by default as getting it to work
    robustly on Cocoa is too much effort (`2158`{.interpreted-text
    role="iss"})

### 0.14.6 \[2019-09-25\]

-   macOS: Fix a regression in the previous release that caused a crash
    when pressing a unprintable key, such as the POWER key
    (`1997`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that caused kitty to not
    always respond to DPI changes (`1999`{.interpreted-text
    role="pull"})

### 0.14.5 \[2019-09-23\]

-   Implement a hack to (mostly) preserve tabs when cat-ting a file with
    them and then copying the text or passing screen contents to another
    program (`1829`{.interpreted-text role="iss"})
-   When all visible windows have the same background color, use that as
    the color for the global padding, instead of the configured
    background color (`1957`{.interpreted-text role="iss"})
-   When resetting the terminal, also reset parser state, this allows
    easy recovery from incomplete escape codes (`1961`{.interpreted-text
    role="iss"})
-   Allow mapping keys commonly found on European keyboards
    (`1928`{.interpreted-text role="pull"})
-   Fix incorrect rendering of some symbols when followed by a space
    while using the PowerLine font which does not have a space glyph
    (`1225`{.interpreted-text role="iss"})
-   Linux: Allow using fonts with spacing=90 in addition to fonts with
    spacing=100 (`1968`{.interpreted-text role="iss"})
-   Use selection foreground color for underlines as well
    (`1982`{.interpreted-text role="iss"})

### 0.14.4 \[2019-08-31\]

-   hints kitten: Add a
    `kitty +kitten hints --alphabet`{.interpreted-text role="option"}
    option to control what alphabets are used for hints
    (`1879`{.interpreted-text role="iss"})
-   hints kitten: Allow specifying
    `kitty +kitten hints --program`{.interpreted-text role="option"}
    multiple times to run multiple programs (`1879`{.interpreted-text
    role="iss"})
-   Add a `kitten_alias`{.interpreted-text role="opt"} option that can
    be used to alias kitten invocation for brevity and to change kitten
    option defaults globally (`1879`{.interpreted-text role="iss"})
-   macOS: Add an option `macos_show_window_title_in`{.interpreted-text
    role="opt"} to control showing the window title in the
    menubar/titlebar (`1837`{.interpreted-text role="pull"})
-   macOS: Allow drag and drop of text from other applications into
    kitty (`1921`{.interpreted-text role="pull"})
-   When running kittens, use the colorscheme of the current window
    rather than the configured colorscheme (`1906`{.interpreted-text
    role="iss"})
-   Don\'t fail to start if running the shell to read the EDITOR env var
    fails (`1869`{.interpreted-text role="iss"})
-   Disable the `liga` and `dlig` OpenType features for broken fonts
    such as Nimbus Mono.
-   Fix a regression that broke setting background[opacity]{#opacity}
    via remote control (`1895`{.interpreted-text role="iss"})
-   Fix piping PNG images into the icat kitten not working
    (`1920`{.interpreted-text role="iss"})
-   When the OS returns a fallback font that does not actually contain
    glyphs for the text, do not exhaust the list of fallback fonts
    (`1918`{.interpreted-text role="iss"})
-   Fix formatting attributes not reset across line boundaries when
    passing buffer as ANSI (`1924`{.interpreted-text role="iss"})

### 0.14.3 \[2019-07-29\]

-   Remote control: Add a command [kitty @ scroll-window]{.title-ref} to
    scroll windows
-   Allow passing a `!neighbor` argument to the new[window]{#window}
    mapping to open a new window next to the active window
    (`1746`{.interpreted-text role="iss"})
-   Document the kitty remote control protocol (`1646`{.interpreted-text
    role="iss"})
-   Add a new option `pointer_shape_when_grabbed`{.interpreted-text
    role="opt"} that allows you to control the mouse pointer shape when
    the terminal programs grabs the pointer (`1808`{.interpreted-text
    role="iss"})
-   Add an option [terminal_select_modifiers]{.title-ref} to control
    which modifiers are used to override mouse selection even when a
    terminal application has grabbed the mouse (`1774`{.interpreted-text
    role="iss"})
-   When piping data to a child in the pipe command do it in a thread so
    as not to block the UI (`1708`{.interpreted-text role="iss"})
-   unicode[input]{#input} kitten: Fix a regression that broke using
    indices to select recently used symbols.
-   Fix a regression that caused closing an overlay window to focus the
    previously focused window rather than the underlying window
    (`1720`{.interpreted-text role="iss"})
-   macOS: Reduce energy consumption when idle by shutting down Apple\'s
    display link thread after 30 second of inactivity
    (`1763`{.interpreted-text role="iss"})
-   Linux: Fix incorrect scaling for fallback fonts when the font has an
    underscore that renders out of bounds (`1713`{.interpreted-text
    role="iss"})
-   macOS: Fix finding fallback font for private use unicode symbols not
    working reliably (`1650`{.interpreted-text role="iss"})
-   Fix an out of bounds read causing a crash when selecting text with
    the mouse in the alternate screen mode (`1578`{.interpreted-text
    role="iss"})
-   Linux: Use the system \"bell\" sound for the terminal bell. Adds
    libcanberra as a new dependency to play the system sound.
-   macOS: Fix a rare deadlock causing kitty to hang
    (`1779`{.interpreted-text role="iss"})
-   Linux: Fix a regression in 0.14.0 that caused the event loop to tick
    continuously, wasting CPU even when idle (`1782`{.interpreted-text
    role="iss"})
-   ssh kitten: Make argument parsing more like ssh
    (`1787`{.interpreted-text role="iss"})
-   When using `strip_trailing_spaces`{.interpreted-text role="opt"} do
    not remove empty lines (`1802`{.interpreted-text role="iss"})
-   Fix a crash when displaying very large number of images
    (`1825`{.interpreted-text role="iss"})

### 0.14.2 \[2019-06-09\]

-   Add an option `placement_strategy`{.interpreted-text role="opt"} to
    control how the cell area is aligned inside the window when the
    window size is not an exact multiple of the cell size
    (`1670`{.interpreted-text role="pull"})
-   hints kitten: Add a
    `kitty +kitten hints --multiple-joiner`{.interpreted-text
    role="option"} option to control how multiple selections are
    serialized when copying to clipboard or inserting into the terminal.
    You can have them on separate lines, separated by arbitrary
    characters, or even serialized as JSON (`1665`{.interpreted-text
    role="iss"})
-   macOS: Fix a regression in the previous release that broke using
    `ctrl+shift+tab`{.interpreted-text role="kbd"}
    (`1671`{.interpreted-text role="iss"})
-   panel kitten: Fix the contents of the panel kitten not being
    positioned correctly on the vertical axis
-   icat kitten: Fix a regression that broke passing directories to icat
    (`1683`{.interpreted-text role="iss"})
-   clipboard kitten: Add a
    `kitty +kitten clipboard --wait-for-completion`{.interpreted-text
    role="option"} option to have the kitten wait till copying to
    clipboard is complete (`1693`{.interpreted-text role="iss"})
-   Allow using the `pipe <pipe>`{.interpreted-text role="doc"} command
    to send screen and scrollback contents directly to the clipboard
    (`1693`{.interpreted-text role="iss"})
-   Linux: Disable the Wayland backend on GNOME by default as GNOME has
    no support for server side decorations. Can be controlled by
    `linux_display_server`{.interpreted-text role="opt"}.
-   Add an option to control the default
    `update_check_interval`{.interpreted-text role="opt"} when building
    kitty packages
-   Wayland: Fix resizing the window on a compositor that does not
    provide server side window decorations, such a GNOME or Weston not
    working correctly (`1659`{.interpreted-text role="iss"})
-   Wayland: Fix crash when enabling disabling monitors on sway
    (`1696`{.interpreted-text role="iss"})

### 0.14.1 \[2019-05-29\]

-   Add an option `command_on_bell`{.interpreted-text role="opt"} to run
    an arbitrary command when a bell occurs (`1660`{.interpreted-text
    role="iss"})
-   Add a shortcut to toggle maximized window state
    `toggle_maximized`{.interpreted-text role="sc"}
-   Add support for the underscore key found in some keyboard layouts
    (`1639`{.interpreted-text role="iss"})
-   Fix a missing newline when using the pipe command between the
    scrollback and screen contents (`1642`{.interpreted-text
    role="iss"})
-   Fix colors not being preserved when using the pipe command with the
    pager history buffer (`1657`{.interpreted-text role="pull"})
-   macOS: Fix a regression that could cause rendering of a kitty window
    to occasionally freeze in certain situations, such as moving it
    between monitors or transitioning from/to fullscreen
    (`1641`{.interpreted-text role="iss"})
-   macOS: Fix a regression that caused `cmd+v`{.interpreted-text
    role="kbd"} to double up in the dvorak keyboard layout
    (`1652`{.interpreted-text role="iss"})
-   When resizing and only a single window is present in the current
    layout, use that window\'s background color to fill in the blank
    areas.
-   Linux: Automatically increase cell height if the font being used is
    broken and draws the underscore outside the bounding box
    (`690`{.interpreted-text role="iss"})
-   Wayland: Fix maximizing the window on a compositor that does not
    provide server side window decorations, such a GNOME or Weston not
    working (`1662`{.interpreted-text role="iss"})

### 0.14.0 \[2019-05-24\]

-   macOS: The default behavior of the Option key has changed. It now
    generates unicode characters rather than acting as the
    `Alt`{.interpreted-text role="kbd"} modifier. See
    `macos_option_as_alt`{.interpreted-text role="opt"}.
-   Support for an arbitrary number of internal clipboard buffers to
    copy/paste from, see (`cpbuf`{.interpreted-text role="ref"})
-   Allow using the new private internal clipboard buffers with the
    `copy_on_select`{.interpreted-text role="opt"} option
    (`1390`{.interpreted-text role="iss"})
-   macOS: Allow opening new kitty tabs/top-level windows from Finder
    (`1350`{.interpreted-text role="pull"})
-   Add an option `disable_ligatures`{.interpreted-text role="opt"} to
    disable multi-character ligatures under the cursor to make editing
    easier or disable them completely (`461`{.interpreted-text
    role="iss"})
-   Allow creating new OS windows in session files
    (`1514`{.interpreted-text role="iss"})
-   Allow setting OS window size in session files
-   Add an option `tab_switch_strategy`{.interpreted-text role="opt"} to
    control which tab becomes active when the current tab is closed
    (`1524`{.interpreted-text role="pull"})
-   Allow specifying a value of `none` for the
    `selection_foreground`{.interpreted-text role="opt"} which will
    cause kitty to not change text color in selections
    (`1358`{.interpreted-text role="iss"})
-   Make live resizing of OS windows smoother and add an option
    `resize_draw_strategy` to control what is drawn while a resize is in
    progress.
-   macOS: Improve handling of IME extended input. Compose characters
    are now highlighted and the IME panel moves along with the text
    (`1586`{.interpreted-text role="pull"}). Also fixes handling of
    delete key in Chinese IME (`1461`{.interpreted-text role="iss"})
-   When a window is closed, switch focus to the previously active
    window (if any) instead of picking the previous window in the layout
    (`1450`{.interpreted-text role="iss"})
-   icat kitten: Add support for displaying images at http(s) URLs
    (`1340`{.interpreted-text role="iss"})
-   A new option `strip_trailing_spaces`{.interpreted-text role="opt"}
    to optionally remove trailing spaces from lines when copying to
    clipboard.
-   A new option `tab_bar_min_tabs`{.interpreted-text role="opt"} to
    control how many tabs must be present before the tab-bar is shown
    (`1382`{.interpreted-text role="iss"})
-   Automatically check for new releases and notify when an update is
    available, via the system notification facilities. Can be controlled
    by `update_check_interval`{.interpreted-text role="opt"}
    (`1342`{.interpreted-text role="iss"})
-   macOS: Fix `cmd+period`{.interpreted-text role="kbd"} key not
    working (`1318`{.interpreted-text role="iss"})
-   macOS: Add an option
    [macos_show_window_title_in_menubar]{.title-ref} to not show the
    current window title in the menu-bar (`1066`{.interpreted-text
    role="iss"})
-   macOS: Workaround for cocoa bug that could cause the mouse cursor to
    become hidden in other applications in rare circumstances
    (`1218`{.interpreted-text role="iss"})
-   macOS: Allow assigning only the left or right
    `Option`{.interpreted-text role="kbd"} key to work as the
    `Alt`{.interpreted-text role="kbd"} key. See
    `macos_option_as_alt`{.interpreted-text role="opt"} for details
    (`1022`{.interpreted-text role="iss"})
-   Fix using remote control to set cursor text color causing errors
    when creating new windows (`1326`{.interpreted-text role="iss"})
-   Fix window title for minimized windows not being updated
    (`1332`{.interpreted-text role="iss"})
-   macOS: Fix using multi-key sequences to input text ignoring the
    first few key presses if the sequence is aborted
    (`1311`{.interpreted-text role="iss"})
-   macOS: Add a number of common macOS keyboard shortcuts
-   macOS: Reduce energy consumption by not rendering occluded windows
-   Fix scrollback pager history not being cleared when clearing the
    main scrollback buffer (`1387`{.interpreted-text role="iss"})
-   macOS: When closing a top-level window only switch focus to the
    previous kitty window if it is on the same workspace
    (`1379`{.interpreted-text role="iss"})
-   macOS: Fix `sync_to_monitor`{.interpreted-text role="opt"} not
    working on Mojave.
-   macOS: Use the system cursor blink interval by default
    `cursor_blink_interval`{.interpreted-text role="opt"}.
-   Wayland: Use the kitty Wayland backend by default. Can be switched
    back to using XWayland by setting the environment variable:
    `KITTY_DISABLE_WAYLAND=1`
-   Add a `no-append` setting to `clipboard_control`{.interpreted-text
    role="opt"} to disable the kitty copy concatenation protocol
    extension for OSC 52.
-   Update to using the Unicode 12 standard
-   Unicode input kitten: Allow using the arrow keys in code mode to go
    to next and previous unicode symbol.
-   macOS: Fix specifying initial window size in cells not working
    correctly on Retina screens (`1444`{.interpreted-text role="iss"})
-   Fix a regression in version 0.13.0 that caused background colors of
    space characters after private use unicode characters to not be
    respected (`1455`{.interpreted-text role="iss"})
-   Only update the selected text to clipboard when the selection is
    finished, not continuously as it is updated.
    (`1460`{.interpreted-text role="iss"})
-   Allow setting `active_border_color`{.interpreted-text role="opt"} to
    `none` to not draw a border around the active window
    (`805`{.interpreted-text role="iss"})
-   Use negative values for `mouse_hide_wait`{.interpreted-text
    role="opt"} to hide the mouse cursor immediately when pressing a key
    (`1534`{.interpreted-text role="iss"})
-   When encountering errors in `kitty.conf`{.interpreted-text
    role="file"} report them to the user instead of failing to start.
-   Allow the user to control the resize debounce time via
    `resize_debounce_time`{.interpreted-text role="opt"}.
-   Remote control: Make the `at-set-font-size`{.interpreted-text
    role="ref"} command more capable. It can now increment font size and
    reset it. It also only acts on the active top-level window, by
    default (`1581`{.interpreted-text role="iss"})
-   When launching child processes set the `PWD` environment variable
    (`1595`{.interpreted-text role="iss"})
-   X11: use the window manager\'s native full-screen implementation
    when making windows full-screen (`1605`{.interpreted-text
    role="iss"})
-   Mouse selection: When extending by word, fix extending selection to
    non-word characters not working well (`1616`{.interpreted-text
    role="iss"})

### 0.13.3 \[2019-01-19\]

-   icat kitten: Add a `--stdin` option to control if image data is read
    from STDIN (`1308`{.interpreted-text role="iss"})
-   hints kitten: Start hints numbering at one instead of zero by
    default. Added an option `--hints-offset` to control it.
    (`1289`{.interpreted-text role="iss"})
-   Fix a regression in the previous release that broke using
    `background` for `cursor_text_color`{.interpreted-text role="opt"}
    (`1288`{.interpreted-text role="iss"})
-   macOS: Fix dragging kitty window tabs in traditional full screen
    mode causing crashes (`1296`{.interpreted-text role="iss"})
-   macOS: Ensure that when running from a bundle, the bundle kitty exe
    is preferred over any kitty in PATH (`1280`{.interpreted-text
    role="iss"})
-   macOS: Fix a regression that broke mapping of
    `ctrl+tab`{.interpreted-text role="kbd"} (`1304`{.interpreted-text
    role="iss"})
-   Add a list of user-created kittens to the docs
-   Fix a regression that broke changing mouse wheel scroll direction
    with negative `wheel_scroll_multiplier`{.interpreted-text
    role="opt"} values in full-screen applications like vim
    (`1299`{.interpreted-text role="iss"})
-   Fix `background_opacity`{.interpreted-text role="opt"} not working
    with pure white backgrounds (`1285`{.interpreted-text role="iss"})
-   macOS: Fix \"New OS Window\" dock action not working when kitty is
    not focused (`1312`{.interpreted-text role="iss"})
-   macOS: Add aliases for close window and new tab actions that conform
    to common Apple shortcuts for these actions
    (`1313`{.interpreted-text role="iss"})
-   macOS: Fix some kittens causing 100% CPU usage

### 0.13.2 \[2019-01-04\]

-   Add a new option `tab_title_template`{.interpreted-text role="opt"}
    to control how tab titles are formatted. In particular the template
    can be used to display the tab number next to the title
    (`1223`{.interpreted-text role="iss"})
-   Report the current foreground processes as well as the original
    child process, when using [kitty @ ls]{.title-ref}
-   Use the current working directory of the foreground process for the
    [\*\_with_cwd]{.title-ref} actions that open a new window with the
    current working directory.
-   Add a new `copy_or_interrupt` action that can be mapped to
    kbd:\`ctrl+c\`. It will copy if there is a selection and interrupt
    otherwise (`1286`{.interpreted-text role="iss"})
-   Fix setting `background_opacity`{.interpreted-text role="opt"}
    causing window margins/padding to be slightly different shade from
    background (`1221`{.interpreted-text role="iss"})
-   Handle keyboards with a \"+\" key (`1224`{.interpreted-text
    role="iss"})
-   Fix Private use Unicode area characters followed by spaces at the
    end of text not being rendered correctly (`1210`{.interpreted-text
    role="iss"})
-   macOS: Add an entry to the dock menu to open a new OS window
    (`1242`{.interpreted-text role="iss"})
-   macOS: Fix scrolling very slowly with wheel mice not working
    (`1238`{.interpreted-text role="iss"})
-   Fix changing `cursor_text_color`{.interpreted-text role="opt"} via
    remote control not working (`1229`{.interpreted-text role="iss"})
-   Add an action to resize windows that can be mapped to shortcuts in
    `kitty.conf`{.interpreted-text role="file"}
    (`1245`{.interpreted-text role="pull"})
-   Fix using the `new_tab !neighbor` action changing the order of the
    non-neighboring tabs (`1256`{.interpreted-text role="iss"})
-   macOS: Fix momentum scrolling continuing when changing the active
    window/tab (`1267`{.interpreted-text role="iss"})

### 0.13.1 \[2018-12-06\]

-   Fix passing input via the pipe action to a program without a window
    not working.
-   Linux: Fix a regression in the previous release that caused
    automatic selection of bold/italic fonts when using aliases such as
    \"monospace\" to not work (`1209`{.interpreted-text role="iss"})
-   Fix resizing window smaller and then restoring causing some wrapped
    lines to not be properly unwrapped (`1206`{.interpreted-text
    role="iss"})

### 0.13.0 \[2018-12-05\]

-   Add an option `scrollback_pager_history_size`{.interpreted-text
    role="opt"} to tell kitty to store extended scrollback to use when
    viewing the scrollback buffer in a pager (`970`{.interpreted-text
    role="iss"})
-   Modify the kittens sub-system to allow creating custom kittens
    without any user interface. This is useful for creating more complex
    actions that can be bound to key presses in
    `kitty.conf`{.interpreted-text role="file"}. See
    doc:\`kittens/custom\`. (`870`{.interpreted-text role="iss"})
-   Add a new `nth_window` action that can be used to go to the nth
    window and also previously active windows, using negative numbers.
    Similarly, `goto_tab` now accepts negative numbers to go to
    previously active tabs (`1040`{.interpreted-text role="iss"})
-   Allow hiding the tab bar completely, by setting
    `tab_bar_style`{.interpreted-text role="opt"} to `hidden`.
    (`1014`{.interpreted-text role="iss"})
-   Allow private use unicode characters to stretch over more than a
    single neighboring space (`1036`{.interpreted-text role="pull"})
-   Add a new `touch_scroll_multiplier`{.interpreted-text role="opt"}
    option to modify the amount scrolled by high precision scrolling
    devices such as touchpads (`1129`{.interpreted-text role="pull"})
-   icat kitten: Implement reading image data from STDIN, if STDIN is
    not connected to a terminal (`1130`{.interpreted-text role="iss"})
-   hints kitten: Insert trailing spaces after matches when using the
    `--multiple` option. Also add a separate `--add-trailing-space`
    option to control this behavior (`1132`{.interpreted-text
    role="pull"})
-   Fix the `*_with_cwd` actions using the cwd of the overlay window
    rather than the underlying window\'s cwd (`1045`{.interpreted-text
    role="iss"})
-   Fix incorrect key repeat rate on wayland (`1055`{.interpreted-text
    role="pull"})
-   macOS: Fix drag and drop of files not working on Mojave
    (`1058`{.interpreted-text role="iss"})
-   macOS: Fix IME input for East Asian languages
    (`910`{.interpreted-text role="iss"})
-   macOS: Fix rendering frames-per-second very low when processing
    large amounts of input in small chunks (`1082`{.interpreted-text
    role="pull"})
-   macOS: Fix incorrect text sizes calculated when using an external
    display that is set to mirror the main display
    (`1056`{.interpreted-text role="iss"})
-   macOS: Use the system default double click interval
    (`1090`{.interpreted-text role="pull"})
-   macOS: Fix touch scrolling sensitivity low on retina screens
    (`1112`{.interpreted-text role="iss"})
-   Linux: Fix incorrect rendering of some fonts when hinting is
    disabled at small sizes (`1173`{.interpreted-text role="iss"})
-   Linux: Fix match rules used as aliases in Fontconfig configuration
    not being respected (`1085`{.interpreted-text role="iss"})
-   Linux: Fix a crash when using the GNU Unifont as a fallback font
    (`1087`{.interpreted-text role="iss"})
-   Wayland: Fix copying from hidden kitty windows hanging
    (`1051`{.interpreted-text role="iss"})
-   Wayland: Add support for the primary selection protocol implemented
    by some compositors (`1095`{.interpreted-text role="pull"})
-   Fix expansion of env vars not working in the `env`{.interpreted-text
    role="opt"} directive (`1075`{.interpreted-text role="iss"})
-   Fix `mouse_hide_wait`{.interpreted-text role="opt"} only taking
    effect after an event such as cursor blink or key press
    (`1073`{.interpreted-text role="iss"})
-   Fix the `set_background_opacity` action not working correctly
    (`1147`{.interpreted-text role="pull"})
-   Fix second cell of emoji created using variation selectors not
    having the same attributes as the first cell
    (`1109`{.interpreted-text role="iss"})
-   Fix focusing neighboring windows in the grid layout with less than 4
    windows not working (`1115`{.interpreted-text role="iss"})
-   Fix `ctrl+shift+special`{.interpreted-text role="kbd"} key not
    working in normal and application keyboard modes
    (`1114`{.interpreted-text role="iss"})
-   Add a terminfo entry for full keyboard mode.
-   Fix incorrect text-antialiasing when using very low background
    opacity (`1005`{.interpreted-text role="iss"})
-   When double or triple clicking ignore clicks if they are \"far\"
    from each other (`1093`{.interpreted-text role="iss"})
-   Follow xterm\'s behavior for the menu key (`597`{.interpreted-text
    role="iss"})
-   Fix hover detection of URLs not working when hovering over the first
    colon and slash characters in short URLs (`1201`{.interpreted-text
    role="iss"})

### 0.12.3 \[2018-09-29\]

-   macOS: Fix kitty window not being rendered on macOS Mojave until the
    window is moved or resized at least once (`887`{.interpreted-text
    role="iss"})
-   Unicode input: Fix an error when searching for the string \'fir\'
    (`1035`{.interpreted-text role="iss"})

### 0.12.2 \[2018-09-24\]

-   A new `last_used_layout` function that can be mapped to a shortcut
    to switch to the previously used window layout
    (`870`{.interpreted-text role="iss"})
-   New `neighboring_window` and `move_window` functions to switch to
    neighboring windows in the current layout, and move them around,
    similar to window movement in vim (`916`{.interpreted-text
    role="iss"})
-   A new `pipe` function that can be used to pipe the contents of the
    screen and scrollback buffer to any desired program running in a new
    window, tab or overlay window. (`933`{.interpreted-text role="iss"})
-   Add a new `kitty --start-as`{.interpreted-text role="option"}
    command line flag to start kitty full-screen/maximized/minimized.
    This replaces the `--start-in-fullscreen` flag introduced in the
    previous release (`935`{.interpreted-text role="iss"})
-   When mapping the `new_tab` action allow specifying that the tab
    should open next to the current tab instead of at the end of the
    tabs list (`979`{.interpreted-text role="iss"})
-   macOS: Add a new `macos_thicken_font`{.interpreted-text role="opt"}
    to make text rendering on macs thicker, which makes it similar to
    the result of sub-pixel antialiasing (`950`{.interpreted-text
    role="pull"})
-   macOS: Add an option
    `macos_traditional_fullscreen`{.interpreted-text role="opt"} to make
    full-screening of kitty windows much faster, but less pretty.
    (`911`{.interpreted-text role="iss"})
-   Fix a bug causing incorrect line ordering when viewing the
    scrollback buffer if the scrollback buffer is full
    (`960`{.interpreted-text role="iss"})
-   Fix drag-scrolling not working when the mouse leaves the window
    confines (`917`{.interpreted-text role="iss"})
-   Workaround for broken editors like nano that cannot handle newlines
    in pasted text (`994`{.interpreted-text role="iss"})
-   Linux: Ensure that the python embedded in the kitty binary build
    uses UTF-8 mode to process command-line arguments
    (`924`{.interpreted-text role="iss"})
-   Linux: Handle fonts that contain monochrome bitmaps (such as the
    Terminus TTF font) (`934`{.interpreted-text role="pull"})
-   Have the `kitty --title`{.interpreted-text role="option"} flag apply
    to all windows created using `kitty --session`{.interpreted-text
    role="option"} (`921`{.interpreted-text role="iss"})
-   Revert change for backspacing of wide characters in the previous
    release, as it breaks backspacing in some wide character aware
    programs (`875`{.interpreted-text role="iss"})
-   Fix kitty \@set-colors not working for tab backgrounds when using
    the [fade]{.title-ref} tabbar style (`937`{.interpreted-text
    role="iss"})
-   macOS: Fix resizing semi-transparent windows causing the windows to
    be invisible during the resize (`941`{.interpreted-text role="iss"})
-   Linux: Fix window icon not set on X11 for the first OS window
    (`961`{.interpreted-text role="iss"})
-   macOS: Add an `macos_custom_beam_cursor`{.interpreted-text
    role="opt"} option to use a special mouse cursor image that can be
    seen on both light and dark backgrounds (`359`{.interpreted-text
    role="iss"})
-   Remote control: Fix the `focus_window` command not focusing the
    top-level OS window of the specified kitty window
    (`1003`{.interpreted-text role="iss"})
-   Fix using `focus_follows_mouse`{.interpreted-text role="opt"}
    causing text selection with the mouse to malfunction when using
    multiple kitty windows (`1002`{.interpreted-text role="iss"})

### 0.12.1 \[2018-09-08\]

-   Add a new `--start-in-fullscreen` command line flag to start kitty
    in full screen mode (`856`{.interpreted-text role="iss"})
-   macOS: Fix a character that cannot be rendered in any font causing
    font fallback for all subsequent characters that cannot be rendered
    in the main font to fail (`799`{.interpreted-text role="iss"})
-   Linux: Do not enable IME input via ibus unless the
    `GLFW_IM_MODULE=ibus` environment variable is set. IME causes key
    processing latency and even missed keystrokes for many people, so it
    is now off by default.
-   Fix backspacing of wide characters in wide-character unaware
    programs not working (`875`{.interpreted-text role="iss"})
-   Linux: Fix number pad arrow keys not working when Numlock is off
    (`857`{.interpreted-text role="iss"})
-   Wayland: Implement support for clipboard copy/paste
    (`855`{.interpreted-text role="iss"})
-   Allow mapping shortcuts using the raw key code from the OS
    (`848`{.interpreted-text role="iss"})
-   Allow mapping of individual key-presses without modifiers as
    shortcuts
-   Fix legacy invocation of icat as [kitty icat]{.title-ref} not
    working (`850`{.interpreted-text role="iss"})
-   Improve rendering of wavy underline at small font sizes
    (`853`{.interpreted-text role="iss"})
-   Fix a regression in 0.12.0 that broke dynamic resizing of layouts
    (`860`{.interpreted-text role="iss"})
-   Wayland: Allow using the `kitty --class` command line flag to set
    the app id (`862`{.interpreted-text role="iss"})
-   Add completion of the kitty command for the fish shell
    (`829`{.interpreted-text role="pull"})
-   Linux: Fix XCompose rules with no defined symbol not working
    (`880`{.interpreted-text role="iss"})
-   Linux: Fix crash with some Nvidia drivers when creating tabs in the
    first top level-window after creating a second top-level window.
    (`873`{.interpreted-text role="iss"})
-   macOS: Diff kitten: Fix syntax highlighting not working because of a
    bug in the 0.12.0 macOS package

### 0.12.0 \[2018-09-01\]

-   Preserve the mouse selection even when the contents of the screen
    are scrolled or overwritten provided the new text does not intersect
    the selected lines.
-   Linux: Implement support for Input Method Extensions (multilingual
    input using standard keyboards) via
    [IBus](https://github.com/ibus/ibus/wiki/ReadMe)
    (`469`{.interpreted-text role="iss"})
-   Implement completion for the kitty command in bash and zsh. See
    `shell_integration`{.interpreted-text role="ref"}.
-   Render the text under the cursor in a fixed color, configurable via
    the option `cursor_text_color`{.interpreted-text role="opt"}
    (`126`{.interpreted-text role="iss"})
-   Add an option `env`{.interpreted-text role="opt"} to set environment
    variables in child processes from kitty.conf
-   Add an action to the `clear_terminal` function to scroll the screen
    contents into the scrollback buffer (`1113`{.interpreted-text
    role="iss"})
-   Implement high precision scrolling with the trackpad on platforms
    such as macOS and Wayland that implement it.
    (`819`{.interpreted-text role="pull"})
-   macOS: Allow scrolling window contents using mouse wheel/trackpad
    even when the window is not the active window
    (`729`{.interpreted-text role="iss"})
-   Remote control: Allow changing the current window layout with a new
    `at-goto-layout`{.interpreted-text role="ref"} command
    (`845`{.interpreted-text role="iss"})
-   Remote control: Allow matching windows by the environment variables
    of their child process as well
-   Allow running kittens via the remote control system
    (`738`{.interpreted-text role="iss"})
-   Allow enabling remote control in only some kitty windows
-   Add a keyboard shortcut to reset the terminal
    (`reset_terminal`{.interpreted-text role="sc"}). It takes parameters
    so you can define your own shortcuts to clear the screen/scrollback
    also (`747`{.interpreted-text role="iss"})
-   Fix one-pixel line appearing at window edges at some window sizes
    when displaying images with background opacity enabled
    (`741`{.interpreted-text role="iss"})
-   diff kitten: Fix error when right hand side file is binary and left
    hand side file is text (`752`{.interpreted-text role="pull"})
-   kitty @ new-window: Add a new option
    `kitten @ new-window --window-type`{.interpreted-text role="option"}
    to create top-level OS windows (`770`{.interpreted-text role="iss"})
-   macOS: The `focus_follows_mouse`{.interpreted-text role="opt"}
    option now also works across top-level kitty OS windows
    (`754`{.interpreted-text role="iss"})
-   Fix detection of URLs in HTML source code (URLs inside quotes)
    (`785`{.interpreted-text role="iss"})
-   Implement support for emoji skin tone modifiers
    (`787`{.interpreted-text role="iss"})
-   Round-trip the zwj unicode character. Rendering of sequences
    containing zwj is still not implemented, since it can cause the
    collapse of an unbounded number of characters into a single cell.
    However, kitty at least preserves the zwj by storing it as a
    combining character.
-   macOS: Disable the custom mouse cursor. Using a custom cursor fails
    on dual GPU machines. I give up, Apple users will just have to live
    with the limitations of their choice of OS. (`794`{.interpreted-text
    role="iss"})
-   macOS: Fix control+tab key combination not working
    (`801`{.interpreted-text role="iss"})
-   Linux: Fix slow startup on some systems caused by GLFW searching for
    joysticks. Since kitty does not use joysticks, disable joystick
    support. (`830`{.interpreted-text role="iss"})

### 0.11.3 \[2018-07-10\]

-   Draw only the minimum borders needed for inactive windows. That is
    only the borders that separate the inactive window from a neighbor.
    Note that setting a non-zero window margin overrides this and causes
    all borders to be drawn. The old behavior of drawing all borders can
    be restored via the `draw_minimal_borders`{.interpreted-text
    role="opt"} setting in kitty.conf. (`699`{.interpreted-text
    role="iss"})
-   macOS: Add an option `macos_window_resizable`{.interpreted-text
    role="opt"} to control if kitty top-level windows are resizable
    using the mouse or not (`698`{.interpreted-text role="iss"})
-   macOS: Use a custom mouse cursor that shows up well on both light
    and dark backgrounds (`359`{.interpreted-text role="iss"})
-   macOS: Workaround for switching from fullscreen to windowed mode
    with the titlebar hidden causing window resizing to not work.
    (`711`{.interpreted-text role="iss"})
-   Fix triple-click to select line not working when the entire line is
    filled (`703`{.interpreted-text role="iss"})
-   When dragging to select with the mouse \"grab\" the mouse so that if
    it strays into neighboring windows, the selection is still updated
    (`624`{.interpreted-text role="pull"})
-   When clicking in the margin/border area of a window, map the click
    to the nearest cell in the window. Avoids selection with the mouse
    failing when starting the selection just outside the window.
-   When drag-scrolling stop the scroll when the mouse button is
    released.
-   Fix a regression in the previous release that caused pasting large
    amounts of text to be duplicated (`709`{.interpreted-text
    role="iss"})

### 0.11.2 \[2018-07-01\]

-   Linux: Allow using XKB key names to bind shortcuts to keys not
    supported by GLFW (`665`{.interpreted-text role="pull"})
-   kitty shell: Ignore failure to read readline history file. Happens
    if the user migrates their kitty cache directory between systems
    with incompatible readline implementations.
-   macOS: Fix an error in remote control when using \--listen-on
    (`679`{.interpreted-text role="iss"})
-   hints kitten: Add a
    `kitty +kitten hints --multiple`{.interpreted-text role="option"}
    option to select multiple items (`687`{.interpreted-text
    role="iss"})
-   Fix pasting large amounts of text very slow (`682`{.interpreted-text
    role="iss"})
-   Add an option `single_window_margin_width`{.interpreted-text
    role="opt"} to allow different margins when only a single window is
    visible in the layout (`688`{.interpreted-text role="iss"})
-   Add a `kitty --hold`{.interpreted-text role="option"} command line
    option to stay open after the child process exits
    (`667`{.interpreted-text role="iss"})
-   diff kitten: When triggering a search scroll to the first match
    automatically
-   `kitty --debug-font-fallback`{.interpreted-text role="option"} also
    prints out what basic fonts were matched
-   When closing a kitty window reset the mouse cursor to its default
    shape and ensure it is visible (`655`{.interpreted-text
    role="iss"}).
-   Remote control: Speed-up reading of command responses
-   Linux installer: Fix installer failing on systems with python \< 3.5
-   Support \"-T\" as an alias for \"\--title\" (`659`{.interpreted-text
    role="pull"})
-   Fix a regression in the previous release that broke using
    `--debug-config` with custom key mappings (`695`{.interpreted-text
    role="iss"})

### 0.11.1 \[2018-06-17\]

-   diff kitten: Implement searching for text in the diff
    (`574`{.interpreted-text role="iss"})
-   Add an option `startup_session`{.interpreted-text role="opt"} to
    `kitty.conf`{.interpreted-text role="file"} to specify a default
    startup session (`641`{.interpreted-text role="iss"})
-   Add a command line option
    `kitty --wait-for-single-instance-window-close`{.interpreted-text
    role="option"} to make `kitty --single-instance`{.interpreted-text
    role="option"} wait for the closing of the newly opened window
    before quitting (`630`{.interpreted-text role="iss"})
-   diff kitten: Allow theming the selection background/foreground as
    well
-   diff kitten: Display CRLF line endings using the unicode return
    symbol instead of \<d\> as it is less intrusive
    (`638`{.interpreted-text role="iss"})
-   diff kitten: Fix default foreground/background colors not being
    restored when kitten quits (`637`{.interpreted-text role="iss"})
-   Fix `kitten @ set-colors --all`{.interpreted-text role="option"} not
    working when more than one window present (`632`{.interpreted-text
    role="iss"})
-   Fix a regression that broke the legacy
    increase/decrease[font_size]{#font_size} actions
-   Clear scrollback on reset (`631`{.interpreted-text role="iss"})

### 0.11.0 \[2018-06-12\]

-   A new tab bar style \"fade\" in which each tab\'s edges fade into
    the background. See `tab_bar_style`{.interpreted-text role="opt"}
    and `tab_fade`{.interpreted-text role="opt"} for details. The old
    look can be restored by setting `tab_bar_style`{.interpreted-text
    role="opt"} to `separator`.
-   `Pre-compiled binaries <binary>`{.interpreted-text role="doc"} with
    all bundled dependencies for Linux (`595`{.interpreted-text
    role="iss"})
-   A `new kitten <kittens/panel>`{.interpreted-text role="doc"} to
    create dock panels on X11 desktops showing the output from arbitrary
    terminal programs.
-   Reduce data sent to the GPU per render by 30%
    (`8dea5b3`{.interpreted-text role="commit"})
-   Implement changing the font size for individual top level (OS)
    windows (`408`{.interpreted-text role="iss"})
-   When viewing the scrollback in less using
    `show_scrollback`{.interpreted-text role="sc"} and kitty is
    currently scrolled, position the scrollback in less to match
    kitty\'s scroll position. (`148`{.interpreted-text role="iss"})
-   ssh kitten: Support all SSH options. It can now be aliased directly
    to ssh for convenience. (`591`{.interpreted-text role="pull"})
-   icat kitten: Add
    `kitty +kitten icat --print-window-size`{.interpreted-text
    role="option"} to easily detect the window size in pixels from
    scripting languages (`581`{.interpreted-text role="iss"})
-   hints kitten: Allow selecting hashes from the terminal with
    `insert_selected_hash`{.interpreted-text role="sc"} useful for git
    commits. (`604`{.interpreted-text role="pull"})
-   Allow specifying initial window size in number of cells in addition
    to pixels (`436`{.interpreted-text role="iss"})
-   Add a setting to control the margins to the left and right of the
    tab-bar (`584`{.interpreted-text role="iss"})
-   When closing a tab switch to the last active tab instead of the
    right-most tab (`585`{.interpreted-text role="iss"})
-   Wayland: Fix kitty not starting when using wl[roots]{#roots} based
    compositors (`157`{.interpreted-text role="iss"})
-   Wayland: Fix mouse wheel/touchpad scrolling in opposite direction to
    other apps (`594`{.interpreted-text role="iss"})
-   macOS: Fix the new OS window keyboard shortcut
    (`new_os_window`{.interpreted-text role="sc"}) not working if no
    kitty window currently has focus. (`524`{.interpreted-text
    role="iss"})
-   macOS: Keep kitty running even when the last window is closed. This
    is in line with how applications are supposed to behave on macOS
    (`543`{.interpreted-text role="iss"}). There is a new option
    (`macos_quit_when_last_window_closed`{.interpreted-text role="opt"})
    to control this.
-   macOS: Add macOS standard shortcuts for copy, paste and new OS
    window (⌘+C, ⌘+V, ⌘+N)
-   Add a config option (`editor`{.interpreted-text role="opt"}) to set
    the EDITOR kitty uses (`580`{.interpreted-text role="iss"})
-   Add a config option (`x11_hide_window_decorations`) to hide window
    decorations under X11/Wayland (`607`{.interpreted-text role="iss"})
-   Add an option to \@set-window-title to make the title change
    non-permanent (`592`{.interpreted-text role="iss"})
-   Add support for the CSI t escape code to query window and cell sizes
    (`581`{.interpreted-text role="iss"})
-   Linux: When using layouts that map the keys to non-ascii characters,
    map shortcuts using the ascii equivalents, from the default layout.
    (`606`{.interpreted-text role="iss"})
-   Linux: Fix fonts not being correctly read from TrueType Collection
    (.ttc) files (`577`{.interpreted-text role="iss"})
-   Fix `inactive_text_alpha`{.interpreted-text role="opt"} also
    applying to the tab bar (`612`{.interpreted-text role="iss"})
-   `hints kitten <kittens/hints>`{.interpreted-text role="doc"}: Fix a
    regression that caused some blank lines to be not be displayed.
-   Linux: Include a man page and the HTML docs when building the
    linux-package
-   Remote control: Fix kitty @ sometimes failing to read the response
    from kitty. (`614`{.interpreted-text role="iss"})
-   Fix [kitty @ set-colors]{.title-ref} not working with the window
    border colors. (`623`{.interpreted-text role="iss"})
-   Fix a regression in 0.10 that caused incorrect rendering of the
    status bar in irssi when used inside screen.
    (`621`{.interpreted-text role="iss"})

### 0.10.1 \[2018-05-24\]

-   Add a kitten to easily ssh into servers that automatically copies
    the terminfo files over. `kitty +kitten ssh myserver`.
-   diff kitten: Make the keyboard shortcuts configurable
    (`563`{.interpreted-text role="iss"})
-   Allow controlling *background_opacity* via either keyboard shortcuts
    or remote control. Note that you must set
    *dynamic_background_opacity yes* in kitty.conf first.
    (`569`{.interpreted-text role="iss"})
-   diff kitten: Add keybindings to scroll by page
-   diff kitten: Fix incorrect syntax highlighting for a few file
    formats such as yaml
-   macOS: Fix regression that caused the *macos_option_as_alt* setting
    to always be disabled for all OS windows in a kitty instance after
    the first window (`571`{.interpreted-text role="iss"})
-   Fix Ctrl+Alt+Space not working in normal and application keyboard
    modes (`562`{.interpreted-text role="iss"})

### 0.10.0 \[2018-05-21\]

-   A diff kitten to show side-by-side diffs with syntax highlighting
    and support for images. See
    `diff kitten <kittens/diff>`{.interpreted-text role="doc"}.
-   Make windows in the various kitty layouts manually resizable. See
    `layouts`{.interpreted-text role="ref"} for details.
-   Implement support for the SGR *faint* escape code to make text blend
    into the background (`446`{.interpreted-text role="iss"}).
-   Make the hints kitten a little smarter (`ad1109b`{.interpreted-text
    role="commit"}) so that URLs that stretch over multiple lines are
    detected. Also improve detection of surrounding brackets/quotes.
-   Make the kitty window id available as the environment variable
    `KITTY_WINDOW_ID` (`532`{.interpreted-text role="iss"}).
-   Add a \"fat\" layout that is similar to the \"tall\" layout but
    vertically oriented.
-   Expand environment variables in config file include directives
-   Allow programs running in kitty to read/write from the clipboard
    (`889ca77`{.interpreted-text role="commit"}). By default only
    writing is allowed. This feature is supported in many terminals,
    search for [OSC 52 clipboard]{.title-ref} to find out more about
    using it.
-   Fix moving cursor outside a defined page area incorrectly causing
    the cursor to be placed inside the page area. Caused incorrect
    rendering in neovim, in some situations (`542`{.interpreted-text
    role="iss"}).
-   Render a couple more powerline symbols directly, bypassing the font
    (`550`{.interpreted-text role="iss"}).
-   Fix ctrl+alt+\<special\> not working in normal and application
    keyboard (`548`{.interpreted-text role="iss"}).
-   Partial fix for rendering Right-to-left languages like Arabic.
    Rendering of Arabic is never going to be perfect, but now it is at
    least readable.
-   Fix Ctrl+backspace acting as plain backspace in normal and
    application keyboard modes (`538`{.interpreted-text role="iss"}).
-   Have the paste[from_selection]{#from_selection} action paste from
    the clipboard on platforms that do not have a primary selection such
    as Wayland and macOS (`529`{.interpreted-text role="iss"})
-   Fix cursor[stop_blinking_after]{#stop_blinking_after}=0 not working
    (`530`{.interpreted-text role="iss"})

### 0.9.1 \[2018-05-05\]

-   Show a bell symbol on the tab if a bell occurs in one of the windows
    in the tab and the window is not the currently focused window
-   Change the window border color if a bell occurs in an unfocused
    window. Can be disabled by setting the
    bell[border_color]{#border_color} to be the same as the
    inactive[border_color]{#border_color}.
-   macOS: Add support for dead keys
-   Unicode input: When searching by name search for prefix matches as
    well as whole word matches
-   Dynamically allocate the memory used for the scrollback history
    buffer. Reduces startup memory consumption when using very large
    scrollback buffer sizes.
-   Add an option to not request window attention on bell.
-   Remote control: Allow matching windows by number (visible position).
-   macOS: Fix changing tab title and kitty shell not working
-   When triple-clicking select all wrapped lines belonging to a single
    logical line.
-   hints kitten: Detect bracketed URLs and don\'t include the closing
    bracket in the URL.
-   When calling pass[selection_to_program]{#selection_to_program} use
    the current directory of the child process as the cwd of the
    program.
-   Add macos[hide_from_tasks]{#hide_from_tasks} option to hide kitty
    from the macOS task switcher
-   macOS: When the macos[titlebar_color]{#titlebar_color} is set to
    background change the titlebar colors to match the current
    background color of the active kitty window
-   Add a setting to clear all shortcuts defined up to that point in the
    config file(s)
-   Add a setting (kitty[mod]{#mod}) to change the modifier used by all
    the default kitty shortcuts, globally
-   Fix Shift+function key not working
-   Support the F13 to F25 function keys
-   Don\'t fail to start if the user deletes the hintstyle key from
    their fontconfig configuration.
-   When rendering a private use unicode codepoint and a space as a two
    cell ligature, set the foreground colors of the space cell to match
    the colors of the first cell. Works around applications like
    powerline that use different colors for the two cells.
-   Fix passing \@text to other programs such as when viewing the
    scrollback buffer not working correctly if kitty is itself scrolled
    up.
-   Fix window focus gained/lost events not being reported to child
    programs when switching windows/tabs using the various keyboard
    shortcuts.
-   Fix tab title not changing to reflect the window title when
    switching between different windows in a tab
-   Ignore -e if it is specified on the command line. This is for
    compatibility with broken software that assumes terminals should run
    with an -e option to execute commands instead of just passing the
    commands as arguments.

### 0.9.0 \[2018-04-15\]

-   A new kitty command shell to allow controlling kitty via commands.
    Press [ctrl+shift+escape]{.title-ref} to run the shell.
-   The hints kitten has become much more powerful. Now in addition to
    URLs you can use it to select word, paths, filenames, lines, etc.
    from the screen. These can be inserted into the terminal, copied to
    clipboard or sent to external programs.
-   Linux: Switch to libxkbcommon for keyboard handling. It allows kitty
    to support XCompose and dead keys and also react to keyboard
    remapping/layout change without needing a restart.
-   Add support for multiple-key-sequence shortcuts
-   A new remote control command [set-colors]{.title-ref} to change the
    current and/or configured colors.
-   When double-clicking to select a word, select words that continue
    onto the next/prev line as well.
-   Add an [include]{.title-ref} directive for the config files to read
    multiple config files
-   Improve mouse selection for windows with padding. Moving the mouse
    into the padding area now acts as if the mouse is over the nearest
    cell.
-   Allow setting all 256 terminal colors in the config file
-   Fix using [kitty \--single-instance]{.title-ref} to open a new
    window in a running kitty instance, not respecting the
    [\--directory]{.title-ref} flag
-   URL hints: Exclude trailing punctuation from URLs
-   URL hints: Launch the browser from the kitty parent process rather
    than the hints kitten. Fixes launching on some systems where
    xdg-open doesn\'t like being run from a kitten.
-   Allow using rectangle select mode by pressing shift in addition to
    the rectangle select modifiers even when the terminal program has
    grabbed the mouse.

### 0.8.4 \[2018-03-31\]

-   Fix presence of XDG[CONFIG_DIRS]{#config_dirs} and absence of
    XDG[CONFIG_HOME]{#config_home} preventing kitty from starting
-   Revert change in last release to cell width calculation. Instead
    just clip the right edges of characters that overflow the cell by at
    most two pixels

### 0.8.3 \[2018-03-29\]

-   Fix a regression that broke the visual bell and invert screen colors
    escape code
-   Allow double-click and triple-click + drag to extend selections word
    at a time or line at a time
-   Add a keyboard shortcut to set the tab title
-   Fix setting window title to empty via OSC escape code not working
    correctly
-   Linux: Fix cell width calculation incorrect for some fonts (cell
    widths are now calculated by actually rendering bitmaps, which is
    slower but more accurate)
-   Allow specifying a system wide kitty config file, for all users
-   Add a \--debug-config command line flag to output data about the
    system and kitty configuration.
-   Wayland: Fix auto-repeat of keys not working

### 0.8.2 \[2018-03-17\]

-   Allow extending existing selections by right clicking
-   Add a configurable keyboard shortcut and remote command to set the
    font size to a specific value
-   Add an option to have kitty close the window when the main processes
    running in it exits, even if there are still background processes
    writing to that terminal
-   Add configurable keyboard shortcuts to switch to a specific layout
-   Add a keyboard shortcut to edit the kitty config file easily
-   macOS: Fix restoring of window size not correct on Retina screens
-   macOS: Add a facility to specify command line arguments when running
    kitty from the GUI
-   Add a focus-tab remote command
-   Fix screen not being refreshed immediately after moving a window.
-   Fix a crash when getting the contents of the scrollback buffer as
    text

### 0.8.1 \[2018-03-09\]

-   Extend kitty\'s remote control feature to work over both UNIX and
    TCP sockets, so now you can control kitty from across the internet,
    if you want to.
-   Render private use unicode characters that are followed by a space
    as a two character ligature. This fixes rendering for applications
    that misuse private-use characters to display square symbols.
-   Fix Unicode emoji presentation variant selector causing new a
    fallback font instance to be created
-   Fix a rare error that prevented the Unicode input kitten from
    working sometimes
-   Allow using Ctrl+Alt+letter in legacy keyboard modes by outputting
    them as Ctrl+letter and Alt+letter. This matches other terminals\'
    behavior.
-   Fix cursor position off-by-one on horizontal axis when resizing the
    terminal
-   Wayland: Fix auto-repeat of keys not working
-   Wayland: Add support for window decorations provided by the Wayland
    shell
-   macOS: Fix URL hints not working
-   macOS: Fix shell not starting in login mode on some computers
-   macOS: Output errors into console.app when running as a bundle

### 0.8.0 \[2018-02-24\]

-   A framework for kittens, that is, small terminal programs designed
    to run inside kitty and extend its capabilities. Examples include
    unicode input and selecting URLs with the keyboard.
-   Input arbitrary unicode characters by pressing Ctrl+Shift+u. You can
    choose characters by name, by hex code, by recently used, etc. There
    is even and editable Favorites list.
-   Open URLs using only the keyboard. kitty has a new \"hints mode\".
    Press Ctrl+Shift+e and all detected URLs on the screen are
    highlighted with a key to press to open them. The facility is
    customizable so you can change what is detected as a URL and which
    program is used to open it.
-   Add an option to change the titlebar color of kitty windows on macOS
-   Only consider Emoji characters with default Emoji presentation to be
    two cells wide. This matches the standard. Also add support for the
    Unicode Emoji variation presentation selector.
-   Prevent video tearing during high speed scrolling by syncing draws
    to the monitor\'s refresh rate. There is a new configuration option
    to control this `sync_to_monitor`.
-   When displaying only a single window, use the default background
    color of the window (which can be changed via escape codes) as the
    color for the margin and padding of the window.
-   Add some non standard terminfo capabilities used by neovim and tmux.
-   Fix large drop in performance when using multiple top-level windows
    on macOS
-   Fix save/restore of window sizes not working correctly.
-   Remove option to use system wcwidth(). Now always use a wcwidth()
    based on the Unicode standard. Only sane way.
-   Fix a regression that caused a few ligature glyphs to not render
    correctly in rare circumstances.
-   Browsing the scrollback buffer now happens in an overlay window
    instead of a new window/tab.

### 0.7.1 \[2018-01-31\]

-   Add an option to adjust the width of character cells
-   Fix selecting text with the mouse in the scrollback buffer selecting
    text from the line above the actually selected line
-   Fix some italic fonts having the right edge of characters cut-off,
    unnecessarily

### 0.7.0 \[2018-01-24\]

-   Allow controlling kitty from the shell prompt/scripts. You can
    open/close/rename windows and tabs and even send input to specific
    windows. See the README for details.
-   Add option to put tab bar at the top instead of the bottom
-   Add option to override the default shell
-   Add \"Horizontal\" and \"Vertical\" window layouts
-   Sessions: Allow setting titles and working directories for
    individual windows
-   Option to copy to clipboard on mouse select
-   Fix incorrect reporting of mouse move events when using the SGR
    protocol
-   Make alt+backspace delete the previous word
-   Take the mouse wheel multiplier option in to account when generating
    fake key scroll events
-   macOS: Fix closing top-level window does not transfer focus to other
    top-level windows.
-   macOS: Fix alt+arrow keys not working when disabling the
    macos[option_as_alt]{#option_as_alt} config option.
-   kitty icat: Workaround for bug in ImageMagick that would cause some
    images to fail to display at certain sizes.
-   Fix rendering of text with ligature fonts that do not use dummy
    glyphs
-   Fix a regression that caused copying of the selection to clipboard
    to only copy the visible part of the selection
-   Fix incorrect handling of some unicode combining marks that are not
    re-ordered
-   Fix handling on non-BMP combining characters
-   Drop the dependency on libunistring

### 0.6.1 \[2017-12-28\]

-   Add an option to fade the text in inactive windows
-   Add new actions to open windows/tabs/etc. with the working directory
    set to the working directory of the current window.
-   Automatically adjust cell size when DPI changes, for example when
    kitty is moved from one monitor to another with a different DPI
-   Ensure underlines are rendered even for fonts with very poor metrics
-   Fix some emoji glyphs not colored on Linux
-   Internal wcwidth() implementation is now auto-generated from the
    unicode standard database
-   Allow configuring the modifiers to use for rectangular selection
    with the mouse.
-   Fix incorrect minimum wayland version in the build script
-   Fix a crash when detecting a URL that ends at the end of the line
-   Fix regression that broke drawing of hollow cursor when window loses
    focus

### 0.6.0 \[2017-12-18\]

-   Support background transparency via the
    background[opacity]{#opacity} option. Provided that your OS/window
    manager supports transparency, you can now have kitty render pixels
    that have only the default background color as semi-transparent.
-   Support multiple top level (OS) windows. These windows all share the
    sprite texture cache on the GPU, further reducing overall resource
    usage. Use the shortcut [ctrl+shift+n]{.title-ref} to open a new
    top-level window.
-   Add support for a *daemon* mode using the
    [\--single-instance]{.title-ref} command line option. With this
    option you can have only a single kitty instance running. All future
    invocations simply open new top-level windows in the existing
    instance.
-   Support colored emoji
-   Use CoreText instead of FreeType to render text on macOS
-   Support running on the \"low power\" GPU on dual GPU macOS machines
-   Add a new \"grid\" window layout
-   Drop the dependency on glfw (kitty now uses a modified, bundled copy
    of glfw)
-   Add an option to control the audio bell volume on X11 systems
-   Add a command line switch to set the name part of the
    WM[CLASS]{#class} window property independently.
-   Add a command line switch to set the window title.
-   Add more options to customize the tab-bar\'s appearance (font styles
    and separator)
-   Allow drag and drop of files into kitty. On drop kitty will paste
    the file path to the running program.
-   Add an option to control the underline style for URL highlighting on
    hover
-   X11: Set the WINDOWID environment variable
-   Fix middle and right buttons swapped when sending mouse events to
    child processes
-   Allow selecting in a rectangle by holding down Ctrl+Alt while
    dragging with the mouse.

### 0.5.1 \[2017-12-01\]

-   Add an option to control the thickness of lines in box drawing
    characters
-   Increase max. allowed ligature length to nine characters
-   Fix text not vertically centered when adjusting line height
-   Fix unicode block characters not being rendered properly
-   Fix shift+up/down not generating correct escape codes
-   Image display: Fix displaying images taller than two screen heights
    not scrolling properly

### 0.5.0 \[2017-11-19\]

-   Add support for ligature fonts such as Fira Code, Hasklig, etc.
    kitty now uses harfbuzz for text shaping which allow it to support
    advanced OpenType features such as contextual
    alternates/ligatures/combining glyphs/etc.
-   Make it easy to select fonts by allowing listing of monospace fonts
    using: kitty list-fonts
-   Add an option to have window focus follow mouse
-   Add a keyboard shortcut (ctrl+shift+f11) to toggle fullscreen mode
-   macOS: Fix handling of option key. It now behaves just like the alt
    key on Linux. There is an option to make it type unicode characters
    instead.
-   Linux: Add support for startup notification on X11 desktops. kitty
    will now inform the window manager when its startup is complete.
-   Fix shell prompt being duplicated when window is resized
-   Fix crash when displaying more than 64 images in the same session
-   Add support for colons in SGR color codes. These are generated by
    some applications such as neovim when they mistakenly identify kitty
    as a libvte based terminal.
-   Fix mouse interaction not working in apps using obsolete mouse
    interaction protocols
-   Linux: no longer require glew as a dependency

### 0.4.2 \[2017-10-23\]

-   Fix a regression in 0.4.0 that broke custom key mappings
-   Fix a regression in 0.4.0 that broke support for non-QWERTY keyboard
    layouts
-   Avoid using threads to reap zombie child processes. Also prevent
    kitty from hanging if the open program hangs when clicking on a URL.

### 0.4.0 \[2017-10-22\]

-   Support for drawing arbitrary raster graphics (images) in the
    terminal via a new graphics protocol. kitty can draw images with
    full 32-bit color using both ssh connections and files/shared memory
    (when available) for better performance. The drawing primitives
    support alpha blending and z-index. Images can be drawn both above
    and below text. See `graphics-protocol`{.interpreted-text
    role="doc"}. for details.
-   Refactor kitty\'s internals to make it even faster and more
    efficient. The CPU usage of kitty + X server while doing intensive
    tasks such as scrolling a file continuously in less has been reduced
    by 50%. There are now two configuration options `repaint_delay` and
    `input_delay` you can use to fine tune kitty\'s performance vs CPU
    usage profile. The CPU usage of kitty + X when scrolling in less is
    now significantly better than most (all?) other terminals. See
    `performance`{.interpreted-text role="doc"}.
-   Hovering over URLs with the mouse now underlines them to indicate
    they can be clicked. Hold down Ctrl+Shift while clicking to open the
    URL.
-   Selection using the mouse is now more intelligent. It does not add
    blank cells (i.e. cells that have no content) after the end of text
    in a line to the selection.
-   The block cursor in now fully opaque but renders the character under
    it in the background color, for enhanced visibility.
-   Allow combining multiple independent actions into a single shortcut
-   Add a new shortcut to pass the current selection to an external
    program
-   Allow creating shortcuts to open new windows running arbitrary
    commands. You can also pass the current selection to the command as
    an arguments and the contents of the screen + scrollback buffer as
    stdin to the command.
# Copying all data types to the clipboard

There already exists an escape code to allow terminal programs to
read/write plain text data from the system clipboard, *OSC 52*. kitty
introduces a more advanced protocol that supports:

-   Copy arbitrary data including images, rich text documents, etc.
-   Allow terminals to ask the user for permission to access the
    clipboard and report permission denied

The escape code is *OSC 5522*, an extension of *OSC 52*. The basic
format of the escape code is:

    <OSC>5522;metadata;payload<ST>

Here, *metadata* is a colon separated list of key-value pairs and
payload is base64 encoded data. `OSC` is `<ESC>[`. `ST` is the string
terminator, `<ESC>\\`.

## Reading data from the system clipboard

To read data from the system clipboard, the escape code is:

    <OSC>5522;type=read;<base 64 encoded space separated list of mime types to read><ST>

For example, to read plain text and PNG data, the payload would be:

    text/plain image/png

encoded as base64. To read from the primary selection instead of the
clipboard, add the key `loc=primary` to the metadata section.

To get the list of MIME types available on the clipboard the payload
must be just a period (`.`), encoded as base64.

The terminal emulator will reply with a sequence of escape codes of the
form:

    <OSC>5522;type=read:status=OK<ST>
    <OSC>5522;type=read:status=DATA:mime=<base 64 encoded mime type>;<base64 encoded data><ST>
    <OSC>5522;type=read:status=DATA:mime=<base 64 encoded mime type>;<base64 encoded data><ST>
    .
    .
    .
    <OSC>5522;type=read:status=DONE<ST>

Here, the `status=DATA` packets deliver the data (as base64 encoded
bytes) associated with each MIME type. The terminal emulator should
chunk up the data for an individual type, into chunks of size **no
more** than 4096 bytes (4096 is the size of a chunk *before* base64
encoding). All the chunks for a given type must be transmitted
sequentially and only once they are done the chunks for the next type,
if any, should be sent. The end of data is indicated by a `status=DONE`
packet.

If an error occurs, instead of the opening `status=OK` packet the
terminal must send a `status=ERRORCODE` packet. The error code must be
one of:

`status=ENOSYS`

:   Sent if the requested clipboard type is not available. For example,
    primary selection is not available on all systems and `loc=primary`
    was used.

`status=EPERM`

:   Sent if permission to read from the clipboard was denied by the
    system or the user.

`status=EBUSY`

:   Sent if there is some temporary problem, such as multiple clients in
    a multiplexer trying to access the clipboard simultaneously.

Terminals should ask the user for permission before allowing a read
request. However, if a read request only wishes to list the available
data types on the clipboard, it should be allowed without a permission
prompt. This is so that the user is not presented with a double
permission prompt for reading the available MIME types and then reading
the actual data.

## Writing data to the system clipboard

To write data to the system clipboard, the terminal programs sends the
following sequence of packets:

    <OSC>5522;type=write<ST>
    <OSC>5522;type=wdata:mime=<base64 encoded mime type>;<base 64 encoded chunk of data for this type><ST>
    <OSC>5522;type=wdata:mime=<base64 encoded mime type>;<base 64 encoded chunk of data for this type><ST>
    .
    .
    .
    <OSC>5522;type=wdata<ST>

The final packet with no mime and no data indicates end of transmission.
The data for every MIME type should be split into chunks of no more than
4096 bytes (4096 is the size of the data before base64 encoding). All
the chunks for a given MIME type must be sent sequentially, before
sending chunks for the next MIME type. After the transmission is
complete, the terminal replies with a single packet indicating success:

    <OSC>5522;type=write:status=DONE<ST>

If an error occurs the terminal can, at any time, send an error packet
of the form:

    <OSC>5522;type=write:status=ERRORCODE<ST>

Here `ERRORCODE` must be one of:

`status=EIO`

:   An I/O error occurred while processing the data

`status=EINVAL`

:   One of the packets was invalid, usually because of invalid base64
    encoding.

`status=ENOSYS`

:   The client asked to write to the primary selection with
    (`loc=primary`) and that is not available on the system

`status=EPERM`

:   Sent if permission to write to the clipboard was denied by the
    system or the user.

`status=EBUSY`

:   Sent if there is some temporary problem, such as multiple clients in
    a multiplexer trying to access the clipboard simultaneously.

Once an error occurs, the terminal must ignore all further OSC 5522
write related packets until it sees the start of a new write with a
`type=write` packet.

The client can send to the primary selection instead of the clipboard by
adding `loc=primary` to the initial `type=write` packet.

Finally, clients have the ability to *alias* MIME types when sending
data to the clipboard. To do that, the client must send a `type=walias`
packet of the form:

    <OSC>5522;type=walias;mime=<base64 encoded target MIME type>;<base64 encoded, space separated list of aliases><ST>

The effect of an alias is that the system clipboard will make available
all the aliased MIME types, with the same data as was transmitted for
the target MIME type. This saves bandwidth, allowing the client to only
transmit one copy of the data, but create multiple references to it in
the system clipboard. Alias packets can be sent anytime after the
initial write packet and before the end of data packet.

## Avoiding repeated permission prompts {#clipboard_repeated_permission}

::: versionadded
0.42.2 using a password to avoid repeated confirmations
:::

If a program like an editor wants to make use of the system clipboard,
by default, the user is prompted on every read request. This can become
quite fatiguing. To avoid this situation, this protocol allows sending a
password and human friendly name with `type=write` and `type=read`
requests. The terminal can then ask the user to allow all future
requests using that password. If the user agrees, future requests on the
same tty will be automatically allowed by the terminal. The editor or
other program using this facility should ideally use a password randomly
generated at startup, such as a UUID4. However, terminals may implement
permanent/stored passwords. Users can then configure terminal programs
they trust to use these password.

The password and the human name are encoded using the `pw` and `name`
keys in the metadata. The values are UTF-8 strings that are base64
encoded. Specifying a password without a human friendly name is
equivalent to not specifying a password and the terminal must treat the
request as though it had no password.

## Allowing terminal applications to respond to paste events

::: versionadded
0.44.1 paste events via the 5522 mode
:::

If a TUI application wants to handle paste events (like the user
pressing the paste key shortcut used by the terminal or selecting paste
from a terminal UI menu) it can enable the *paste events* private mode
(5522), as described in this [ancillary
specification](https://rockorager.dev/misc/bracketed-paste-mime/). When
that mode is set, the terminal will send the application a list of MIME
types on the clipboard every time the user triggers a paste action. The
application is then free to request whatever MIME data it wants from the
list of types.

The mode can be enabled using the standard DECSET or DECRST control
sequences. `CSI ? 5522 h` to enable the mode. `CSI ? 5522 l` to disable
the mode.

The terminal *should* send a one time password with the list of mime
types, as the `pw` key (base64 encoded). The application can then use
this password to request data from the clipboard without needing a
permission prompt. The human name *should* be set to `Paste event`
(base64 encoded) when the application uses this one time password.

## Detecting support for this protocol

Applications can detect if a terminal supports this protocol with a
standard DECRQM query:

``` 
CSI ? 5522 $ p
```

To which the terminal will respond with a DECRPM response:

``` 
CSI ? 5522 ; Ps $ y
```

A Ps value of 0 or 4 means the mode is not supported.

## Support for terminal multiplexers

Since this protocol involves two way communication between the terminal
emulator and the client program, multiplexers need a way to know which
window to send responses from the terminal to. In order to make this
possible, the metadata portion of this escape code includes an optional
`id` field. If present the terminal emulator must send it back unchanged
with every response. Valid ids must include only characters from the
set: `[a-zA-Z0-9-_+.]`. Any other characters must be stripped out from
the id by the terminal emulator before retransmitting it.

Note that when using a terminal multiplexer it is possible for two
different programs to overwrite each other\'s clipboard requests. This
is fundamentally unavoidable since the system clipboard is a single
global shared resource. However, there is an additional complication
where responses from this protocol could get lost if, for instance,
multiple write requests are received simultaneously. It is up to well
designed multiplexers to ensure that only a single request is in flight
at a time. The multiplexer can abort requests by sending back the
`EBUSY` error code indicating some other window is trying to access the
clipboard.

When the terminal sends an unsolicited paste event because the user
triggered a paste and the 5522 mode is enabled, there will be no
associated id. In this case, the multiplexer must forward the event to
the currently active window.
# Color control

## Saving and restoring colors

It is often useful for a full screen application with its own color
themes to set the default foreground, background, selection and cursor
colors and the ANSI color table. This allows for various performance
optimizations when drawing the screen. The problem is that if the user
previously used the escape codes to change these colors themselves, then
running the full screen application will lose those changes even after
it exits. To avoid this, kitty introduces a new pair of *OSC* escape
codes to push and pop the current color values from a stack:

    <ESC>]30001<ESC>\  # push onto stack
    <ESC>]30101<ESC>\  # pop from stack

These escape codes save/restore the colors, default background, default
foreground, selection background, selection foreground and cursor color
and the 256 colors of the ANSI color table.

:::: note
::: title
Note
:::

In July 2020, after several years, xterm copied this protocol extension,
without acknowledgement, and using incompatible escape codes
(XTPUSHCOLORS, XTPOPCOLORS, XTREPORTCOLORS). And they decided to save
not just the dynamic colors but the entire ANSI color table. In the
interests of promoting interoperability, kitty added support for
xterm\'s escape codes as well, and changed this extension to also
save/restore the entire ANSI color table.
::::

## Setting and querying colors {#color_control}

While there exists a legacy protocol developed by XTerm for querying and
setting colors, as with most XTerm protocols it suffers from the usual
design limitations of being under specified and in-sufficient. XTerm
implements querying of colors using OSC 4,5,6,10-19,104,105,106,110-119.
This absurd profusion of numbers is completely unnecessary, redundant
and requires adding two new numbers for every new color. Also XTerm\'s
protocol doesn\'t handle the case of colors that are unknown to the
terminal or that are not a set value, for example, many terminals
implement selection as a reverse video effect not a fixed color. The
XTerm protocol has no way to query for this condition. The protocol also
doesn\'t actually specify the format in which colors are reported,
deferring to a man page for X11!

Instead kitty has developed a single number based protocol that
addresses all these shortcomings and is future proof by virtue of using
string keys rather than numbers. The syntax of the escape code is:

    <OSC> 21 ; key=value ; key=value ; ... <ST>

The spaces in the above definition are for reading clarity and should be
ignored. Here, `<OSC>` is the two bytes `0x1b (ESC)` and `0x5d (])`.
`<ST>` is either `0x07 (BEL)` or the two bytes `0x1b (ESC)` and
`0x5c (\\)`.

`key` is a number from 0-255 to query or set the color values from the
terminals ANSI color table, or one of the strings in the table below for
special colors:

  key                                                     meaning                                                                                                                                                                                                                      dynamic
  ------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------
  foreground                                              The default foreground text color                                                                                                                                                                                            Not applicable
  background                                              The default background text color                                                                                                                                                                                            Not applicable
  selection[background]{#background}                      The background color of selections                                                                                                                                                                                           Reverse video
  selection[foreground]{#foreground}                      The foreground color of selections                                                                                                                                                                                           Reverse video
  cursor                                                  The color of the text cursor                                                                                                                                                                                                 Foreground color
  cursor[text]{#text}                                     The color of text under the cursor                                                                                                                                                                                           Background color
  visual[bell]{#bell}                                     The color of a visual bell                                                                                                                                                                                                   Automatic color selection based on current screen colors
  transparent[background_color1]{#background_color1}..7   A background color that is rendered with the specified opacity in cells that have the specified background color. An opacity value less than zero means, use the `background_opacity`{.interpreted-text role="opt"} value.   Unset

In this table the third column shows what effect setting the color to
*dynamic* has in kitty and many other terminal emulators. It is advisory
only, terminal emulators may not support dynamic colors for these or
they may have other effects. Setting the ANSI color table colors to
dynamic is not allowed.

### Querying current color values

To query colors values, the client program sends this escape code with
the `value` field set to `?` (the byte `0x3f`). The terminal then
responds with the same escape code, but with the `?` replaced by the
`encoded
color value <color_control_color_encoding>`{.interpreted-text
role="ref"}. If the queried color is one that does not have a defined
value, for example, if the terminal is using a reverse video effect or a
gradient or similar, then the value must be empty, that is the response
contains only the key and `=`, no value. For example, if the client
sends:

    <OSC> 21 ; foreground=? ; cursor=? <ST>

The terminal responds:

    <OSC> 21 ; foreground=rgb:ff/00/00 ; cursor= <ST>

This indicates that the foreground color is red and the cursor color is
undefined (typically the cursor takes the color of the text under it and
the text takes the color of the background).

If the terminal does not know a field that a client sends to it for a
query it must respond back with the `field=?`, that is, it must send
back a question mark as the value.

### Setting color values

To set a color value, the client program sends this escape code with the
`value` field set to either an `encoded color value
<color_control_color_encoding>`{.interpreted-text role="ref"} or the
empty value. The empty value means the terminal should use a dynamic
color for example reverse video for selections or similar. To reset a
color to its default value (i.e. the value it would have if it was never
set) the client program should send just the key name with no `=` and no
value. For example:

    <OSC> 21 ; foreground=green ; cursor= ; background <ST>

This sets the foreground to the color green, sets the cursor color to
dynamic (usually meaning the cursor takes the color of the text under
it) and resets the background color to its default value.

To check if setting succeeded, the client can simply query the color, in
fact the two can be combined into a single escape code, for example:

    <OSC> 21 ; foreground=white ; foreground=? <ST>

The terminal will change the foreground color and reply with the new
foreground color.

### Color value encoding {#color_control_color_encoding}

The color encoding is inherited from the scheme used by XTerm, for
compatibility, but a sane, rigorously specified subset is chosen.

RGB colors are encoded in one of three forms:

`rgb:<red>/<green>/<blue>`

:   | \<red\>, \<green\>, \<blue\> := h \| hh \| hhh \| hhhh
    | h := single hexadecimal digits (case insignificant)
    | Note that h indicates the value scaled in 4 bits, hh the value
      scaled in 8 bits, hhh the value scaled in 12 bits, and hhhh the
      value scaled in 16 bits, respectively.

`#<h...>`

:   | h := single hexadecimal digits (case insignificant)
    | #RGB (4 bits each)
    | #RRGGBB (8 bits each)
    | #RRRGGGBBB (12 bits each)
    | #RRRRGGGGBBBB (16 bits each)
    | The R, G, and B represent single hexadecimal digits. When fewer
      than 16 bits each are specified, they represent the most
      significant bits of the value (unlike the "rgb:" syntax, in which
      values are scaled). For example, the string `#3a7` is the same as
      `#3000a0007000`.

`rgbi:<red>/<green>/<blue>`

:   red, green, and blue are floating-point values between 0.0 and 1.0,
    inclusive. The input format for these values is an optional sign, a
    string of numbers possibly containing a decimal point, and an
    optional exponent field containing an E or e followed by a possibly
    signed integer string. Values outside the `0 - 1` range must be
    clipped to be within the range.

If a color should have an alpha component, it must be suffixed to the
color specification in the form `@number between zero and one`. For
example:

    red@0.5 rgb:ff0000@0.1 #ff0000@0.3

The syntax for the floating point alpha component is the same as used
for the components of `rgbi` defined above. When not specified, the
default alpha value is `1.0`. Values outside the range `0 - 1` must be
clipped to be within the range, negative values may have special context
dependent meaning.

In addition, the following color names are accepted (case-insensitively)
corresponding to the specified RGB values.
# kitty.conf

::: only
man

## Overview
:::

[\|kitty\|](##SUBST##|kitty|) is highly customizable, everything from
keyboard shortcuts, to rendering frames-per-second. See below for an
overview of all customization possibilities.

You can open the config file within [\|kitty\|](##SUBST##|kitty|) by
pressing `edit_config_file`{.interpreted-text role="sc"}
(`⌘+,`{.interpreted-text role="kbd"} on macOS). A
`kitty.conf`{.interpreted-text role="file"} with commented default
configurations and descriptions will be created if the file does not
exist. The configuration is automatically reloaded when modified,
controlled by `auto_reload_config`{.interpreted-text role="opt"}. You
can manually reload the config by pressing
`reload_config_file`{.interpreted-text role="sc"}
(`⌃+⌘+,`{.interpreted-text role="kbd"} on macOS) or sending
[\|kitty\|](##SUBST##|kitty|) the `SIGUSR1` signal with
`kill -SIGUSR1 $KITTY_PID`. You can also display the current
configuration by pressing `debug_config`{.interpreted-text role="sc"}
(`⌥+⌘+,`{.interpreted-text role="kbd"} on macOS).

::: {#confloc}
[\|kitty\|](##SUBST##|kitty|) looks for a config file in the OS config
directories (usually `~/.config/kitty/kitty.conf`{.interpreted-text
role="file"}) but you can pass a specific path via the
`kitty --config`{.interpreted-text role="option"} option or use the
`KITTY_CONFIG_DIRECTORY`{.interpreted-text role="envvar"} environment
variable. See `kitty --config`{.interpreted-text role="option"} for full
details.
:::

**Comments** can be added to the config file as lines starting with the
`#` character. This works only if the `#` character is the first
character in the line.

**Lines can be split** by starting the next line with the `\` character.
All leading whitespace and the `\` character are removed.

::: {#include}
You can **include secondary config files** via the `include` directive.
If you use a relative path for `include`, it is resolved with respect to
the location of the current config file. Note that environment variables
are expanded, so `${USER}.conf` becomes `name.conf`{.interpreted-text
role="file"} if `USER=name`. A special environment variable
`KITTY_OS`{.interpreted-text role="envvar"} is available, to detect the
operating system. It is `linux`, `macos` or `bsd`. Also, you can use
`globinclude` to include files matching a shell glob pattern and
`envinclude` to include configuration from environment variables.
Finally, you can dynamically generate configuration by running a program
using `geninclude`. For example:

``` conf
# Include other.conf
include other.conf
# Include *.conf files from all subdirs of kitty.d inside the kitty config dir
globinclude kitty.d/**/*.conf
# Include the *contents* of all env vars starting with KITTY_CONF_
envinclude KITTY_CONF_*
# Run the script dynamic.py placed in the same directory as this config file
# and include its :file:`STDOUT`. Note that Python scripts are fastest
# as they use the embedded Python interpreter, but any executable script
# or program is supported, in any language. Remember to mark the script
# file executable.
geninclude dynamic.py
```
:::

## Sample kitty.conf

::: only
html

You can download a sample `kitty.conf`{.interpreted-text role="file"}
file with all default settings and comments describing each setting by
clicking: `sample
kitty.conf </generated/conf/kitty.conf>`{.interpreted-text
role="download"}.
:::

::: only
man

You can edit a fully commented sample kitty.conf by pressing the
`edit_config_file`{.interpreted-text role="sc"} shortcut in kitty. This
will generate a config file with full documentation and all settings
commented out. If you have a pre-existing `kitty.conf`{.interpreted-text
role="file"}, then that will be used instead, delete it to see the
sample file.
:::

A default configuration file can also be generated by running:

``` conf
kitty +runpy 'from kitty.config import *; print(commented_out_default_config())'
```

This will print the commented out default config file to
`STDOUT`{.interpreted-text role="file"}.

## All mappable actions

See the
`list of all the things you can make |kitty| can do </actions>`{.interpreted-text
role="doc"}.

::: {.toctree hidden=""}
actions wide-gamut-colors
:::
# Setting text styles/colors in arbitrary regions of the screen

There already exists an escape code to set *some* text attributes in
arbitrary regions of the screen,
[DECCARA](https://vt100.net/docs/vt510-rm/DECCARA.html). However, it is
limited to only a few attributes. [\|kitty\|](##SUBST##|kitty|) extends
this to work with *all* SGR attributes. So, for example, this can be
used to set the background color in an arbitrary region of the screen.

The motivation for this extension is the various problems with the
existing solution for erasing to background color, namely the
*background color erase (bce)* capability. See
`this discussion <160#issuecomment-346470545>`{.interpreted-text
role="iss"} and [this
FAQ](https://invisible-island.net/ncurses/ncurses.faq.html#bce_mismatches)
for a summary of problems with *bce*.

For example, to set the background color to blue in a rectangular region
of the screen from (3, 4) to (10, 11), you use:

    <ESC>[2*x<ESC>[4;3;11;10;44$r<ESC>[*x
# Desktop notifications {#notifications_on_the_desktop}

[\|kitty\|](##SUBST##|kitty|) implements an extensible escape code (OSC
99) to show desktop notifications. It is easy to use from shell scripts
and fully extensible to show title and body. Clicking on the
notification can optionally focus the window it came from, and/or send
an escape code back to the application running in that window.

The design of the escape code is partially based on the discussion in
the defunct
[terminal-wg](https://gitlab.freedesktop.org/terminal-wg/specifications/-/issues/13)

The escape code has the form:

    <OSC> 99 ; metadata ; payload <terminator>

Here `<OSC>` is `<ESC>]` and `<terminator>` is `<ESC><backslash>`. The
`metadata` is a section of colon separated `key=value` pairs. Every key
must be a single character from the set `a-zA-Z` and every value must be
a word consisting of characters from the set
`a-zA-Z0-9-_/\+.,(){}[]*&^%$#@!`\~\`. The payload must be interpreted
based on the metadata section. The two semi-colons *must* always be
present even when no metadata is present.

Before going into details, let\'s see how one can display a simple,
single line notification from a shell script:

    printf '\x1b]99;;Hello world\x1b\\'

To show a message with a title and a body:

    printf '\x1b]99;i=1:d=0;Hello world\x1b\\'
    printf '\x1b]99;i=1:p=body;This is cool\x1b\\'

:::: tip
::: title
Tip
:::

[\|kitty\|](##SUBST##|kitty|) also comes with its own
`statically compiled command line tool </kittens/notify>`{.interpreted-text
role="doc"} to easily display notifications, with all their advanced
features. For example:

``` sh
kitten notify "Hello world" A good day to you
```
::::

The most important key in the metadata is the `p` key, it controls how
the payload is interpreted. A value of `title` means the payload is
setting the title for the notification. A value of `body` means it is
setting the body, and so on, see the table below for full details.

The design of the escape code is fundamentally chunked, this is because
different terminal emulators have different limits on how large a single
escape code can be. Chunking is accomplished by the `i` and `d` keys.
The `i` key is the *notification id* which is an
`identifier`{.interpreted-text role="ref"}. The `d` key stands for
*done* and can only take the values `0` and `1`. A value of `0` means
the notification is not yet done and the terminal emulator should hold
off displaying it. A non-zero value means the notification is done, and
should be displayed. You can specify the title or body multiple times
and the terminal emulator will concatenate them, thereby allowing
arbitrarily long text (terminal emulators are free to impose a sensible
limit to avoid Denial-of-Service attacks). The size of the payload must
be no longer than `2048` bytes, *before being encoded* or `4096` encoded
bytes.

Both the `title` and `body` payloads must be either
`safe_utf8`{.interpreted-text role="ref"} text or UTF-8 text that is
`base64`{.interpreted-text role="ref"} encoded, in which case there must
be an `e=1` key in the metadata to indicate the payload is
`base64`{.interpreted-text role="ref"} encoded. No HTML or other markup
in the plain text is allowed. It is strictly plain text, to be
interpreted as such.

## Allowing users to filter notifications

::: versionadded
0.36.0 Specifying application name and notification type
:::

Well behaved applications should identify themselves to the terminal by
means of two keys `f` which is the application name and `t` which is the
notification type. These are free form keys, they can contain any
values, their purpose is to allow users to easily filter out
notifications they do not want. Both keys must have
`base64`{.interpreted-text role="ref"} encoded UTF-8 text as their
values. The `t` key can be specified multiple times, as notifications
can have more than one type. See the [freedesktop.org
spec](https://specifications.freedesktop.org/notification-spec/notification-spec-latest.html#categories)
for examples of notification types.

:::: note
::: title
Note
:::

The application name should generally be set to the filename of the
applications [desktop
file](https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html#file-naming)
(without the `.desktop` part) or the bundle identifier for a macOS
application. While not strictly necessary, this allows the terminal
emulator to deduce an icon for the notification when one is not
specified.
::::

:::: tip
::: title
Tip
:::

[\|kitty\|](##SUBST##|kitty|) has sophisticated notification filtering
and management capabilities via `filter_notification`{.interpreted-text
role="opt"}.
::::

## Being informed when user activates the notification

When the user clicks the notification, a couple of things can happen,
the terminal emulator can focus the window from which the notification
came, and/or it can send back an escape code to the application
indicating the notification was activated. This is controlled by the `a`
key which takes a comma separated set of values, `report` and `focus`.
The value `focus` means focus the window from which the notification was
issued and is the default. `report` means send an escape code back to
the application. The format of the returned escape code is:

    <OSC> 99 ; i=identifier ; <terminator>

The value of `identifier` comes from the `i` key in the escape code sent
by the application. If the application sends no identifier, then the
terminal *must* use `i=0`. (Ideally `i` should have been left out from
the response, but for backwards compatibility `i=0` is used). Actions
can be preceded by a negative sign to turn them off, so for example if
you do not want any action, turn off the default `focus` action with:

    a=-focus

Complete specification of all the metadata keys is in the
`table below <keys_in_notificatons_protocol>`{.interpreted-text
role="ref"}. If a terminal emulator encounters a key in the metadata it
does not understand, the key *must* be ignored, to allow for future
extensibility of this escape code. Similarly if values for known keys
are unknown, the terminal emulator *should* either ignore the entire
escape code or perform a best guess effort to display it based on what
it does understand.

## Being informed when a notification is closed

::: versionadded
0.36.0 Notifications of close events
:::

If you wish to be informed when a notification is closed, you can
specify `c=1` when sending the notification. For example:

    <OSC> 99 ; i=mynotification : c=1 ; hello world <terminator>

Then, the terminal will send the following escape code to inform when
the notification is closed:

    <OSC> 99 ; i=mynotification : p=close ; <terminator>

If no notification id was specified `i=0` will be used in the response

If `a=report` is specified and the notification is activated/clicked on
then both the activation report and close notification are sent. If the
notification is updated then the close event is not sent unless the
updated notification also requests a close notification.

Note that on some platforms, such as macOS, the OS does not inform
applications when notifications are closed, on such platforms, terminals
reply with:

    <OSC> 99 ; i=mynotification : p=close ; untracked <terminator>

This means that the terminal has no way of knowing when the notification
is closed. Instead, applications can poll the terminal to determine
which notifications are still alive (not closed), with:

    <OSC> 99 ; i=myid : p=alive ; <terminator>

The terminal will reply with:

    <OSC> 99 ; i=myid : p=alive ; id1,id2,id3 <terminator>

Here, `myid` is present for multiplexer support. The response from the
terminal contains a comma separated list of ids that are still alive.

## Updating or closing an existing notification

::: versionadded
0.36.0 The ability to update and close a previous notification
:::

To update a previous notification simply send a new notification with
the same *notification id* (`i` key) as the one you want to update. If
the original notification is still displayed it will be replaced,
otherwise a new notification is displayed. This can be used, for
example, to show progress of an operation. How smoothly the existing
notification is replaced depends on the underlying OS, for example, on
Linux the replacement is usually flicker free, on macOS it isn\'t,
because of Apple\'s design choices. Note that if no `i` key is
specified, no updating must take place, even if there is a previous
notification without an identifier. The terminal must treat these as
being two unique *unidentified* notifications.

To close a previous notification, send:

    <OSC> i=<notification id> : p=close ; <terminator>

This will close a previous notification with the specified id. If no
such notification exists (perhaps because it was already closed or it
was activated) then the request is ignored. If no `i` key is specified,
this must be a no-op.

## Automatically expiring notifications

A notification can be marked as expiring (being closed) automatically
after a specified number of milliseconds using the `w` key. The default
if unspecified is `-1` which means to use whatever expiry policy the OS
has for notifications. A value of `0` means the notification should
never expire. Values greater than zero specify the number of
milliseconds after which the notification should be auto-closed. Note
that the value of `0` is best effort, some platforms honor it and some
do not. Positive values are robust, since they can be implemented by the
terminal emulator itself, by manually closing the notification after the
expiry time. The notification could still be closed before the expiry
time by user interaction or OS policy, but it is guaranteed to be closed
once the expiry time has passed.

## Adding icons to notifications

::: versionadded
0.36.0 Custom icons in notifications
:::

Applications can specify a custom icon to be displayed with a
notification. This can be the application\'s logo or a symbol such as
error or warning symbols. The simplest way to specify an icon is by
*name*, using the `n` key. The value of this key is
`base64`{.interpreted-text role="ref"} encoded UTF-8 text. Names can be
either application names, or symbol names. The terminal emulator will
try to resolve the name based on icons and applications available on the
computer it is running on. The following list of well defined names must
be supported by any terminal emulator implementing this spec. The `n`
key can be specified multiple times, the terminal will go through the
list in order and use the first icon that it finds available on the
system.

  Name                Description
  ------------------- -----------------------------------------------------------------------
  `error`             An error symbol
  `warn`, `warning`   A warning symbol
  `info`              A symbol denoting an informational message
  `question`          A symbol denoting asking the user a question
  `help`              A symbol denoting a help message
  `file-manager`      A symbol denoting a generic file manager application
  `system-monitor`    A symbol denoting a generic system monitoring/information application
  `text-editor`       A symbol denoting a generic text editor application

  : Universally available icon names

If an icon name is an application name it should be an application
identifier, such as the filename of the application\'s
`.desktop`{.interpreted-text role="file"} file on Linux or its bundle
identifier on macOS. For example if the cross-platform application
FooBar has a desktop file named: `foo-bar.desktop`{.interpreted-text
role="file"} and a bundle identifier of `net.foo-bar-website.foobar`
then it should use the icon names `net.foo-bar-website.foobar` *and*
`foo-bar` so that terminals running on both platforms can find the
application icon.

If no icon is specified, but the `f` key (application name) is
specified, the terminal emulator should use the value of the `f` key to
try to find a suitable icon.

### Adding icons by transmitting icon data

This can be done by using the `p=icon` key. Then, the payload is the
icon image in any of the `PNG`, `JPEG` or `GIF` image formats. It is
recommended to use an image size of `256x256` for icons. Since icons are
binary data, they must be transmitted encoded, with `e=1`.

When both an icon name and an image are specified, the terminal emulator
must first try to find a locally available icon matching the name and
only if one is not found, fallback to the provided image. This is so
that users are presented with icons from their current icon theme, where
possible.

Transmitted icon data can be cached using the `g` key. The value of the
`g` key must be a random globally unique UUID like
`identifier`{.interpreted-text role="ref"}. Then, the terminal emulator
will cache the transmitted data using that key. The cache should exist
for as long as the terminal emulator remains running. Thus, in future
notifications, the application can simply send the `g` key to display a
previously cached icon image with needing to re-transmit the actual data
with `p=icon`. The `g` key refers only to the icon data, multiple
different notifications with different icon or application names can use
the same `g` key to refer to the same icon. Terminal multiplexers must
cache icon data themselves and refresh it in the underlying terminal
implementation when detaching and then re-attaching. This means that
applications once started need to transmit icon data only once until
they are quit.

:::: note
::: title
Note
:::

To avoid DoS attacks terminal implementations can impose a reasonable
max size on the icon cache and evict icons in order of last used. Thus
theoretically, a previously cached icon may become unavailable, but
given that icons are small images, practically this is not an issue in
all but the most resource constrained environments, and the failure mode
is simply that the icon is not displayed.
::::

:::: note
::: title
Note
:::

How the icon is displayed depends on the underlying OS notifications
implementation. For example, on Linux, typically a single icon is
displayed. On macOS, both the terminal emulator\'s icon and the
specified custom icon are displayed.
::::

## Adding buttons to the notification

Buttons can be added to the notification using the *buttons* payload,
with `p=buttons`. Buttons are a list of UTF-8 text separated by the
Unicode Line Separator character (U+2028) which is the UTF-8 bytes
`0xe2 0x80 0xa8`. They can be sent either as
`safe_utf8`{.interpreted-text role="ref"} or `base64`{.interpreted-text
role="ref"}. When the user clicks on one of the buttons, and reporting
is enabled with `a=report`, the terminal will send an escape code of the
form:

    <OSC> 99 ; i=identifier ; button_number <terminator>

Here, [button_number]{.title-ref} is a number from 1 onwards, where 1
corresponds to the first button, two to the second and so on. If the
user activates the notification as a whole, and not a specific button,
the response, as described above is:

    <OSC> 99 ; i=identifier ; <terminator>

If no identifier was specified when creating the notification, `i=0` is
used. The terminal *must not* send a response unless report is requested
with `a=report`.

:::: note
::: title
Note
:::

The appearance of the buttons depends on the underlying OS
implementation. On most Linux systems, the buttons appear as individual
buttons on the notification. On macOS they appear as a drop down menu
that is accessible when hovering the notification. Generally, using more
than two or three buttons is not a good idea.
::::

## Playing a sound with notifications {#notifications_query}

::: versionadded
0.36.0 The ability to control the sound played with notifications
:::

By default, notifications may or may not have a sound associated with
them depending on the policies of the OS notifications service.
Sometimes it might be useful to ensure a notification is not accompanied
by a sound. This can be done by using the `s` key which accepts
`base64`{.interpreted-text role="ref"} encoded UTF-8 text as its value.
The set of known sounds names is in the table below, any other names are
implementation dependent, for instance, on Linux, terminal emulators
will probably support the [standard sound
names](https://specifications.freedesktop.org/sound-naming-spec/latest/#names)

  Name                Description
  ------------------- ---------------------------------------------------------------------------------------------
  `system`            The default system sound for a notification, which may be some kind of beep or just silence
  `silent`            No sound must accompany the notification
  `error`             A sound associated with error messages
  `warn`, `warning`   A sound associated with warning messages
  `info`              A sound associated with information messages
  `question`          A sound associated with questions

  : Standard sound names

Support for sound names can be queried as described below.

## Querying for support

::: versionadded
0.36.0 The ability to query for support
:::

An application can query the terminal emulator for support of this
protocol, by sending the following escape code:

    <OSC> 99 ; i=<some identifier> : p=? ; <terminator>

A conforming terminal must respond with an escape code of the form:

    <OSC> 99 ; i=<some identifier> : p=? ; key=value : key=value <terminator>

The identifier is present to support terminal multiplexers, so that they
know which window to redirect the query response too.

Here, the `key=value` parts specify details about what the terminal
implementation supports. Currently, the following keys are defined:

  Key   Value
  ----- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `a`   Comma separated list of actions from the `a` key that the terminal implements. If no actions are supported, the `a` key must be absent from the query response.
  `c`   `c=1` if the terminal supports close events, otherwise the `c` must be omitted.
  `o`   Comma separated list of occasions from the `o` key that the terminal implements. If no occasions are supported, the value `o=always` must be sent in the query response.
  `p`   Comma separated list of supported payload types (i.e. values of the `p` key that the terminal implements). These must contain at least `title`.
  `s`   Comma separated list of sound names from the table of standard sound names above. Terminals will report the list of standard sound names they support. Terminals *should* support at least `system` and `silent`.
  `u`   Comma separated list of urgency values that the terminal implements. If urgency is not supported, the `u` key must be absent from the query response.
  `w`   `w=1` if the terminal supports auto expiring of notifications.

In the future, if this protocol expands, more keys might be added.
Clients must ignore keys they do not understand in the query response.

To check if a terminal emulator supports this notifications protocol the
best way is to send the above *query action* followed by a request for
the [primary device
attributes](https://vt100.net/docs/vt510-rm/DA1.html). If you get back
an answer for the device attributes without getting back an answer for
the *query action* the terminal emulator does not support this
notifications protocol.

## Specification of all keys used in the protocol {#keys_in_notificatons_protocol}

  Key   Value                                                                    Default    Description
  ----- ------------------------------------------------------------------------ ---------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `a`   Comma separated list of `report`, `focus`, with optional leading `-`     `focus`    What action to perform when the notification is clicked
  `c`   `0` or `1`                                                               `0`        When non-zero an escape code is sent to the application when the notification is closed.
  `d`   `0` or `1`                                                               `1`        Indicates if the notification is complete or not. A non-zero value means it is complete.
  `e`   `0` or `1`                                                               `0`        If set to `1` means the payload is `base64`{.interpreted-text role="ref"} encoded UTF-8, otherwise it is plain UTF-8 text with no C0 control codes in it
  `f`   `base64`{.interpreted-text role="ref"} encoded UTF-8 application name    `unset`    The name of the application sending the notification. Can be used to filter out notifications.
  `g`   `identifier`{.interpreted-text role="ref"}                               `unset`    Identifier for icon data. Make these globally unique, like an UUID.
  `i`   `identifier`{.interpreted-text role="ref"}                               `unset`    Identifier for the notification. Make these globally unique, like an UUID, so that terminal multiplexers can direct responses to the correct window. Note that for backwards compatibility reasons i=0 is special and should not be used.
  `n`   `base64`{.interpreted-text role="ref"} encoded UTF-8 application name    `unset`    Icon name. Can be specified multiple times.
  `o`   One of `always`, `unfocused` or `invisible`                              `always`   When to honor the notification request. `unfocused` means when the window the notification is sent on does not have keyboard focus. `invisible` means the window both is unfocused and not visible to the user, for example, because it is in an inactive tab or its OS window is not currently active. `always` is the default and always honors the request.
  `p`   One of `title`, `body`, `close`, `icon`, `?`, `alive`, `buttons`         `title`    Type of the payload. If a notification has no title, the body will be used as title. A notification with not title and no body is ignored. Terminal emulators should ignore payloads of unknown type to allow for future expansion of this protocol.
  `s`   `base64`{.interpreted-text role="ref"} encoded sound name                `system`   The sound name to play with the notification. `silent` means no sound. `system` means to play the default sound, if any, of the platform notification service. Other names are implementation dependent.
  `t`   `base64`{.interpreted-text role="ref"} encoded UTF-8 notification type   `unset`    The type of the notification. Used to filter out notifications. Can be specified multiple times.
  `u`   `0, 1 or 2`                                                              `unset`    The *urgency* of the notification. `0` is low, `1` is normal and `2` is critical. If not specified normal is used.
  `w`   `>=-1`                                                                   `-1`       The number of milliseconds to auto-close the notification after.

::: versionadded
0.35.0 Support for the `u` key to specify urgency
:::

::: versionadded
0.31.0 Support for the `o` key to prevent notifications from focused
windows
:::

:::: note
::: title
Note
:::

[\|kitty\|](##SUBST##|kitty|) also supports the [legacy OSC 9 protocol
developed by iTerm2](https://iterm2.com/documentation-escape-codes.html)
for desktop notifications.
::::

## Base64

The base64 encoding used in the this specification is the one defined in
`4648`{.interpreted-text role="rfc"}. When a base64 payload is chunked,
either the chunking should be done before encoding or after. When the
chunking is done before encoding, no more than 2048 bytes of data should
be encoded per chunk and the encoded data **must** include the base64
padding bytes, if any. When the chunking is done after encoding, each
encoded chunk must be no more than 4096 bytes in size. There may or may
not be padding bytes at the end of the last chunk, terminals must handle
either case.

## Escape code safe UTF-8 {#safe_utf8}

This must be valid UTF-8 as per the spec in `3629`{.interpreted-text
role="rfc"}. In addition, in order to make it safe for transmission
embedded inside an escape code, it must contain none of the C0 and C1
control characters, that is, the Unicode characters: U+0000 (NUL) - U+1F
(Unit separator), U+7F (DEL) and U+80 (PAD) - U+9F (APC). Note that in
particular, this means that no newlines, carriage returns, tabs, etc.
are allowed.

## Identifier

Any string consisting solely of characters from the set
`[a-zA-Z0-9_-+.]`, that is, the letters `a-z`, `A-Z`, the underscore,
the hyphen, the plus sign and the period. Applications should make these
globally unique, like a UUID for maximum robustness.

:::: important
::: title
Important
:::

Terminals **must** sanitize ids received from client programs before
sending them back in responses, to mitigate input injection based
attacks. That is, they must either reject ids containing characters not
from the above set, or remove bad characters when reading ids sent to
them.
::::
# The Drag and Drop protocol

::: versionadded
0.47.0
:::

:::: warning
::: title
Warning
:::

This protocol is still under development, see `9984`{.interpreted-text
role="iss"}.
::::

This protocol enables drag and drop functionality for terminal programs
that is as good as the drag and drop functionality available for GUI
programs.

There is one central escape code used for this protocol, which is of the
form:

    OSC _dnd_code ; metadata ; payload ST

Here, `OSC` is the bytes `ESC ] (0x1b 0x5b)` and ST is
`ESC \\ (0x1b 0x5c)`. The `metadata` is a colon separated list of
`key=value` pairs. The final part of the escape code is the payload
data, whose meaning depends on the metadata.

The payload must be no more than 4096 bytes. When the payload is larger
than 4096 bytes, it is chunked up using the `m` key. An escape code that
has a too long payload is transmitted in chunks. All but the last chunk
must have `m=1` in their metadata. Each chunk must have a payload of no
more than 4096 bytes. Only the first chunk is guaranteed to have
metadata other than the `m` key. Subsequent chunks may optionally omit
all metadata except the `m` and `i` keys. While a chunked transfer is in
progress it is a protocol error to for the sending side to send any
protocol related escape codes other than chunked ones or query (`t=q|Q`)
ones. In particular, this means that the receiving side should use the
metadata from the first chunk in a chain of chunks only.

All integer values used in this escape code must be 32-bit signed or
unsigned integers encoded in decimal representation.

When transferring binary data the payload is
`base64 <4648>`{.interpreted-text role="rfc"} encoded. The 4096 bytes
limit applies to *encoded bytes*, that is, it is applied after encoding.
base64 padding bytes are optional and may or may not be present at the
end of the last chunk.

## Accepting drops

In order to inform the terminal emulator that the client accepts drops,
it must send the following escape code:

    OSC _dnd_code ; t=a ; payload ST

The payload here is a space separated list of MIME types the program
accepts. The list of MIME types is optional, it is needed if the program
wants to accept exotic or private use MIME types on platforms such as
macOS, where the system does not deliver drop events unless the MIME
type is registered.

When the client is done accepting drops, or at exit, it should send the
escape code:

    OSC _dnd_code ; t=A ST

to inform the terminal that it no longer wants drops.

Whenever the user drags something over the window, the terminal will
send an escape code of the form:

    OSC _dnd_code ; t=m:x=x:y=y:X=X:Y=Y:o=O ; optional MIME list ST

Here, `x, y` identify the cell over which the drag is currently present.
The `(0, 0)` cell is at top left of the screen. `X and Y` are the pixel
offsets from the top-left. The `O` value is the set of allowed
operations, which can be `1` for copy, `2` for move and `3` for either,
at the client\'s discretion. The optional list of MIMES is a space
separated list of MIME types that are available for dropping. To avoid
overhead, the terminal should only send this list for the first move
event and subsequently only if the list changes.

When the drag leaves the window, the terminal will send the same event
but with `x, y = -1, -1` to indicate that the drag has left the window.
For such events the list of MIME types must be empty. Note that the
terminal must never send negative cell co-ordinates for any other
reason. No more movement escape codes `t=m` will be sent until this drop
or another re-enters the window.

The client program must inform the terminal whether it will accept the
potential drop and which MIME types of the set of offered MIME types it
accepts. Until the client does so the terminal will indicate to the OS
that the drop is not accepted. To do so, the client sends an escape code
of the form:

    OSC _dnd_code ; t=m:o=O ; MIME list ST

Here the `o` key is the operation the client intends to perform if a
drop occurs which can be either `1` for copy or `2` for move or `0` for
not accepted. The MIME list is the ordered list of MIME types from the
offered list that the client wants. If no MIME type list is present, it
is equivalent to no change in the offered list of MIME types. The list
should be ordered in order of decreasing preference. Some platforms may
show the user some indication of the first MIME type in the list.

When the user triggers a drop on the window, the terminal will send an
escape code of the form:

    OSC _dnd_code ; t=M: ... ; MIME list ST

This is the same as the movement escape codes above, except that `t=M`
(upper case M instead of lower case m), indicating this is a drop. Once
this escape code is received, no more movement escape codes `t=m` will
be sent until a new drop enters the window. The MIME list here is
mandatory, terminals must send the full list of MIME types available in
the drop. The client program can now request data for the MIME types it
is interested in.

Requesting data is done by sending an escape code of the form:

    OSC _dnd_code ; t=r:x=idx ST

Here `idx` is a 1-based index into the list of MIME types sent in the
`t=M` drop event. This will request data for the specified MIME type.
The terminal must respond with a series of escape codes of the form:

    OSC _dnd_code ; t=r:x=idx; base64 encoded data possibly chunked ST

End of data is indicated by an empty payload and `m=0`. If some error
occurs while getting the data, the terminal must send an escape code of
the form:

    OSC _dnd_code ; t=R:x=idx ; POSIX error name:optional description ST

Here `POSIX error name` is a POSIX symbolic error name such as `ENOENT`
or `EIO` or the value `EUNKNOWN` for an unknown error. Unless otherwise
noted, any error response means the drop is terminated. The description
is optional and must consist only of `safe_utf8`{.interpreted-text
role="ref"}.

Once the client program finishes reading all the dropped data it needs,
it must send an escape code of the form:

    OSC _dnd_code ; t=r:o=operation ST

That is, it must send a request for data with no MIME type specified.
The terminal emulator must then inform the OS that the drop is
completed. Any queued data requests must be discarded by the terminal.
The `operation` is required and must specify the final action the client
took with the data. If unset (aka `0`) the terminal must assume the drop
was canceled.

### Dropping from remote machines

In order to support dropping of files from remote machines, the client
must inform the terminal of its
`machine id <machine_id>`{.interpreted-text role="ref"} using the escape
code:

    OSC _dnd_code ; t=a:x=1 ; machine id ST

Then, the client must first request the
`text/uri-list <2483>`{.interpreted-text role="rfc"} MIME type to get a
list of dropped URIs. When responding to this request, the terminal will
send the usual `t=r` responses, but, in addition, if the client has sent
its machine id and the terminal determines that the client is on a
different machine based on the id, it will add the `X=1` key to its
response. The client should use this key to determine if it wants to
request data for entries in the URI list. For every URI in the list, the
client can send the terminal emulator a data request of the form:

    OSC _dnd_code ; t=r:x=idx:y=subidx ST

Here `idx` is the one based index of the `text/uri-list` MIME type. And
`subidx` is the one based index into the array of MIME types in the
`text/uri-list` entry. The terminal will then read the file and transmit
the data as for a normal MIME data request, except it will have
`y=subidx` as well in its response, for example:

    OSC _dnd_code ; t=r:x=idx:y=subidx ; base64 encoded data possibly chunked ST

Similarly, error responses are as above, except for the addition of
`y=subidx`, for example:

    OSC _dnd_code ; t=R:x=idx:y=subidx ; POSIX error name:optional desc ST

Terminals must reply with `ENOENT` if the index is out of bounds. If the
client does not first request the `text/uri-list` MIME type or that MIME
type is not present in the drop, the terminal must reply with `EINVAL`.
Terminals must support at least `file://` URIs. If the client requests
an entry that is not a supported URI type the terminal must reply with
`EUNKNOWN`.

Terminals must ONLY send data for regular files, symbolic links and
directories. See below for more details about sending symlinks.

If the terminal does not have permission to read the file it must reply
with `EPERM`. Terminals must respond with `EINVAL` if the file is not a
regular file or symlink or directory and `ENOENT` if the file does not
exist. If an I/O error occurs the terminal must send `EIO`.

For security reasons, terminals must reply with `EPERM` if the drag
originated in the same window as the drop, this prevents malicious
programs from reading files on the computer by starting their own drag.
This is a defense in depth feature since drags can only be started by
the terminal, but it helps in case of accidental drag starts and drops
into the same window.

Clients may send multiple requests without waiting for any request to
complete. Terminals may queue requests and respond in any order they
choose, including interleaving responses to different requests. However,
for simplicity, this specification recommends terminals queue requests
and respond in first-in, first-out order. Every response can be matched
to a corresponding request using the `x`, `y` and `Y` keys. To prevent
Denial of service attacks, if too many requests are received, terminals
must deny the request with `EMFILE` and end the drop.

#### Reading remote directories

If the file pointed to by a `file://` URL is actually a directory the
terminal must instead respond with:

    OSC _dnd_code ; t=r:x=idx:y=subidx:X=handle ; base64 encoded list of dir entries ST

The presence of `X=handle` indicates this is a directory response not a
regular file or symlink. For regular files, `X=0`. For symlinks, `X=1`.
For directories `X` is an arbitrary integer (`handle`) other than `0` or
`1`. Here, the payload is a null byte separated list of entries in the
directory that are either regular files, directories or symlinks. The
payload must be base64 encoded and might be chunked if the directory has
a lot of entries.

The client can now read the files in this directory using requests of
the form:

    OSC _dnd_code ; t=r:Y=handle:x=num ST

Here `num` is the 1-based index into the list of directory entries
previously transmitted to the client. The terminal will respond with an
escape code of the forms :

    OSC _dnd_code ; t=r:Y=handle:x=num ; base64 encoded data of regular file ST
    OSC _dnd_code ; t=r:Y=handle:x=num:X=1 ; base64 encoded symlink target ST
    OSC _dnd_code ; t=r:Y=handle:x=num:X=child-handle ; base64 encoded list of entries in sub-dir ST

In case of any errors, the terminal will respond with:

    OSC _dnd_code ; t=R:Y=handle:x=num ; POSIX error name:optional desc ST

In the above, the `Y=handle` and `x=num` keys allow the client to know
which directory entry the response concerns. The `handle` points to the
parent directory and `num` to the entry within the parent dir.

Once the client is done reading a directory it should transmit
`t=r:Y=handle` to the terminal. The terminal can then free any resources
associated with that directory. The directory handle is now invalid and
terminals must return `EINVAL` if the client sends a request using an
invalid directory handle. It is recommended that clients traverse
directories breadth first to minimise resource usage in the terminal.
Terminals may deny directory traversal requests if too many resources
are used, in order to prevent Denial of service attacks. In such cases
the terminal must respond with `ENOMEM`.

## Starting drags

Terminal programs can inform the terminal emulator that they are willing
to act as a source of drag data by sending the sending the escape code:

    OSC _dnd_code ; t=o:x=1 ; optional machine id ST

On exit, or if the program no longer is willing to start drag gestures,
it must send `t=o:x=2` to the terminal to indicate it no longer wants to
offer drag data. The `machine id` is optional and is used to enable
dragging from remote machines. See
`below <machine_id>`{.interpreted-text role="ref"} for its semantics.

When the user performs the platform specific gesture to start a drag
operation, the terminal will send the escape code `t=o` back to the
terminal program informing it that it can potentially start a drag. The
gesture is typically holding the left mouse button down and dragging a
short distance, but this protocol does not mandate any particular
gesture to start drag operations. The terminal, when sending the event
will also set the `x, y, X, Y` keys to indicate the cell and pixel
locations in the window of the start drag event.

If the terminal program determines that it wants to start a drag at that
location, it must send the terminal the `t=o:o=flags` escape code again,
but with a payload consisting of the space separated MIME types it
offers. The `flags` indicate what types of operations the client
supports, `1` for copy, `2` for move and `3` for either. The
transmission should be chunked if the list of MIME types is too long.
Note that at this time the drag operation has not actually started, this
gives the terminal program the opportunity to pre-send some data or set
one or more images to act as thumbnails for the drag operation. If the
list of MIME types is too long the terminal may cancel the operation by
responding with `t=E ; EFBIG` or `t=E ; ENOMEM`.

If at the time the terminal receives this request the drag gesture has
already been terminated or the terminal otherwise determines that it is
not appropriate to start the drag, it must reply with `t=E ; EPERM` to
indicate the drag offer was not accepted.

For some well known types like `text/plain` or `text/uri-list` the
terminal program should pre-send the data for them unless it is very
large. This is because some platforms, such as macOS, need pre sent data
to be able to interoperate with native programs. The terminal emulator
should reply with `t=E ; EFBIG` if too much data is sent and cancel the
drag. Terminals must accept at least 64MB of pre sent data.

Pre sent data is sent with escape codes of the form:

    OSC _dnd_code ; t=p:x=idx ; base64 encoded data ST

Here `idx` is the zero based index into the list of previously sent MIME
types indicating this data is for that MIME type. Transmission should be
chunked using the `m` key. End of data is indicated by sending the
escape code with no payload and `m=0`. Terminal programs should pre-read
this data and only send the `t=o` key indicating the offer if the data
is available.

To associate one or more images with the drag operation, the terminal
program must transmit the data for the image with the `idx` value above
being a negative number starting with `-1` for the first image and so
on. Clients **must** transmit all images consecutively in order,
starting with the first, then the second and so on. When transmitting
images, the image data format is specified using the `y` key. A value of
`y=24` mean 24bit RGB data and `y=32` means 32bit RGBA data. Colors in
the RGB/A data must be in the sRGB color space. Using `y=100` means the
data is a PNG image. Using `y=0` means the payload is UTF-8 base64
encoded text. The terminal will render the text to display the image.
Additionally, the `X` and `Y` keys must be used to specify the width and
height of the image data in pixels. If the size of the transmitted data
does not match the image dimensions the terminal must replay with
`t=E ; EINVAL`. When using `y=0` the `X` and `Y` keys specify the text
size as `base_font_size * X/Y`. Where `base_font_size` is the normal
font size the terminal uses for text. Note that terminals **may** ignore
newlines and render all text on a single line so client programs should
not send too much text. The `o` key is used to specify if the background
the text is drawn on is transparent or not. `o=0` means transparent and
`o=1024` means fully opaque. In other words background opacity is
`o/1024`. This is particularly useful when drawing a Unicode symbol as
the icon for the drag.

Terminals are free to impose a limit on the amount of image data, to
avoid Denial-of-service attacks. If the image data is too much or the
image is too large they must reply with `t=E ; EFBIG` and abort the
drag. By default, the drag will be started using the first image, if
any. During the drag, the terminal program can change the image by
sending:

    OSC _dnd_code ; t=P:x=idx ST

Where `idx` is now a zero based index with zero being the first image
and so on. Sending an `idx` out of bounds means the drag image should be
removed.

Once the terminal program has sent all data and images for the drag
operation, it indicates the drag should be started by sending
`t=P:x=-1`. At this time if the user has already cancelled the drag or
the terminal determines the drag operation is not allowed, it must
respond with `t=E ; EPERM`. If any other error occurs starting the drag
operation, it must respond with the appropriate POSIX error name and
optional error description. If it determines that the image data after
conversion to display format is too large, it must respond with
`t=E ; EFBIG`. If the drag operation is successfully started, it must
respond with `t=E ; OK`.

As the drag progresses, status changes are reported using the `t=e`
escape code. The variants are listed in the table below:

  ------------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------
  Code                     Description
  `t=e : x=1 : y=idx`      The drag has been accepted by a client. `idx` is a zero based index into the list of MIME types pointing to the MIME type the client is likely to want
  `t=e : x=2 : o=O`        The action the client is likely to perform has changed to the value indicated by the `o` key
  `t=e : x=3`              The drag offer has been dropped onto a client, there are likely to be requests for data in the near future
  `t=e : x=4 : y=0 or 1`   The drag is finished. If `y=1` then the drag was canceled by the user.
  `t=e : x=5 : y=idx`      Request data for the MIME type at the zero based index `idx` in the list of MIME types
  ------------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------

  : Drag offer events

The client program should respond to data requests with escape codes of
the form:

    OSC _dnd_code ; t=e:y=idx:m=0 or 1 ; base64 encoded data ST

This, is the data for the MIME type identified by `idx` which is a zero
based index into the list of MIME types. The data should be chunked
using the `m` key. End of data is denoted by `m=0` and an empty payload.
If an error occurs the client should send:

    OSC _dnd_code ; t=E:y=idx ; POSIX error name:optional description ST

Where `POSIX error name` is a POSIX symbolic error name such as `ENOENT`
if the MIME type is not found or `EIO` if an IO error occurred and so
on. The description is optional and must contain only
`safe_utf8`{.interpreted-text role="ref"}.

If the client wants to cancel the full drag at any time, it should send:

    OSC _dnd_code ; t=E:y=-1 ST

If `t=e` or `t=E` escape codes are sent to the terminal before the drag
is started and the terminal has responded with `t=E ; OK`, the terminal
must respond with `t=E ; EINVAL` and abort the drag.

### Dragging to remote machines

To support dragging to remote machines, first of all clients **must**
pre-send the data for the `text/uri-list` MIME type. All `file://` URLs
that point to directories **must** end with a `/`. Then, terminals can
examine the `machine_id`{.interpreted-text role="ref"} sent with the
enable drag offers `t=o` escape code to decide whether to request data
for `file://` entries from the URI list. To request data for a
particular entry, terminals send an escape code of the form:

    OSC _dnd_code ; t=k:x=idx ST

Here `idx` is the one based index into the list of entries in the
`text/uri-list` MIME type. Then the client can respond with the data for
that entry with an escape code of the form:

    OSC _dnd_code ; t=k:x=idx:m=0 or 1 ; base64 encoded file data ST
    OSC _dnd_code ; t=k:x=idx:X=1:m=0 or 1 ; base64 encoded symlink target ST
    OSC _dnd_code ; t=k:x=idx:X=handle:m=0 or 1 ; base64 encoded null separated list of directory entries ST

These represent possibly chunked data for files, symlinks and
directories, as denoted by the `X` key. As above, end of data for an
individual entry is indicated by an escape code with `m=0` and no
payload. `idx` is the one based index into the list of entries in the
`text/uri-list` MIME type. Only regular files, symlinks and directories
should be sent. Terminals may send multiple requests before the data for
the first request is received. Client programs should queue the requests
and handle them in FIFO order.

Every directory must be transmitted with `X=handle`. The payload is a
null separated list of regular files, directories and symlinks in the
directory. `handle` is an integer other than `0` or `1` that serves as
an identifier for the directory. Directories should be traversed in
breadth first order. The children of a directory are sent by adding
`Y=parent-handle:y=num` to the escape codes above. Here `parent-handle`
is the handle of the directory being traversed and `num` is the one
based index into the list of entries in the directory. Thus, the set of
keys `x, y, Y` uniquely determine an entry. Clients **must** send all
children of directories, recursively, terminals **must not** make
requests for children of directories, only for the entries from the
`text/uri-list`.

If any error occurs in the client while reading the data, it can inform
the terminal using:

    OSC _dnd_code ; t=E ; POSIX error name:optional description ST

The terminal must then abort the drag.

Terminals are free to impose resource limits on how much data they
accept, if a limit is breached or some errors occurs, they can abort the
drag and inform the client of it with:

    OSC _dnd_code ; t=E ; POSIX error name:optional description ST

The error code for too many resources is `EMFILE`, for IO errors is
`EIO` and so on.

## Detecting support for this protocol

Clients can query the terminal emulator for support of this protocol
using:

    OSC _dnd_code ; t=q:i=optional ST

The `i` key is optional, if present it will be echoed back in the
responses from the terminal. A terminal supporting this protocol
**must** respond with:

    OSC _dnd_code ; t=q:i=echoed ; payload ST

Here, `payload` is a colon separated list of `key=value` pairs. These
specify support for optional/future parts of this protocol. Currently
the payload is empty, but that might change as the protocol evolves.

The client should send these escape codes followed by a request for the
[primary device attributes](https://vt100.net/docs/vt510-rm/DA1.html).
If a response for the device attributes is received before a response
for the queries, then the terminal does not support this protocol.

## Multiplexers

To support multiplexers, the `i` key exists. When the terminal receives
and `t=a` or `t=o` escape code that has the `i` key set, all escape
codes it sends to the terminal program must include the `i` key with the
same value. This allows terminal multiplexers to direct the response
codes to the correct client.

## Metadata reference

The table below shows all the metadata keys as well as what values they
can take, and the default value they take when missing. All integers are
32-bit.

+----------------+----------------+----------------+----------------+
| Key            | Value          | Default        | Description    |
+================+================+================+================+
| `t`            | Single         | `a`            | The type of    |
|                | character.     |                | drag and drop  |
|                | `(a, A, )`     |                | event. `a` -   |
|                |                |                | start          |
|                |                |                | accepting      |
|                |                |                | drops `A` -    |
|                |                |                | stop accepting |
|                |                |                | drops `m` - a  |
|                |                |                | drop move      |
|                |                |                | event `M` - a  |
|                |                |                | drop dropped   |
|                |                |                | event `r` -    |
|                |                |                | request        |
|                |                |                | dropped data   |
|                |                |                | `R` - report   |
|                |                |                | an error `o` - |
|                |                |                | start offering |
|                |                |                | drags or start |
|                |                |                | a drag `p` -   |
|                |                |                | present data   |
|                |                |                | for drag       |
|                |                |                | offers `P` -   |
|                |                |                | Change drag    |
|                |                |                | image or start |
|                |                |                | drag `e` - a   |
|                |                |                | drag offer     |
|                |                |                | event occurred |
|                |                |                | `E` - a drag   |
|                |                |                | offer data     |
|                |                |                | error occurred |
|                |                |                | `k` - data for |
|                |                |                | uri-list items |
|                |                |                | in drag offer  |
|                |                |                | `q` - query    |
|                |                |                | support for    |
|                |                |                | this protocol  |
+----------------+----------------+----------------+----------------+
| `m`            | Chunking       | `0`            | `0` or `1`     |
|                | indicator      |                |                |
+----------------+----------------+----------------+----------------+
| `i`            | Postive        | `0`            | This id is for |
|                | integer        |                | use by         |
|                |                |                | multiplexers.  |
|                |                |                | When it is     |
|                |                |                | set, all       |
|                |                |                | responses from |
|                |                |                | the terminal   |
|                |                |                | in that        |
|                |                |                | session will   |
|                |                |                | have it set to |
|                |                |                | the same       |
|                |                |                | value.         |
+----------------+----------------+----------------+----------------+
| `o`            | Positive       | `0`            | What drop      |
|                | integer        |                | operation to   |
|                |                |                | perform. `0`   |
|                |                |                | means          |
|                |                |                | rejected, `1`  |
|                |                |                | means copy and |
|                |                |                | `2` means      |
|                |                |                | move.          |
+----------------+----------------+----------------+----------------+
| \*\*Keys fo    | r location\*\* |                |                |
+----------------+----------------+----------------+----------------+
| ------------   | ------------   | ------------   | ------------   |
+----------------+----------------+----------------+----------------+
| `x`            | Integer        | `0`            | Cell           |
|                |                |                | x-coordinate   |
|                |                |                | origin is 0, 0 |
|                |                |                | at top left of |
|                |                |                | screen         |
+----------------+----------------+----------------+----------------+
| `y`            | Integer        | `0`            | Cell           |
|                |                |                | y-coordinate   |
|                |                |                | origin is 0, 0 |
|                |                |                | at top left of |
|                |                |                | screen         |
+----------------+----------------+----------------+----------------+
| `X`            | Integer        | `0`            | Pixel          |
|                |                |                | x-coordinate   |
|                |                |                | origin is 0, 0 |
|                |                |                | at top left of |
|                |                |                | screen         |
+----------------+----------------+----------------+----------------+
| `Y`            | Integer        | `0`            | Pixel          |
|                |                |                | y-coordinate   |
|                |                |                | origin is 0, 0 |
|                |                |                | at top left of |
|                |                |                | screen         |
+----------------+----------------+----------------+----------------+

## Machine id {#machine_id}

The machine id is used to detect when the source and destination
machines for a drag and drop are different. It is of the form:
`version:ASCII printable chars`. The leading `version` field allows for
changing the format or semantics of this field in the future. The actual
id is the machine id which is:

::: tab
macOS

The value returned by the `IOPlatformUUID` system function.
:::

::: tab
Windows

The contents of the
`HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Cryptography\\MachineGuid`{.interpreted-text
role="file"} registry key.
:::

::: tab
Other

The contents of the `/etc/machine-id`{.interpreted-text role="file"}
file with trailing whitespace removed
:::

This machine id is then hashed using a `HMAC <2104>`{.interpreted-text
role="rfc"} with `SHA-256
<6234>`{.interpreted-text role="rfc"} as the digest algorithm and the
key being the ASCII bytes: `tty-dnd-protocol-machine-id`. The hashing is
done so as to not easily leak the actual machine id and to ensure that
the value is of fixed size and consisting only of ASCII printable
characters. This gives a final value of:

    1:hashed machine id hexadecimal encoded

In the future, the `version` field may increase if the hashing algorithm
is changed. If the terminal sees a version it does not understand, it
must assume that the machine id does not match, aka the source and
destination machines are different. This assumption means that remote
drag and drop will still work, just with reduced performance in case of
version mismatch.
# Frequently Asked Questions

## Some special symbols are rendered small/truncated in kitty?

The number of cells a Unicode character takes up are controlled by the
Unicode standard. All characters are rendered in a single cell unless
the Unicode standard says they should be rendered in two cells. When a
symbol does not fit, it will either be rescaled to be smaller or
truncated (depending on how much extra space it needs). This is often
different from other terminals which just let the character overflow
into neighboring cells, which is fine if the neighboring cell is empty,
but looks terrible if it is not.

Some programs, like Powerline, vim with fancy gutter symbols/status-bar,
etc. use Unicode characters from the private use area to represent
symbols. Often these symbols are wide and should be rendered in two
cells. However, since private use area symbols all have their width set
to one in the Unicode standard, [\|kitty\|](##SUBST##|kitty|) renders
them either smaller or truncated. The exception is if these characters
are followed by a space or en-space (U+2002) in which case kitty makes
use of the extra cell to render them in two cells. This behavior can be
turned off for specific symbols using `narrow_symbols`{.interpreted-text
role="opt"}.

As of version 0.40 kitty has innovated a `new protocol
<text-sizing-protocol>`{.interpreted-text role="doc"} that allows
programs running in the terminal to control how many cells a character
is rendered in thereby solving the issue of character width once and for
all.

Similarly, some monospaced font families are buggy and have bold or
italic faces that have characters wider than the width of the normal
face, these will also result in clipping. Such issues should be reported
to the font developer. Monospaced font families must have all their
characters rendered within a fixed width across all faces of the font,
otherwise they aren\'t really monospaced.

## I get errors about the terminal being unknown or opening the terminal failing or functional keys like arrow keys don\'t work?

These issues all have the same root cause: the kitty terminfo files not
being available. The most common way this happens is SSHing into a
computer that does not have the kitty terminfo files. The simplest fix
for that is running:

``` sh
kitten ssh myserver
```

It will automatically copy over the terminfo files and also magically
enable `shell integration </shell-integration>`{.interpreted-text
role="doc"} on the remote machine.

This `ssh kitten <kittens/ssh>`{.interpreted-text role="doc"} takes all
the same command line arguments as `ssh`{.interpreted-text
role="program"}, you can alias it to something small in your shell\'s rc
files to avoid having to type it each time:

``` sh
alias s="kitten ssh"
```

If this does not work, see `manual_terminfo_copy`{.interpreted-text
role="ref"} for alternative ways to get the kitty terminfo files onto a
remote computer.

The next most common reason for this is if you are running commands as
root using `sudo`{.interpreted-text role="program"} or
`su`{.interpreted-text role="program"}. These programs often filter the
`TERMINFO`{.interpreted-text role="envvar"} environment variable which
is what points to the kitty terminfo files.

First, make sure the `TERM`{.interpreted-text role="envvar"} is set to
`xterm-kitty` in the sudo environment. By default, it should be
automatically copied over.

If you are using a well maintained Linux distribution, it will have a
`kitty-terminfo` package that you can simply install to make the kitty
terminfo files available system-wide. Then the problem will no longer
occur.

Alternately, you can configure `sudo`{.interpreted-text role="program"}
to preserve `TERMINFO`{.interpreted-text role="envvar"} by running
`sudo visudo` and adding the following line:

``` sh
Defaults env_keep += "TERM TERMINFO"
```

If none of these are suitable for you, you can run sudo as :

``` sh
sudo TERMINFO="$TERMINFO"
```

This will make `TERMINFO`{.interpreted-text role="envvar"} available in
the sudo environment. Create an alias in your shell rc files to make
this convenient:

``` sh
alias sudo="sudo TERMINFO=\"$TERMINFO\""
```

If you have double width characters in your prompt, you may also need to
explicitly set a UTF-8 locale, like:

``` sh
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
```

## I cannot use the key combination X in program Y?

First, run:

``` sh
kitten show-key -m kitty
```

Press the key combination X. If the kitten reports the key press that
means kitty is correctly sending the key press to terminal programs. You
need to report the issue to the developer of the terminal program. Most
likely they have not added support for
`/keyboard-protocol`{.interpreted-text role="doc"}.

If the kitten does not report it, it means that the key is bound to some
action in kitty. You can unbind it in `kitty.conf`{.interpreted-text
role="file"} with:

``` conf
map X no_op
```

Here X is the keys you press on the keyboard. So for example
`ctrl+shift+1`{.interpreted-text role="kbd"}.

## How do I change the colors in a running kitty instance?

The easiest way to do it is to use the
`themes kitten </kittens/themes>`{.interpreted-text role="doc"}, to
choose a new color theme. Simply run:

``` sh
kitten themes
```

And choose your theme from the list.

You can also define keyboard shortcuts to set colors, for example:

``` sh
map f1 set_colors --configured /path/to/some/config/file/colors.conf
```

Or you can enable `remote control <remote-control>`{.interpreted-text
role="doc"} for [\|kitty\|](##SUBST##|kitty|) and use
`at-set-colors`{.interpreted-text role="ref"}. The shortcut mapping
technique has the same syntax as the remote control command, for
details, see `at-set-colors`{.interpreted-text role="ref"}.

To change colors when SSHing into a remote host, use the `color_scheme
<kitten-ssh.color_scheme>`{.interpreted-text role="opt"} setting for the
`ssh kitten <kittens/ssh>`{.interpreted-text role="doc"}.

Additionally, you can use the escape code described in
`color-stack`{.interpreted-text role="doc"} to set colors in a single
window. Examples of using OSC escape codes to set colors:

``` sh
Change the default foreground color:
printf '\x1b]21;foreground=#ff0000\x1b\\'
Change the default background color:
printf '\x1b]21;background=blue\x1b\\'
Change the cursor color:
printf '\x1b]21;cursor=blue\x1b\\'
Change the selection background color:
printf '\x1b]21;selection_background=blue\x1b\\'
Change the selection foreground color:
printf '\x1b]21;selection_foreground=blue\x1b\\'
Change the nth color (0 - 255):
printf '\x1b]21;n=green\x1b\\'
```

See `color-stack`{.interpreted-text role="doc"} for details on the
syntax for specifying colors and how to query current colors.

## Why is there padding between the text area and the window border?

Terminal screens are a grid of fixed size cells. When the window size is
not an exact multiple of the cell size, there is some leftover space
that appears as padding. Additionally you can add your own padding with
`window_padding_width`{.interpreted-text role="opt"}. This padding can
be particularly noticeable when using TUI programs that have a
background color different from the terminal background color. In such
cases either change their background color to match the terminal or more
correctly, open a bug report against such programs and ask them to
`change the terminal default background color <color-stack>`{.interpreted-text
role="doc"} using OSC escape codes when starting and restore it when
quitting to have it work automatically.

## How do I specify command line options for kitty on macOS?

Apple does not want you to use command line options with GUI
applications. To workaround that limitation,
[\|kitty\|](##SUBST##|kitty|) will read command line options from the
file
`<kitty config dir>/macos-launch-services-cmdline`{.interpreted-text
role="file"} when it is launched from the GUI, i.e. by clicking the
[\|kitty\|](##SUBST##|kitty|) application icon or using `open -a kitty`.
Note that this file is *only read* when running via the GUI. The
contents of the file are assumed to be the command line to pass to kitty
in shell syntax, for example:

``` sh
--single-instance --override background=red
```

You can, of course, also run [\|kitty\|](##SUBST##|kitty|) from a
terminal with command line options, using:
`/Applications/kitty.app/Contents/MacOS/kitty`{.interpreted-text
role="file"}.

And within [\|kitty\|](##SUBST##|kitty|) itself, you can always run
[\|kitty\|](##SUBST##|kitty|) using just `kitty` as it cleverly adds
itself to the `PATH`{.interpreted-text role="envvar"}.

## I catted a binary file and now kitty is hung?

**Never** output unknown binary data directly into a terminal.

Terminals have a single channel for both data and control. Certain bytes
are control codes. Some of these control codes are of arbitrary length,
so if the binary data you output into the terminal happens to contain
the starting sequence for one of these control codes, the terminal will
hang waiting for the closing sequence. Press
`reset_terminal`{.interpreted-text role="sc"} to reset the terminal.

If you do want to cat unknown data, use `cat -v`.

## kitty is not able to use my favorite font?

[\|kitty\|](##SUBST##|kitty|) achieves its stellar performance by
caching alpha masks of each rendered character on the GPU, and rendering
them all in parallel. This means it is a strictly character cell based
display. As such it can use only monospace fonts, since every cell in
the grid has to be the same size. Furthermore, it needs fonts to be
freely resizable, so it does not support bitmapped fonts.

:::: note
::: title
Note
:::

If you are trying to use a font patched with [Nerd
Fonts](https://nerdfonts.com/) symbols, don\'t do that as patching
destroys fonts. There is no need, kitty has a builtin NERD font and will
use it for symbols not found in any other font on your system. If you
have patched fonts on your system they might be used instead for NERD
symbols, so to force kitty to use the pure NERD font for NERD symbols,
add the following line to `kitty.conf`{.interpreted-text role="file"}:

``` sh
# Nerd Fonts v3.4.0
```

symbol[map]{#map}
U+e000-U+e00a,U+e0a0-U+e0a2,U+e0a3,U+e0b0-U+e0b3,U+e0b4-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ea60-U+ec1e,U+ed00-U+efce,U+f000-U+f2ff,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0
Symbols Nerd Font Mono

Those Unicode symbols not in the [Unicode private use
areas](https://en.wikipedia.org/wiki/Private_Use_Areas) are not
included.
::::

If your font is not listed in `kitten choose-fonts` it means that it is
not monospace or is a bitmapped font. On Linux you can list all
monospace fonts with:

``` sh
fc-list : family spacing outline scalable | grep -e spacing=100 -e spacing=90 | grep -e outline=True | grep -e scalable=True
```

On macOS, you can open *Font Book* and look in the
`Fixed width`{.interpreted-text role="guilabel"} collection to see all
monospaced fonts on your system.

Note that **on Linux**, the spacing property is calculated by fontconfig
based on actual glyph widths in the font. If for some reason fontconfig
concludes your favorite monospace font does not have `spacing=100` you
can override it by using the following
`~/.config/fontconfig/fonts.conf`{.interpreted-text role="file"}:

``` sh
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<match target="scan">
    <test name="family">
        <string>Your Font Family Name</string>
    </test>
    <edit name="spacing">
        <int>100</int>
    </edit>
</match>
</fontconfig>
```

After creating (or modifying) this file, you may need to run the
following command to rebuild your fontconfig cache:

``` sh
fc-cache -r
```

Then, the font will be available in `kitten choose-fonts`.

## How can I assign a single global shortcut to bring up the kitty terminal?

Use the `panel kitten <quake>`{.interpreted-text role="ref"}, this
allows you to use kitty as a quick access Quake like terminal and even
to use kitty as the desktop background, if so desired.

## I do not like the kitty icon!

The kitty icon was created as tribute to my cat of nine years who passed
away, as such it is not going to change. However, if you do not like it,
there are many alternate icons available, click on an icon to visit its
homepage:

[![image](https://github.com/k0nserv/kitty-icon/raw/main/kitty.iconset/icon_256x256.png){width="256px"}](https://github.com/k0nserv/kitty-icon)

[![image](https://github.com/DinkDonk/kitty-icon/raw/main/kitty-dark.png){width="256px"}](https://github.com/DinkDonk/kitty-icon)

[![image](https://github.com/DinkDonk/kitty-icon/raw/main/kitty-light.png){width="256px"}](https://github.com/DinkDonk/kitty-icon)

[![image](https://github.com/hristost/kitty-alternative-icon/raw/main/kitty_icon.png){width="256px"}](https://github.com/hristost/kitty-alternative-icon)

[![image](https://github.com/igrmk/whiskers/raw/main/whiskers.svg){width="256px"}](https://github.com/igrmk/whiskers)

[![image](https://github.com/samholmes/whiskers/raw/main/whiskers.png){width="256px"}](https://github.com/samholmes/whiskers)

[![image](https://github.com/user-attachments/assets/a37d7830-4a8c-45a8-988a-3e98a41ea541){width="256px"}](https://github.com/diegobit/kitty-icon)

[![image](https://github.com/eccentric-j/eccentric-icons/raw/main/icons/kitty-terminal/2d/kitty-preview.png){width="256px"}](https://github.com/eccentric-j/eccentric-icons)

[![image](https://github.com/eccentric-j/eccentric-icons/raw/main/icons/kitty-terminal/3d/kitty-preview.png){width="256px"}](https://github.com/eccentric-j/eccentric-icons)

[![image](https://github.com/sodapopcan/kitty-icon/raw/main/kitty.app.png){width="256px"}](https://github.com/sodapopcan/kitty-icon)

[![image](https://github.com/sfsam/some_icons/raw/main/kitty.app.iconset/icon_128x128@2x.png){width="256px"}](https://github.com/sfsam/some_icons)

[![image](https://github.com/igrmk/twiskers/raw/main/icon/twiskers.svg){width="256px"}](https://github.com/igrmk/twiskers)

[![image](https://github.com/mtklr/kitty-nyan-icon/raw/main/kitty-nyan.svg){width="256px"}](https://github.com/mtklr/kitty-nyan-icon)

You can put `kitty.app.icns`{.interpreted-text role="file"} (macOS only)
or `kitty.app.png`{.interpreted-text role="file"} in the
`kitty configuration directory <confloc>`{.interpreted-text role="ref"},
and this icon will be applied automatically at startup. On X11 and
Wayland, this will set the icon for kitty windows. Note that not all
Wayland compositors support the [protocol
needed](https://wayland.app/protocols/xdg-toplevel-icon-v1) for changing
window icons.

Unfortunately, on macOS, Apple\'s Dock does not change its cached icon
so the custom icon will revert when kitty is quit. Run the following to
force the Dock to update its cached icons:

``` sh
rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock
```

If you prefer not to keep a custom icon in the kitty config folder, on
macOS, you can also set it with the following command:

``` sh
# Set kitty.icns as the icon for currently running kitty
kitty +runpy 'from kitty.fast_data_types import cocoa_set_app_icon; import sys; cocoa_set_app_icon(*sys.argv[1:]); print("OK")' kitty.icns

# Set the icon for app bundle specified by the path
kitty +runpy 'from kitty.fast_data_types import cocoa_set_app_icon; import sys; cocoa_set_app_icon(*sys.argv[1:]); print("OK")' /path/to/icon.png /Applications/kitty.app
```

You can also change the icon manually by following the steps:

::: tab
macOS

1.  Find `kitty.app`{.interpreted-text role="file"} in the Applications
    folder, select it and press `⌘+I`{.interpreted-text role="kbd"}

2.  Drag `kitty.icns`{.interpreted-text role="file"} onto the
    application icon in the kitty info pane

3.  Delete the icon cache and restart Dock:

    ``` sh
    rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock
    ```
:::

::: tab
Linux

1.  Copy `kitty.desktop`{.interpreted-text role="file"} from the
    installation location (usually
    `/usr/share/applications`{.interpreted-text role="file"} to
    `~/.local/share/applications`{.interpreted-text role="file"}
2.  Edit the copied desktop file changing the `Icon` line to have the
    absolute path to your desired icon.
:::

## How do I map key presses in kitty to different keys in the terminal program?

This is accomplished by using `map` with `send_key`{.interpreted-text
role="ac"} in `kitty.conf`{.interpreted-text role="file"}. For example:

``` sh
map alt+s send_key ctrl+s
map ctrl+alt+2 combine : send_key ctrl+c : send_key h : send_key a
```

This causes the program running in kitty to receive the
`ctrl+s`{.interpreted-text role="kbd"} key when you press the
`alt+s`{.interpreted-text role="kbd"} key and several keystrokes when
you press `ctrl+alt+2`{.interpreted-text role="kbd"}. To see this in
action, run:

``` sh
kitten show-key -m kitty
```

Which will print out what key events it receives. To send arbitrary text
rather than a key press, see `send_text <send_text>`{.interpreted-text
role="sc"} instead.

## How do I open a new window or tab with the same working directory as the current window?

In `kitty.conf`{.interpreted-text role="file"} add the following:

``` sh
map f1 launch --cwd=current
map f2 launch --cwd=current --type=tab
```

Pressing `F1`{.interpreted-text role="kbd"} will open a new kitty window
with the same working directory as the current window. The
`launch command <launch>`{.interpreted-text role="doc"} is very
powerful, explore `its documentation <launch>`{.interpreted-text
role="doc"}.

## Things behave differently when running kitty from system launcher vs. from another terminal?

This will be because of environment variables. When you run kitty from
the system launcher, it gets a default set of system environment
variables. When you run kitty from another terminal, you are actually
running it from a shell, and the shell\'s rc files will have setup a
whole different set of environment variables which kitty will now
inherit.

You need to make sure that the environment variables you define in your
shell\'s rc files are either also defined system wide or via the
`env`{.interpreted-text role="opt"} directive in
`kitty.conf`{.interpreted-text role="file"}. Common environment
variables that cause issues are those related to localization, such as
`LANG`{.interpreted-text role="envvar"}, `LC_*` and loading of
configuration files such as `XDG_*`,
`KITTY_CONFIG_DIRECTORY`{.interpreted-text role="envvar"} and, most
importantly, `PATH` to locate binaries.

The simplest way to fix this is to have kitty load the environment
variables from your shell configuration at startup using the
`env`{.interpreted-text role="opt"} directive, adding the following to
`kitty.conf`{.interpreted-text role="file"}:

``` sh
env read_from_shell=PATH LANG LC_* XDG_* EDITOR VISUAL
```

This works for POSIX compliant shells and the fish shell. Note that it
does add significantly to kitty startup time, so use only if really
necessary. This feature was added in version `0.43.2`.

To see the environment variables that kitty sees, you can add the
following mapping to `kitty.conf`{.interpreted-text role="file"}:

``` sh
map f1 show_kitty_env_vars
```

then pressing `F1`{.interpreted-text role="kbd"} will show you the
environment variables kitty sees.

This problem is most common on macOS, as Apple makes it exceedingly
difficult to setup environment variables system-wide, so people end up
putting them in all sorts of places where they may or may not work.

## I am using tmux/zellij and have a problem

First, terminal multiplexers are
`a bad idea <391#issuecomment-638320745>`{.interpreted-text role="iss"},
do not use them, if at all possible. kitty contains features that do all
of what tmux does, but better, with the exception of remote persistence
(`391`{.interpreted-text role="iss"}). If you still want to use tmux,
read on.

Using ancient versions of tmux such as 1.8 will cause gibberish on
screen when pressing keys (`3541`{.interpreted-text role="iss"}).

If you are using tmux with multiple terminals or you start it under one
terminal and then switch to another and these terminals have different
`TERM`{.interpreted-text role="envvar"} variables, tmux will break. You
will need to restart it as tmux does not support multiple terminfo
definitions.

Displaying images while inside programs such as nvim or ranger may not
work depending on whether those programs have adopted support for the
`unicode
placeholders <graphics_unicode_placeholders>`{.interpreted-text
role="ref"} workaround that kitty created for tmux refusing to support
images.

If you use any of the advanced features that kitty has innovated, such
as `styled underlines </underlines>`{.interpreted-text role="doc"},
`desktop notifications
</desktop-notifications>`{.interpreted-text role="doc"},
`variable sized text </text-sizing-protocol>`{.interpreted-text
role="doc"},
`extended keyboard support </keyboard-protocol>`{.interpreted-text
role="doc"}, `file transfer </kittens/transfer>`{.interpreted-text
role="doc"}, `the ssh kitten </kittens/ssh>`{.interpreted-text
role="doc"}, `shell integration </shell-integration>`{.interpreted-text
role="doc"} etc. they may or may not work, depending on the whims of
tmux\'s maintainer, your version of tmux, etc.

## I opened and closed a lot of windows/tabs and top shows kitty\'s memory usage is very high?

`top`{.interpreted-text role="program"} is not a good way to measure
process memory usage. That is because on modern systems, when allocating
memory to a process, the C library functions will typically allocate
memory in large blocks, and give the process chunks of these blocks.
When the process frees a chunk, the C library will not necessarily
release the underlying block back to the OS. So even though the
application has released the memory, `top`{.interpreted-text
role="program"} will still claim the process is using it.

To check for memory leaks, instead use a tool like
[Valgrind](https://valgrind.org/). Run:

``` sh
PYTHONMALLOC=malloc valgrind --tool=massif kitty
```

Now open lots of tabs/windows, generate lots of output using tools like
find/yes etc. Then close all but one window. Do some random work for a
few seconds in that window, maybe run yes or find again. Then quit kitty
and run:

``` sh
massif-visualizer massif.out.*
```

You will see the allocations graph goes up when you opened the windows,
then goes back down when you closed them, indicating there were no
memory leaks.

For those interested, you can get a similar profile out of
`valgrind`{.interpreted-text role="program"} as you get with
`top`{.interpreted-text role="program"} by adding `--pages-as-heap=yes`
then you will see that memory allocated in malloc is not freed in free.
This can be further refined if you use `glibc` as your C library by
setting the environment variable `MALLOC_MMAP_THRESHOLD_=64`. This will
cause free to actually free memory allocated in sizes of more than 64
bytes. With this set, memory usage will climb high, then fall when
closing windows, but not fall all the way back. The remaining used
memory can be investigated using valgrind again, and it will come from
arenas in the GPU drivers and the per thread arenas glibc\'s malloc
maintains. These too allocate memory in large blocks and don\'t release
it back to the OS immediately.

## Using a color theme with a background color does not work well in vim?

First, be sure to [use a color scheme in
vim](https://github.com/kovidgoyal/kitty/discussions/8196#discussioncomment-11739991)
instead of relying on the terminal theme. Otherwise, background and text
selection colours may be difficult to read.

Sadly, vim has very poor out-of-the-box detection for modern terminal
features. Furthermore, it [recently broke detection even
more](https://github.com/vim/vim/issues/11729). It kind of, but not
really, supports terminfo, except it overrides it with its own
hard-coded values when it feels like it. Worst of all, it has no ability
to detect modern features not present in terminfo, at all, even security
sensitive ones like bracketed paste.

Thankfully, probably as a consequence of this lack of detection, vim
allows users to configure these low level details. So, to make vim work
well with any modern terminal, including kitty, add the following to
your `~/.vimrc`{.interpreted-text role="file"}.

``` vim
" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
```

These settings must be placed **before** setting the `colorscheme`. It
is also important that the value of the vim `term` variable is not
changed after these settings.

## Why does kitty sometimes start slowly on my Linux system?

[\|kitty\|](##SUBST##|kitty|) takes no longer (within 100ms) to start
than other similar GPU terminal emulators, (and may be faster than
some). If [\|kitty\|](##SUBST##|kitty|) occasionally takes a long time
to start, it could be a power management issue with the graphics card.
On a multi-GPU system (which many modern laptops are, having a power
efficient GPU that\'s built into the processor and a power hungry
dedicated one that\'s usually off), even if the answer of the GPU will
only be \"don\'t use me\".

For example, if you have a system with an AMD CPU and an NVIDIA GPU, and
you know that you want to use the lower powered card to save battery
life and because kitty does not require a powerful GPU to function, you
can choose not to wake up the dedicated card, which has been reported on
at least one system (`4292`{.interpreted-text role="iss"}) to take ≈2
seconds, by running [\|kitty\|](##SUBST##|kitty|) as:

``` sh
MESA_LOADER_DRIVER_OVERRIDE=radeonsi __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json kitty
```

The correct command will depend on your situation and hardware.
`__EGL_VENDOR_LIBRARY_FILENAMES` instructs the GL dispatch library to
use `libEGL_mesa.so`{.interpreted-text role="file"} and ignore
`libEGL_nvidia.so`{.interpreted-text role="file"} also available on the
system, which will wake the NVIDIA card during device enumeration.
`MESA_LOADER_DRIVER_OVERRIDE` also assures that Mesa won\'t offer any
NVIDIA card during enumeration, and will instead just use
`radeonsi_dri.so`{.interpreted-text role="file"}.
# File transfer over the TTY

There are sometimes situations where the TTY is the only convenient pipe
between two connected systems, for example, nested SSH sessions, a
serial line, etc. In such scenarios, it is useful to be able to transfer
files over the TTY.

This protocol provides the ability to transfer regular files,
directories and links (both symbolic and hard) preserving most of their
metadata. It can optionally use compression and transmit only binary
diffs to speed up transfers. However, since all data is base64 encoded
for transmission over the TTY, this protocol will never be competitive
with more direct file transfer mechanisms.

## Overall design

The basic design of this protocol is around transfer \"sessions\". Since
untrusted software should not be able to read/write to another machines
filesystem, a session must be approved by the user in the terminal
emulator before any actual data is transmitted, unless a
`pre-shared password is
provided <bypass_auth>`{.interpreted-text role="ref"}.

There can be either send or receive sessions. In send sessions files are
sent from remote client to the terminal emulator and vice versa for
receive sessions. Every session basically consists of sending metadata
for the files first and then sending the actual data. The session is a
series of commands, every command carrying the session id (which should
be a random unique-ish identifier, to avoid conflicts). The session is
bi-directional with commands going both to and from the terminal
emulator. Every command in a session also carries an `action` field that
specifies what the command does. The remaining fields in the command are
dependent on the nature of the command.

Let\'s look at some simple examples of sessions to get a feel for the
protocol.

### Sending files to the computer running the terminal emulator

The client starts by sending a start send command:

    → action=send id=someid

It then waits for a status message from the terminal either allowing the
transfer or refusing it. Until this message is received the client is
not allowed to send any more commands for the session. The terminal
emulator should drop a session if it receives any commands before
sending an `OK` response. If the user accepts the transfer, the terminal
will send:

    ← action=status id=someid status=OK

Or if the transfer is refused:

    ← action=status id=someid status=EPERM:User refused the transfer

The client then sends one or more `file` commands with the metadata of
the file it wants to transfer:

    → action=file id=someid file_id=f1 name=/path/to/destination
    → action=file id=someid file_id=f2 name=/path/to/destination2 ftype=directory

The terminal responds with either `OK` for directories or `STARTED` for
files:

    ← action=status id=someid file_id=f1 status=STARTED
    ← action=status id=someid file_id=f2 status=OK

If there was an error with the file, for example, if the terminal does
not have permission to write to the specified location, it will instead
respond with an error, such as:

    ← action=status id=someid file_id=f1 status=EPERM:No permission

The client sends data for files using `data` commands. It does not need
to wait for the `STARTED` from the terminal for this, the terminal must
discard data for files that are not `STARTED`. Data for a file is sent
in individual chunks of no larger than `4096` bytes. For example:

    → action=data id=someid file_id=f1 data=chunk of bytes
    → action=data id=someid file_id=f1 data=chunk of bytes
    ...
    → action=end_data id=someid file_id=f1 data=chunk of bytes

The sequence of data transmission for a file is ended with an `end_data`
command. After each data packet is received the terminal replies with an
acknowledgement of the form:

    ← action=status id=someid file_id=f1 status=PROGRESS size=bytes written

After `end_data` the terminal replies with:

    ← action=status id=someid file_id=f1 status=OK size=bytes written

If an error occurs while writing the data, the terminal replies with an
error code and ignores further commands about that file, for example:

    ← action=status id=someid file_id=f1 status=EIO:Failed to write to file

Once the client has finished sending as many files as it wants to, it
ends the session with:

    → action=finish id=someid

At this point the terminal commits the session, applying file metadata,
creating links, etc. If any errors occur it responds with an error
message, such as:

    ← action=status id=someid status=Some error occurred

### Receiving files from the computer running terminal emulator

The client starts by sending a start receive command:

    → action=receive id=someid size=num_of_paths

It then sends a list of `num_of_paths` paths it is interested in
receiving:

    → action=file id=someid file_id=f1 name=/some/path
    → action=file id=someid file_id=f2 name=/some/path2
    ...

The client must then wait for responses from the terminal emulator. It
is an error to send anymore commands to the terminal until an `OK`
response is received from the terminal. The terminal waits for the user
to accept the request. If accepted, it sends:

    ← action=status id=someid status=OK

If permission is denied it sends:

    ← action=status id=someid status=EPERM:User refused the transfer

The terminal then sends the metadata for all requested files. If any of
them are directories, it traverses the directories recursively, listing
all files. Note that symlinks must not be followed, but sent as
symlinks:

    ← action=file id=someid file_id=f1 mtime=XXX permissions=XXX name=/absolute/path status=file_id1 size=size_in_bytes file_type=type parent=file_id of parent
    ← action=file id=someid file_id=f1 mtime=XXX permissions=XXX name=/absolute/path2 status=file_id2 size=size_in_bytes file_type=type parent=file_id of parent
    ...

Here the `file_id` field is set to the `file_id` value sent from the
client and the `status` field is set to the actual file id for each
file. This is because a file query sent from the client can result in
multiple actual files if it is a directory. The `parent` field is the
actual `file_id` of the directory containing this file and is set for
entries that are generated from client requests that match directories.
This allows the client to build an unambiguous picture of the file tree.

Once all the files are listed, the terminal sends an `OK` response that
also specifies the absolute path to the home directory for the user
account running the terminal:

    ← action=status id=someid status=OK name=/path/to/home

If an error occurs while listing any of the files asked for by the
client, the terminal will send an error response like:

    ← action=status id=someid file_id=f1 status=ENOENT: Does not exist

Here, `file_id` is the same as was sent by the client in its initial
query.

Now, the client can send requests for file data using the paths sent by
the terminal emulator:

    → action=file id=someid file_id=f1 name=/some/path
    ...

The client must not send requests for directories and absolute symlinks.
The terminal emulator replies with the data for the files, as a sequence
of `data` commands each with a chunk of data no larger than `4096`
bytes, for each file (the terminal emulator must send the data for one
file at a time):

    ← action=data id=someid file_id=f1 data=chunk of bytes
    ...
    ← action=end_data id=someid file_id=f1 data=chunk of bytes

If any errors occur reading file data, the terminal emulator sends an
error message for the file, for example:

    ← action=status id=someid file_id=f1 status=EIO:Could not read

Once the client is done reading data for all the files it expects, it
terminates the session with:

    → action=finished id=someid

## Canceling a session

A client can decide to cancel a session at any time (for example if the
user presses `ctrl+c`{.interpreted-text role="kbd"}). To cancel a
session it sends a `cancel` action to the terminal emulator:

    → action=cancel id=someid

The terminal emulator drops the session and sends a cancel
acknowledgement:

    ← action=status id=someid status=CANCELED

The client **must** wait for the canceled response from the emulator
discarding any other responses till the cancel is received. If it does
not wait, after it quits the responses might end up being printed to
screen.

## Quieting responses from the terminal

The above protocol includes lots of messages from the terminal
acknowledging receipt of data, granting permission etc., acknowledging
cancel requests, etc. For extremely simple clients like shell scripts,
it might be useful to suppress these responses, which can be done by
adding the `quiet` key to the start session command:

    → action=send id=someid quiet=1

The key can take the values `1` - meaning suppress acknowledgement
responses or `2` - meaning suppress all responses including errors. Only
actual data responses are sent. Note that in particular this means
acknowledgement of permission for the transfer to go ahead is
suppressed, so this is typically useful only with
`bypass_auth`{.interpreted-text role="ref"}.

## File metadata {#file_metadata}

File metadata includes file paths, permissions and modification times.
They are somewhat tricky as different operating systems support
different kinds of metadata. This specification defines a common minimum
set which should work across most operating systems.

File paths

:   File paths must be valid UTF-8 encoded POSIX paths (i.e. using the
    forward slash `/` as a separator). Linux systems allow non UTF-8
    file paths, these are not supported. A leading `~/` means a path is
    relative to the `HOME` directory. All path must be either absolute
    (i.e. with a leading `/`) or relative to the HOME directory.
    Individual components of the path must be no longer than 255 UTF-8
    bytes. Total path length must be no more than 4096 bytes. Paths from
    Windows systems must use the forward slash as the separator, the
    first path component must be the drive letter with a colon. For
    example: `C:\\some\\file.txt`{.interpreted-text role="file"} is
    represented as `/C:/some/file.txt`{.interpreted-text role="file"}.
    For maximum portability, the following characters *should* be
    omitted from paths (however implementations are free to try to
    support them returning errors for non-representable paths):

        \ * : < > ? | /

File modification times

:   Must be represented as the number of nanoseconds since the UNIX
    epoch. An individual file system may not store file metadata with
    this level of accuracy in which case it should use the closest
    possible approximation.

File permissions

:   Represented as a number with the usual UNIX read, write and execute
    bits. In addition, the sticky, set-group-id and set-user-id bits may
    be present. Implementations should make a best effort to preserve as
    many bits as possible. On Windows, there is only a read-only bit.
    When reading file metadata all the `WRITE` bits should be set if the
    read only bit is clear and cleared if it is set. When writing files,
    the read-only bit should be set if the bit indicating write
    permission for the user is clear. The other UNIX bits must be
    ignored when writing. When reading, all the `READ` bits should
    always be set and all the `EXECUTE` bits should be set if the file
    is directly executable by the Windows Operating system. There is no
    attempt to map Window\'s ACLs to permission bits.

## Symbolic and hard links

Symbolic and hard links can be preserved by this protocol.

:::: note
::: title
Note
:::

In the following when target paths of symlinks are sent as actual paths,
they must be encoded in the same way as discussed in
`file_metadata`{.interpreted-text role="ref"}. It is up to the receiving
side to translate them into appropriate paths for the local operating
system. This may not always be possible, in which case either the
symlink should not be created or a broken symlink should be created.
::::

### Sending links to the terminal emulator

When sending files to the terminal emulator, the file command has the
form:

    → action=file id=someid file_id=f1 name=/path/to/link file_type=link
    → action=file id=someid file_id=f2 name=/path/to/symlink file_type=symlink

Then, when the client is sending data for the files, for hardlinks, the
data will be the `file_id` of the target file (assuming the target file
is also being transmitted, otherwise the hard link should be transmitted
as a plain file):

    → action=end_data id=someid file_id=f1 data=target_file_id_encoded_as_utf8

For symbolic links, the data is a little more complex. If the symbolic
link is to a destination being transmitted, the data has the form:

    → action=end_data id=someid file_id=f1 data=fid:target_file_id_encoded_as_utf8
    → action=end_data id=someid file_id=f1 data=fid_abs:target_file_id_encoded_as_utf8

The `fid_abs` form is used if the symlink uses an absolute path, `fid`
if it uses a relative path. If the symlink is to a destination that is
not being transmitted, then the prefix `path:` and the actual path in
the symlink is transmitted.

### Receiving links from the terminal emulator

When receiving files from the terminal emulator, link data is
transmitted in two parts. First when the emulator sends the initial file
listing to the client, the `file_type` is set to the link type and the
`data` field is set to file[id]{#id} of the target file if the target
file is included in the listing. For example:

    ← action=file id=someid file_id=f1 status=file_id1 ...
    ← action=file id=someid file_id=f1 status=file_id2 file_type=symlink data=file_id1 ...

Here the rest of the metadata has been left out for clarity. Notice that
the second file is symlink whose `data` field is set to the file id of
the first file (the value of the `status` field of the first file). The
same technique is used for hard links.

The client should not request data for hard links, instead creating them
directly after transmission is complete. For symbolic links the terminal
must send the actual symbolic link target as a UTF-8 encoded path in the
data field. The client can use this path either as-is (when the target
is not a transmitted file) or to decide whether to create the symlink
with a relative or absolute path when the target is a transmitted file.

## Transmitting binary deltas

Repeated transfer of large files that have only changed a little between
the receiving and sending side can be sped up significantly by
transmitting binary deltas of only the changed portions. This protocol
has built-in support for doing that. This support uses the [rsync
algorithm](https://rsync.samba.org/tech_report/tech_report.html). In
this algorithm, first the receiving side sends a file signature that
contains hashes of blocks in the file. Then the sending side sends only
those blocks that have changed. The receiving side applies these deltas
to the file to update it till it matches the file on the sending side.

The modification to the basic protocol consists of setting the
`transmission_type` key to `rsync` when requesting a file. This triggers
transmission of signatures and deltas instead of file data. The details
are different for sending and receiving.

### Sending to the terminal emulator

When sending the metadata of the file it wants to transfer, the client
adds the `transmission_type` key:

    → action=file id=someid file_id=f1 name=/path/to/destination transmission_type=rsync

The `STARTED` response from the terminal will have `transmission_type`
set to `rsync` if the file exists and the terminal is able to send
signature data:

    ← action=status id=someid file_id=f1 status=STARTED transmission_type=rsync

The terminal then transmits the signature using `data` commands:

    ← action=data id=someid file_id=f1 data=...
    ...
    ← action=end_data id=someid file_id=f1 data=...

Once the client receives and processes the full signature, it transmits
the file delta to the terminal as `data` commands:

    → action=data id=someid file_id=f1 data=...
    → action=data id=someid file_id=f1 data=...
    ...
    → action=end_data id=someid file_id=f1 data=...

The terminal then uses this delta to update the file.

### Receiving from the terminal emulator

When the client requests file data from the terminal emulator, it can
add the `transmission_type=rsync` key to indicate it will be sending a
signature for that file:

    → action=file id=someid file_id=f1 name=/some/path transmission_type=rsync

The client then sends the signature using `data` commands:

    → action=data id=someid file_id=f1 data=...
    ...
    → action=end_data id=someid file_id=f1 data=...

After receiving the signature the terminal replies with the delta as a
series of `data` commands:

    ← action=data id=someid file_id=f1 data=...
    ...
    ← action=end_data id=someid file_id=f1 data=...

The client then uses this delta to update the file.

### The format of signatures and deltas

In what follows, all integers must be encoded in little-endian format,
regardless of the architecture of the machines involved. The XXH3 hash
family refers to [the xxHash
algorithm](https://github.com/Cyan4973/xxHash/blob/dev/doc/xxhash_spec.md).

A signature first has a 12 byte header of the form:

``` 
uint16 version
uint16 checksum_type
uint16 strong_hash_type
uint16 weak_hash_type
uint32 block_size
```

These fields define the parameters to the rsync algorithm. Allowed
values are currently all zero except for `block_size`, which is usually
the square root of the file size, but implementations are free to use
any algorithm they like to arrive at the block size.

`checksum_type` must be `0` which indicates using the XXH3-128 bit hash
to verify file integrity after transmission.

`strong_hash_type` must be `0` which indicates using the XXH3-64 bit
hash to identify blocks.

`weak_hash_type` must be `0` which indicates using the [rsync rolling
checksum hash](https://rsync.samba.org/tech_report/node3.html) to
identify blocks, weakly.

After the header comes the list of block signatures. The number of
blocks is unknown allowing for streaming, the transfer protocol takes
care of indicating end-of-stream via an `action=end_data` packet. Each
signature in the list is of the form:

``` 
uint64 index
uint32 weak_hash
uint64 strong_hash
```

Here, `index` is the zero-based block number. `weak_hash` is the weak,
but easy to calculate hash of the block and strong hash is a stronger
hash of the block that is very unlikely to collide.

The algorithms used for these hashes are specified by the signature
header above. Given the `block_size` from the header and `index` the
position of a block in the file is: `index * block_size`.

Once the sending side receives the signature, it calculates a *delta*
based on the actual file contents and transmits that delta to the
receiving side. The delta is of the form of a list of *operations*. An
operation is a single byte denoting the operation type followed by
variable length data depending on the type. The types of operations are:

`Block (type=0)`

:   Followed by an 8 byte `uint64` that is the block index. It means
    copy the specified block from the existing file to the output,
    unmodified.

`Data (type=1)`

:   Followed by a 4 byte `uint32` that is the size of the payload and
    then the payload itself. The payload must be written to the output.

`Hash (type=2)`

:   Followed by a 2 byte `uint16` specifying the size of the hash
    checksum and then the checksum itself. The checksum of the output
    file must match this checksum. The algorithm used to calculate the
    checksum is specified in the signature header.

`BlockRange (type=3)`

:   Followed by an 8 byte `uint64` that is the starting block index and
    then a 4 byte `uint32` (`N`) that is the number of additional
    blocks. Works just like `Block` above, except that after copying the
    block an additional (`N`) more blocks must be copied.

## Compression

Individual files can be transmitted compressed if needed. Currently,
only `1950`{.interpreted-text role="rfc"} ZLIB based deflate compression
is supported, which is specified using the `compression=zlib` key when
requesting a file. For example when sending files to the terminal
emulator, when sending the file metadata the `compression` key can also
be specified:

    → action=file id=someid file_id=f1 name=/path/to/destination compression=zlib

Similarly when receiving files from the terminal emulator, the final
file command that the client sends to the terminal requesting the start
of the transfer of data for the file can include the `compression` key:

    → action=file id=someid file_id=f1 name=/some/path compression=zlib

## Bypassing explicit user authorization {#bypass_auth}

In order to bypass the requirement of interactive user authentication,
this protocol has the ability to use a pre-shared secret (password).
When initiating a transfer session the client sends a hash of the
password and the session id:

    → action=send id=someid bypass=sha256:hash_value

For example, suppose that the session id is `mysession` and the shared
secret is `mypassword`. Then the value of the `bypass` key above is
`sha256:SHA256("mysession" + ";" + "mypassword")`, which is:

    → action=send id=mysession bypass=sha256:192bd215915eeaa8c2b2a4c0f8f851826497d12b30036d8b5b1b4fc4411caf2c

The value of `bypass` is of the form `hash_function_name : hash_value`
(without spaces). Currently, only the SHA256 hash function is supported.

:::: warning
::: title
Warning
:::

Hashing does not effectively hide the value of the password. So this
functionality should only be used in secure/trusted contexts. While
there exist hash functions harder to compute than SHA256, they are
unsuitable as they will introduce a lot of latency to starting a session
and in any case there is no mathematical proof that **any** hash
function is not brute-forceable.
::::

Terminal implementations are free to use their own more advanced hashing
schemes, with prefixes other than those starting with `sha`, which are
reserved. For instance, kitty uses a scheme based on public key
encryption via `KITTY_PUBLIC_KEY`{.interpreted-text role="envvar"}. For
details of this scheme, see the `check_bypass()` function in the kitty
source code.

## Encoding of transfer commands as escape codes

Transfer commands are encoded as `OSC` escape codes of the form:

    <OSC> 5113 ; key=value ; key=value ... <ST>

Here `OSC` is the bytes `0x1b 0x5d` and `ST` is the bytes `0x1b 0x5c`.
Keys are words containing only the characters `[a-zA-Z0-9_]` and `value`
is arbitrary data, whose encoding is dependent on the value of `key`.
Unknown keys **must** be ignored when decoding a command. The number
`5113` is a constant and is unused by any known OSC codes. It is the
numeralization of the word `file`.

  Key                         Key name   Value type                Notes
  --------------------------- ---------- ------------------------- ---------------------------------------------------------------------
  action                      ac         enum                      send, file, data, end[data]{#data}, receive, cancel, status, finish
  compression                 zip        enum                      none, zlib
  file[type]{#type}           ft         enum                      regular, directory, symlink, link
  transmission[type]{#type}   tt         enum                      simple, rsync
  id                          id         safe[string]{#string}     A unique-ish value, to avoid collisions
  file[id]{#id}               fid        safe[string]{#string}     Must be unique per file in a session
  bypass                      pw         safe[string]{#string}     hash of the bypass password and the session id
  quiet                       q          integer                   0 - verbose, 1 - only errors, 2 - totally silent
  mtime                       mod        integer                   the modification time of file in nanoseconds since the UNIX epoch
  permissions                 prm        integer                   the UNIX file permissions bits
  size                        sz         integer                   size in bytes
  name                        n          base64[string]{#string}   The path to a file
  status                      st         base64[string]{#string}   Status messages
  parent                      pr         safe[string]{#string}     The file id of the parent directory
  data                        d          base64[bytes]{#bytes}     Binary data

  : The keys and value types for this protocol

The `Key name` is the actual serialized name of the key sent in the
escape code. So for example, `permissions=123` is serialized as
`prm=123`. This is done to reduce overhead.

The value types are:

enum

:   One from a permitted set of values, for example:

        ac=file

safe[string]{#string}

:   A string consisting only of characters from the set
    `[0-9a-zA-Z_:./@-]` Note that the semi-colon is missing from this
    set.

integer

:   A base-10 number composed of the characters `[0-9]` with a possible
    leading `-` sign. When missing the value is zero.

base64[string]{#string}

:   A base64 encoded UTF-8 string using the standard base64 encoding

base64[bytes]{#bytes}

:   Binary data encoded using the standard base64 encoding

An example of serializing an escape code is shown below:

    action=send id=test name=somefile size=3 data=01 02 03

becomes:

    <OSC> 5113 ; ac=send ; id=test ; n=c29tZWZpbGU= ; sz=3 ; d=AQID <ST>

Here `c29tZWZpbGU` is the base64 encoded form of somefile and `AQID` is
the base64 encoded form of the bytes `0x01 0x02 0x03`. The spaces in the
encoded form are present for clarity and should be ignored.
orphan

:   

# Glossary

::: glossary

os[window]{#window}

:   kitty has two kinds of windows. Operating System windows, referred
    to as `OS
    Window <os_window>`{.interpreted-text role="term"}, and *kitty
    windows*. An OS Window consists of one or more kitty
    `tabs <tab>`{.interpreted-text role="term"}. Each tab in turn
    consists of one or more *kitty windows* organized in a
    `layout`{.interpreted-text role="term"}.

tab

:   A *tab* refers to a group of
    `kitty windows <window>`{.interpreted-text role="term"}, organized
    in a `layout`{.interpreted-text role="term"}. Every
    `OS Window <os_window>`{.interpreted-text role="term"} contains one
    or more tabs.

layout

:   A *layout* is a system of organizing
    `kitty windows <window>`{.interpreted-text role="term"} in groups
    inside a tab. The layout automatically maintains the size and
    position of the windows, think of a layout as a tiling window
    manager for the terminal. See `layouts`{.interpreted-text
    role="doc"} for details.

window

:   kitty has two kinds of windows. Operating System windows, referred
    to as `OS
    Window <os_window>`{.interpreted-text role="term"}, and *kitty
    windows*. An OS Window consists of one or more kitty
    `tabs <tab>`{.interpreted-text role="term"}. Each tab in turn
    consists of one or more *kitty windows* organized in a
    `layout`{.interpreted-text role="term"}.

overlay

:   An *overlay window* is a `kitty window <window>`{.interpreted-text
    role="term"} that is placed on top of an existing kitty window,
    entirely covering it. Overlays are used throughout kitty, for
    example, to display the
    `the scrollback buffer <scrollback>`{.interpreted-text role="ref"},
    to display `hints </kittens/hints>`{.interpreted-text role="doc"},
    for `unicode input
    </kittens/unicode_input>`{.interpreted-text role="doc"} etc. Normal
    overlays are meant for short duration popups and so are not
    considered the `active window`{.interpreted-text role="italic"} when
    determining the current working directory or getting input text for
    kittens, launch commands, etc. To create an overlay considered as a
    `main window`{.interpreted-text role="italic"} use the
    `overlay-main` argument to `launch`{.interpreted-text role="doc"}.

hyperlinks

:   Terminals can have hyperlinks, just like the internet. In kitty you
    can `control exactly what happens <open_actions>`{.interpreted-text
    role="doc"} when clicking on a hyperlink, based on the type of link
    and its URL. See also [Hyperlinks in terminal
    emulators](https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda).

kittens

:   Small, independent statically compiled command line programs that
    are designed to run inside kitty windows and provide it with lots of
    powerful and flexible features such as viewing images, connecting
    conveniently to remote computers, transferring files, inputting
    unicode characters, etc. They can also be written by users in Python
    and used to customize and extend kitty functionality, see
    `kittens_intro`{.interpreted-text role="doc"} for details.

easing function

:   A function that controls how an animation progresses over time.
    kitty support the [CSS syntax for easing
    functions](https://developer.mozilla.org/en-US/docs/Web/CSS/easing-function).
    Commonly used easing functions are `linear` for a constant rate
    animation and `ease-in-out` for an animation that starts slow,
    becomes fast in the middle and ends slowly. These are used to
    control various animations in kitty, such as
    `cursor_blink_interval`{.interpreted-text role="opt"} and
    `visual_bell_duration`{.interpreted-text role="opt"}.
:::

## Environment variables {#env_vars}

### Variables that influence kitty behavior

::: envvar
KITTY[CONFIG_DIRECTORY]{#config_directory}

Controls where kitty looks for `kitty.conf`{.interpreted-text
role="file"} and other configuration files. Defaults to
`~/.config/kitty`{.interpreted-text role="file"}. For full details of
the config directory lookup mechanism see,
`kitty --config`{.interpreted-text role="option"}.
:::

::: envvar
KITTY[CACHE_DIRECTORY]{#cache_directory}

Controls where kitty stores cache files. Defaults to
`~/.cache/kitty`{.interpreted-text role="file"} or
`~/Library/Caches/kitty`{.interpreted-text role="file"} on macOS.
:::

::: envvar
KITTY[RUNTIME_DIRECTORY]{#runtime_directory}

Controls where kitty stores runtime files like sockets. Defaults to the
`XDG_RUNTIME_DIR` environment variable if that is defined otherwise the
run directory inside the kitty cache directory is used.
:::

::: envvar
VISUAL

The terminal based text editor (such as `vi`{.interpreted-text
role="program"} or `nano`{.interpreted-text role="program"}) kitty uses,
when, for instance, opening `kitty.conf`{.interpreted-text role="file"}
in response to `edit_config_file`{.interpreted-text role="sc"}.
:::

::: envvar
EDITOR

Same as `VISUAL`{.interpreted-text role="envvar"}. Used if
`VISUAL`{.interpreted-text role="envvar"} is not set.
:::

::: envvar
SHELL

Specifies the default shell kitty will run when
`shell`{.interpreted-text role="opt"} is set to `.`.
:::

::: envvar
GLFW[IM_MODULE]{#im_module}

Set this to `ibus` to enable support for IME under X11.
:::

::: envvar
KITTY[WAYLAND_DETECT_MODIFIERS]{#wayland_detect_modifiers}

When set to a non-empty value, kitty attempts to autodiscover XKB
modifiers under Wayland. This is useful if using non-standard modifiers
like hyper. It is possible for the autodiscovery to fail; the default
Wayland XKB mappings are used in this case. See `3943`{.interpreted-text
role="pull"} for details.
:::

::: envvar
SSH[ASKPASS]{#askpass}

Specify the program for SSH to ask for passwords. When this is set, `ssh
kitten </kittens/ssh>`{.interpreted-text role="doc"} will use this
environment variable by default. See
`askpass <kitten-ssh.askpass>`{.interpreted-text role="opt"} for
details.
:::

::: envvar
KITTY[CLONE_SOURCE_CODE]{#clone_source_code}

Set this to some shell code that will be executed in the cloned window
with `eval` when `clone-in-kitty <clone_shell>`{.interpreted-text
role="ref"} is used.
:::

::: envvar
KITTY[CLONE_SOURCE_PATH]{#clone_source_path}

Set this to the path of a file that will be sourced in the cloned window
when `clone-in-kitty <clone_shell>`{.interpreted-text role="ref"} is
used.
:::

::: envvar
KITTY[DEVELOP_FROM]{#develop_from}

Set this to the directory path of the kitty source code and its Python
code will be loaded from there. Only works with official binary builds.
:::

::: envvar
KITTY[RC_PASSWORD]{#rc_password}

Set this to a pass phrase to use the `kitten @` remote control command
with `remote_control_password`{.interpreted-text role="opt"}.
:::

### Variables that kitty sets when running child programs

::: envvar
LANG

This is only set on macOS. If the country and language from the macOS
user settings form an invalid locale, it will be set to `en_US.UTF-8`.
:::

::: envvar
PATH

kitty prepends itself to the PATH of its own environment to ensure the
functions calling `kitty`{.interpreted-text role="program"} will work
properly.
:::

::: envvar
KITTY[WINDOW_ID]{#window_id}

An integer that is the id for the kitty `window`{.interpreted-text
role="term"} the program is running in. Can be used with the
`kitty remote control facility <remote-control>`{.interpreted-text
role="doc"}.
:::

::: envvar
KITTY[PID]{#pid}

An integer that is the process id for the kitty process in which the
program is running. Allows programs to tell kitty to reload its config
by sending it the SIGUSR1 signal.
:::

::: envvar
KITTY[PUBLIC_KEY]{#public_key}

A public key that programs can use to communicate securely with kitty
using the remote control protocol. The format is: `protocol:key data`.
:::

::: envvar
WINDOWID

The id for the `OS Window <os_window>`{.interpreted-text role="term"}
the program is running in. Only available on platforms that have ids for
their windows, such as X11 and macOS.
:::

::: envvar
TERM

The name of the terminal, defaults to `xterm-kitty`. See
`term`{.interpreted-text role="opt"}.
:::

::: envvar
TERMINFO

Path to a directory containing the kitty terminfo database. Or the
terminfo database itself encoded in base64. See
`terminfo_type`{.interpreted-text role="opt"}.
:::

::: envvar
KITTY[INSTALLATION_DIR]{#installation_dir}

Path to the kitty installation directory.
:::

::: envvar
COLORTERM

Set to the value `truecolor` to indicate that kitty supports 16 million
colors.
:::

::: envvar
KITTY[LISTEN_ON]{#listen_on}

Set when the `remote control <remote-control>`{.interpreted-text
role="doc"} facility is enabled and the a socket is used for control via
`kitty --listen-on`{.interpreted-text role="option"} or
`listen_on`{.interpreted-text role="opt"}. Contains the path to the
socket. Avoid the need to use `kitten @ --to`{.interpreted-text
role="option"} when issuing remote control commands. Can also be a file
descriptor of the form fd:num instead of a socket address, in which
case, remote control communication should proceed over the specified
file descriptor.
:::

::: envvar
KITTY[PIPE_DATA]{#pipe_data}

Set to data describing the layout of the screen when running child
programs using `launch --stdin-source`{.interpreted-text role="option"}
with the contents of the screen/scrollback piped to them.
:::

::: envvar
KITTY[CHILD_CMDLINE]{#child_cmdline}

Set to the command line of the child process running in the kitty window
when calling the notification callback program on terminal bell, see
`command_on_bell`{.interpreted-text role="opt"}.
:::

::: envvar
KITTY[COMMON_OPTS]{#common_opts}

Set with the values of some common kitty options when running kittens,
so kittens can use them without needing to load
`kitty.conf`{.interpreted-text role="file"}.
:::

::: envvar
KITTY[SHELL_INTEGRATION]{#shell_integration}

Set when enabling `shell_integration`{.interpreted-text role="ref"}. It
is automatically removed by the shell integration scripts.
:::

::: envvar
KITTY[SI_RUN_COMMAND_AT_STARTUP]{#si_run_command_at_startup}

Set this to an expression that the kitty shell integration scripts will
`eval` after the shell is started. Note that this environment variable
is ignored when present in the environment in which kitty itself is
launched in. It is most useful with the `--env` flag for the
`launch <launch>`{.interpreted-text role="doc"} action.
:::

::: envvar
ZDOTDIR

Set when enabling `shell_integration`{.interpreted-text role="ref"} with
`zsh`{.interpreted-text role="program"}, allowing
`zsh`{.interpreted-text role="program"} to automatically load the
integration script.
:::

::: envvar
XDG[DATA_DIRS]{#data_dirs}

Set when enabling `shell_integration`{.interpreted-text role="ref"} with
`fish`{.interpreted-text role="program"}, allowing
`fish`{.interpreted-text role="program"} to automatically load the
integration script.
:::

::: envvar
ENV

Set when enabling `shell_integration`{.interpreted-text role="ref"} with
`bash`{.interpreted-text role="program"}, allowing
`bash`{.interpreted-text role="program"} to automatically load the
integration script.
:::

::: envvar
KITTY[OS]{#os}

Set when using the include directive in kitty.conf. Can take values:
`linux`, `macos`, `bsd`.
:::

::: envvar
KITTY[HOLD]{#hold}

Set to `1` when kitty is running a shell because of the `--hold` flag.
Can be used to specialize shell behavior in the shell rc files as
desired.
:::

::: envvar
KITTY[SIMD]{#simd}

Set it to `128` to use 128 bit vector registers, `256` to use 256 bit
vector registers or any other value to prevent kitty from using SIMD CPU
vector instructions. Warning, this overrides CPU capability detection so
will cause kitty to crash with SIGILL if your CPU does not support the
necessary SIMD extensions.
:::
# Terminal graphics protocol

The goal of this specification is to create a flexible and performant
protocol that allows the program running in the terminal, hereafter
called the *client*, to render arbitrary pixel (raster) graphics to the
screen of the terminal emulator. The major design goals are:

-   Should not require terminal emulators to understand image formats.
-   Should allow specifying graphics to be drawn at individual pixel
    positions.
-   The graphics should integrate with the text, in particular it should
    be possible to draw graphics below as well as above the text, with
    alpha blending. The graphics should also scroll with the text,
    automatically.
-   Should use optimizations when the client is running on the same
    computer as the terminal emulator.

For some discussion regarding the design choices, see
`33`{.interpreted-text role="iss"}.

To see a quick demo, inside a [\|kitty\|](##SUBST##|kitty|) terminal
run:

    kitten icat path/to/some/image.png

You can also see a screenshot with more sophisticated features such as
alpha-blending and text over graphics.

![Demo of graphics rendering in kitty](https://user-images.githubusercontent.com/1308621/31647475-1188ab66-b326-11e7-8d26-24b937f1c3e8.png){.align-center}

Some applications that use the kitty graphics protocol:

-   [awrit](https://github.com/chase/awrit) - Chromium-based web browser
    rendered in Kitty with mouse and keyboard support
-   [blackcat](https://github.com/j-c-m/blackcat) - a modern compatible
    cat with image support
-   [bicat](https://github.com/stevenxxiu/bicat) - a terminal image
    viewer that also works in the Vifm file manager, with nested Tmux
    support
-   [broot](https://dystroy.org/broot/) - a terminal file explorer and
    manager, with preview of images, SVG, PDF, etc.
-   [chafa](https://github.com/hpjansson/chafa) - a terminal image
    viewer
-   `kitty-diff <kittens/diff>`{.interpreted-text role="doc"} - a
    side-by-side terminal diff program with support for images
-   [fzf](https://github.com/junegunn/fzf/commit/d8188fce7b7bea982e7f9050c35e488e49fb8fd0) -
    A command line fuzzy finder
-   [mpv](https://github.com/mpv-player/mpv/commit/874e28f4a41a916bb567a882063dd2589e9234e1) -
    A video player that can play videos in the terminal
-   [neofetch](https://github.com/dylanaraps/neofetch) - A command line
    system information tool
-   [nvim](https://github.com/neovim/neovim/issues/30889) - A TUI editor
    that can display images in the terminal
-   [pixcat](https://github.com/mirukana/pixcat) - a third party CLI and
    python library that wraps the graphics protocol
-   [ranger](https://github.com/ranger/ranger) - a terminal file
    manager, with image previews
-   [termpdf.py](https://github.com/dsanson/termpdf.py) - a terminal
    PDF/DJVU/CBR viewer
-   [timg](https://github.com/hzeller/timg) - a terminal image and video
    viewer
-   [tpix](https://github.com/jesvedberg/tpix) - a statically compiled
    binary that can be used to display images and easily installed on
    remote servers without root access
-   [twitch-tui](https://github.com/Xithrius/twitch-tui) - Twitch chat
    in the terminal
-   [vat](https://github.com/jzbrooks/vat) - a terminal image viewer for
    vector graphics, including Android Vector Drawables
-   [viu](https://github.com/atanunq/viu) - a terminal image viewer
-   [Yazi](https://github.com/sxyazi/yazi) - Blazing fast terminal file
    manager written in Rust, based on async I/O

Libraries:

-   [ctx.graphics](https://ctx.graphics/) - Library for drawing graphics
-   [notcurses](https://github.com/dankamongmen/notcurses) - C library
    for terminal graphics with bindings for C++, Rust and Python
-   [rasterm](https://github.com/BourgeoisBear/rasterm) - Go library to
    display images in the terminal
-   [hologram.nvim](https://github.com/edluffy/hologram.nvim) - view
    images inside nvim
-   [image.nvim](https://github.com/3rd/image.nvim) - Bringing images to
    neovim
-   [image_preview.nvim](https://github.com/adelarsq/image_preview.nvim/) -
    Image preview for neovim
-   [kui.nvim](https://github.com/romgrk/kui.nvim) - Build sophisticated
    UIs inside neovim using the kitty graphics protocol
-   [kitty-graphics.el](https://github.com/cashmeredev/kitty-graphics.el) -
    Images in emacs
-   [term-image](https://github.com/AnonymouX47/term-image) - A Python
    library, CLI and TUI to display and browse images in the terminal
-   [glkitty](https://github.com/michaeljclark/glkitty) - C library to
    draw OpenGL shaders in the terminal with a glgears demo

Other terminals that have implemented the graphics protocol:

-   [Ghostty](https://ghostty.org)
-   [Konsole](https://invent.kde.org/utilities/konsole/-/merge_requests/594)
-   [st (with a
    patch)](https://st.suckless.org/patches/kitty-graphics-protocol)
-   [Warp](https://docs.warp.dev/getting-started/changelog#id-2025.03.26-v0.2025.03.26.08.10)
-   [wayst](https://github.com/91861/wayst)
-   [WezTerm](https://github.com/wez/wezterm/issues/986)
-   [iTerm2](https://github.com/gnachman/iTerm2/commit/4fe5b2173193b6c3e45234b6b2ab7a144a5cfa01)
-   [xterm.js](https://github.com/xtermjs/xterm.js/discussions/5683)

## Getting the window size

In order to know what size of images to display and how to position
them, the client must be able to get the window size in pixels and the
number of cells per row and column. The cell width is then simply the
window size divided by the number of rows. This can be done by using the
`TIOCGWINSZ` ioctl. Some code to demonstrate its use

::: tab
C

``` c
#include <stdio.h>
#include <sys/ioctl.h>

int main(int argc, char **argv) {
    struct winsize sz;
    ioctl(0, TIOCGWINSZ, &sz);
    printf(
        "number of rows: %i, number of columns: %i, screen width: %i, screen height: %i\n",
        sz.ws_row, sz.ws_col, sz.ws_xpixel, sz.ws_ypixel);
    return 0;
}
```
:::

::: tab
Python

``` python
import array, fcntl, sys, termios
buf = array.array('H', [0, 0, 0, 0])
fcntl.ioctl(sys.stdout, termios.TIOCGWINSZ, buf)
print((
    'number of rows: {} number of columns: {} '
    'screen width: {} screen height: {}').format(*buf))
```
:::

::: tab
Go

``` go
package main

import (
    "fmt"
    "os"

    "golang.org/x/sys/unix"
)

func main() {
    var err error
    var f *os.File
    if f, err = os.OpenFile("/dev/tty", unix.O_NOCTTY|unix.O_CLOEXEC|unix.O_NDELAY|unix.O_RDWR, 0666); err == nil {
        var sz *unix.Winsize
        if sz, err = unix.IoctlGetWinsize(int(f.Fd()), unix.TIOCGWINSZ); err == nil {
            fmt.Printf("rows: %v columns: %v width: %v height %v\n", sz.Row, sz.Col, sz.Xpixel, sz.Ypixel)
            return
        }
    }
    fmt.Fprintln(os.Stderr, err)
    os.Exit(1)
}
```
:::

::: tab
POSIX sh

``` sh
#!/bin/sh

read rows cols <<EOF
$(command stty size)
EOF

oldstty=$(command stty -g)
command stty raw -echo
printf "\033[14t"
response=""
while : ; do
    char=$(command dd bs=1 count=1 2>/dev/null)
    [ "$char" = "t" ] && break
    response="${response}${char}"
done
command stty "$oldstty"
h=$(echo "$response" | cut -d';' -f2)
w=$(echo "$response" | cut -d';' -f3)
printf "number of rows: %d number of columns: %d" "$rows" "$cols"
printf " screen width: %d screen height: %d\n" "$w" "$h"
```
:::

Note that some terminals return `0` for the width and height values.
Such terminals should be modified to return the correct values. Examples
of terminals that return correct values: `kitty, xterm`

You can also use the *CSI t* escape code to get the screen size. Send
`<ESC>[14t` to `STDOUT` and kitty will reply on `STDIN` with
`<ESC>[4;<height>;<width>t` where `height` and `width` are the window
size in pixels. This escape code is supported in many terminals, not
just kitty. A more precise version of this escape code, which is however
supported in less terminals is `<ESC>[16t` which causes the terminal to
reply with the pixel dimensions of a single cell.

## A minimal example

Some minimal code to display PNG images in kitty, using the most basic
features of the graphics protocol:

::: tab
POSIX sh

``` sh
#!/bin/sh

send_chunked() {
    first="y"
    while IFS= read -r chunk; do
        metadata=""; [ "$first" = "y" ] && { metadata="a=T,f=100,"; first="n"; }
        printf "\033_G%sm=1;%s\033\\" "${metadata}" "${chunk}"
    done
    [ "$first" = "n" ] && { printf "\033_Gm=0;\033\\"; return 0; }
    return 1
}

transmit_png() {
    # Different systems have different or missing base64 executables.
    # The sed command below adds a trailing newline which openssl
    # base64 does not produce and is needed for reading via read -r
    { command base64 -w 4096 "$1" 2>/dev/null | send_chunked; } || \
    { command base64 -b 4096 "$1" 2>/dev/null | send_chunked; } || \
    { command openssl base64 -e -A -in "$1" | command sed '$a\' | command fold -b -w 4096 | send_chunked; }
}

transmit_png "$1"
```
:::

::: tab
Python

``` python
#!/usr/bin/env python
import sys
from base64 import standard_b64encode

first, eof, buf = True, False, memoryview(bytearray(3 * 4096 // 4))
w = sys.stdout.buffer.write
with open(sys.argv[-1], 'rb') as f:
    while not eof:
        p = buf[:]
        while p and not eof:
            n = f.readinto1(p)
            p, eof = p[n:], n == 0
        encoded = standard_b64encode(buf[:len(buf)-len(p)])
        metadata, first = "a=T,f=100," if first else "", False
        w(f'\x1b_G{metadata}m={0 if eof else 1};'.encode('ascii'))
        w(encoded)
        w(b'\x1b\\')
```
:::

Save this script as `send-png`{.interpreted-text role="file"}, then you
can use it to display any PNG file in kitty as:

    chmod +x send-png
    ./send-png file.png

## The graphics escape code

All graphics escape codes are of the form:

    <ESC>_G<control data>;<payload><ESC>\

This is a so-called *Application Programming Command (APC)*. Most
terminal emulators ignore APC codes, making it safe to use.

The control data is a comma-separated list of `key=value` pairs. The
payload is arbitrary binary data, `base64 <4648>`{.interpreted-text
role="rfc"} encoded to prevent interoperation problems with legacy
terminals that get confused by control codes within an APC code. The
meaning of the payload is interpreted based on the control data.

The first step is to transmit the actual image data.

## Transferring pixel data {#transferring_pixel_data}

The first consideration when transferring data between the client and
the terminal emulator is the format in which to do so. Since there is a
vast and growing number of image formats in existence, it does not make
sense to have every terminal emulator implement support for them.
Instead, the client should send simple pixel data to the terminal
emulator. The obvious downside to this is performance, especially when
the client is running on a remote machine. Techniques for remedying this
limitation are discussed later. The terminal emulator must understand
pixel data in three formats, 24-bit RGB, 32-bit RGBA and PNG. This is
specified using the `f` key in the control data. `f=32` (which is the
default) indicates 32-bit RGBA data and `f=24` indicates 24-bit RGB data
and `f=100` indicates PNG data. The PNG format is supported both for
convenience, and as a compact way of transmitting paletted images.

### RGB and RGBA data

In these formats the pixel data is stored directly as 3 or 4 bytes per
pixel, respectively. The colors in the data **must** be in the *sRGB
color space*. When specifying images in this format, the image
dimensions **must** be sent in the control data. For example:

    <ESC>_Gf=24,s=10,v=20;<payload><ESC>\

Here the width and height are specified using the `s` and `v` keys
respectively. Since `f=24` there are three bytes per pixel and therefore
the pixel data must be `3 * 10 * 20 = 600` bytes.

### PNG data

In this format any PNG image can be transmitted directly. For example:

    <ESC>_Gf=100;<payload><ESC>\

The PNG format is specified using the `f=100` key. The width and height
of the image will be read from the PNG data itself. Note that if you use
both PNG and compression, then you must provide the `S` key with the
size of the PNG data.

### Compression

The client can send compressed image data to the terminal emulator, by
specifying the `o` key. Currently, only `1950`{.interpreted-text
role="rfc"} ZLIB based deflate compression is supported, which is
specified using `o=z`. For example:

    <ESC>_Gf=24,s=10,v=20,o=z;<payload><ESC>\

This is the same as the example from the RGB data section, except that
the payload is now compressed using deflate (this occurs prior to
`base64 <4648>`{.interpreted-text role="rfc"} encoding). The terminal
emulator will decompress it before rendering. You can specify
compression for any format. The terminal emulator will decompress before
interpreting the pixel data.

### The transmission medium

The transmission medium is specified using the `t` key. The `t` key
defaults to `d` and can take the values:

  Value of [t]{.title-ref}   Meaning
  -------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `d`                        Direct (the data is transmitted within the escape code itself)
  `f`                        A simple file (regular files only, not named pipes, device files, etc.)
  `t`                        A temporary file, the terminal emulator will delete the file after reading the pixel data. For security reasons the terminal emulator should only delete the file if it is in a known temporary directory, such as `/tmp`{.interpreted-text role="file"}, `/dev/shm`{.interpreted-text role="file"}, `TMPDIR env var if present`{.interpreted-text role="file"} and any platform specific temporary directories and the file has the string `tty-graphics-protocol` in its full file path.
  `s`                        A *shared memory object*, which on POSIX systems is a [POSIX shared memory object](https://pubs.opengroup.org/onlinepubs/9699919799/functions/shm_open.html) and on Windows is a [Named shared memory object](https://docs.microsoft.com/en-us/windows/win32/memory/creating-named-shared-memory). The terminal emulator must read the data from the memory object and then unlink and close it on POSIX and just close it on Windows.

When opening files, the terminal emulator must follow symlinks. In case
of symlink loops or too many symlinks, it should fail and respond with
an error, similar to reporting any other kind of I/O error. Since the
file paths come from potentially untrusted sources, terminal emulators
**must** refuse to read any device/socket/etc. special files. Only
regular files are allowed. Additionally, terminal emulators may refuse
to read files in *sensitive* parts of the filesystem, such as
`/proc`{.interpreted-text role="file"}, `/sys`{.interpreted-text
role="file"}, `/dev`{.interpreted-text role="file"}, etc.

#### Local client

First let us consider the local client techniques (files and shared
memory). Some examples:

    <ESC>_Gf=100,t=f;<encoded /path/to/file.png><ESC>\

Here we tell the terminal emulator to read PNG data from the specified
file of the specified size:

    <ESC>_Gs=10,v=2,t=s,o=z;<encoded /some-shared-memory-name><ESC>\

Here we tell the terminal emulator to read compressed image data from
the specified shared memory object.

The client can also specify a size and offset to tell the terminal
emulator to only read a part of the specified file. This is done using
the `S` and `O` keys respectively. For example:

    <ESC>_Gs=10,v=2,t=s,S=80,O=10;<encoded /some-shared-memory-name><ESC>\

This tells the terminal emulator to read `80` bytes starting from the
offset `10` inside the specified shared memory buffer.

#### Remote client

Remote clients, those that are unable to use the filesystem/shared
memory to transmit data, must send the pixel data directly using escape
codes. Since escape codes are of limited maximum length, the data will
need to be chunked up for transfer. This is done using the `m` key. The
pixel data must first be `base64 <4648>`{.interpreted-text role="rfc"}
encoded then chunked up into chunks no larger than `4096` bytes. All
chunks, except the last, must have a size that is a multiple of 4. The
client then sends the graphics escape code as usual, with the addition
of an `m` key that must have the value `1` for all but the last chunk,
where it must be `0`. For example, if the data is split into three
chunks, the client would send the following sequence of escape codes to
the terminal emulator:

    <ESC>_Gs=100,v=30,m=1;<encoded pixel data first chunk><ESC>\
    <ESC>_Gm=1;<encoded pixel data second chunk><ESC>\
    <ESC>_Gm=0;<encoded pixel data last chunk><ESC>\

Note that only the first escape code needs to have the full set of
control codes such as width, height, format, etc. Subsequent chunks
**must** have only the `m` and optionally `q` keys. When sending
animation frame data, subsequent chunks **must** also specify the `a=f`
key. The client **must** finish sending all chunks for a single image
before sending any other graphics related escape codes. Note that the
cursor position used to display the image **must** be the position when
the final chunk is received. Finally, terminals must not display
anything, until the entire sequence is received and validated.

### Querying support and available transmission mediums

Since a client has no a-priori knowledge of whether it shares a
filesystem/shared memory with the terminal emulator, it can send an id
with the control data, using the `i` key (which can be an arbitrary
positive integer up to 4294967295, it must not be zero). If it does so,
the terminal emulator will reply after trying to load the image, saying
whether loading was successful or not. For example:

    <ESC>_Gi=31,s=10,v=2,t=s;<encoded /some-shared-memory-name><ESC>\

to which the terminal emulator will reply (after trying to load the
data):

    <ESC>_Gi=31;error message or OK<ESC>\

Here the `i` value will be the same as was sent by the client in the
original request. The message data will be a ASCII encoded string
containing only printable characters and spaces. The string will be `OK`
if reading the pixel data succeeded or an error message.

Sometimes, using an id is not appropriate, for example, if you do not
want to replace a previously sent image with the same id, or if you are
sending a dummy image and do not want it stored by the terminal
emulator. In that case, you can use the *query action*, set `a=q`. Then
the terminal emulator will try to load the image and respond with either
OK or an error, as above, but it will not replace an existing image with
the same id, nor will it store the image.

We intend that any terminal emulator that wishes to support it can do
so. To check if a terminal emulator supports the graphics protocol the
best way is to send the above *query action* followed by a request for
the [primary device
attributes](https://vt100.net/docs/vt510-rm/DA1.html). If you get back
an answer for the device attributes without getting back an answer for
the *query action* the terminal emulator does not support the graphics
protocol.

This means that terminal emulators that support the graphics protocol,
**must** reply to *query actions* immediately without processing other
input. Most terminal emulators handle input in a FIFO manner, anyway.

So for example, you could send:

    <ESC>_Gi=31,s=1,v=1,a=q,t=d,f=24;AAAA<ESC>\<ESC>[c

If you get back a response to the graphics query, the terminal emulator
supports the protocol, if you get back a response to the device
attributes query without a response to the graphics query, it does not.

## Display images on screen

Every transmitted image can be displayed an arbitrary number of times on
the screen, in different locations, using different parts of the source
image, as needed. Each such display of an image is called a *placement*.
You can either simultaneously transmit and display an image using the
action `a=T`, or first transmit the image with a id, such as `i=10` and
then display it with `a=p,i=10` which will display the previously
transmitted image at the current cursor position. When specifying an
image id, the terminal emulator will reply to the placement request with
an acknowledgement code, which will be either:

    <ESC>_Gi=<id>;OK<ESC>\

when the image referred to by id was found, or:

    <ESC>_Gi=<id>;ENOENT:<some detailed error msg><ESC>\

when the image with the specified id was not found. This is similar to
the scheme described above for querying available transmission media,
except that here we are querying if the image with the specified id is
available or needs to be re-transmitted.

Since there can be many placements per image, you can also give
placements an id. To do so add the `p` key with a number between `1` and
`4294967295`. When you specify a placement id, it will be added to the
acknowledgement code above. Every placement is uniquely identified by
the pair of the `image id` and the `placement id`. If you specify a
placement id for an image that does not have an id (i.e. has id=0), it
will be ignored, i.e. the placement will not get an id. In particular
this means there can exist multiple images with
`image id=0, placement id=0`. Not specifying a placement id or using
`p=0` for multiple put commands (`a=p`) with the same non-zero image id
results in multiple placements the image.

An example response:

    <ESC>_Gi=<image id>,p=<placement id>;OK<ESC>\

If you send two placements with the same `image id` and `placement id`
the second one will replace the first. This can be used to resize or
move placements around the screen, without flicker.

:::: note
::: title
Note
:::

When re-transmitting image data for a specific id, the existing image
and all its placements must be deleted. The new data replaces the old
image data but is not actually displayed until a placement for it is
created. This is to avoid divergent behavior in the case when unrelated
programs happen to re-use image ids in the same session.
::::

::: versionadded
0.19.3 Support for specifying placement ids (see
`kittens/query_terminal`{.interpreted-text role="doc"} to query kitty
version)
:::

### Controlling displayed image layout

The image is rendered at the current cursor position, from the upper
left corner of the current cell. You can also specify extra `X=3` and
`Y=4` pixel offsets to display from a different origin within the cell.
Note that the offsets must be smaller than the size of the cell.

By default, the entire image will be displayed (images wider than the
available width will be truncated on the right edge). You can choose a
source rectangle (in pixels) as the part of the image to display. This
is done with the keys: `x, y, w, h` which specify the top-left corner,
width and height of the source rectangle. The displayed area is the
intersection of the specified rectangle with the source image rectangle.

You can also ask the terminal emulator to display the image in a
specified rectangle (num of columns / num of lines), using the control
codes `c,r`. `c` is the number of columns and [r]{.title-ref} the number
of rows. The image will be scaled (enlarged/shrunk) as needed to fit the
specified area. Note that if you specify a start cell offset via the
`X,Y` keys, it is not added to the number of rows/columns. If only one
of either `r` or `c` is specified, the other one is computed based on
the source image aspect ratio, so that the image is displayed without
distortion.

Finally, you can specify the image *z-index*, i.e. the vertical stacking
order. Images placed in the same location with different z-index values
will be blended if they are semi-transparent. You can specify z-index
values using the `z` key. Negative z-index values mean that the images
will be drawn under the text. This allows rendering of text on top of
images. Negative z-index values below INT32[MIN]{#min}/2
(-1,073,741,824) will be drawn under cells with non-default background
colors. If two images with the same z-index overlap then the image with
the lower id is considered to have the lower z-index. If the images have
the same z-index and the same id, then the behavior is undefined.

:::: note
::: title
Note
:::

After placing an image on the screen the cursor must be moved to the
right by the number of cols in the image placement rectangle and down by
the number of rows in the image placement rectangle. If either of these
cause the cursor to leave either the screen or the scroll area, the
exact positioning of the cursor is undefined, and up to implementations.
The client can ask the terminal emulator to not move the cursor at all
by specifying `C=1` in the command, which sets the cursor movement
policy to no movement for placing the current image.
::::

::: versionadded
0.20.0 Support for the C=1 cursor movement policy
:::

### Unicode placeholders {#graphics_unicode_placeholders}

::: versionadded
0.28.0 Support for image display via Unicode placeholders
:::

You can also use a special Unicode character `U+10EEEE` as a placeholder
for an image. This approach is less flexible, but it allows using images
inside any host application that supports Unicode, foreground colors
(tmux, vim, weechat, etc.), and a way to pass escape codes through to
the underlying terminal.

The central idea is that we use a single *Private Use* Unicode character
as a *placeholder* to indicate to the terminal that an image is supposed
to be displayed at that cell. Since this character is just normal text,
Unicode aware application will move it around as needed when they redraw
their screens, thereby automatically moving the displayed image as well,
even though they know nothing about the graphics protocol. So an image
is first created using the normal graphics protocol escape codes (albeit
in quiet mode (`q=2`) so that there are no responses from the terminal
that could confuse the host application). Then, the actual image is
displayed by getting the host application to emit normal text consisting
of `U+10EEEE` and various diacritics (Unicode combining characters) and
colors.

To use it, first create an image as you would normally with the graphics
protocol with (`q=2`), but do not create a placement for it, that is, do
not display it. Then, create a *virtual image placement* by specifying
`U=1` and the desired number of lines and columns:

    <ESC>_Ga=p,U=1,i=<image_id>,c=<columns>,r=<rows><ESC>\

The creation of the placement need not be a separate escape code, it can
be combined with `a=T` to both transmit and create the virtual placement
with a single code.

The image will eventually be fit to the specified rectangle, its aspect
ratio preserved. Finally, the image can be actually displayed by using
the placeholder character, encoding the image ID in its foreground
color. The row and column values are specified with diacritics listed in
`rowcolumn-diacritics.txt <../gen/rowcolumn-diacritics.txt>`{.interpreted-text
role="download"}. For example, here is how you can print a `2x2`
placeholder for image ID `42`:

``` sh
printf "\e[38;5;42m\U10EEEE\U0305\U0305\U10EEEE\U0305\U030D\e[39m\n"
printf "\e[38;5;42m\U10EEEE\U030D\U0305\U10EEEE\U030D\U030D\e[39m\n"
```

Here, `U+305` is the diacritic corresponding to the number `0` and
`U+30D` corresponds to `1`. So these two commands create the following
`2x2` placeholder:

  -------- --------
  (0, 0)   (0, 1)
  (1, 0)   (1, 1)
  -------- --------

This will cause the image with ID `42` to be displayed in a `2x2` grid.
Ideally, you would print out as many cells as the number of rows and
columns specified when creating the virtual placement, but in case of a
mismatch only part of the image will be displayed.

By using only the foreground color for image ID you are limited to
either 8-bit IDs in 256 color mode or 24-bit IDs in true color mode.
Since IDs are in a global namespace there can easily be collisions. If
you need more bits for the image ID, you can specify the most
significant byte via a third diacritic. For example, this is the
placeholder for the image ID `33554474 = 42 + (2 << 24)`:

``` sh
printf "\e[38;5;42m\U10EEEE\U0305\U0305\U030E\U10EEEE\U0305\U030D\U030E\n"
printf "\e[38;5;42m\U10EEEE\U030D\U0305\U030E\U10EEEE\U030D\U030D\U030E\n"
```

Here, `U+30E` is the diacritic corresponding to the number `2`.

You can also specify a placement ID using the underline color (if it\'s
omitted or zero, the terminal may choose any virtual placement of the
given image). The background color is interpreted as the background
color, visible if the image is transparent. Other text attributes are
reserved for future use.

Row, column and most significant byte diacritics may also be omitted, in
which case the placeholder cell will inherit the missing values from the
placeholder cell to the left, following the algorithm:

-   If no diacritics are present, and the previous placeholder cell has
    the same foreground and underline colors, then the row of the
    current cell will be the row of the cell to the left, the column
    will be the column of the cell to the left plus one, and the most
    significant image ID byte will be the most significant image ID byte
    of the cell to the left.
-   If only the row diacritic is present, and the previous placeholder
    cell has the same row and the same foreground and underline colors,
    then the column of the current cell will be the column of the cell
    to the left plus one, and the most significant image ID byte will be
    the most significant image ID byte of the cell to the left.
-   If only the row and column diacritics are present, and the previous
    placeholder cell has the same row, the same foreground and underline
    colors, and its column is one less than the current column, then the
    most significant image ID byte of the current cell will be the most
    significant image ID byte of the cell to the left.

These rules are applied left-to-right, which allows specifying only row
diacritics of the first column, i.e. here is a 2 rows by 3 columns
placeholder:

``` sh
printf "\e[38;5;42m\U10EEEE\U0305\U10EEEE\U10EEEE\n"
printf "\e[38;5;42m\U10EEEE\U030D\U10EEEE\U10EEEE\n"
```

This will not work for horizontal scrolling and overlapping images since
the two given rules will fail to guess the missing information. In such
cases, the terminal may apply other heuristics (but it doesn\'t have
to).

It is important to distinguish between virtual image placements and real
images displayed on top of Unicode placeholders. Virtual placements are
invisible and only play the role of prototypes for real images. Virtual
placements can be deleted by a deletion command only when the
[d]{.title-ref} key is equal to `i`, `I`, `r`, `R`, `n` or `N`. The key
values `a`, `c`, `p`, `q`, `x`, `y`, `z` and their capital variants
never affect virtual placements because they do not have a physical
location on the screen.

Real images displayed on top of Unicode placeholders are not considered
placements from the protocol perspective. They cannot be manipulated
using graphics commands, instead they should be moved, deleted, or
modified by manipulating the underlying Unicode placeholder as normal
text.

### Relative placements {#relative_image_placement}

::: versionadded
0.31.0 Support for positioning images relative to other images
:::

You can specify that a placement is positioned relative to another
placement. This is particularly useful in combination with
`graphics_unicode_placeholders`{.interpreted-text role="ref"} above. It
can be used to specify a single transparent pixel image using a Unicode
placeholder, which moves around naturally with the text, the real
image(s) can base their position relative to the placeholder.

To specify that a placement should be relative to another, use the
`P=<image_id>,Q=<placement_id>` keys, when creating the relative
placement. For example:

    <ESC>_Ga=p,i=<image_id>,p=<placement_id>,P=<parent_img_id>,Q=<parent_placement_id><ESC>\

This will create a *relative placement* that refers to the *parent
placement* specified by the `P` and `Q` keys. When the parent placement
moves, the relative placement moves along with it. The relative
placement can be offset from the parent\'s location by a specified
number of cells, using the `H` and `V` keys for horizontal and vertical
displacement. Positive values move right and down. Negative values move
left and up. The origin is the top left cell of the parent placement.

The lifetime of a relative placement is tied to the lifetime of its
parent. If its parent is deleted, it is deleted as well. If the image
that the relative placement is a placement of, has no more placements,
the image is deleted as well. Thus, a parent and its relative placements
form a *group* that is managed together.

A relative placement can refer to another relative placement as its
parent. Thus the relative placements can form a chain. It is
implementation dependent how long a chain of such placements is allowed,
but implementation must allow a chain of length at least 8. If the
implementation max depth is exceeded, the terminal must respond with the
`ETOODEEP` error code.

Virtual placements created for Unicode placeholder based images cannot
also be relative placements. However, a relative placement can refer to
a virtual placement as its parent. When a virtual placement is the
parent, its position is derived from all the actual Unicode placeholder
images that refer to it. The x position is the minimum of all the
placeholder x positions and the y position is the minimum of all the
placeholder y positions. If a client attempts to make a virtual
placement relative the terminal must respond with the `EINVAL` error
code.

Terminals are required to reject the creation of a relative placement
that would create a cycle, such as when A is relative to B and B is
relative to C and C is relative to A. In such cases, the terminal must
respond with the `ECYCLE` error code.

If a client attempts to create a reference to a placement that does not
exist the terminal must respond with the `ENOPARENT` error code.

:::: note
::: title
Note
:::

Since a relative placement gets its position specified based on another
placement, instead of the cursor, the cursor must not move after a
relative position, regardless of the value of the `C` key to control
cursor movement.
::::

## Deleting images

Images can be deleted by using the delete action `a=d`. If specified
without any other keys, it will delete all images visible on screen. To
delete specific images, use the [d]{.title-ref} key as described in the
table below. Note that each value of d has both a lowercase and an
uppercase variant. The lowercase variant only deletes the images without
necessarily freeing up the stored image data, so that the images can be
re-displayed without needing to resend the data. The uppercase variants
will delete the image data as well, provided that the image is not
referenced elsewhere, such as in the scrollback buffer. The values of
the `x` and `y` keys are the same as cursor positions (i.e. `x=1, y=1`
is the top left cell).

  Value of `d`   Meaning
  -------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `a` or `A`     Delete all placements visible on screen
  `i` or `I`     Delete all images with the specified id, specified using the `i` key. If you specify a `p` key for the placement id as well, then only the placement with the specified image id and placement id will be deleted.
  `n` or `N`     Delete newest image with the specified number, specified using the `I` key. If you specify a `p` key for the placement id as well, then only the placement with the specified number and placement id will be deleted.
  `c` or `C`     Delete all placements that intersect with the current cursor position.
  `f` or `F`     Delete animation frames.
  `p` or `P`     Delete all placements that intersect a specific cell, the cell is specified using the `x` and `y` keys
  `q` or `Q`     Delete all placements that intersect a specific cell having a specific z-index. The cell and z-index is specified using the `x`, `y` and `z` keys.
  `r` or `R`     Delete all images whose id is greater than or equal to the value of the `x` key and less than or equal to the value of the `y` (added in kitty version 0.33.0).
  `x` or `X`     Delete all placements that intersect the specified column, specified using the `x` key.
  `y` or `Y`     Delete all placements that intersect the specified row, specified using the `y` key.
  `z` or `Z`     Delete all placements that have the specified z-index, specified using the `z` key.

Note when all placements for an image have been deleted, the image is
also deleted, if the capital letter form above is specified. Also, when
the terminal is running out of quota space for new images, existing
images without placements will be preferentially deleted.

If an image is being loaded in chunks and the upload is not complete
when any delete command is received, the partial upload must be aborted.

Some examples:

    <ESC>_Ga=d<ESC>\              # delete all visible placements
    <ESC>_Ga=d,d=i,i=10<ESC>\     # delete the image with id=10, without freeing data
    <ESC>_Ga=d,d=i,i=10,p=7<ESC>\ # delete the image with id=10 and placement id=7, without freeing data
    <ESC>_Ga=d,d=Z,z=-1<ESC>\     # delete the placements with z-index -1, also freeing up image data
    <ESC>_Ga=d,d=p,x=3,y=4<ESC>\  # delete all placements that intersect the cell at (3, 4), without freeing data

## Suppressing responses from the terminal

If you are using the graphics protocol from a limited client, such as a
shell script, it might be useful to avoid having to process responses
from the terminal. For this, you can use the `q` key. Set it to `1` to
suppress `OK` responses and to `2` to suppress failure responses.

::: versionadded
0.19.3 The ability to suppress responses (see
`kittens/query_terminal`{.interpreted-text role="doc"} to query kitty
version)
:::

## Requesting image ids from the terminal

If you are writing a program that is going to share the screen with
other programs and you still want to use image ids, it is not possible
to know what image ids are free to use. In this case, instead of using
the `i` key to specify an image id use the `I` key to specify an image
number instead. These numbers are not unique. When creating a new image,
even if an existing image has the same number a new one is created. And
the terminal will reply with the id of the newly created image. For
example, when creating an image with `I=13`, the terminal will send the
response:

    <ESC>_Gi=99,I=13;OK<ESC>\

Here, the value of `i` is the id for the newly created image and the
value of `I` is the same as was sent in the creation command.

All future commands that refer to images using the image number, such as
creating placements or deleting images, will act on only the newest
image with that number. This allows the client program to send a bunch
of commands dealing with an image by image number without waiting for a
response from the terminal with the image id. Once such a response is
received, the client program should use the `i` key with the image id
for all future communication.

:::: note
::: title
Note
:::

Specifying both `i` and `I` keys in any command is an error. The
terminal must reply with an EINVAL error message, unless silenced.
::::

::: versionadded
0.19.3 The ability to use image numbers (see
`kittens/query_terminal`{.interpreted-text role="doc"} to query kitty
version)
:::

## Animation {#animation_protocol}

::: versionadded
0.20.0 Animation support (see `kittens/query_terminal`{.interpreted-text
role="doc"} to query kitty version)
:::

When designing support for animation, the two main considerations were:

1.  There should be a way for both client and terminal driven
    animations. Since there is unknown and variable latency between
    client and terminal, especially over SSH, client driven animations
    are not sufficient.
2.  Animations often consist of small changes from one frame to the
    next, the protocol should thus allow transmitting these deltas for
    efficiency and performance reasons.

Animation support is added to the protocol by adding two new modes for
the `a` (action) key. A `f` mode for transmitting frame data and an `a`
mode for controlling the animation of an image. Animation proceeds in
two steps, first a normal image is created as described earlier. Then
animation frames are added to the image to make it into an animation.
Since every animation is associated with a single image, all animation
escape codes must specify either the `i` or `I` keys to identify the
image being operated on.

### Transferring animation frame data

Transferring animation frame data is very similar to
`transferring_pixel_data`{.interpreted-text role="ref"} above. The main
difference is that the image the frame belongs to must be specified and
it is possible to transmit data for only part of a frame, declaring the
rest of the frame to be filled in by data from a previous frame, or left
blank. To transfer frame data the `a=f` key must be used in all escape
codes.

First, to transfer a simple frame that has data for the full image area,
the escape codes used are exactly the same as for transferring image
data, with the addition of: `a=f,i=<image id>` or
`a=f,I=<image number>`.

If the frame has data for only a part of the image, you can specify the
rectangle for it using the `x, y, s, v` keys, for example:

    x=10,y=5,s=100,v=200  # A 100x200 rectangle with its top left corner at (10, 5)

Frames are created by composing the transmitted data onto a background
canvas. This canvas can be either a single color, or the pixels from a
previous frame. The composition can be of two types, either a simple
replacement (`X=1`) key or a full alpha blend (the default).

To use a background color for the canvas, specify the `Y` key as a
32-bit RGBA color. For example:

    Y=4278190335 # 0xff0000ff opaque red
    Y=16711816   # 0x00ff0088 translucent green (alpha=0.53)

The default background color when none is specified is `0` i.e. a black,
transparent pixel.

To use the data from a previous frame, specify the `c` key which is a
1-based frame number. Thus `c=1` refers to the root frame (the base
image data), `c=2` refers to the second frame and so on.

If the frame is composed of multiple rectangular blocks, these can be
expressed by using the `r` key. When specifying the `r` key the data for
an existing frame is edited. The same composition operation as above
happens, but now the background canvas is the existing frame itself. `r`
is a 1-based index, so `r=1` is the root frame (base image data), `r=2`
is the second frame and so on.

Finally, while transferring frame data, the frame *gap* can also be
specified using the `z` key. The gap is the number of milliseconds to
wait before displaying the next frame when the animation is running. A
value of `z=0` is ignored (acts as though `z` was unspecified),
`z=positive number` sets the gap to the specified number of milliseconds
and `z=negative number` creates a *gapless* frame. Gapless frames are
not displayed to the user since they are instantly skipped over, however
they can be useful as the base data for subsequent frames. For example,
for an animation where the background remains the same and a small
object or two move.

### Controlling animations

Clients can control animations by using the `a=a` key in the escape code
sent to the terminal.

The simplest is client driven animations, where the client transmits the
frame data and then also instructs the terminal to make a particular
frame the current frame. To change the current frame, use the `c` key:

    <ESC>_Ga=a,i=3,c=7<ESC>\

This will make the seventh frame in the image with id `3` the current
frame.

However, client driven animations can be sub-optimal, since the latency
between the client and terminal is unknown and variable especially over
the network. Also they require the client to remain running for the
lifetime of the animation, which is not desirable for cat like
utilities.

Terminal driven animations are achieved by the client specifying *gaps*
(time in milliseconds) between frames and instructing the terminal to
stop or start the animation.

The animation state is controlled by the `s` key. `s=1` stops the
animation. `s=2` runs the animation, but in *loading* mode, in this mode
when reaching the last frame, instead of looping, the terminal will wait
for the arrival of more frames. `s=3` runs the animation normally, after
the last frame, the terminal loops back to the first frame. The number
of loops can be controlled by the `v` key. `v=0` is ignored (acts as
though `v` was not specified), `v=1` is loop infinitely, and any other
positive number is loop `number - 1` times. Note that stopping the
animation resets the loop counter.

Finally, the *gap* for frames can be set using the `z` key. This can be
specified either when the frame is created as part of the transmit
escape code or separately using the animation control escape code. The
*gap* is the time in milliseconds to wait before displaying the next
frame in the animation. For example:

    <ESC>_Ga=a,i=7,r=3,z=48<ESC>\

This sets the gap for the third frame of the image with id `7` to `48`
milliseconds. Note that *gapless* frames are not displayed to the user
since the next frame comes immediately, however they can be useful to
store base data for subsequent frames, such as in an animation with an
object moving against a static background.

In particular, the first frame or *root frame* is created with the base
image data and has no gap, so its gap must be set using this control
code.

### Composing animation frames

::: versionadded
0.22.0 Support for frame composition
:::

Clients can *compose* animation frames, this means that they can compose
pixels in rectangular regions from one frame onto another frame. This
allows for fast and low band-width modification of frames.

To achieve this use the `a=c` key. The source frame is specified with
`r=frame number` and the destination frame as `c=frame number`. The size
of the rectangle is specified as `w=width,h=height` pixels. If
unspecified, the full image width and height are used. The offset of the
rectangle from the top-left corner for the source frame is specified by
the `x,y` keys and the destination frame by the `X,Y` keys. The
composition operation is specified by the `C` key with the default being
to alpha blend the source rectangle onto the destination rectangle. With
`C=1` it will be a simple replacement of pixels. For example:

    <ESC>_Ga=c,i=1,r=7,c=9,w=23,h=27,X=4,Y=8,x=1,y=3<ESC>\

Will compose a `23x27` rectangle located at `(4, 8)` in the `7th frame`
onto the rectangle located at `(1, 3)` in the `9th frame`. These will be
in the image with `id=1`.

If the frames or the image are not found the terminal emulator must
respond with [ENOENT]{.title-ref}. If the rectangles go out of bounds of
the image the terminal must respond with [EINVAL]{.title-ref}. If the
source and destination frames are the same and the rectangles overlap,
the terminal must respond with [EINVAL]{.title-ref}.

:::: note
::: title
Note
:::

In kitty, doing a composition will cause a frame to be *fully rendered*
potentially increasing its storage requirements, when the frame was
previously stored as a set of operations on other frames. If this
happens and there is not enough storage space, kitty will respond with
ENOSPC.
::::

## Image persistence and storage quotas

In order to avoid *Denial-of-Service* attacks, terminal emulators should
have a maximum storage quota for image data. It should allow at least a
few full screen images. For example the quota in kitty is 320MB per
buffer. When adding a new image, if the total size exceeds the quota,
the terminal emulator should delete older images to make space for the
new one. In kitty, for animations, the additional frame data is stored
on disk and has a separate, larger quota of five times the base quota.

## Control data reference

The table below shows all the control data keys as well as what values
they can take, and the default value they take when missing. All
integers are 32-bit.

+----------------+----------------+----------------+----------------+
| Key            | Value          | Default        | Description    |
+================+================+================+================+
| `a`            | Single         | `t`            | The overall    |
|                | character.     |                | action this    |
|                | `(a, c, d, f   |                | graphics       |
|                | , p, q, t, T)` |                | command is     |
|                |                |                | performing.    |
|                |                |                | `t` - transmit |
|                |                |                | data, `T` -    |
|                |                |                | transmit data  |
|                |                |                | and display    |
|                |                |                | image, `q` -   |
|                |                |                | query          |
|                |                |                | terminal,      |
|                |                |                | `p` - put      |
|                |                |                | (display)      |
|                |                |                | previous       |
|                |                |                | transmitted    |
|                |                |                | image, `d` -   |
|                |                |                | delete image,  |
|                |                |                | `f` - transmit |
|                |                |                | data for       |
|                |                |                | animation      |
|                |                |                | frames, `a` -  |
|                |                |                | control        |
|                |                |                | animation,     |
|                |                |                | `c` - compose  |
|                |                |                | animation      |
|                |                |                | frames         |
+----------------+----------------+----------------+----------------+
| `q`            | `0, 1, 2`      | `0`            | Suppress       |
|                |                |                | responses from |
|                |                |                | the terminal   |
|                |                |                | to this        |
|                |                |                | graphics       |
|                |                |                | command.       |
+----------------+----------------+----------------+----------------+
| \*\*Keys fo    | r image        |                |                |
|                | tr             |                |                |
|                | ansmission\*\* |                |                |
+----------------+----------------+----------------+----------------+
| ------------   | ------------   | ------------   | ------------   |
+----------------+----------------+----------------+----------------+
| `f`            | Positive       | `32`           | The format in  |
|                | integer.       |                | which the      |
|                | `(             |                | image data is  |
|                | 24, 32, 100)`. |                | sent.          |
+----------------+----------------+----------------+----------------+
| `t`            | Single         | `d`            | The            |
|                | character.     |                | transmission   |
|                | `              |                | medium used.   |
|                | (d, f, t, s)`. |                |                |
+----------------+----------------+----------------+----------------+
| `s`            | Positive       | `0`            | The width of   |
|                | integer.       |                | the image      |
|                |                |                | being sent.    |
+----------------+----------------+----------------+----------------+
| `v`            | Positive       | `0`            | The height of  |
|                | integer.       |                | the image      |
|                |                |                | being sent.    |
+----------------+----------------+----------------+----------------+
| `S`            | Positive       | `0`            | The size of    |
|                | integer.       |                | data to read   |
|                |                |                | from a file.   |
+----------------+----------------+----------------+----------------+
| `O`            | Positive       | `0`            | The offset     |
|                | integer.       |                | from which to  |
|                |                |                | read data from |
|                |                |                | a file.        |
+----------------+----------------+----------------+----------------+
| `i`            | Positive       | `0`            | The image id   |
|                | integer.       |                |                |
|                | `(0            |                |                |
|                | - 4294967295)` |                |                |
+----------------+----------------+----------------+----------------+
| `I`            | Positive       | `0`            | The image      |
|                | integer.       |                | number         |
|                | `(0            |                |                |
|                | - 4294967295)` |                |                |
+----------------+----------------+----------------+----------------+
| `p`            | Positive       | `0`            | The placement  |
|                | integer.       |                | id             |
|                | `(0            |                |                |
|                | - 4294967295)` |                |                |
+----------------+----------------+----------------+----------------+
| `o`            | Single         | `null`         | The type of    |
|                | character.     |                | data           |
|                | `only z`       |                | compression.   |
+----------------+----------------+----------------+----------------+
| `m`            | zero or one    | `0`            | Whether there  |
|                |                |                | is more        |
|                |                |                | chunked data   |
|                |                |                | available.     |
+----------------+----------------+----------------+----------------+
| \*\*Keys fo    | r image        |                |                |
|                | display\*\*    |                |                |
+----------------+----------------+----------------+----------------+
| ------------   | ------------   | ------------   | ------------   |
+----------------+----------------+----------------+----------------+
| `x`            | Positive       | `0`            | The left edge  |
|                | integer        |                | (in pixels) of |
|                |                |                | the image area |
|                |                |                | to display     |
+----------------+----------------+----------------+----------------+
| `y`            | Positive       | `0`            | The top edge   |
|                | integer        |                | (in pixels) of |
|                |                |                | the image area |
|                |                |                | to display     |
+----------------+----------------+----------------+----------------+
| `w`            | Positive       | `0`            | The width (in  |
|                | integer        |                | pixels) of the |
|                |                |                | image area to  |
|                |                |                | display. By    |
|                |                |                | default, the   |
|                |                |                | entire width   |
|                |                |                | is used        |
+----------------+----------------+----------------+----------------+
| `h`            | Positive       | `0`            | The height (in |
|                | integer        |                | pixels) of the |
|                |                |                | image area to  |
|                |                |                | display. By    |
|                |                |                | default, the   |
|                |                |                | entire height  |
|                |                |                | is used        |
+----------------+----------------+----------------+----------------+
| `X`            | Positive       | `0`            | The x-offset   |
|                | integer        |                | within the     |
|                |                |                | first cell at  |
|                |                |                | which to start |
|                |                |                | displaying the |
|                |                |                | image          |
+----------------+----------------+----------------+----------------+
| `Y`            | Positive       | `0`            | The y-offset   |
|                | integer        |                | within the     |
|                |                |                | first cell at  |
|                |                |                | which to start |
|                |                |                | displaying the |
|                |                |                | image          |
+----------------+----------------+----------------+----------------+
| `c`            | Positive       | `0`            | The number of  |
|                | integer        |                | columns to     |
|                |                |                | display the    |
|                |                |                | image over     |
+----------------+----------------+----------------+----------------+
| `r`            | Positive       | `0`            | The number of  |
|                | integer        |                | rows to        |
|                |                |                | display the    |
|                |                |                | image over     |
+----------------+----------------+----------------+----------------+
| `C`            | Positive       | `0`            | Cursor         |
|                | integer        |                | movement       |
|                |                |                | policy. `0` is |
|                |                |                | the default,   |
|                |                |                | to move the    |
|                |                |                | cursor to      |
|                |                |                | after the      |
|                |                |                | image. `1` is  |
|                |                |                | to not move    |
|                |                |                | the cursor at  |
|                |                |                | all when       |
|                |                |                | placing the    |
|                |                |                | image.         |
+----------------+----------------+----------------+----------------+
| `U`            | Positive       | `0`            | Set to `1` to  |
|                | integer        |                | create a       |
|                |                |                | virtual        |
|                |                |                | placement for  |
|                |                |                | a Unicode      |
|                |                |                | placeholder.   |
+----------------+----------------+----------------+----------------+
| `z`            | 32-bit integer | `0`            | The *z-index*  |
|                |                |                | vertical       |
|                |                |                | stacking order |
|                |                |                | of the image   |
+----------------+----------------+----------------+----------------+
| `P`            | Positive       | `0`            | The id of a    |
|                | integer        |                | parent image   |
|                |                |                | for relative   |
|                |                |                | placement      |
+----------------+----------------+----------------+----------------+
| `Q`            | Positive       | `0`            | The id of a    |
|                | integer        |                | placement in   |
|                |                |                | the parent     |
|                |                |                | image for      |
|                |                |                | relative       |
|                |                |                | placement      |
+----------------+----------------+----------------+----------------+
| `H`            | 32-bit integer | `0`            | The offset in  |
|                |                |                | cells in the   |
|                |                |                | horizontal     |
|                |                |                | direction for  |
|                |                |                | relative       |
|                |                |                | placement      |
+----------------+----------------+----------------+----------------+
| `V`            | 32-bit integer | `0`            | The offset in  |
|                |                |                | cells in the   |
|                |                |                | vertical       |
|                |                |                | direction for  |
|                |                |                | relative       |
|                |                |                | placement      |
+----------------+----------------+----------------+----------------+
| \*\*Keys fo    | r animation    | ing\*\*        |                |
|                | frame load     |                |                |
+----------------+----------------+----------------+----------------+
| ------------   | ------------   | ------------   | ------------   |
+----------------+----------------+----------------+----------------+
| `x`            | Positive       | `0`            | The left edge  |
|                | integer        |                | (in pixels) of |
|                |                |                | where the      |
|                |                |                | frame data     |
|                |                |                | should be      |
|                |                |                | updated        |
+----------------+----------------+----------------+----------------+
| `y`            | Positive       | `0`            | The top edge   |
|                | integer        |                | (in pixels) of |
|                |                |                | where the      |
|                |                |                | frame data     |
|                |                |                | should be      |
|                |                |                | updated        |
+----------------+----------------+----------------+----------------+
| `c`            | Positive       | `0`            | The 1-based    |
|                | integer        |                | frame number   |
|                |                |                | of the frame   |
|                |                |                | whose image    |
|                |                |                | data serves as |
|                |                |                | the base data  |
|                |                |                | when creating  |
|                |                |                | a new frame,   |
|                |                |                | by default the |
|                |                |                | base data is   |
|                |                |                | black, fully   |
|                |                |                | transparent    |
|                |                |                | pixels         |
+----------------+----------------+----------------+----------------+
| `r`            | Positive       | `0`            | The 1-based    |
|                | integer        |                | frame number   |
|                |                |                | of the frame   |
|                |                |                | that is being  |
|                |                |                | edited. By     |
|                |                |                | default, a new |
|                |                |                | frame is       |
|                |                |                | created        |
+----------------+----------------+----------------+----------------+
| `z`            | 32-bit integer | `0`            | The gap (in    |
|                |                |                | milliseconds)  |
|                |                |                | of this frame  |
|                |                |                | from the next  |
|                |                |                | one. A value   |
|                |                |                | of zero is     |
|                |                |                | ignored.       |
|                |                |                | Negative       |
|                |                |                | values create  |
|                |                |                | a *gapless*    |
|                |                |                | frame. If not  |
|                |                |                | specified,     |
|                |                |                | frames have a  |
|                |                |                | default gap of |
|                |                |                | `40ms`. The    |
|                |                |                | root frame     |
|                |                |                | defaults to    |
|                |                |                | zero gap.      |
+----------------+----------------+----------------+----------------+
| `X`            | Positive       | `0`            | The            |
|                | integer        |                | composition    |
|                |                |                | mode for       |
|                |                |                | blending       |
|                |                |                | pixels when    |
|                |                |                | creating a new |
|                |                |                | frame or       |
|                |                |                | editing a      |
|                |                |                | frame\'s data. |
|                |                |                | The default is |
|                |                |                | full alpha     |
|                |                |                | blending. `1`  |
|                |                |                | means a simple |
|                |                |                | overwrite.     |
+----------------+----------------+----------------+----------------+
| `Y`            | Positive       | `0`            | The background |
|                | integer        |                | color for      |
|                |                |                | pixels not     |
|                |                |                | specified in   |
|                |                |                | the frame      |
|                |                |                | data. Must be  |
|                |                |                | in 32-bit RGBA |
|                |                |                | format         |
+----------------+----------------+----------------+----------------+
| \*\*Keys fo    | r animation    | osition\*\*    |                |
|                | frame comp     |                |                |
+----------------+----------------+----------------+----------------+
| ------------   | ------------   | ------------   | ------------   |
+----------------+----------------+----------------+----------------+
| `c`            | Positive       | `0`            | The 1-based    |
|                | integer        |                | frame number   |
|                |                |                | of the frame   |
|                |                |                | whose image    |
|                |                |                | data serves as |
|                |                |                | the overlaid   |
|                |                |                | data           |
+----------------+----------------+----------------+----------------+
| `r`            | Positive       | `0`            | The 1-based    |
|                | integer        |                | frame number   |
|                |                |                | of the frame   |
|                |                |                | that is being  |
|                |                |                | edited.        |
+----------------+----------------+----------------+----------------+
| `x`            | Positive       | `0`            | The left edge  |
|                | integer        |                | (in pixels) of |
|                |                |                | the            |
|                |                |                | destination    |
|                |                |                | rectangle      |
+----------------+----------------+----------------+----------------+
| `y`            | Positive       | `0`            | The top edge   |
|                | integer        |                | (in pixels) of |
|                |                |                | the            |
|                |                |                | destination    |
|                |                |                | rectangle      |
+----------------+----------------+----------------+----------------+
| `w`            | Positive       | `0`            | The width (in  |
|                | integer        |                | pixels) of the |
|                |                |                | source and     |
|                |                |                | destination    |
|                |                |                | rectangles. By |
|                |                |                | default, the   |
|                |                |                | entire width   |
|                |                |                | is used        |
+----------------+----------------+----------------+----------------+
| `h`            | Positive       | `0`            | The height (in |
|                | integer        |                | pixels) of the |
|                |                |                | source and     |
|                |                |                | destination    |
|                |                |                | rectangles. By |
|                |                |                | default, the   |
|                |                |                | entire height  |
|                |                |                | is used        |
+----------------+----------------+----------------+----------------+
| `X`            | Positive       | `0`            | The left edge  |
|                | integer        |                | (in pixels) of |
|                |                |                | the source     |
|                |                |                | rectangle      |
+----------------+----------------+----------------+----------------+
| `Y`            | Positive       | `0`            | The top edge   |
|                | integer        |                | (in pixels) of |
|                |                |                | the source     |
|                |                |                | rectangle      |
+----------------+----------------+----------------+----------------+
| `C`            | Positive       | `0`            | The            |
|                | integer        |                | composition    |
|                |                |                | mode for       |
|                |                |                | blending       |
|                |                |                | pixels.        |
|                |                |                | Default is     |
|                |                |                | full alpha     |
|                |                |                | blending. `1`  |
|                |                |                | means a simple |
|                |                |                | overwrite.     |
+----------------+----------------+----------------+----------------+
| \*\*Keys fo    | r animation    |                |                |
|                | control\*\*    |                |                |
+----------------+----------------+----------------+----------------+
| ------------   | ------------   | ------------   | ------------   |
+----------------+----------------+----------------+----------------+
| `s`            | Positive       | `0`            | `1` - stop     |
|                | integer        |                | animation,     |
|                |                |                | `2` - run      |
|                |                |                | animation, but |
|                |                |                | wait for new   |
|                |                |                | frames, `3` -  |
|                |                |                | run animation  |
+----------------+----------------+----------------+----------------+
| `r`            | Positive       | `0`            | The 1-based    |
|                | integer        |                | frame number   |
|                |                |                | of the frame   |
|                |                |                | that is being  |
|                |                |                | affected       |
+----------------+----------------+----------------+----------------+
| `z`            | 32-bit integer | `0`            | The gap (in    |
|                |                |                | milliseconds)  |
|                |                |                | of this frame  |
|                |                |                | from the next  |
|                |                |                | one. A value   |
|                |                |                | of zero is     |
|                |                |                | ignored.       |
|                |                |                | Negative       |
|                |                |                | values create  |
|                |                |                | a *gapless*    |
|                |                |                | frame.         |
+----------------+----------------+----------------+----------------+
| `c`            | Positive       | `0`            | The 1-based    |
|                | integer        |                | frame number   |
|                |                |                | of the frame   |
|                |                |                | that should be |
|                |                |                | made the       |
|                |                |                | current frame  |
+----------------+----------------+----------------+----------------+
| `v`            | Positive       | `0`            | The number of  |
|                | integer        |                | loops to play. |
|                |                |                | `0` is         |
|                |                |                | ignored, `1`   |
|                |                |                | is play        |
|                |                |                | infinite and   |
|                |                |                | is the default |
|                |                |                | and larger     |
|                |                |                | number means   |
|                |                |                | play that      |
|                |                |                | number `-1`    |
|                |                |                | loops          |
+----------------+----------------+----------------+----------------+
| \*\*Keys fo    | r deleting     |                |                |
|                | images\*\*     |                |                |
+----------------+----------------+----------------+----------------+
| ------------   | ------------   | ------------   | ------------   |
+----------------+----------------+----------------+----------------+
| `d`            | Single         | `a`            | What to        |
|                | character.     |                | delete.        |
|                | `( a, A,       |                |                |
|                | c, C, n, N, i, |                |                |
|                |  I, p, P, q, Q |                |                |
|                | , r, R, x, X,  |                |                |
|                | y, Y, z, Z )`. |                |                |
+----------------+----------------+----------------+----------------+

## Interaction with other terminal actions

When resetting the terminal, all images that are visible on the screen
must be cleared. When switching from the main screen to the alternate
screen buffer (1049 private mode) all images in the alternate screen
must be cleared, just as all text is cleared. The clear screen escape
code (usually `<ESC>[2J`) should also clear all images. This is so that
the clear command works.

The other commands to erase text must have no effect on graphics. The
dedicated delete graphics commands must be used for those.

When scrolling the screen (such as when using index cursor movement
commands, or scrolling through the history buffer), images must be
scrolled along with text. When page margins are defined and the index
commands are used, only images that are entirely within the page area
(between the margins) must be scrolled. When scrolling them would cause
them to extend outside the page area, they must be clipped.
# kitty

*If you live in the terminal, kitty is made for YOU!*

The fast, feature-rich, GPU based terminal emulator.

::: {.toctree hidden=""}
quickstart overview faq support sessions performance changelog
integrations protocol-extensions press-mentions
:::

::: tab
Fast

-   Uses GPU and SIMD vector CPU instructions for
    `best in class performance <performance>`{.interpreted-text
    role="doc"}
-   Uses threaded rendering for
    `absolutely minimal latency <2701#issuecomment-636497270>`{.interpreted-text
    role="iss"}
-   Performance tradeoffs can be
    `tuned <conf-kitty-performance>`{.interpreted-text role="ref"}
:::

::: tab
Capable

-   Graphics, with
    `images and animations <graphics-protocol>`{.interpreted-text
    role="doc"}
-   Ligatures, emoji with
    `per glyph font substitution <symbol_map>`{.interpreted-text
    role="opt"} and
    `variable fonts and font features </kittens/choose-fonts>`{.interpreted-text
    role="doc"}
-   `Hyperlinks<hyperlinks>`{.interpreted-text role="term"}, with
    `configurable actions <open_actions>`{.interpreted-text role="doc"}
:::

::: tab
Scriptable

-   Control from
    `scripts or the shell <remote-control>`{.interpreted-text
    role="doc"}
-   Extend with `kittens <kittens>`{.interpreted-text role="ref"} using
    the Python language
-   Use `startup sessions <sessions>`{.interpreted-text role="ref"} to
    specify working environments
:::

::: tab
Composable

-   Programmable tabs, `splits <splits_layout>`{.interpreted-text
    role="ref"} and multiple `layouts <layouts>`{.interpreted-text
    role="doc"} to manage windows
-   Browse the `entire history <scrollback>`{.interpreted-text
    role="ref"} or the
    `output from the last command <show_last_command_output>`{.interpreted-text
    role="sc"} comfortably in pagers and editors
-   Edit or download
    `remote files <kittens/remote_file>`{.interpreted-text role="doc"}
    in an existing SSH session
:::

::: tab
Cross-platform

-   Linux
-   macOS
-   Various BSDs
:::

::: tab
Innovative

Pioneered various extensions to move the entire terminal ecosystem
forward

-   `graphics-protocol`{.interpreted-text role="doc"}
-   `keyboard-protocol`{.interpreted-text role="doc"}
-   Lots more in `protocol-extensions`{.interpreted-text role="doc"}
:::

To get started see `quickstart`{.interpreted-text role="doc"}.

:::: only
dirhtml

<div id="intro-video-container" class="video-with-timestamps">

<video controls width="640" height="360" poster="_static/poster.png">
    <source src="https://download.calibre-ebook.com/videos/kitty.mp4" type="video/mp4">
    <source src="https://download.calibre-ebook.com/videos/kitty.webm" type="video/webm">
</video>

::: rst-class
caption caption-text

Watch kitty in action!
:::

Timestamps for the above video:

00:00

:   Intro

00:39

:   Pager: View command output in same window:
    `Ctrl+Shift+g`{.interpreted-text role="kbd"}

01:43

:   Pager: View command output in a separate window

02:14

:   Pager: Uses shell integration in kitty

02:27

:   Tab text: The output of cwd and last cmd

03:03

:   Open files from ls output with mouse:
    `Ctrl+Shift+Right-click`{.interpreted-text role="kbd"}

04:04

:   Open files from ls output with keyboard:
    `Ctrl+Shift+P>y`{.interpreted-text role="kbd"}

04:26

:   Open files on click: `ls --hyperlink=auto`

05:03

:   Open files on click: Filetype settings in open-actions.conf

05:45

:   hyperlinked-grep kitten: Open grep output in editor

07:18

:   Remote-file kitten: View remote files locally

08:31

:   Remote-file kitten: Edit remote files locally

10:01

:   icat kitten: View images directly

10:36

:   icat kitten: Download & display image/gif from internet

11:03

:   Kitty Graphics Protocol: Live image preview in ranger

11:25

:   icat kitten: Display image from remote server

12:04

:   unicode-input kitten: Emojis in terminal

12:54

:   Windows: Intro

13:36

:   Windows: Switch focus: `Ctrl+Shift+win_nr`{.interpreted-text
    role="kbd"}

13:48

:   Windows: Visual selection: `Ctrl+Shift+F7`{.interpreted-text
    role="kbd"}

13:58

:   Windows: Simultaneous input

14:15

:   Interactive Kitty Shell: `Ctrl+Shift+Esc`{.interpreted-text
    role="kbd"}

14:36

:   Broadcast text: `launch --allow-remote-control kitten broadcast`

15:18

:   Kitty Remote Control Protocol

15:52

:   Interactive Kitty Shell: Help

16:34

:   Choose theme interactively: `kitten themes -h`

17:23

:   Choose theme by name: `kitten themes [options] [theme_name]`

</div>
::::
tocdepth
:   2

# Integrations with other tools

kitty provides extremely powerful interfaces such as
`remote-control`{.interpreted-text role="doc"} and
`kittens/custom`{.interpreted-text role="doc"} and
`kittens/icat`{.interpreted-text role="doc"} that allow it to be
integrated with other tools seamlessly.

## Image and document viewers

Powered by kitty\'s `graphics-protocol`{.interpreted-text role="doc"}
there exist many tools for viewing images and other types of documents
directly in your terminal, even over SSH.

### [bookokrat](https://github.com/bugzmanov/bookokrat) {#tool_bookokrat}

A terminal PDF/EPUB viewer

### [termpdf.py](https://github.com/dsanson/termpdf.py) {#tool_termpdf}

A terminal PDF/DJVU/CBR viewer

### [tdf](https://github.com/itsjunetime/tdf) {#tool_tdf}

A terminal PDF viewer

### [fancy-cat](https://github.com/freref/fancy-cat) {#tool_fancy_cat}

A terminal PDF viewer

### [meowpdf](https://github.com/monoamine11231/meowpdf) {#tool_meowpdf}

A terminal PDF viewer with GUI-like usage and Vim-like keybindings
written in Rust

### [mcat](https://github.com/Skardyy/mcat) {#tool_mcat}

Display various types of files nicely formatted with images in the
terminal

### [dawn](https://github.com/andrewmd5/dawn)

A markdown editor that uses the text-sizing protocol for large headings
and the graphics protocol for images.

### [presenterm](https://github.com/mfontanini/presenterm) {#tool_presentterm}

Show markdown based slides with images in your terminal, powered by the
kitty graphics protocol.

### [mdfried](https://github.com/benjajaja/mdfried) {#tool_mdfried}

Markdown viewer that can render big headers with the
text-sizing-protocol, and also render images with the kitty graphics
protocol.

### [term-image](https://github.com/AnonymouX47/term-image) {#tool_term_image}

Tool to browse images in a terminal using kitty\'s graphics protocol.

### [koneko](https://github.com/twenty5151/koneko) {#tool_koneko}

Browse images from the pixiv artist community directly in kitty.

### [viu](https://github.com/atanunq/viu) {#tool_viu}

View images in the terminal, similar to kitty\'s icat.

### [nb](https://github.com/xwmx/nb) {#tool_nb}

Command line and local web note-taking, bookmarking, archiving, and
knowledge base application that uses kitty\'s graphics protocol for
images.

### [w3m](https://github.com/tats/w3m) {#tool_w3m}

A text mode WWW browser that supports kitty\'s graphics protocol to
display images.

### [awrit](https://github.com/chase/awrit) {#tool_awrit}

A full Chromium based web browser running in the terminal using kitty\'s
graphics protocol.

### [chawan](https://sr.ht/~bptato/chawan/) {#tool_chawan}

A text mode WWW browser that supports kitty\'s graphics protocol to
display images.

### [mpv](https://github.com/mpv-player/mpv/commit/874e28f4a41a916bb567a882063dd2589e9234e1) {#tool_mpv}

A video player that can play videos in the terminal.

``` sh
mpv --profile=sw-fast --vo=kitty --vo-kitty-use-shm=yes --really-quiet video.mkv
```

### [timg](https://github.com/hzeller/timg) {#tool_timg}

A terminal image and video viewer, that displays static and animated
images or plays videos. Fast multi-threaded loading, JPEG exif rotation,
grid view and connecting to the webcam make it a versatile terminal
utility.

## File managers

### [ranger](https://github.com/ranger/ranger) {#tool_ranger}

A terminal file manager, with previews of file contents powered by
kitty\'s graphics protocol.

### [nnn](https://github.com/jarun/nnn/) {#tool_nnn}

Another terminal file manager, with previews of file contents powered by
kitty\'s graphics protocol.

### [Yazi](https://github.com/sxyazi/yazi) {#tool_yazi}

Blazing fast terminal file manager, with built-in kitty graphics
protocol support (implemented both Classic protocol and Unicode
placeholders).

### [clifm](https://github.com/leo-arch/clifm) {#tool_clifm}

The shell-like, command line terminal file manager, uses the kitty
graphics and keyboard protocols.

### [hunter](https://github.com/rabite0/hunter) {#tool_hunter}

Another terminal file manager, with previews of file contents powered by
kitty\'s graphics protocol.

### [far2l](https://github.com/elfmz/far2l) {#tool_far2l}

Text-mode dual panel (orthodox) file manager and also terminal emulator,
uses the kitty graphics and keyboard protocols (both as client and as
terminal)

## System and data visualisation tools

### [neofetch](https://github.com/dylanaraps/neofetch) {#tool_neofetch}

A command line system information tool that shows images using kitty\'s
graphics protocol

### matplotlib {#tool_matplotlib}

There exist multiple backends for matplotlib to draw images directly in
kitty.

-   [matplotlib-backend-kitty](https://github.com/jktr/matplotlib-backend-kitty)
-   [kitcat](https://github.com/mil-ad/kitcat)

### [KittyTerminalImages.jl](https://github.com/simonschoelly/KittyTerminalImages.jl) {#tool_KittyTerminalImage}

Show images from Julia directly in kitty

### [euporie](https://github.com/joouha/euporie) {#tool_euporie}

A text-based user interface for running and editing Jupyter notebooks,
powered by kitty\'s graphics protocol for displaying plots

### [gnuplot](http://www.gnuplot.info/) {#tool_gnuplot}

A graphing and data visualization tool that has support for the kitty
graphics protocol, with its `kittygd` and `kittycairo` backends.

### [k-nine](https://github.com/talwrii/kitty-plotnine) {#tool_k-nine}

A wrapper around the `plotnine` library which lets you plot data from
the command-line with bash one-liners.

### [tgutui](https://github.com/tgu-ltd/tgutui)

A Terminal Operating Test hardware equipment

### [onefetch](https://github.com/o2sh/onefetch)

A tool to fetch information about your git repositories

### [patat](https://github.com/jaspervdj/patat)

Terminal based presentations using pandoc and kitty\'s image protocol
for images

### [wttr.in](https://github.com/chubin/wttr.in)

A tool to display weather information in your terminal with curl

### [wl-clipboard-manager](https://github.com/maximbaz/wl-clipboard-manager)

View and manage the system clipboard under Wayland in your kitty
terminal

### [NEMU](https://github.com/nemuTUI/nemu)

TUI for QEMU used to manage virtual machines, can display the Virtual
Machine in the terminal using the kitty graphics protocol.

## Editor integration

[\|kitty\|](##SUBST##|kitty|) can be integrated into many different
terminal based text editors to add features such a split windows,
previews, REPLs etc.

### [kakoune](https://kakoune.org/)

Integrates with kitty to use native kitty windows for its windows/panels
and REPLs.

### [orbiton](https://github.com/xyproto/orbiton/) {#tool_orbiton}

A terminal text editor that uses kitty\'s graphics protocol to render
Markdown documents with fonts and images inline (use the `-B` flag for a
word processor-like book mode), and to preview images in its built-in
file browser.

### [vim-slime](https://github.com/jpalardy/vim-slime#kitty)

Uses kitty remote control for a Lisp REPL.

### [vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator)

Allows you to navigate seamlessly between vim and kitty splits using a
consistent set of hotkeys.

### [vim-test](https://github.com/vim-test/vim-test)

Allows easily running tests in a terminal window

### Various image viewing plugins for editors

-   [snacks.nvim](https://github.com/folke/snacks.nvim) - Enables
    seamless inline images in various file formats within nvim
-   [image.nvim](https://github.com/3rd/image.nvim) - Bringing images to
    neovim
-   [image_preview.nvim](https://github.com/adelarsq/image_preview.nvim/) -
    Image preview for neovim
-   [hologram.nvim](https://github.com/edluffy/hologram.nvim) - view
    images inside nvim
-   [kitty-graphics.el](https://github.com/cashmeredev/kitty-graphics.el) -
    view images in emacs

## Scrollback manipulation

### [kitty-scrollback.nvim](https://github.com/mikesmithgh/kitty-scrollback.nvim)

Browse the scrollback buffer with Neovim, with simple key actions for
efficient copy/paste and even execution of commands.

### [kitty-search](https://github.com/trygveaa/kitty-kitten-search)

Live incremental search of the scrollback buffer.

### [kitty-grab](https://github.com/yurikhan/kitty_grab)

Keyboard based text selection for the kitty scrollback buffer.

## Desktop panels

### [kitty panel](https://github.com/5hubham5ingh/kitty-panel)

A system panel for Kitty terminal that displays real-time system metrics
using terminal-based utilities.

### [pawbar](https://github.com/codelif/pawbar)

A kitten-panel based desktop panel for your desktop

## Password managers

### [1password](https://github.com/mm-zacharydavison/kitty-kitten-1password)

Allow injecting passwords from 1Password into kitty.

### [BitWarden](https://github.com/dnanhkhoa/kitty-password-manager)

Inject passwords from BitWarden into kitty

## Miscellaneous

### DOOM

Play the classic shooter DOOM in
[kitty](https://github.com/cryptocode/terminal-doom) or even inside
[neovim inside kitty](https://github.com/seandewar/actually-doom.nvim).

### [gattino](https://github.com/salvozappa/gattino)

Integrate kitty with an LLM to convert plain language prompts into shell
commands.

### [kitty-smart-tab](https://github.com/yurikhan/kitty-smart-tab)

Use keys to either control tabs or pass them onto running applications
if no tabs are present

### [kitty-smart-scroll](https://github.com/yurikhan/kitty-smart-scroll)

Use keys to either scroll or pass them onto running applications if no
scrollback buffer is present

### [kitti3](https://github.com/LandingEllipse/kitti3)

Allow using kitty as a drop-down terminal under the i3 window manager

### [weechat-hints](https://github.com/GermainZ/kitty-weechat-hints)

URL hints kitten for WeeChat that works without having to use WeeChat\'s
raw-mode.

### [glkitty](https://github.com/michaeljclark/glkitty)

C library to draw OpenGL shaders in the terminal with a glgears demo
<div id="intro-video-container" class="video-with-timestamps">

<video controls width="640" height="360" poster="_static/poster.png">
    <source src="https://download.calibre-ebook.com/videos/kitty.mp4" type="video/mp4">
    <source src="https://download.calibre-ebook.com/videos/kitty.webm" type="video/webm">
</video>

::: rst-class
caption caption-text

Watch kitty in action!
:::

Timestamps for the above video:

00:00

:   Intro

00:39

:   Pager: View command output in same window:
    `Ctrl+Shift+g`{.interpreted-text role="kbd"}

01:43

:   Pager: View command output in a separate window

02:14

:   Pager: Uses shell integration in kitty

02:27

:   Tab text: The output of cwd and last cmd

03:03

:   Open files from ls output with mouse:
    `Ctrl+Shift+Right-click`{.interpreted-text role="kbd"}

04:04

:   Open files from ls output with keyboard:
    `Ctrl+Shift+P>y`{.interpreted-text role="kbd"}

04:26

:   Open files on click: `ls --hyperlink=auto`

05:03

:   Open files on click: Filetype settings in open-actions.conf

05:45

:   hyperlinked-grep kitten: Open grep output in editor

07:18

:   Remote-file kitten: View remote files locally

08:31

:   Remote-file kitten: Edit remote files locally

10:01

:   icat kitten: View images directly

10:36

:   icat kitten: Download & display image/gif from internet

11:03

:   Kitty Graphics Protocol: Live image preview in ranger

11:25

:   icat kitten: Display image from remote server

12:04

:   unicode-input kitten: Emojis in terminal

12:54

:   Windows: Intro

13:36

:   Windows: Switch focus: `Ctrl+Shift+win_nr`{.interpreted-text
    role="kbd"}

13:48

:   Windows: Visual selection: `Ctrl+Shift+F7`{.interpreted-text
    role="kbd"}

13:58

:   Windows: Simultaneous input

14:15

:   Interactive Kitty Shell: `Ctrl+Shift+Esc`{.interpreted-text
    role="kbd"}

14:36

:   Broadcast text: `launch --allow-remote-control kitten broadcast`

15:18

:   Kitty Remote Control Protocol

15:52

:   Interactive Kitty Shell: Help

16:34

:   Choose theme interactively: `kitten themes -h`

17:23

:   Choose theme by name: `kitten themes [options] [theme_name]`

</div>
orphan

:   

# The kitty command line interface

::: program
kitty
:::

## Tabs and Windows

[\|kitty\|](##SUBST##|kitty|) is capable of running multiple programs
organized into tabs and windows. The top level of organization is the
`OS window <os_window>`{.interpreted-text role="term"}. Each OS window
consists of one or more `tabs <tab>`{.interpreted-text role="term"}.
Each tab consists of one or more
`kitty windows <window>`{.interpreted-text role="term"}. The kitty
windows can be arranged in multiple different
`layouts <layout>`{.interpreted-text role="term"}, like windows are
organized in a tiling window manager. The keyboard controls (which are
`all customizable
<conf-kitty-shortcuts>`{.interpreted-text role="ref"}) for tabs and
windows are:

### Scrolling

  Action                      Shortcut
  --------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------
  Line up                     `scroll_line_up`{.interpreted-text role="sc"} (also `⌥+⌘+⇞`{.interpreted-text role="kbd"} and `⌘+↑`{.interpreted-text role="kbd"} on macOS)
  Line down                   `scroll_line_down`{.interpreted-text role="sc"} (also `⌥+⌘+⇟`{.interpreted-text role="kbd"} and `⌘+↓`{.interpreted-text role="kbd"} on macOS)
  Page up                     `scroll_page_up`{.interpreted-text role="sc"} (also `⌘+⇞`{.interpreted-text role="kbd"} on macOS)
  Page down                   `scroll_page_down`{.interpreted-text role="sc"} (also `⌘+⇟`{.interpreted-text role="kbd"} on macOS)
  Top                         `scroll_home`{.interpreted-text role="sc"} (also `⌘+↖`{.interpreted-text role="kbd"} on macOS)
  Bottom                      `scroll_end`{.interpreted-text role="sc"} (also `⌘+↘`{.interpreted-text role="kbd"} on macOS)
  Previous shell prompt       `scroll_to_previous_prompt`{.interpreted-text role="sc"} (see `shell_integration`{.interpreted-text role="ref"})
  Next shell prompt           `scroll_to_next_prompt`{.interpreted-text role="sc"} (see `shell_integration`{.interpreted-text role="ref"})
  Browse scrollback in less   `show_scrollback`{.interpreted-text role="sc"}
  Browse last cmd output      `show_last_command_output`{.interpreted-text role="sc"} (see `shell_integration`{.interpreted-text role="ref"})
  Search scrollback in less   `search_scrollback`{.interpreted-text role="sc"} (also `⌘+F`{.interpreted-text role="kbd"} on macOS)

The scroll actions only take effect when the terminal is in the main
screen. When the alternate screen is active (for example when using a
full screen program like an editor) the key events are instead passed to
program running in the terminal.

### Tabs

  Action              Shortcut
  ------------------- ---------------------------------------------------------------------------------------------------------------------------------------------
  New tab             `new_tab`{.interpreted-text role="sc"} (also `⌘+t`{.interpreted-text role="kbd"} on macOS)
  Close tab           `close_tab`{.interpreted-text role="sc"} (also `⌘+w`{.interpreted-text role="kbd"} on macOS)
  Next tab            `next_tab`{.interpreted-text role="sc"} (also `⌃+⇥`{.interpreted-text role="kbd"} and `⇧+⌘+]`{.interpreted-text role="kbd"} on macOS)
  Previous tab        `previous_tab`{.interpreted-text role="sc"} (also `⇧+⌃+⇥`{.interpreted-text role="kbd"} and `⇧+⌘+[`{.interpreted-text role="kbd"} on macOS)
  Next layout         `next_layout`{.interpreted-text role="sc"}
  Move tab forward    `move_tab_forward`{.interpreted-text role="sc"}
  Move tab backward   `move_tab_backward`{.interpreted-text role="sc"}
  Set tab title       `set_tab_title`{.interpreted-text role="sc"} (also `⇧+⌘+i`{.interpreted-text role="kbd"} on macOS)

### Windows

  Action                  Shortcut
  ----------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  New window              `new_window`{.interpreted-text role="sc"} (also `⌘+↩`{.interpreted-text role="kbd"} on macOS)
  New OS window           `new_os_window`{.interpreted-text role="sc"} (also `⌘+n`{.interpreted-text role="kbd"} on macOS)
  Close window            `close_window`{.interpreted-text role="sc"} (also `⇧+⌘+d`{.interpreted-text role="kbd"} on macOS)
  Resize window           `start_resizing_window`{.interpreted-text role="sc"} (also `⌘+r`{.interpreted-text role="kbd"} on macOS)
  Next window             `next_window`{.interpreted-text role="sc"}
  Previous window         `previous_window`{.interpreted-text role="sc"}
  Move window forward     `move_window_forward`{.interpreted-text role="sc"}
  Move window backward    `move_window_backward`{.interpreted-text role="sc"}
  Move window to top      `move_window_to_top`{.interpreted-text role="sc"}
  Visually focus window   `focus_visible_window`{.interpreted-text role="sc"}
  Visually swap window    `swap_with_window`{.interpreted-text role="sc"}
  Focus specific window   `first_window`{.interpreted-text role="sc"}, `second_window`{.interpreted-text role="sc"} \... `tenth_window`{.interpreted-text role="sc"} (also `⌘+1`{.interpreted-text role="kbd"}, `⌘+2`{.interpreted-text role="kbd"} \... `⌘+9`{.interpreted-text role="kbd"} on macOS) (clockwise from the top-left)

Additionally, you can define shortcuts in `kitty.conf`{.interpreted-text
role="file"} to focus neighboring windows and move windows around
(similar to window movement in `vim`{.interpreted-text role="program"}):

    map ctrl+left neighboring_window left
    map shift+left move_window right
    map ctrl+down neighboring_window down
    map shift+down move_window up
    ...

You can also define a shortcut to switch to the previously active
window:

    map ctrl+p nth_window -1

`nth_window`{.interpreted-text role="ac"} will focus the nth window for
positive numbers (starting from zero) and the previously active windows
for negative numbers.

To switch to the nth OS window, you can define
`nth_os_window`{.interpreted-text role="ac"}. Only positive numbers are
accepted, starting from one.

::: {#detach_window}
You can define shortcuts to detach the current window and move it to
another tab or another OS window:

    # moves the window into a new OS window
    map ctrl+f2 detach_window
    # moves the window into a new tab
    map ctrl+f3 detach_window new-tab
    # moves the window into the previously active tab
    map ctrl+f3 detach_window tab-prev
    # moves the window into the tab at the left of the active tab
    map ctrl+f3 detach_window tab-left
    # moves the window into a new tab created to the left of the active tab
    map ctrl+f3 detach_window new-tab-left
    # asks which tab to move the window into
    map ctrl+f4 detach_window ask
:::

Similarly, you can detach the current tab, with:

    # moves the tab into a new OS window
    map ctrl+f2 detach_tab
    # asks which OS Window to move the tab into
    map ctrl+f4 detach_tab ask

Note that tabs can be re-arranged, detached and moved to another OS
Window in the same kitty instance using drag and drop.

Finally, you can define a shortcut to close all windows in a tab other
than the currently active window:

    map f9 close_other_windows_in_tab

## Other keyboard shortcuts

The full list of actions that can be mapped to key presses is available
`here </actions>`{.interpreted-text role="doc"}. To learn how to do more
sophisticated keyboard mappings, such as modal mappings, per application
mappings, etc. see `mapping`{.interpreted-text role="doc"}.

  Action                                               Shortcut
  ---------------------------------------------------- ------------------------------------------------------------------------------------------------------------------
  Show this help                                       `show_kitty_doc`{.interpreted-text role="sc"}
  Copy to clipboard                                    `copy_to_clipboard`{.interpreted-text role="sc"} (also `⌘+c`{.interpreted-text role="kbd"} on macOS)
  Paste from clipboard                                 `paste_from_clipboard`{.interpreted-text role="sc"} (also `⌘+v`{.interpreted-text role="kbd"} on macOS)
  Paste from selection                                 `paste_from_selection`{.interpreted-text role="sc"}
  Pass selection to program                            `pass_selection_to_program`{.interpreted-text role="sc"}
  Increase font size                                   `increase_font_size`{.interpreted-text role="sc"} (also `⌘++`{.interpreted-text role="kbd"} on macOS)
  Decrease font size                                   `decrease_font_size`{.interpreted-text role="sc"} (also `⌘+-`{.interpreted-text role="kbd"} on macOS)
  Restore font size                                    `reset_font_size`{.interpreted-text role="sc"} (also `⌘+0`{.interpreted-text role="kbd"} on macOS)
  Toggle fullscreen                                    `toggle_fullscreen`{.interpreted-text role="sc"} (also `⌃+⌘+f`{.interpreted-text role="kbd"} on macOS)
  Toggle maximized                                     `toggle_maximized`{.interpreted-text role="sc"}
  Input Unicode character                              `input_unicode_character`{.interpreted-text role="sc"} (also `⌃+⌘+space`{.interpreted-text role="kbd"} on macOS)
  Open URL in web browser                              `open_url`{.interpreted-text role="sc"}
  Reset the terminal                                   `reset_terminal`{.interpreted-text role="sc"} (also `⌥+⌘+r`{.interpreted-text role="kbd"} on macOS)
  Edit `kitty.conf`{.interpreted-text role="file"}     `edit_config_file`{.interpreted-text role="sc"} (also `⌘+,`{.interpreted-text role="kbd"} on macOS)
  Reload `kitty.conf`{.interpreted-text role="file"}   `reload_config_file`{.interpreted-text role="sc"} (also `⌃+⌘+,`{.interpreted-text role="kbd"} on macOS)
  Debug `kitty.conf`{.interpreted-text role="file"}    `debug_config`{.interpreted-text role="sc"} (also `⌥+⌘+,`{.interpreted-text role="kbd"} on macOS)
  Open a [\|kitty\|](##SUBST##|kitty|) shell           `kitty_shell`{.interpreted-text role="sc"}
  Increase background opacity                          `increase_background_opacity`{.interpreted-text role="sc"}
  Decrease background opacity                          `decrease_background_opacity`{.interpreted-text role="sc"}
  Full background opacity                              `full_background_opacity`{.interpreted-text role="sc"}
  Reset background opacity                             `reset_background_opacity`{.interpreted-text role="sc"}

## See also

See kitty.conf(5)
# Comprehensive keyboard handling in terminals

There are various problems with the current state of keyboard handling
in terminals. They include:

-   No way to use modifiers other than `ctrl` and `alt`
-   No way to reliably use multiple modifier keys, other than,
    `shift+alt` and `ctrl+alt`.
-   Many of the existing escape codes used to encode these events are
    ambiguous with different key presses mapping to the same escape
    code.
-   No way to handle different types of keyboard events, such as press,
    release or repeat
-   No reliable way to distinguish single `Esc` key presses from the
    start of a escape sequence. Currently, client programs use fragile
    timing related hacks for this, leading to bugs, for example: [neovim
    #2035](https://github.com/neovim/neovim/issues/2035).

To solve these issues and others, kitty has created a new keyboard
protocol, that is backward compatible but allows applications to opt-in
to support more advanced usages. The protocol is based on initial work
in [fixterms](http://www.leonerd.org.uk/hacks/fixterms/), however, it
corrects various issues in that proposal, listed at the
`bottom of this document
<fixterms_bugs>`{.interpreted-text role="ref"}. For public discussion of
this spec, see `3248`{.interpreted-text role="iss"}.

You can see this protocol with all enhancements in action by running:

    kitten show-key -m kitty

inside the kitty terminal to report key events.

In addition to kitty, this protocol is also implemented in:

-   The [alacritty
    terminal](https://github.com/alacritty/alacritty/pull/7125)
-   The [foot terminal](https://codeberg.org/dnkl/foot/issues/319)
-   The [ghostty terminal](https://ghostty.org)
-   The [iTerm2
    terminal](https://gitlab.com/gnachman/iterm2/-/issues/10017)
-   The [Microsoft
    terminal](https://github.com/microsoft/terminal/pull/19817)
-   The [rio
    terminal](https://github.com/raphamorim/rio/commit/cd463ca37677a0fc48daa8795ea46dadc92b1e95)
-   The [TuiOS terminal
    (multiplexer)](https://github.com/Gaurav-Gosain/tuios/issues/26)
-   The [Warp
    terminal](https://github.com/warpdotdev/Warp/issues/8462#issuecomment-3857779488)
-   The [WezTerm
    terminal](https://wezfurlong.org/wezterm/config/lua/config/enable_kitty_keyboard.html)
-   The [xterm.js
    terminal](https://github.com/xtermjs/xterm.js/pull/5600)

Libraries implementing this protocol:

-   The [notcurses
    library](https://github.com/dankamongmen/notcurses/issues/2131)
-   The [crossterm
    library](https://github.com/crossterm-rs/crossterm/pull/688)
-   The [textual
    library](https://github.com/Textualize/textual/pull/4631)
-   The vaxis library [go](https://sr.ht/~rockorager/vaxis/) and
    [zig](https://github.com/rockorager/libvaxis/)
-   The [bubbletea
    library](https://github.com/charmbracelet/bubbletea/issues/869)
-   The [vtinput](https://unxed.github.com/vtinput) and
    [vtui](https://github.com/unxed/vtui) libraries
-   The [tcell
    library](https://github.com/gdamore/tcell/commit/c10909b991eb87c009554fe9b2dfa7276e2649c1)

Programs implementing this protocol:

-   The [Vim text
    editor](https://github.com/vim/vim/commit/63a2e360cca2c70ab0a85d14771d3259d4b3aafa)
-   The [Emacs text editor via the kkp
    package](https://github.com/benjaminor/kkp)
-   The [Neovim text
    editor](https://github.com/neovim/neovim/pull/18181)
-   The [kakoune text
    editor](https://github.com/mawww/kakoune/issues/4103)
-   The [dte text
    editor](https://gitlab.com/craigbarnes/dte/-/issues/138)
-   The [Helix text
    editor](https://github.com/helix-editor/helix/pull/4939)
-   The [Flow control
    editor](https://github.com/neurocyte/flow?tab=readme-ov-file#requirements)
-   The
    [far2l](https://github.com/elfmz/far2l/commit/e1f2ee0ef2b8332e5fa3ad7f2e4afefe7c96fc3b)
    and [f4](https://github.com/unxed/f4) file managers
-   The [Yazi file manager](https://github.com/sxyazi/yazi)
-   The [awrit web browser](https://github.com/chase/awrit)
-   The [Turbo
    Vision](https://github.com/magiblot/tvision/commit/6e5a7b46c6634079feb2ac98f0b890bbed59f1ba)/[Free
    Vision](https://gitlab.com/freepascal.org/fpc/source/-/issues/40673#note_2061428120)
    IDEs
-   The [aerc email
    client](https://git.sr.ht/~rjarry/aerc/commit/d73cf33c2c6c3e564ce8aff04acc329a06eafc54)

Shells implementing this protocol:

-   The [nushell shell](https://github.com/nushell/nushell/pull/10540)
-   The [fish
    shell](https://github.com/fish-shell/fish-shell/commit/8bf8b10f685d964101f491b9cc3da04117a308b4)

::: versionadded
0.20.0
:::

## Quickstart

If you are an application or library developer just interested in using
this protocol to make keyboard handling simpler and more robust in your
application, without too many changes, do the following:

1.  Emit the escape code `CSI > 1 u` at application startup if using the
    main screen or when entering alternate screen mode, if using the
    alternate screen.
2.  All key events will now be sent in only a few forms to your
    application, that are easy to parse unambiguously.
3.  Emit the escape sequence `CSI < u` at application exit if using the
    main screen or just before leaving alternate screen mode if using
    the alternate screen, to restore whatever the keyboard mode was
    before step 1.

Key events will all be delivered to your application either as plain
UTF-8 text, or using the following escape codes, for those keys that do
not produce text (`CSI` is the bytes `0x1b 0x5b`):

    CSI number ; modifiers [u~]
    CSI 1; modifiers [ABCDEFHPQS]
    0x0d - for the Enter key
    0x7f or 0x08 - for Backspace
    0x09 - for Tab

The `number` in the first form above will be either the Unicode
codepoint for a key, such as `97` for the `a`{.interpreted-text
role="kbd"} key, or one of the numbers from the
`functional`{.interpreted-text role="ref"} table below. The `modifiers`
optional parameter encodes any modifiers active for the key event. The
encoding is described in the `modifiers`{.interpreted-text role="ref"}
section.

The second form is used for a few functional keys, such as the
`Home`{.interpreted-text role="kbd"}, `End`{.interpreted-text
role="kbd"}, `Arrow`{.interpreted-text role="kbd"} keys and
`F1`{.interpreted-text role="kbd"} \... `F4`{.interpreted-text
role="kbd"}, they are enumerated in the `functional`{.interpreted-text
role="ref"} table below. Note that if no modifiers are present the
parameters are omitted entirely giving an escape code of the form
`CSI [ABCDEFHPQS]`.

If you want support for more advanced features such as repeat and
release events, alternate keys for shortcut matching et cetera, these
can be turned on using `progressive_enhancement`{.interpreted-text
role="ref"} as documented in the rest of this specification.

## An overview

Key events are divided into two types, those that produce text and those
that do not. When a key event produces text, the text is sent directly
as UTF-8 encoded bytes. This is safe as UTF-8 contains no C0 control
codes. When the key event does not have text, the key event is encoded
as an escape code. In legacy compatibility mode (the default) this uses
legacy escape codes, so old terminal applications continue to work. For
more advanced features, such as release/repeat reporting etc.,
applications can tell the terminal they want this information by sending
an escape code to
`progressively enhance <progressive_enhancement>`{.interpreted-text
role="ref"} the data reported for key events.

The central escape code used to encode key events is:

    CSI unicode-key-code:alternate-key-codes ; modifiers:event-type ; text-as-codepoints u

Spaces in the above definition are present for clarity and should be
ignored. `CSI` is the bytes `0x1b 0x5b`. All parameters are decimal
numbers. Fields are separated by the semi-colon and sub-fields by the
colon. Only the `unicode-key-code` field is mandatory, everything else
is optional. The escape code is terminated by the `u` character (the
byte `0x75`).

### Key codes {#key_codes}

The `unicode-key-code` above is the Unicode codepoint representing the
key, as a decimal number. For example, the `A`{.interpreted-text
role="kbd"} key is represented as `97` which is the unicode code for
lowercase `a`. Note that the codepoint used is *always* the lower-case
(or more technically, un-shifted) version of the key. If the user
presses, for example, `ctrl+shift+a`{.interpreted-text role="kbd"} the
escape code would be `CSI 97;modifiers u`. It *must not* be
`CSI 65; modifiers u`.

If *alternate key reporting* is requested by the program running in the
terminal, the terminal can send two additional Unicode codepoints, the
*shifted key* and *base layout key*, separated by colons. The shifted
key is simply the upper-case version of `unicode-codepoint`, or more
technically, the shifted version, in the currently active keyboard
layout. So [a]{.title-ref} becomes [A]{.title-ref} and so on, based on
the current keyboard layout. This is needed to be able to match against
a shortcut such as `ctrl+plus`{.interpreted-text role="kbd"} which
depending on the type of keyboard could be either
`ctrl+shift+equal`{.interpreted-text role="kbd"} or
`ctrl+plus`{.interpreted-text role="kbd"}. Note that the shifted key
must be present only if shift is also present in the modifiers.

The *base layout key* is the key corresponding to the physical key in
the standard PC-101 key layout. So for example, if the user is using a
Cyrillic keyboard with a Cyrillic keyboard layout pressing the
`ctrl+С`{.interpreted-text role="kbd"} key will be
`ctrl+c`{.interpreted-text role="kbd"} in the standard layout. So the
terminal should send the *base layout key* as `99` corresponding to the
`c` key.

If only one alternate key is present, it is the *shifted key*. If the
terminal wants to send only a base layout key but no shifted key, it
must use an empty sub-field for the shifted key, like this:

    CSI unicode-key-code::base-layout-key

### Modifiers

This protocol supports six modifier keys, `shift`{.interpreted-text
role="kbd"}, `alt`{.interpreted-text role="kbd"},
`ctrl`{.interpreted-text role="kbd"}, `super`{.interpreted-text
role="kbd"}, `hyper`{.interpreted-text role="kbd"},
`meta`{.interpreted-text role="kbd"}, `num_lock`{.interpreted-text
role="kbd"} and `caps_lock`{.interpreted-text role="kbd"}. Here
`super`{.interpreted-text role="kbd"} is either the *Windows/Linux* key
or the `command`{.interpreted-text role="kbd"} key on mac keyboards. The
`alt`{.interpreted-text role="kbd"} key is the
`option`{.interpreted-text role="kbd"} key on mac keyboards.
`hyper`{.interpreted-text role="kbd"} and `meta`{.interpreted-text
role="kbd"} are typically present only on X11/Wayland based systems with
special XKB rules. Modifiers are encoded as a bit field with:

    shift     0b1         (1)
    alt       0b10        (2)
    ctrl      0b100       (4)
    super     0b1000      (8)
    hyper     0b10000     (16)
    meta      0b100000    (32)
    caps_lock 0b1000000   (64)
    num_lock  0b10000000  (128)

In the escape code, the modifier value is encoded as a decimal number
which is `1 + actual modifiers`. So to represent
`shift`{.interpreted-text role="kbd"} only, the value would be
`1 + 1 = 2`, to represent `ctrl+shift`{.interpreted-text role="kbd"} the
value would be `1 + 0b101 = 6` and so on. If the modifier field is not
present in the escape code, its default value is `1` which means no
modifiers. If a modifier is *active* when the key event occurs, i.e. if
the key is pressed or the lock (for caps lock/num lock) is enabled, the
key event must have the bit for that modifier set.

When the key event is related to an actual modifier key, the
corresponding modifier\'s bit must be set to the modifier state
including the effect for the current event. For example, when pressing
the `LEFT_CONTROL`{.interpreted-text role="kbd"} key, the `ctrl` bit
must be set and when releasing it, it must be reset. When both left and
right control keys are pressed and one is released, the release event
must have the `ctrl` bit set. See `6913`{.interpreted-text role="iss"}
for discussion of this design.

### Event types {#event_types}

There are three key event types: `press, repeat and release`. They are
reported (if requested `0b10`) as a sub-field of the modifiers field
(separated by a colon). If no modifiers are present, the modifiers field
must have the value `1` and the event type sub-field the type of event.
The `press` event type has value `1` and is the default if no event type
sub field is present. The `repeat` type is `2` and the `release` type is
`3`. So for example:

    CSI key-code             # this is a press event
    CSI key-code;modifier    # this is a press event
    CSI key-code;modifier:1  # this is a press event
    CSI key-code;modifier:2  # this is a repeat event
    CSI key-code;modifier:3  # this is a release event

:::: note
::: title
Note
:::

Key events that result in text are reported as plain UTF-8 text, so
events are not supported for them, unless the application requests *key
report mode*, see below.
::::

### Text as code points {#text_as_codepoints}

The terminal can optionally send the text associated with key events as
a sequence of Unicode code points. This behavior is opt-in by the
`progressive
enhancement <progressive_enhancement>`{.interpreted-text role="ref"}
mechanism described below. Some examples:

    shift+a -> CSI 97 ; 2 ; 65 u   # The text 'A' is reported as 65
    alt+a   -> CSI  0 ;   ; 229 u  # The text 'å' is reported as 229

If multiple code points are present, they must be separated by colons.
If no known key is associated with the text the key number `0` must be
used. The associated text must not contain control codes (control codes
are code points below U+0020 and codepoints in the C0 and C1 blocks). In
the above example, the `alt`{.interpreted-text role="kbd"} modifier is
consumed by the OS itself to produce the text å and not sent to the
terminal emulator, which gets only a \"text input\" event and no
information about modifiers, thus the event gets encoded with no
modifiers. The exact behavior in these situations depends on the OS,
keyboard layout, IME system in use and so on. In general, if the
terminal emulator receives no key information, the key number 0 must be
used to indicate a pure \"text event\".

### Non-Unicode keys

There are many keys that don\'t correspond to letters from human
languages, and thus aren\'t represented in Unicode. Think of functional
keys, such as `Escape`{.interpreted-text role="kbd"},
`Play`{.interpreted-text role="kbd"}, `Pause`{.interpreted-text
role="kbd"}, `F1`{.interpreted-text role="kbd"},
`Home`{.interpreted-text role="kbd"}, etc. These are encoded using
Unicode code points from the Private Use Area (`57344 - 63743`). The
mapping of key names to code points for these keys is in the
`Functional key definition table below <functional>`{.interpreted-text
role="ref"}.

## Progressive enhancement {#progressive_enhancement}

While, in theory, every key event could be completely represented by
this protocol and all would be hunk-dory, in reality there is a vast
universe of existing terminal programs that expect legacy control codes
for key events and that are not likely to ever be updated. To support
these, in default mode, the terminal will emit legacy escape codes for
compatibility. If a terminal program wants more robust key handling, it
can request it from the terminal, via the mechanism described here. Each
enhancement is described in detail below. The escape code for requesting
enhancements is:

    CSI = flags ; mode u

Here `flags` is a decimal encoded integer to specify a set of bit-flags.
The meanings of the flags are given below. The second, `mode` parameter
is optional (defaulting to `1`) and specifies how the flags are applied.
The value `1` means all set bits are set and all unset bits are reset.
The value `2` means all set bits are set, unset bits are left unchanged.
The value `3` means all set bits are reset, unset bits are left
unchanged.

  Bit            Meaning
  -------------- ---------------------------------------------------
  0b1 (1)        `disambiguate`{.interpreted-text role="ref"}
  0b10 (2)       `report_events`{.interpreted-text role="ref"}
  0b100 (4)      `report_alternates`{.interpreted-text role="ref"}
  0b1000 (8)     `report_all_keys`{.interpreted-text role="ref"}
  0b10000 (16)   `report_text`{.interpreted-text role="ref"}

  : The progressive enhancement flags

The program running in the terminal can query the terminal for the
current values of the flags by sending:

    CSI ? u

The terminal will reply with:

    CSI ? flags u

The program can also push/pop the current flags onto a stack in the
terminal with:

    CSI > flags u  # for push, if flags omitted default to zero
    CSI < number u # to pop number entries, defaulting to 1 if unspecified

Terminals should limit the size of the stack as appropriate, to prevent
Denial-of-Service attacks. Terminals must maintain separate stacks for
the main and alternate screens. If a pop request is received that
empties the stack, all flags are reset. If a push request is received
and the stack is full, the oldest entry from the stack must be evicted.

:::: note
::: title
Note
:::

The main and alternate screens in the terminal emulator must maintain
their own, independent, keyboard mode stacks. This is so that a program
that uses the alternate screen such as an editor, can change the
keyboard mode in the alternate screen only, without affecting the mode
in the main screen or even knowing what that mode is. Without this, and
if no stack is implemented for keyboard modes (such as in some legacy
terminal emulators) the editor would have to somehow know what the
keyboard mode of the main screen is and restore to that mode on exit.
::::

### Disambiguate escape codes {#disambiguate}

This type of progressive enhancement (`0b1`) fixes the problem of some
legacy key press encodings overlapping with other control codes. For
instance, pressing the `Esc`{.interpreted-text role="kbd"} key generates
the byte `0x1b` which also is used to indicate the start of an escape
code. Similarly pressing the key `alt+[`{.interpreted-text role="kbd"}
will generate the bytes used for CSI control codes.

Turning on this flag will cause the terminal to report the
`Esc`{.interpreted-text role="kbd"}, `alt+key`{.interpreted-text
role="kbd"}, `ctrl+key`{.interpreted-text role="kbd"},
`ctrl+alt+key`{.interpreted-text role="kbd"},
`shift+alt+key`{.interpreted-text role="kbd"} keys using `CSI u`
sequences instead of legacy ones. Here key is any ASCII key as described
in `legacy_text`{.interpreted-text role="ref"}. Additionally, all non
text keypad keys will be reported as separate keys with `CSI u`
encoding, using dedicated numbers from the
`table below <functional>`{.interpreted-text role="ref"}.

With this flag turned on, all key events that do not generate text are
represented in one of the following two forms:

    CSI number; modifier u
    CSI 1; modifier [~ABCDEFHPQS]

This makes it very easy to parse key events in an application. In
particular, `ctrl+c`{.interpreted-text role="kbd"} will no longer
generate the `SIGINT` signal, but instead be delivered as a `CSI u`
escape code. This has the nice side effect of making it much easier to
integrate into the application event loop. The only exceptions are the
`Enter`{.interpreted-text role="kbd"}, `Tab`{.interpreted-text
role="kbd"} and `Backspace`{.interpreted-text role="kbd"} keys which
still generate the same bytes as in legacy mode this is to allow the
user to type and execute commands in the shell such as `reset` after a
program that sets this mode crashes without clearing it. Note that the
Lock modifiers are not reported for text producing keys, to keep them
usable in legacy programs. To get lock modifiers for all keys use the
`report_all_keys`{.interpreted-text role="ref"} enhancement.

### Report event types {#report_events}

This progressive enhancement (`0b10`) causes the terminal to report key
repeat and key release events. Normally only key press events are
reported and key repeat events are treated as key press events. See
`event_types`{.interpreted-text role="ref"} for details on how these are
reported.

:::: note
::: title
Note
:::

The `Enter`{.interpreted-text role="kbd"}, `Tab`{.interpreted-text
role="kbd"} and `Backspace`{.interpreted-text role="kbd"} keys will not
have release events unless `report_all_keys`{.interpreted-text
role="ref"} is also set, so that the user can still type reset at a
shell prompt when a program that sets this mode ends without resetting
it.
::::

### Report alternate keys {#report_alternates}

This progressive enhancement (`0b100`) causes the terminal to report
alternate key values *in addition* to the main value, to aid in shortcut
matching. See `key_codes`{.interpreted-text role="ref"} for details on
how these are reported. Note that this flag is a pure enhancement to the
form of the escape code used to represent key events, only key events
represented as escape codes due to the other enhancements in effect will
be affected by this enhancement. In other words, only if a key event was
already going to be represented as an escape code due to one of the
other enhancements will this enhancement affect it.

### Report all keys as escape codes {#report_all_keys}

Key events that generate text, such as plain key presses without
modifiers, result in just the text being sent, in the legacy protocol.
There is no way to be notified of key repeat/release events. These types
of events are needed for some applications, such as games (think of
movement using the `WASD` keys).

This progressive enhancement (`0b1000`) turns on key reporting even for
key events that generate text. When it is enabled, text will not be
sent, instead only key events are sent. If the text is needed as well,
combine with the Report associated text enhancement below.

Additionally, with this mode, events for pressing modifier keys are
reported. Note that *all* keys are reported as escape codes, including
`Enter`{.interpreted-text role="kbd"}, `Tab`{.interpreted-text
role="kbd"}, `Backspace`{.interpreted-text role="kbd"} etc. Note that
this enhancement implies all keys are automatically disambiguated as
well, since they are represented in their canonical escape code form.

### Report associated text {#report_text}

This progressive enhancement (`0b10000`) *additionally* causes key
events that generate text to be reported as `CSI u` escape codes with
the text embedded in the escape code. See
`text_as_codepoints`{.interpreted-text role="ref"} above for details on
the mechanism. Note that this flag is an enhancement to
`report_all_keys`{.interpreted-text role="ref"} and is undefined if used
without it.

## Detection of support for this protocol {#detection}

An application can query the terminal for support of this protocol by
sending the escape code querying for the
`current progressive enhancement
<progressive_enhancement>`{.interpreted-text role="ref"} status followed
by request for the [primary device
attributes](https://vt100.net/docs/vt510-rm/DA1.html). If an answer for
the device attributes is received without getting back an answer for the
progressive enhancement the terminal does not support this protocol.

:::: note
::: title
Note
:::

Terminal implementations of this protocol are **strongly** encouraged to
implement all progressive enhancements. It does not make sense to
implement only a subset. Nonetheless, there are likely to be some
terminal implementations that do not do so, applications can detect such
implementations by first setting the desired progressive enhancements
and then querying for the
`current progressive enhancement <progressive_enhancement>`{.interpreted-text
role="ref"}
::::

## Legacy key event encoding

In the default mode, the terminal uses a legacy encoding for key events.
In this encoding, only key press and repeat events are sent and there is
no way to distinguish between them. Text is sent directly as UTF-8
bytes.

Any key events not described in this section are sent using the standard
`CSI u` encoding. This includes keys that are not encodable in the
legacy encoding, thereby increasing the space of usable key combinations
even without progressive enhancement.

### Legacy functional keys

These keys are encoded using three schemes:

    CSI number ; modifier ~
    CSI 1 ; modifier {ABCDEFHPQS}
    SS3 {ABCDEFHPQRS}

In the above, if there are no modifiers, the modifier parameter is
omitted. The modifier value is encoded as described in the
`modifiers`{.interpreted-text role="ref"} section, above, except that
lock keys (such as `Num lock`{.interpreted-text role="kbd"} and
`Caps lock`{.interpreted-text role="kbd"}) are not encoded as the legacy
mode has no encoding for them.

When the second form is used, the number is always `1` and must be
omitted if the modifiers field is also absent. The third form becomes
the second form when modifiers are present
(`SS3 is the bytes 0x1b 0x4f`).

These sequences must match entries in the terminfo database for maximum
compatibility. The table below lists the key, its terminfo entry name
and the escape code used for it by kitty. A different terminal would use
whatever escape code is present in its terminfo database for the key.
Some keys have an alternate representation when the terminal is in
*cursor key mode* (the `smkx/rmkx` terminfo capabilities). This form is
used only in *cursor key mode* and only when no modifiers are present.

  Name                Terminfo name   Escape code
  ------------------- --------------- --------------
  INSERT              kich1           CSI 2 \~
  DELETE              kdch1           CSI 3 \~
  PAGE[UP]{#up}       kpp             CSI 5 \~
  PAGE[DOWN]{#down}   knp             CSI 6 \~
  UP                  cuu1,kcuu1      CSI A, SS3 A
  DOWN                cud1,kcud1      CSI B, SS3 B
  RIGHT               cuf1,kcuf1      CSI C, SS3 C
  LEFT                cub1,kcub1      CSI D, SS3 D
  HOME                home,khome      CSI H, SS3 H
  END                 -,kend          CSI F, SS3 F
  F1                  kf1             SS3 P
  F2                  kf2             SS3 Q
  F3                  kf3             SS3 R
  F4                  kf4             SS3 S
  F5                  kf5             CSI 15 \~
  F6                  kf6             CSI 17 \~
  F7                  kf7             CSI 18 \~
  F8                  kf8             CSI 19 \~
  F9                  kf9             CSI 20 \~
  F10                 kf10            CSI 21 \~
  F11                 kf11            CSI 23 \~
  F12                 kf12            CSI 24 \~
  MENU                kf16            CSI 29 \~

  : Legacy functional encoding

There are a few more functional keys that have special cased legacy
encodings. These are present because they are commonly used and for the
sake of legacy terminal applications that get confused when seeing CSI u
escape codes:

  Key         No mods   Ctrl   Alt         Shift   Ctrl + Shift   Alt + Shift   Ctrl + Alt
  ----------- --------- ------ ----------- ------- -------------- ------------- ------------
  Enter       0xd       0xd    0x1b 0xd    0xd     0xd            0x1b 0xd      0x1b 0xd
  Escape      0x1b      0x1b   0x1b 0x1b   0x1b    0x1b           0x1b 0x1b     0x1b 0x1b
  Backspace   0x7f      0x8    0x1b 0x7f   0x7f    0x8            0x1b 0x7f     0x1b 0x8
  Tab         0x9       0x9    0x1b 0x9    CSI Z   CSI Z          0x1b CSI Z    0x1b 0x9
  Space       0x20      0x0    0x1b 0x20   0x20    0x0            0x1b 0x20     0x1b 0x0

  : C0 controls

Note that `Backspace`{.interpreted-text role="kbd"} and
`ctrl+Backspace`{.interpreted-text role="kbd"} are swapped in some
terminals, this can be detected using the `kbs` terminfo property that
must correspond to the `Backspace`{.interpreted-text role="kbd"} key.

All keypad keys are reported as their equivalent non-keypad keys. To
distinguish these, use the
`disambiguate <disambiguate>`{.interpreted-text role="ref"} flag.

Terminals may choose what they want to do about functional keys that
have no legacy encoding. kitty chooses to encode these using `CSI u`
encoding even in legacy mode, so that they become usable even in
programs that do not understand the full kitty keyboard protocol.
However, terminals may instead choose to ignore such keys in legacy mode
instead, or have an option to control this behavior.

### Legacy text keys {#legacy_text}

For legacy compatibility, the keys `a`{.interpreted-text
role="kbd"}-`z`{.interpreted-text role="kbd"} `0`{.interpreted-text
role="kbd"}-`9`{.interpreted-text role="kbd"} `` \` ``{.interpreted-text
role="kbd"} `-`{.interpreted-text role="kbd"} `=`{.interpreted-text
role="kbd"} `[`{.interpreted-text role="kbd"} `]`{.interpreted-text
role="kbd"} `\\`{.interpreted-text role="kbd"} `;`{.interpreted-text
role="kbd"} `'`{.interpreted-text role="kbd"} `,`{.interpreted-text
role="kbd"} `.`{.interpreted-text role="kbd"} `/`{.interpreted-text
role="kbd"} with the modifiers `shift`{.interpreted-text role="kbd"},
`alt`{.interpreted-text role="kbd"}, `ctrl`{.interpreted-text
role="kbd"}, `shift+alt`{.interpreted-text role="kbd"},
`ctrl+alt`{.interpreted-text role="kbd"} are output using the following
algorithm:

1.  If the `alt`{.interpreted-text role="kbd"} key is pressed output the
    byte for `ESC (0x1b)`
2.  If the `ctrl`{.interpreted-text role="kbd"} modifier is pressed map
    the key using the table in `ctrl_mapping`{.interpreted-text
    role="ref"}.
3.  Otherwise, if the `shift`{.interpreted-text role="kbd"} modifier is
    pressed, output the shifted key, for example, `A` for `a` and `$`
    for `4`.
4.  Otherwise, output the key unmodified

Additionally, `ctrl+space`{.interpreted-text role="kbd"} is output as
the NULL byte `(0x0)`.

Any other combination of modifiers with these keys is output as the
appropriate `CSI u` escape code.

  Key   Plain     shift     alt     ctrl       shift+alt   alt+ctrl   ctrl+shift
  ----- --------- --------- ------- ---------- ----------- ---------- --------------
  i     i (105)   I (73)    ESC i   t (9)      ESC I       ESC t      CSI 105; 6 u
  3     3 (51)    \# (35)   ESC 3   ESC (27)   ESC \#      ESC ESC    CSI 51; 6 u
  ;     ; (59)    : (58)    ESC ;   ; (59)     ESC :       ESC ;      CSI 59; 6 u

  : Example encodings

:::: note
::: title
Note
:::

Many of the legacy escape codes are ambiguous with multiple different
key presses yielding the same escape code(s), for example,
`ctrl+i`{.interpreted-text role="kbd"} is the same as
`tab`{.interpreted-text role="kbd"}, `ctrl+m`{.interpreted-text
role="kbd"} is the same as `Enter`{.interpreted-text role="kbd"},
`ctrl+r`{.interpreted-text role="kbd"} is the same
`ctrl+shift+r`{.interpreted-text role="kbd"}, etc. To resolve these use
the
`disambiguate progressive enhancement <disambiguate>`{.interpreted-text
role="ref"}.
::::

## Functional key definitions {#functional}

All numbers are in the Unicode Private Use Area (`57344 - 63743`) except
for a handful of keys that use numbers under 32 and 127 (C0 control
codes) for legacy compatibility reasons.

  Name                                     CSI             Name                                 CSI
  ---------------------------------------- --------------- ------------------------------------ ------------------
  ESCAPE                                   `27 u`          ENTER                                `13 u`
  TAB                                      `9 u`           BACKSPACE                            `127 u`
  INSERT                                   `2 ~`           DELETE                               `3 ~`
  LEFT                                     `1 D`           RIGHT                                `1 C`
  UP                                       `1 A`           DOWN                                 `1 B`
  PAGE[UP]{#up}                            `5 ~`           PAGE[DOWN]{#down}                    `6 ~`
  HOME                                     `1 H or 7 ~`    END                                  `1 F or 8 ~`
  CAPS[LOCK]{#lock}                        `57358 u`       SCROLL[LOCK]{#lock}                  `57359 u`
  NUM[LOCK]{#lock}                         `57360 u`       PRINT[SCREEN]{#screen}               `57361 u`
  PAUSE                                    `57362 u`       MENU                                 `57363 u`
  F1                                       `1 P or 11 ~`   F2                                   `1 Q or 12 ~`
  F3                                       `13 ~`          F4                                   `1 S or 14 ~`
  F5                                       `15 ~`          F6                                   `17 ~`
  F7                                       `18 ~`          F8                                   `19 ~`
  F9                                       `20 ~`          F10                                  `21 ~`
  F11                                      `23 ~`          F12                                  `24 ~`
  F13                                      `57376 u`       F14                                  `57377 u`
  F15                                      `57378 u`       F16                                  `57379 u`
  F17                                      `57380 u`       F18                                  `57381 u`
  F19                                      `57382 u`       F20                                  `57383 u`
  F21                                      `57384 u`       F22                                  `57385 u`
  F23                                      `57386 u`       F24                                  `57387 u`
  F25                                      `57388 u`       F26                                  `57389 u`
  F27                                      `57390 u`       F28                                  `57391 u`
  F29                                      `57392 u`       F30                                  `57393 u`
  F31                                      `57394 u`       F32                                  `57395 u`
  F33                                      `57396 u`       F34                                  `57397 u`
  F35                                      `57398 u`       KP0                                  `57399 u`
  KP1                                      `57400 u`       KP2                                  `57401 u`
  KP3                                      `57402 u`       KP4                                  `57403 u`
  KP5                                      `57404 u`       KP6                                  `57405 u`
  KP7                                      `57406 u`       KP8                                  `57407 u`
  KP9                                      `57408 u`       KP[DECIMAL]{#decimal}                `57409 u`
  KP[DIVIDE]{#divide}                      `57410 u`       KP[MULTIPLY]{#multiply}              `57411 u`
  KP[SUBTRACT]{#subtract}                  `57412 u`       KP[ADD]{#add}                        `57413 u`
  KP[ENTER]{#enter}                        `57414 u`       KP[EQUAL]{#equal}                    `57415 u`
  KP[SEPARATOR]{#separator}                `57416 u`       KP[LEFT]{#left}                      `57417 u`
  KP[RIGHT]{#right}                        `57418 u`       KP[UP]{#up}                          `57419 u`
  KP[DOWN]{#down}                          `57420 u`       KP[PAGE_UP]{#page_up}                `57421 u`
  KP[PAGE_DOWN]{#page_down}                `57422 u`       KP[HOME]{#home}                      `57423 u`
  KP[END]{#end}                            `57424 u`       KP[INSERT]{#insert}                  `57425 u`
  KP[DELETE]{#delete}                      `57426 u`       KP[BEGIN]{#begin}                    `1 E or 57427 ~`
  MEDIA[PLAY]{#play}                       `57428 u`       MEDIA[PAUSE]{#pause}                 `57429 u`
  MEDIA[PLAY_PAUSE]{#play_pause}           `57430 u`       MEDIA[REVERSE]{#reverse}             `57431 u`
  MEDIA[STOP]{#stop}                       `57432 u`       MEDIA[FAST_FORWARD]{#fast_forward}   `57433 u`
  MEDIA[REWIND]{#rewind}                   `57434 u`       MEDIA[TRACK_NEXT]{#track_next}       `57435 u`
  MEDIA[TRACK_PREVIOUS]{#track_previous}   `57436 u`       MEDIA[RECORD]{#record}               `57437 u`
  LOWER[VOLUME]{#volume}                   `57438 u`       RAISE[VOLUME]{#volume}               `57439 u`
  MUTE[VOLUME]{#volume}                    `57440 u`       LEFT[SHIFT]{#shift}                  `57441 u`
  LEFT[CONTROL]{#control}                  `57442 u`       LEFT[ALT]{#alt}                      `57443 u`
  LEFT[SUPER]{#super}                      `57444 u`       LEFT[HYPER]{#hyper}                  `57445 u`
  LEFT[META]{#meta}                        `57446 u`       RIGHT[SHIFT]{#shift}                 `57447 u`
  RIGHT[CONTROL]{#control}                 `57448 u`       RIGHT[ALT]{#alt}                     `57449 u`
  RIGHT[SUPER]{#super}                     `57450 u`       RIGHT[HYPER]{#hyper}                 `57451 u`
  RIGHT[META]{#meta}                       `57452 u`       ISO[LEVEL3_SHIFT]{#level3_shift}     `57453 u`
  ISO[LEVEL5_SHIFT]{#level5_shift}         `57454 u`                                            

  : Functional key codes

:::: note
::: title
Note
:::

The escape codes above of the form `CSI 1 letter` will omit the `1` if
there are no modifiers, since `1` is the default value.
::::

:::: note
::: title
Note
:::

The original version of this specification allowed F3 to be encoded as
both CSI R and CSI \~. However, CSI R conflicts with the Cursor Position
Report, so it was removed.
::::

## Legacy `ctrl`{.interpreted-text role="kbd"} mapping of ASCII keys {#ctrl_mapping}

When the `ctrl`{.interpreted-text role="kbd"} key and another key are
pressed on the keyboard, terminals map the result *for some keys* to a
*C0 control code* i.e. an value from `0 - 31`. This mapping was
historically dependent on the layout of hardware terminal keyboards and
is not specified anywhere, completely. The best known reference is
[Table 3-5 in the VT-100
docs](https://vt100.net/docs/vt100-ug/chapter3.html).

The table below provides a mapping that is a commonly used superset of
the table above. Any ASCII keys not in the table must be left untouched
by `ctrl`{.interpreted-text role="kbd"}.

## Bugs in fixterms {#fixterms_bugs}

The following is a list of errata in the [original fixterms
proposal](http://www.leonerd.org.uk/hacks/fixterms/), corrected in this
specification.

-   No way to disambiguate `Esc`{.interpreted-text role="kbd"} key
    presses, other than using 8-bit controls which are undesirable for
    other reasons
-   Incorrectly claims special keys are sometimes encoded using
    `CSI letter` encodings when it is actually `SS3 letter` in all
    terminals newer than a VT-52, which is pretty much everything.
-   `ctrl+shift+tab`{.interpreted-text role="kbd"} should be
    `CSI 9 ; 6 u` not `CSI 1 ; 5 Z` (shift+tab is not a separate key
    from tab)
-   No support for the `super`{.interpreted-text role="kbd"} modifier.
-   Makes no mention of cursor key mode and how it changes encodings
-   Incorrectly encoding shifted keys when shift modifier is used, for
    instance, for `ctrl+shift+i`{.interpreted-text role="kbd"} is
    encoded as `ctrl+I`{.interpreted-text role="kbd"}.
-   No way to have non-conflicting escape codes for
    `alt+letter`{.interpreted-text role="kbd"},
    `ctrl+letter`{.interpreted-text role="kbd"},
    `ctrl+alt+letter`{.interpreted-text role="kbd"} key presses
-   No way to specify both shifted and unshifted keys for robust
    shortcut matching (think matching
    `ctrl+shift+equal`{.interpreted-text role="kbd"} and
    `ctrl+plus`{.interpreted-text role="kbd"})
-   No way to specify alternate layout key. This is useful for keyboard
    layouts such as Cyrillic where you want the shortcut
    `ctrl+c`{.interpreted-text role="kbd"} to work when pressing the
    `ctrl+С`{.interpreted-text role="kbd"} on the keyboard.
-   No way to report repeat and release key events, only key press
    events
-   No way to report key events for presses that generate text, useful
    for gaming. Think of using the `WASD`{.interpreted-text role="kbd"}
    keys to control movement.
-   Only a small subset of all possible functional keys are assigned
    numbers.
-   Claims the `CSI u` escape code has no fixed meaning, but has been
    used for decades as `SCORC` for instance by xterm and ansi.sys and
    [DECSMBV](https://vt100.net/docs/vt510-rm/DECSMBV.html) by the
    VT-510 hardware terminal. This doesn\'t really matter since these
    uses are for communication to the terminal not from the terminal.
-   Handwaves that `ctrl`{.interpreted-text role="kbd"} *tends to* mask
    with `0x1f`. In actual fact it does this only for some keys. The
    action of `ctrl`{.interpreted-text role="kbd"} is not specified and
    varies between terminals, historically because of different keyboard
    layouts.

## Why xterm\'s modifyOtherKeys should not be used

-   Does not support release events
-   Does not fix the issue of `Esc`{.interpreted-text role="kbd"} key
    presses not being distinguishable from escape codes.
-   Does not fix the issue of some keypresses generating identical bytes
    and thus being indistinguishable
-   There is no robust way to query it or manage its state from a
    program running in the terminal.
-   No support for shifted keys.
-   No support for alternate keyboard layouts.
-   No support for modifiers beyond the basic four.
-   No support for lock keys like Num lock and Caps lock.
-   Is completely unspecified. The most discussion of it available
    anywhere is
    [here](https://invisible-island.net/xterm/modified-keys.html) And it
    contains no specification of what numbers to assign to what function
    keys beyond running a Perl script on an X11 system!!
# Extend with kittens {#kittens}

::: {.toctree hidden="" glob=""}
kittens/icat kittens/diff kittens/unicode[input]{#input} kittens/themes
kittens/choose-fonts kittens/hints kittens/command-palette
kittens/quick-access-terminal kittens/choose-files kittens/dnd
kittens/panel kittens/remote[file]{#file}
kittens/hyperlinked[grep]{#grep} kittens/transfer kittens/ssh
kittens/custom kittens/\*
:::

[\|kitty\|](##SUBST##|kitty|) has a framework for easily creating
terminal programs that make use of its advanced features. These programs
are called kittens. They are used both to add features to
[\|kitty\|](##SUBST##|kitty|) itself and to create useful standalone
programs. Some prominent kittens:

`icat <kittens/icat>`{.interpreted-text role="doc"}

:   Display images in the terminal.

`diff <kittens/diff>`{.interpreted-text role="doc"}

:   A fast, side-by-side diff for the terminal with syntax highlighting
    and images.

`Unicode input <kittens/unicode_input>`{.interpreted-text role="doc"}

:   Easily input arbitrary Unicode characters in
    [\|kitty\|](##SUBST##|kitty|) by name or hex code.

`Themes <kittens/themes>`{.interpreted-text role="doc"}

:   Preview and quick switch between over three hundred color themes.

`Fonts <kittens/choose-fonts>`{.interpreted-text role="doc"}

:   Preview, fine-tune and quick switch the fonts used by kitty.

`Hints <kittens/hints>`{.interpreted-text role="doc"}

:   Select and open/paste/insert arbitrary text snippets such as URLs,
    filenames, words, lines, etc. from the terminal screen.

`Command palette <kittens/command-palette>`{.interpreted-text role="doc"}

:   Browse, search and trigger all keyboard shortcuts and actions from a
    single searchable overlay.

`Quick access terminal <kittens/quick-access-terminal>`{.interpreted-text role="doc"}

:   Get access to a quick access floating, semi-transparent kitty window
    with a single keypress.

`Panel <kittens/panel>`{.interpreted-text role="doc"}

:   Draw the desktop wallpaper or docks and panels using arbitrary
    terminal programs.

`Choose files <kittens/choose-files>`{.interpreted-text role="doc"}

:   Preview and select files at the speed of thought

`Drag and drop from the shell <kittens/dnd>`{.interpreted-text role="doc"}

:   Drag and drop files from/to GUI programs from your shell, even over
    SSH

`Remote file <kittens/remote_file>`{.interpreted-text role="doc"}

:   Edit, open, or download remote files over SSH easily, by simply
    clicking on the filename.

`Transfer files <kittens/transfer>`{.interpreted-text role="doc"}

:   Transfer files and directories seamlessly and easily from remote
    machines over your existing SSH sessions with a simple command.

`Hyperlinked grep <kittens/hyperlinked_grep>`{.interpreted-text role="doc"}

:   Search your files using
    [ripgrep](https://github.com/BurntSushi/ripgrep) and open the
    results directly in your favorite editor in the terminal, at the
    line containing the search result, simply by clicking on the result
    you want.

`Broadcast <kittens/broadcast>`{.interpreted-text role="doc"}

:   Type in one `kitty window <window>`{.interpreted-text role="term"}
    and have it broadcast to all (or a subset) of other
    `kitty windows <window>`{.interpreted-text role="term"}.

`SSH <kittens/ssh>`{.interpreted-text role="doc"}

:   SSH with automatic
    `shell integration <shell_integration>`{.interpreted-text
    role="ref"}, connection re-use for low latency and easy cloning of
    local shell and editor configuration to the remote host.

`Clipboard <kittens/clipboard>`{.interpreted-text role="doc"}

:   Copy/paste to the clipboard from shell scripts, even over SSH.

You can also
`Learn to create your own kittens <kittens/custom>`{.interpreted-text
role="doc"}.
# The `launch`{.interpreted-text role="command"} command

::: program
launch
:::

[\|kitty\|](##SUBST##|kitty|) has a `launch` action that can be used to
run arbitrary programs in new windows/tabs. It can be mapped to user
defined shortcuts in `kitty.conf`{.interpreted-text role="file"}. It is
very powerful and allows sending the contents of the current window to
the launched program, as well as many other options.

In the simplest form, you can use it to open a new kitty window running
the shell, as shown below:

    map f1 launch

To run a different program simply pass the command line as arguments to
launch:

    map f1 launch vim path/to/some/file

To open a new window with the same working directory as the currently
active window:

    map f1 launch --cwd=current

To open the new window in a new tab:

    map f1 launch --type=tab

To run multiple commands in a shell, use:

    map f1 launch sh -c "ls && exec zsh"

To pass the contents of the current screen and scrollback to the started
process:

    map f1 launch --stdin-source=@screen_scrollback less

There are many more powerful options, refer to the complete list below.

:::: note
::: title
Note
:::

To avoid duplicating launch actions with frequently used parameters, you
can use `action_alias`{.interpreted-text role="opt"} to define launch
action aliases. For example:

action[alias]{#alias} launch[tab]{#tab} launch \--cwd=current
\--type=tab map f1 launch[tab]{#tab} vim map f2 launch[tab]{#tab} emacs

The `F1`{.interpreted-text role="kbd"} key will now open
`vim`{.interpreted-text role="program"} in a new tab with the current
windows working directory.
::::

# The piping environment

When using `launch --stdin-source`{.interpreted-text role="option"}, the
program to which the data is piped has a special environment variable
declared, `KITTY_PIPE_DATA`{.interpreted-text role="envvar"} whose
contents are:

    KITTY_PIPE_DATA={scrolled_by}:{cursor_x},{cursor_y}:{lines},{columns}

where `scrolled_by` is the number of lines kitty is currently scrolled
by, `cursor_(x|y)` is the position of the cursor on the screen with
`(1,1)` being the top left corner and `{lines},{columns}` being the
number of rows and columns of the screen.

# Special arguments

There are a few special placeholder arguments that can be specified as
part of the command line:

`@selection`

:   Replaced by the currently selected text.

`@active-kitty-window-id`

:   Replaced by the id of the currently active kitty window.

`@line-count`

:   Replaced by the number of lines in STDIN. Only present when passing
    some data to STDIN.

`@input-line-number`

:   Replaced by the number of lines a pager should scroll to match the
    current scroll position in kitty. See
    `scrollback_pager`{.interpreted-text role="opt"} for details.

`@scrolled-by`

:   Replaced by the number of lines kitty is currently scrolled by.

`@cursor-x`

:   Replaced by the current cursor x position with 1 being the leftmost
    cell.

`@cursor-y`

:   Replaced by the current cursor y position with 1 being the topmost
    cell.

`@first-line-on-screen`

:   Replaced by the first line on screen. Can be used for pager
    positioning.

`@last-line-on-screen`

:   Replaced by the last line on screen. Can be used for pager
    positioning.

For example:

    map f1 launch my-program @active-kitty-window-id

# Watching launched windows {#watchers}

The `launch --watcher`{.interpreted-text role="option"} option allows
you to specify Python functions that will be called at specific events,
such as when the window is resized or closed. Note that you can also
specify watchers that are loaded for all windows, via
`watcher`{.interpreted-text role="opt"}. To create a watcher, specify
the path to a Python module that specifies callback functions for the
events you are interested in, for create
`~/.config/kitty/mywatcher.py`{.interpreted-text role="file"} and use
`launch --watcher`{.interpreted-text role="option"} =
`mywatcher.py`{.interpreted-text role="file"}:

``` python
# ~/.config/kitty/mywatcher.py
from typing import Any

from kitty.boss import Boss
from kitty.window import Window


def on_load(boss: Boss, data: dict[str, Any]) -> None:
    # This is a special function that is called just once when this watcher
    # module is first loaded, can be used to perform any initialization/one
    # time setup. Any exceptions in this function are printed to kitty's
    # STDERR but otherwise ignored.
    ...

def on_resize(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    # Here data will contain old_geometry and new_geometry
    # Note that resize is also called the first time a window is created
    # which can be detected as old_geometry will have all zero values, in
    # particular, old_geometry.xnum and old_geometry.ynum will be zero.
    ...

def on_focus_change(boss: Boss, window: Window, data: dict[str, Any])-> None:
    # Here data will contain focused
    ...

def on_close(boss: Boss, window: Window, data: dict[str, Any])-> None:
    # called when window is closed, typically when the program running in
    # it exits
    ...

def on_set_user_var(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    # called when a "user variable" is set or deleted on a window. Here
    # data will contain key and value
    ...

def on_title_change(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    # called when the window title is changed on a window. Here
    # data will contain title and from_child. from_child will be True
    # when a title change was requested via escape code from the program
    # running in the terminal
    ...

def on_cmd_startstop(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    # called when the shell starts/stops executing a command. Here
    # data will contain is_start, cmdline and time.
    ...

def on_color_scheme_preference_change(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    # called when the color scheme preference of this window changes from
    # light to dark or vice versa. data contains is_dark and via_escape_code
    # the latter will be true if the color scheme was changed via escape
    # code received from the program running in the window
    ...

def on_tab_bar_dirty(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    # called when any changes happen to the tab bar, such a new tabs being
    # created, tab titles changing, tabs moving, etc. Useful to display the
    # tab bar externally to kitty. This is called even if the tab bar is
    # hidden. Note that this is called only in *global watchers*, that is
    # watchers defined in kitty.conf or using the --watcher command line
    # flag. data contains tab_manager which is the object responsible for
    # managing all tabs in a single OS Window.
    ...

def on_quit(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    # called when kitty is about to quit. This is called in *global watchers*
    # only. It is called twice: once before the quit confirmation dialog is
    # shown (data['confirmed'] will be False) and once after the user has
    # confirmed quitting (data['confirmed'] will be True). Setting
    # data['aborted'] to True will abort the quit in both cases.
    ...
```

Every callback is passed a reference to the global `Boss` object as well
as the `Window` object the action is occurring on. The `data` object is
a dict that contains event dependent data. You have full access to kitty
internals in the watcher scripts, however kitty internals are not
documented/stable so for most things you are better off using the kitty
`Remote control API </remote-control>`{.interpreted-text role="doc"}.
Simply call `boss.call_remote_control()`, with the same arguments you
would pass to `kitten @`. For example:

``` python
def on_resize(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    # send some text to the resized window
    boss.call_remote_control(window, ('send-text', f'--match=id:{window.id}', 'hello world'))
```

Run, `kitten @ --help` in a kitty terminal, to see all the remote
control commands available to you.

# Finding executables

When you specify a command to run as just a name rather than an absolute
path, it is searched for in the system-wide `PATH`{.interpreted-text
role="envvar"} environment variable. Note that this **may not** be the
value of `PATH`{.interpreted-text role="envvar"} inside a shell, as
shell startup scripts often change the value of this variable. If it is
not found there, then a system specific list of default paths is
searched. If it is still not found, then your shell is run and the value
of `PATH`{.interpreted-text role="envvar"} inside the shell is used.

See `exe_search_path`{.interpreted-text role="opt"} for details and how
to control this.

# Syntax reference
# Arrange windows

kitty has the ability to define its own windows that can be tiled next
to each other in arbitrary arrangements, based on *Layouts*, see below
for examples:

<figure class="align-center">
<img src="screenshots/screenshot.png" style="width:100.0%"
alt="screenshots/screenshot.png" />
<figcaption>Screenshot, showing <code class="interpreted-text"
role="program">vim</code>, <code class="interpreted-text"
role="program">tig</code> and <code class="interpreted-text"
role="program">git</code> running in <a
href="##SUBST##|kitty|">|kitty|</a> with the <em>Tall</em>
layout</figcaption>
</figure>

<figure class="align-center">
<img src="screenshots/splits.png" style="width:100.0%"
alt="screenshots/splits.png" />
<figcaption>Screenshot, showing windows with arbitrary arrangement in
the <em>Splits</em> layout</figcaption>
</figure>

There are many different layouts available. They are all enabled by
default, you can switch layouts using `next_layout`{.interpreted-text
role="ac"} (`next_layout`{.interpreted-text role="sc"} by default). To
control which layouts are available use
`enabled_layouts`{.interpreted-text role="opt"}, the first listed layout
becomes the default. Individual layouts and how to use them are
described below.

# The Stack Layout

This is the simplest layout. It displays a single window using all
available space, other windows are hidden behind it. This layout has no
options:

    enabled_layouts stack

# The Tall Layout

Displays one (or optionally more) full-height windows on the left half
of the screen. Remaining windows are tiled vertically on the right half
of the screen. There are options to control how the screen is split
horizontally `bias` (an integer between `10` and `90`) and options to
control how many full-height windows there are `full_size` (a positive
integer). The `mirrored` option when set to `true` will cause the
full-height windows to be on the right side of the screen instead of the
left. The syntax for the options is:

    enabled_layouts tall:bias=50;full_size=1;mirrored=false

    ┌──────────────┬───────────────┐
    │              │               │
    │              │               │
    │              │               │
    │              ├───────────────┤
    │              │               │
    │              │               │
    │              │               │
    │              ├───────────────┤
    │              │               │
    │              │               │
    │              │               │
    └──────────────┴───────────────┘

In addition, you can map keys to increase or decrease the number of
full-height windows, or toggle the mirrored setting, for example:

    map ctrl+[ layout_action decrease_num_full_size_windows
    map ctrl+] layout_action increase_num_full_size_windows
    map ctrl+/ layout_action mirror toggle
    map ctrl+y layout_action mirror true
    map ctrl+n layout_action mirror false

You can also map a key to change the bias by providing a list of
percentages and it will rotate through the list as you press the key. If
you only provide one number it\'ll toggle between that percentage and
50, for example:

    map ctrl+. layout_action bias 50 62 70
    map ctrl+, layout_action bias 62

# The Fat Layout

Displays one (or optionally more) full-width windows on the top half of
the screen. Remaining windows are tiled horizontally on the bottom half
of the screen. There are options to control how the screen is split
vertically `bias` (an integer between `10` and `90`) and options to
control how many full-width windows there are `full_size` (a positive
integer). The `mirrored` option when set to `true` will cause the
full-width windows to be on the bottom of the screen instead of the top.
The syntax for the options is:

    enabled_layouts fat:bias=50;full_size=1;mirrored=false

    ┌──────────────────────────────┐
    │                              │
    │                              │
    │                              │
    │                              │
    ├─────────┬──────────┬─────────┤
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    └─────────┴──────────┴─────────┘

This layout also supports the same layout actions as the *Tall* layout,
shown above.

# The Grid Layout

Display windows in a balanced grid with all windows the same size except
the last column if there are not enough windows to fill the grid. This
layout has no options:

    enabled_layouts grid

    ┌─────────┬──────────┬─────────┐
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    ├─────────┼──────────┼─────────┤
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    └─────────┴──────────┴─────────┘

# The Splits Layout {#splits_layout}

This is the most flexible layout. You can create any arrangement of
windows by splitting existing windows repeatedly. To best use this
layout you should define a few extra key bindings in
`kitty.conf`{.interpreted-text role="file"}:

    # Create a new window splitting the space used by the existing one so that
    # the two windows are placed one above the other
    map f5 launch --location=hsplit

    # Create a new window splitting the space used by the existing one so that
    # the two windows are placed side by side
    map f6 launch --location=vsplit

    # Create a new window splitting the space used by the existing one so that
    # the two windows are placed side by side if the existing window is wide or
    # one above the other if the existing window is tall.
    map f4 launch --location=split

    # Rotate the current split, changing its split axis from vertical to
    # horizontal or vice versa
    map f7 layout_action rotate

    # Move the active window in the indicated direction
    map shift+up move_window up
    map shift+left move_window left
    map shift+right move_window right
    map shift+down move_window down

    # Move the active window to the indicated screen edge
    map ctrl+shift+up layout_action move_to_screen_edge top
    map ctrl+shift+left layout_action move_to_screen_edge left
    map ctrl+shift+right layout_action move_to_screen_edge right
    map ctrl+shift+down layout_action move_to_screen_edge bottom

    # Switch focus to the neighboring window in the indicated direction
    map ctrl+left neighboring_window left
    map ctrl+right neighboring_window right
    map ctrl+up neighboring_window up
    map ctrl+down neighboring_window down

    # Set the bias of the split containing the currently focused window. The
    # currently focused window will take up the specified percent of its parent
    # window's size.
    map ctrl+. layout_action bias 80

    # Maximize the active window along the horizontal axis (fill full width),
    # keeping other windows visible in their vertical positions. Press again to
    # restore the original layout.
    map ctrl+shift+right layout_action maximize horizontal

    # Maximize the active window along the vertical axis (fill full height),
    # keeping other windows visible in their horizontal positions. Press again
    # to restore the original layout.
    map ctrl+shift+up layout_action maximize vertical

Windows can be resized using `window_resizing`{.interpreted-text
role="ref"}. You can swap the windows in a split using the `rotate`
action with an argument of `180` and rotate and swap with an argument of
`270`. The `maximize` action expands the active window to fill the
maximum available space along a single axis while keeping the rest of
the layout intact. Use `maximize horizontal` to fill the full width and
`maximize vertical` to fill the full height. Calling it again restores
the original split sizes.

This layout takes one option, `split_axis` that controls whether new
windows are placed into vertical or horizontal splits when a `--location
<launch --location>`{.interpreted-text role="option"} is not specified.
A value of `horizontal` (same as `--location=vsplit`) means when a new
split is created the two windows will be placed side by side and a value
of `vertical` (same as `--location=hsplit`) means the two windows will
be placed one on top of the other. A value of `auto` means the axis of
the split is chosen automatically (same as `--location=split`). By
default:

    enabled_layouts splits:split_axis=horizontal

    ┌──────────────┬───────────────┐
    │              │               │
    │              │               │
    │              │               │
    │              ├───────┬───────┤
    │              │       │       │
    │              │       │       │
    │              │       │       │
    │              ├───────┴───────┤
    │              │               │
    │              │               │
    │              │               │
    └──────────────┴───────────────┘

::: versionadded
0.17.0 The Splits layout
:::

# The Horizontal Layout

All windows are shown side by side. This layout has no options:

    enabled_layouts horizontal

    ┌─────────┬──────────┬─────────┐
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    │         │          │         │
    └─────────┴──────────┴─────────┘

# The Vertical Layout

All windows are shown one below the other. This layout has no options:

    enabled_layouts vertical

    ┌──────────────────────────────┐
    │                              │
    │                              │
    │                              │
    ├──────────────────────────────┤
    │                              │
    │                              │
    │                              │
    ├──────────────────────────────┤
    │                              │
    │                              │
    │                              │
    └──────────────────────────────┘

# Resizing windows {#window_resizing}

You can resize windows inside layouts. The easiest method is to simply
drag the window borders using a mouse, controlled by the option
`window_drag_tolerance`{.interpreted-text role="opt"}. Note that
technically this resizes layout slots not actual windows, so it does not
work exactly like resizing OS Windows on your desktop. Instead, the
layout is changed and potentially multiple windows get resized when
dragging a single border.

For keyboard friendly resizing, press
`start_resizing_window`{.interpreted-text role="sc"} (also
`⌘+r`{.interpreted-text role="kbd"} on macOS) to enter resizing mode and
follow the on-screen instructions. In a given window layout only some
operations may be possible for a particular window. For example, in the
*Tall* layout you can make the first window wider/narrower, but not
taller/shorter. Note that what you are resizing is actually not a
window, but a row/column in the layout, all windows in that row/column
will be resized.

You can also define shortcuts in `kitty.conf`{.interpreted-text
role="file"} to make the active window wider, narrower, taller, or
shorter by mapping to the `resize_window`{.interpreted-text role="ac"}
action, for example:

    map ctrl+left resize_window narrower
    map ctrl+right resize_window wider
    map ctrl+up resize_window taller
    map ctrl+down resize_window shorter 3
    # reset all windows in the tab to default sizes
    map ctrl+home resize_window reset

The `resize_window`{.interpreted-text role="ac"} action has a second
optional argument to control the resizing increment (a positive integer
that defaults to 1).

Some layouts take options to control their behavior. For example, the
*Fat* and *Tall* layouts accept the `bias` and `full_size` options to
control how the available space is split up. To specify the option, in
`kitty.conf
<enabled_layouts>`{.interpreted-text role="opt"} use:

    enabled_layouts tall:bias=70;full_size=2

This will have `2` instead of a single tall window, that occupy `70%`
instead of `50%` of available width. `bias` can be any number between
`10` and `90`.

Writing a new layout only requires about two hundred lines of code, so
if there is some layout you want, take a look at one of the existing
layouts in the
[layout](https://github.com/kovidgoyal/kitty/tree/master/kitty/layout)
package and submit a pull request!
orphan

:   

# Making your keyboard dance

kitty has extremely powerful facilities for mapping keyboard actions.
Things like combining actions, multi-key mappings, modal mappings,
mappings that send arbitrary text, and mappings dependent on the program
currently running in kitty.

Let\'s start with the basics. You can map a key press to an action in
kitty using the following syntax:

``` conf
map ctrl+a new_window_with_cwd
```

This will map the key press `Ctrl+a`{.interpreted-text role="kbd"} to
open a new `window`{.interpreted-text role="term"} with the working
directory set to the working directory of the current window. This is
the basic operation of the map directive, the tip of the iceberg, for
more read the sections below.

## Combining multiple actions on a single keypress

Multiple actions can be combined on a single keypress, like a macro. To
do this map the key press to the `combine`{.interpreted-text role="ac"}
action:

``` conf
map key combine <separator> action1 <separator> action2 <separator> action3 ...
```

For example:

``` conf
map kitty_mod+e combine : new_window : next_layout
```

This will create a new window and switch to the next available layout.
You can also run arbitrarily powerful scripts on a key press. There are
two major techniques for doing this, using remote control scripts or
using kittens.

### Remote control scripts

These can be written in any language and use the \"kitten\" binary to
control kitty via its extensive
`Remote control <remote-control>`{.interpreted-text role="doc"} API.
First, if you just want to run a single remote control command on a key
press, you can just do:

``` conf
map f1 remote_control set-spacing margin=30
```

This will run the `set-spacing` command, changing window margins to 30
pixels. For more complex scripts, write a script file in any language
you like and save it somewhere, preferably in the kitty configuration
directory. Do not forget to make it executable. In the script file you
run remote control commands by running the \"kitten\" binary, for
example:

``` sh
#!/bin/sh

kitten @ set-spacing margin=30
kitten @ new_window
...
```

The script can perform arbitrarily complex logic and actions, limited
only by the remote control API, that you can browse by running
`kitten @ --help`. To run the script you created on a key press, use:

``` conf
map f1 remote_control_script /path/to/myscript
```

### Kittens

Here, kittens refer to Python scripts. The scripts have two parts, one
that runs as a regular command line program inside a kitty window to,
for example, ask the user for some input and a second part that runs
inside the kitty process itself and can perform any operation on the
kitty UI, which is itself implemented in Python. However, the kitty
internal API is not documented and can (very rarely) change, so kittens
are harder to get started with than remote control scripts. To run a
kitten on a key press:

``` conf
map f1 kitten mykitten.py
```

Many of kitty\'s features are themselves implemented as kittens, for
example, `/kittens/unicode_input`{.interpreted-text role="doc"},
`/kittens/hints`{.interpreted-text role="doc"} and
`/kittens/themes`{.interpreted-text role="doc"}. To learn about writing
your own kittens, see `/kittens/custom`{.interpreted-text role="doc"}.

## Syntax for specifying keys

A mapping maps a key press to some action. In their most basic form,
keypresses are `modifier+key`. Keys are identified simply by their
lowercase Unicode characters. For example: `a` for the
`A`{.interpreted-text role="kbd"} key, `[` for the left square bracket
key, etc. For functional keys, such as `Enter`{.interpreted-text
role="kbd"} or `Escape`{.interpreted-text role="kbd"}, the names are
present at `Functional key definitions
<functional>`{.interpreted-text role="ref"}. For modifier keys, the
names are `ctrl`{.interpreted-text role="kbd"}
(`control`{.interpreted-text role="kbd"}, `⌃`{.interpreted-text
role="kbd"}), `shift`{.interpreted-text role="kbd"}
(`⇧`{.interpreted-text role="kbd"}), `alt`{.interpreted-text role="kbd"}
(`opt`{.interpreted-text role="kbd"}, `option`{.interpreted-text
role="kbd"}, `⌥`{.interpreted-text role="kbd"}),
`super`{.interpreted-text role="kbd"} (`cmd`{.interpreted-text
role="kbd"}, `command`{.interpreted-text role="kbd"},
`⌘`{.interpreted-text role="kbd"}).

Additionally, you can use the name `kitty_mod`{.interpreted-text
role="opt"} as a modifier, the default value of which is
`ctrl+shift`{.interpreted-text role="kbd"}. The default kitty shortcuts
are defined using this value, so by changing it in
`kitty.conf`{.interpreted-text role="file"} you can change all the
modifiers used by all the default shortcuts.

On Linux, you can also use XKB names for functional keys that don\'t
have kitty names. See `XKB keys
<https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h>`{.interpreted-text
role="link"} for a list of key names. The name to use is the part after
the `XKB_KEY_` prefix. Note that you can only use an XKB key name for
keys that are not known as kitty keys.

Finally, you can use raw system key codes to map keys, again only for
keys that are not known as kitty keys. To see the system key code for a
key, start kitty with the `kitty --debug-input`{.interpreted-text
role="option"} option, kitty will output some debug text for every key
event. In that text look for `native_code`, the value of that becomes
the key name in the shortcut. For example:

``` none
on_key_input: glfw key: 0x61 native_code: 0x61 action: PRESS mods: none text: 'a'
```

Here, the key name for the `A`{.interpreted-text role="kbd"} key is
`0x61` and you can use it with:

``` conf
map ctrl+0x61 something
```

This maps `Ctrl+A`{.interpreted-text role="kbd"} to something.

## Multi-key mappings

A mapping in kitty can involve pressing multiple keys in sequence, with
the syntax shown below:

``` conf
map key1>key2>key3 action
```

For example:

``` conf
map ctrl+f>2 set_font_size 20
```

The default mappings to run the
`hints kitten </kittens/hints>`{.interpreted-text role="doc"} to select
text on the screen are examples of multi-key mappings.

## Unmapping default shortcuts

kitty comes with dozens of default keyboard mappings for common
operations. See `actions`{.interpreted-text role="doc"} for the full
list of actions and the default shortcuts that map to them. You can
unmap an individual shortcut, so that it is passed on to the program
running inside kitty, by mapping it to nothing, for example:

``` conf
map kitty_mod+enter
```

This unmaps the default shortcut `new_window`{.interpreted-text
role="sc"} to open a new window. Almost all default shortcuts are of the
form `modifier + key` where the modifier defaults to
`Ctrl+Shift`{.interpreted-text role="kbd"} and can be changed using the
`kitty_mod`{.interpreted-text role="opt"} setting in
`kitty.conf`{.interpreted-text role="file"}.

If you want to clear all default shortcuts, you can use
`clear_all_shortcuts`{.interpreted-text role="opt"} in
`kitty.conf`{.interpreted-text role="file"}.

If you would like kitty to completely ignore a key event, not even
sending it to the program running in the terminal, map it to
`discard_event`{.interpreted-text role="ac"}:

``` conf
map kitty_mod+f1 discard_event
```

## Configuring a timeout {#conditional_mappings}

You can also set a timeout for keyboard modes and multi-key mappings. If
a timeout is set and you don\'t complete the key sequence or exit the
mode within the specified time, the mode will be automatically
cancelled. This is useful for multi-key mappings where you might
accidentally press the first key and then change your mind. The timeout
is specified in seconds and can be set globally using the
`map_timeout`{.interpreted-text role="opt"} option or per-mode using
`--timeout`:

``` conf
# Set a global 2 second timeout for all multi-key and modal mappings
map_timeout 2.0

# This mode will have a 5 second timeout (overrides global setting)
map --new-mode resize --timeout 5.0 kitty_mod+r
map --mode resize h resize_window narrower
map --mode resize l resize_window wider
# ... more mappings

# Multi-key mapping with the global timeout
map ctrl+a>h new_window
```

When a timeout occurs, the mode is exited and any buffered keys are
discarded. A timeout value of zero disables the timeout. For multi-key
sequences, the timeout is restarted after each valid key press in the
sequence.

## Conditional mappings depending on the state of the focused window

Sometimes, you may want different mappings to be active when running a
particular program in kitty, perhaps because it has some native
functionality that duplicates kitty functions or there is a conflict,
etc. kitty has the ability to create mappings that work only when the
currently focused window matches some criteria, such as when it has a
particular title or user variable.

Let\'s see some examples:

``` conf
map --when-focus-on title:keyboard.protocol kitty_mod+t
```

This will cause `kitty_mod+t`{.interpreted-text role="kbd"} (the default
shortcut for opening a new tab) to be unmapped only when the focused
window has `keyboard protocol` in its title. Run the show-key kitten as:

``` conf
kitten show-key -m kitty
```

Press `ctrl+shift+t`{.interpreted-text role="kbd"} and instead of a new
tab opening, you will see the key press being reported by the kitten.
`--when-focus-on` can test the focused window using very powerful
criteria, see `search_syntax`{.interpreted-text role="ref"} for details.
A more practical example unmaps the key when the focused window is
running an editor:

``` conf
map --when-focus-on var:in_editor kitty_mod+c
```

In order to make this work, you need to configure your editor as shown
below:

::: tab
vim

In `~/.vimrc`{.interpreted-text role="file"} add:

:   ``` vim
    let &t_ti = &t_ti . "\033]1337;SetUserVar=in_editor=MQ==\007"
    let &t_te = &t_te . "\033]1337;SetUserVar=in_editor\007"
    ```
:::

::: tab
neovim

In `~/.config/nvim/init.lua`{.interpreted-text role="file"} add:

> ``` lua
> vim.api.nvim_create_autocmd({ "VimEnter", "VimResume", "UIEnter" }, {
>     group = vim.api.nvim_create_augroup("KittySetVarVimEnter", { clear = true }),
>     callback = function()
>         if vim.api.nvim_ui_send then
>             vim.api.nvim_ui_send("\x1b]1337;SetUserVar=in_editor=MQ==\007")
>         else
>             io.stdout:write("\x1b]1337;SetUserVar=in_editor=MQ==\007")
>         end
>     end,
> })
>
> vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
>     group = vim.api.nvim_create_augroup("KittyUnsetVarVimLeave", { clear = true }),
>     callback = function()
>         if vim.api.nvim_ui_send then
>             vim.api.nvim_ui_send("\x1b]1337;SetUserVar=in_editor\007")
>         else
>             io.stdout:write("\x1b]1337;SetUserVar=in_editor\007")
>         end
>     end,
> })
> ```
:::

These cause the editor to set the `in_editor` variable in kitty and
unset it when exiting. As a result, the `ctrl+shift+c`{.interpreted-text
role="kbd"} key will be passed to the editor instead of copying to
clipboard. In the editor, you can map it to copy to the clipboard,
thereby allowing use of a common shortcut both inside and outside the
editor for copying to clipboard.

:::: note
::: title
Note
:::

When using multi-key mappings, of the form `k1>k2`{.interpreted-text
role="kbd"} or similar, the condition applies to the first key and you
can have only one condition per key, the last in kitty.conf wins. In
particular, this means you cannot have multiple conditions applying to
multi-key mappings with the same first key and you cannot have mappings
with and without conditions applying to multi-keys with the same first
key.
::::

## Non-Latin keyboard layout support {#mapping-fallback}

When using a non-Latin keyboard layout (e.g. Russian, Arabic, Greek),
letter-key shortcuts like `Ctrl+C`{.interpreted-text role="kbd"} stop
working because the key produces a non-Latin character. kitty solves
this with the `--allow-fallback` option on the `map` directive, which
controls how shortcuts fall back to the physical key position.

The `--allow-fallback` option accepts a comma-separated list of fallback
types:

`shifted`

:   Fall back to the *shifted key* --- the character produced when Shift
    is held with the key. This is the default for all mappings and
    preserves the existing behavior.

`ascii`

:   Fall back to the *alternate key* --- the character that the physical
    key would produce in a standard US layout. This only triggers when
    the key produces a non-ASCII character, so it has no effect on
    Latin-based layouts like Dvorak or Colemak.

`none`

:   Disable all fallback matching. The mapping will only match the exact
    key specified, ignoring both shifted and alternate key positions.

For example:

``` conf
# Enable both shifted and ASCII fallback (used by default kitty shortcuts)
map --allow-fallback=shifted,ascii kitty_mod+c copy_to_clipboard

# Only ASCII fallback, no shifted key fallback
map --allow-fallback=ascii ctrl+s save_something

# Disable all fallback (neither shifted nor alternate key matching)
map --allow-fallback=none ctrl+x some_action
```

All default kitty shortcuts use `--allow-fallback=shifted,ascii`, so
they work out of the box with non-Latin layouts. Custom mappings without
an explicit `--allow-fallback` get the default value of `shifted`, which
preserves backward compatibility.

:::: note
::: title
Note
:::

The `ascii` fallback uses a non-ASCII guard: it only activates when the
key produces a character with a Unicode code point above 127. This means
alternative Latin layouts (Dvorak, Colemak, etc.) are never affected by
the `ascii` fallback --- only non-Latin layouts trigger it.
::::

## Sending arbitrary text or keys to the program running in kitty

This is accomplished by using `map` with
`send_text <send_text>`{.interpreted-text role="sc"} in
`kitty.conf`{.interpreted-text role="file"}. For example:

``` conf
map f1 send_text normal,application Hello, world!
```

Now, pressing `f1`{.interpreted-text role="kbd"} will cause
`Hello, world!` to show up at your shell prompt. To have the shell
execute a command sent via `send_text` you need to also simulate
pressing the enter key which is `\r`. For example:

``` conf
map f1 send_text normal,application echo Hello, world!\r
```

Now, if you press `f1`{.interpreted-text role="kbd"} when at shell
prompt it will run the `echo Hello, world!` command.

To have one key press send another key press, use
`send_key`{.interpreted-text role="ac"}:

``` conf
map alt+s send_key ctrl+s
```

This causes the program running in kitty to receive the
`ctrl+s`{.interpreted-text role="kbd"} key when you press the
`alt+s`{.interpreted-text role="kbd"} key. To see this in action, run:

``` conf
kitten show-key -m kitty
```

Which will print out what key events it receives.

## Modal mappings {#modal_mappings}

kitty has the ability, like vim, to use *modal* key maps. Except that
unlike vim it allows you to define your own arbitrary number of modes.
To create a new mode, use
`map --new-mode <my mode name> <shortcut to enter mode>`. For example,
lets create a mode to manage windows: switching focus, moving the
window, etc.:

``` conf
# Create a new "manage windows" mode (mw)
map --new-mode mw kitty_mod+f7

# Switch focus to the neighboring window in the indicated direction using arrow keys
map --mode mw left neighboring_window left
map --mode mw right neighboring_window right
map --mode mw up neighboring_window up
map --mode mw down neighboring_window down

# Move the active window in the indicated direction
map --mode mw shift+up move_window up
map --mode mw shift+left move_window left
map --mode mw shift+right move_window right
map --mode mw shift+down move_window down

# Resize the active window
map --mode mw n resize_window narrower
map --mode mw w resize_window wider
map --mode mw t resize_window taller
map --mode mw s resize_window shorter

# Exit the manage window mode
map --mode mw esc pop_keyboard_mode
```

Now, if you run kitty as:

``` sh
kitty -o enabled_layouts=vertical --session <(echo "launch\nlaunch\nlaunch")
```

Press `Ctrl+Shift+F7`{.interpreted-text role="kbd"} to enter the mode
and then press the up and down arrow keys to focus the next/previous
window. Press `Shift+Up`{.interpreted-text role="kbd"} or
`Shift+Down`{.interpreted-text role="kbd"} to move the active window up
and down. Press `t`{.interpreted-text role="kbd"} to make the active
window taller and `s`{.interpreted-text role="kbd"} to make it shorter.
To exit the mode press `Esc`{.interpreted-text role="kbd"}.

Pressing an unknown key while in a custom keyboard mode by default
beeps. This can be controlled by the `map --on-unknown` option as shown
below:

``` conf
# Beep on unknown keys
map --new-mode XXX --on-unknown beep ...
# Ignore unknown keys silently
map --new-mode XXX --on-unknown ignore ...
# Beep and exit the keyboard mode on unknown key
map --new-mode XXX --on-unknown end ...
# Pass unknown keys to the program running in the active window
map --new-mode XXX --on-unknown passthrough ...
```

When a key matches an action in a custom keyboard mode, the action is
performed and the custom keyboard mode remains in effect. If you would
rather have the keyboard mode end after the action you can use
`map --on-action` as shown below:

``` conf
# Have this keyboard mode automatically exit after performing any action
map --new-mode XXX --on-action end ...
```

## All mappable actions

There is a list of `all mappable actions <actions>`{.interpreted-text
role="doc"}.

## Debugging mapping issues

To debug mapping issues, kitty has several facilities. First, when you
run kitty with the `--debug-input` command line flag it outputs details
about all key events it receives form the system and how they are
handled.

To see what key events are sent to applications, run kitty like this:

``` conf
kitty kitten show-key
```

Press the keys you want to debug and the kitten will print out the bytes
it receives. Note that this uses the legacy terminal keyboard protocol
that does not support all keys and key events. To debug the
`full kitty keyboard
protocol that <keyboard-protocol>`{.interpreted-text role="doc"} that is
nowadays being adopted by more and more programs, use:

``` conf
kitty kitten show-key -m kitty
```
# Mark text on screen

kitty has the ability to mark text on the screen based on regular
expressions. This can be useful to highlight words or phrases when
browsing output from long running programs or similar. Lets start with a
few examples:

# Examples

Suppose we want to be able to highlight the word `ERROR` in the current
window. Add the following to `kitty.conf`{.interpreted-text
role="file"}:

    map f1 toggle_marker text 1 ERROR

Now when you press `F1`{.interpreted-text role="kbd"}, all instances of
the word `ERROR` will be highlighted. To turn off the highlighting,
press `F1`{.interpreted-text role="kbd"} again. If you want to make it
case-insensitive, use:

    map f1 toggle_marker itext 1 ERROR

To make it match only complete words, use:

    map f1 toggle_marker regex 1 \\bERROR\\b

Suppose you want to highlight both `ERROR` and `WARNING`, case
insensitively:

    map f1 toggle_marker iregex 1 \\bERROR\\b 2 \\bWARNING\\b

kitty supports up to 3 mark groups (the numbers in the commands above).
You can control the colors used for these groups in
`kitty.conf`{.interpreted-text role="file"} with:

    mark1_foreground red
    mark1_background gray
    mark2_foreground green
    ...

:::: note
::: title
Note
:::

For performance reasons, matching is done per line only, and only when
that line is altered in any way. So you cannot match text that stretches
across multiple lines.
::::

# Creating markers dynamically

If you want to create markers dynamically rather than pre-defining them
in `kitty.conf`{.interpreted-text role="file"}, you can do so as
follows:

    map f1 create_marker
    map f2 remove_marker

Then pressing `F1`{.interpreted-text role="kbd"} will allow you to enter
the marker definition and set it and pressing `F2`{.interpreted-text
role="kbd"} will remove the marker. `create_marker`{.interpreted-text
role="ac"} accepts the same syntax as `toggle_marker`{.interpreted-text
role="ac"} above. Note that while creating markers, the prompt has
history so you can easily re-use previous marker expressions.

You can also use the facilities for `remote-control`{.interpreted-text
role="doc"} to dynamically add or remove markers.

# Scrolling to marks

kitty has a `scroll_to_mark`{.interpreted-text role="ac"} action to
scroll to the next line that contains a mark. You can use it by mapping
it to some shortcut in `kitty.conf`{.interpreted-text role="file"}:

    map ctrl+p scroll_to_mark prev
    map ctrl+n scroll_to_mark next

Then pressing `Ctrl+P`{.interpreted-text role="kbd"} will scroll to the
first line in the scrollback buffer above the current top line that
contains a mark. Pressing `Ctrl+N`{.interpreted-text role="kbd"} will
scroll to show the first line below the current last line that contains
a mark. If you wish to jump to a mark of a specific type, you can add
that to the mapping:

    map ctrl+1 scroll_to_mark prev 1

Which will scroll only to marks of type 1.

# The full syntax for creating marks

The syntax of the `toggle_marker`{.interpreted-text role="ac"} action
is:

    toggle_marker <marker-type> <specification>

Here `marker-type` is one of:

-   `text` - Simple substring matching
-   `itext` - Case-insensitive substring matching
-   `regex` - A Python regular expression
-   `iregex` - A case-insensitive Python regular expression
-   `function` - An arbitrary function defined in a Python file, see
    `marker_funcs`{.interpreted-text role="ref"}.

# Arbitrary marker functions {#marker_funcs}

You can create your own marker functions. Create a Python file named
`mymarker.py`{.interpreted-text role="file"} and in it create a `marker`
function. This function receives the text of the line as input and must
yield three numbers, the starting character position, the ending
character position and the mark group (1-3). For example:

``` 
def marker(text):
    # Function to highlight the letter X
    for i, ch in enumerate(text):
        if ch.lower() == 'x':
            yield i, i, 3
```

Save this file somewhere and in `kitty.conf`{.interpreted-text
role="file"}, use:

    map f1 toggle_marker function /path/to/mymarker.py

If you save the file in the
`kitty config directory <confloc>`{.interpreted-text role="ref"}, you
can use:

    map f1 toggle_marker function mymarker.py
# Miscellaneous protocol extensions

These are a few small protocol extensions kitty implements, primarily
for use by its own kitten, they are documented here for completeness.

## Simple save/restore of all terminal modes

XTerm has the XTSAVE/XTRESTORE escape codes to save and restore terminal
private modes. However, they require specifying an explicit list of
modes to save/restore. kitty extends this protocol to specify that when
no modes are specified, all side-effect free modes should be
saved/restored. By side-effects we mean things that can affect other
terminal state such as cursor position or screen contents. Examples of
modes that have side effects are:
[DECOM](https://vt100.net/docs/vt510-rm/DECOM.html) and
[DECCOLM](https://vt100.net/docs/vt510-rm/DECCOLM.html).

This allows TUI applications to easily save and restore emulator state
without needing to maintain lists of modes.

## Independent control of bold and faint SGR properties

In common terminal usage, bold is set via SGR 1 and faint by SGR 2.
However, there is only one number to reset these attributes, SGR 22,
which resets both. There is no way to reset one and not the other. kitty
uses 221 and 222 to reset bold and faint independently.

## Reporting when the mouse leaves the window {#mouse_leave_window}

kitty extends the SGR Pixel mouse reporting protocol created by xterm to
also report when the mouse leaves the window. This event is delivered
encoded as a normal SGR pixel event except that the eight bit is set on
the first number. Additionally, bit 5 is set to indicate this is a
motion related event. The remaining bits 1-7 (except 5) are used to
encode button and modifier information. When bit 8 is set it means the
event is a mouse has left the window event, and all other bits should be
ignored. The pixel position values must also be ignored as they may not
be accurate.

## An escape code to move the contents of the screen into the scrollback

The escape code is `\x1b [ 22 J` (ignoring spaces present for clarity).
It moves all screen contents (text and images) into the scrollback
leaving the screen in the same state as it would be if the standard
screen clear escape code had been used `\x1b [ 2 J`.

## kitty specific private escape codes

These are a family of escape codes used by kitty for various things
including remote control. They are all DCS (Device Control String)
escape codes starting with `\x1b P @ kitty-` (ignoring spaces present
for clarity).
# The multiple cursors protocol

::: versionadded
0.43.0
:::

Many editors support something called *multiple cursors* in which you
can make the same changes at multiple locations in a file and the editor
shows you cursors at each of the locations. In a terminal context
editors typically implement this by showing some Unicode glyph at each
location instead of the actual cursor. This is sub-optimal since actual
cursors implemented by the terminal have many niceties like smooth
animation [\[anim\]](#anim){.citation}, auto adjust colors
[\[rv\]](#rv){.citation}, etc. To address this and other use cases, this
protocol allows terminal programs to request that the terminal display
multiple cursors at specific locations on the screen.

## Quickstart

An example, showing how to use the protocol:

``` sh
# Show cursors of the same shape as the main cursor at y=4, x=5
printf "\e[>29;2:4:5 q"
# Show more cursors on the seventh line, of various shapes, the underline shape is shown twice
printf "\e[>1;2:7:1 q\e[>2;2:7:3 q\e[>3;2:7:5;2:7:7 q"
```

The escape code to show a cursor has the following structure (ignore
spaces they are present for readability only):

    CSI > SHAPE;CO-ORD TYPE : CO-ORDINATES ; CO-ORD TYPE : CO-ORDINATES ... TRAILER

Here `CSI` is the two bytes ESC (`0x1b`) and \[ (`0x5b`). `SHAPE` can be
one of:

-   `0`: No cursor
-   `1`: Block cursor
-   `2`: Beam cursor
-   `3`: Underline cursor
-   `29`: Follow the shape of the main cursor
-   `30`: Change the color of text under extra cursors
-   `40`: Change the color of extra cursors
-   `100`: Used for querying currently set cursors

`CO-ORD TYPE` can be one of:

-   `0`: This refers to the position of the main cursor and has no
    following co-ordinates.
-   `2`: In this case the following co-ordinates are pairs of numbers
    pointing to cells in the form `y:x` with the origin in the top left
    corner at `1,1`. There can be any number of pairs, the terminal must
    treat each pair as a new location to set a cursor.
-   `4`: In this case the following co-ordinates are sets of four
    numbers that define a rectangle in the same co-ordinate system as
    above of the form: `top:left:bottom:right`. The shape is set on
    every cell in the rectangle from the top left cell to the bottom
    right cell, inclusive. If no numbers are provided, the rectangle is
    the full screen. There can be any number of rectangles, the terminal
    must treat each set of four numbers as a new rectangle.

The sequence of `CO-ORD TYPE : CO-ORDINATES` can be repeated any number
of times separated by `;`. The `SHAPE` will be set on the cells
indicated by each such group. For example: `-1;2:3:4;4:5:6:7:8` will set
the shape `-1` at the cell `(3, 2)` and in the rectangle `(6, 5)` to
`(8, 7)` inclusive.

Finally, the `TRAILER` terminates the sequence and is the bytes SPACE
(`0x20`) and q (`0x71`).

Terminals **must** ignore cells that fall outside the screen. That
means, for rectangle co-ordinates only the intersection of the rectangle
with the screen must be considered, and point co-ordinates that fall
outside of the screen are simply ignored, with no effect.

Terminals **must** ignore extra co-ordinates, that means if an odd
number of co-ordinates are specified for type `2` the last co-ordinate
is ignored. Similarly for type `4` if the number of co-ordinates is not
a multiple of four, the last `1 <= n <= 3` co-ordinates are ignored, as
if they were not specified.

## Querying for support

A terminal program can query the terminal emulator for support of this
protocol by sending the escape code:

    CSI > TRAILER

In this case a supporting terminal must reply with:

    CSI > 1;2;3;29;30;40;100;101 TRAILER

Here, the list of numbers indicates the cursor shapes and other
operations the terminal supports and can be any subset of the above. No
numbers indicates the protocol is not supported. To avoid having to wait
with a timeout for a response from the terminal, the client should send
this query code immediately followed by a request for the [primary
device attributes](https://vt100.net/docs/vt510-rm/DA1.html). If the
terminal responds with an answer for the device attributes without an
answer for the *query* the terminal emulator does not support this
protocol at all.

Terminals **must** respond to these queries in FIFO order, so that
multiplexers that split a single screen know which split to send
responses too.

## Clearing previously set multi-cursors

The cursor at a cell is cleared by setting its shape to `0`. The most
common operation is to clear all previously set multi-cursors. This is
easily done using the *rectangle* co-ordinate system above, like this:

    CSI > 0;4 TRAILER

For more precise control different co-ordinate types can be used. This
is particularly important for multiplexers that split up the screen and
therefore need to re-write these escape codes.

## Changing the color of extra cursors {#extra_cursor_color}

In order to visually distinguish extra cursors from the main cursor, it
is possible to specify a color pair for extra cursors. Note that for
performance reasons, there is only a single color pair that all extra
cursors share. The color pair consists of the cursor color and the color
for text in the cell the cursor is on.

To change this color pair use an escape code of the form:

    CSI > WHICH ; COLOR_SPACE : COLOR_PARAMETER1 : COLOR_PARAMETER2 : ... TRAILER

Here, `WHICH` is `30` to set the color of text under the cursor and `40`
to set the color of the cursor itself (these numbers mimic the SGR codes
for foreground and background respectively).

The `COLOR_SPACE` parameter sets the type of color, it can take values:

`0` - unset color is same as for main cursor. No color parameters. `1` -
*special* which typically means some kind of reverse video effect, see
below `2` - sRGB color, with three color parameters, red, green and blue
as numbers from 0 to 255 `5` - Indexed color with one color parameter
which is an index into the color table from 0 to 255

When the cursor color is set to *special* via `40` it means the block
cursor must be rendered with a reverse video effect where the cursor
color becomes the foreground color of the cell under the cursor and the
foreground color of the cell becomes its background color.
Implementations are free to adjust these colors to ensure suitable
contrast levels. In this case the text color set by `30` must be
ignored.

When the cursor color is not set to *special* but the text color via
`30` is set to special, then that means the foreground color of the cell
with the cursor must be changed to its background color for a partial
reverse video effect.

When unset, aka, set to `0` the cursors must be the same color as the
main cursor. In particular if the main color is using a reverse video
effect, the extra cursors must use the exact same colors as the main
cursor, not the colors of the cells they are on.

## Querying for already set cursors

Programs can ask the terminal what extra cursors are currently set, by
sending the escape code:

    CSI > 100 TRAILER

The terminal must respond with **one** escape code:

    CSI > 100; SHAPE:CO-ORDINATE TYPE:CO-ORDINATES ; ... TRAILER

Here, the `SHAPE:CO-ORDINATE TYPE:CO-ORDINATES` block can be repeated
any number of times, separated by `;`. This response gives the set of
shapes and positions currently active. If no cursors are currently
active, there will be no blocks, just an empty response of the form:

    CSI > 100 TRAILER

Again, terminals **must** respond in FIFO order so that multiplexers
know where to direct the responses.

## Querying for extra cursor colors

Programs can ask the terminal what cursor colors are currently set, by
sending escape code:

    CSI > 101 TRAILER

The terminal must respond with **one** escape code:

    CSI > 101 ; 30 : COLOR_SPACE : COLOR_PARAMETERS ; 40 : COLOR_SPACE : COLOR_PARAMETERS TRAILER

The number and type of `COLOR_PARAMETERS` depends on the preceding
`COLOR_SPACE` and can be omitted for some `COLOR_SPACE` values. See the
section `extra_cursor_color`{.interpreted-text role="ref"} for details.

## Interaction with other terminal controls and state

**The main cursor**

:   The extra cursors must all have the same color and opacity and blink
    state as the main cursor. The main cursor\'s visibility must not
    affect the visibility of the extra cursors. Their visibility and
    shape are controlled only by this protocol.

**Clearing the screen**

:   The escape codes used to clear the screen
    ([ED](https://vt100.net/docs/vt510-rm/ED.html)) with parameters 2, 3
    and 22 must remove all extra cursors, this is so that the clear
    command can be used by users to clear the screen of extra cursors.

**Reset**\*

:   This must remove all extra cursors.

**Alternate screen**\*

:   Switching between the main and alternate screens must remove all
    extra cursors.

**Scrolling**

:   The index (IND) and reverse index (RI) escape codes that cause
    screen contents to scroll into scrollback or off screen must not
    affect the extra cursors in any way. They remain at exactly the same
    position. It is up to applications to manage extra cursor positions
    when using these escape codes if needed. There are not a lot of use
    cases for scrolling extra cursors with screen content, since extra
    cursors are meant to be ephemeral and on screen only, not in
    scrollback. This allows terminals to avoid the extra overhead of
    adjusting positions of the extra cursors on every scroll.

## Footnotes

::: {#citations}

[anim]{#anim .citation-label}

:   kitty allows the cursor blink to be `animated
    <cursor_blink_interval>`{.interpreted-text role="opt"} using any CSS
    easing function. This cannot be implemented using fake cursors.

[rv]{#rv .citation-label}

:   kitty has a special \"reverse video\" color mode for cursors where
    the color of the cursor and the text under the cursor is adjusted
    based on the color of the cell under the cursor. This also cannot be
    implemented using fake cursors.
:::
# Scripting the mouse click

[\|kitty\|](##SUBST##|kitty|) has support for
`terminal hyperlinks <hyperlinks>`{.interpreted-text role="term"}. These
are generated by many terminal programs, such as `ls`, `gcc`, `systemd`,
`tool_mcat`{.interpreted-text role="ref"}, etc. You can customize
exactly what happens when clicking on these hyperlinks in
[\|kitty\|](##SUBST##|kitty|).

You can tell kitty to take arbitrarily many, complex actions when a link
is clicked. Let us illustrate with some examples, first. Create the file
`~/.config/kitty/open-actions.conf`{.interpreted-text role="file"} with
the following:

``` conf
# Open any image in the full kitty window by clicking on it
protocol file
mime image/*
action launch --type=overlay kitten icat --hold -- ${FILE_PATH}
```

Now, run `ls --hyperlink=auto` in kitty and click on the filename of an
image, holding down `ctrl+shift`{.interpreted-text role="kbd"}. It will
be opened over the current window. Press any key to close it.

:::: note
::: title
Note
:::

The `ls`{.interpreted-text role="program"} comes with macOS does not
support hyperlink, you need to install [GNU
Coreutils](https://www.gnu.org/software/coreutils/). If you install it
via [Homebrew](https://formulae.brew.sh/formula/coreutils), it will be
`gls`{.interpreted-text role="program"}.
::::

Each entry in `open-actions.conf`{.interpreted-text role="file"}
consists of one or more `matching_criteria`{.interpreted-text
role="ref"}, such as `protocol` and `mime` and one or more `action`
entries. In the example above kitty uses the
`launch <launch>`{.interpreted-text role="doc"} action which can be used
to run external programs. Entries are separated by blank lines.

Actions are very powerful, anything that you can map to a key
combination in `kitty.conf`{.interpreted-text role="file"} can be used
as an action. You can specify more than one action per entry if you
like, for example:

``` conf
# Tail a log file (*.log) in a new OS Window and reduce its font size
protocol file
ext log
action launch --title ${FILE} --type=os-window tail -f -- ${FILE_PATH}
action change_font_size current -2
```

In the launch specification you can expand environment variables, as
shown in the examples above. In addition to regular environment
variables, there are some special variables, documented below:

`URL`

:   The full URL being opened

`FILE_PATH`

:   The path portion of the URL (unquoted)

`FILE`

:   The file portion of the path of the URL (unquoted)

`FRAGMENT`

:   The fragment (unquoted), if any of the URL or the empty string.

`NETLOC`

:   The net location aka hostname (unquoted), if any of the URL or the
    empty string.

`URL_PATH`

:   The path, query and fragment portions of the URL, without any
    unquoting.

`EDITOR`

:   The terminal based text editor. The configured
    `editor`{.interpreted-text role="opt"} in
    `kitty.conf`{.interpreted-text role="file"} is preferred.

`SHELL`

:   The path to the shell. The configured `shell`{.interpreted-text
    role="opt"} in `kitty.conf`{.interpreted-text role="file"} is
    preferred, without arguments.

:::: note
::: title
Note
:::

You can use the `action_alias`{.interpreted-text role="opt"} option just
as in `kitty.conf`{.interpreted-text role="file"} to define aliases for
frequently used actions.
::::

## Matching criteria {#matching_criteria}

An entry in `open-actions.conf`{.interpreted-text role="file"} must have
one or more matching criteria. URLs that match all criteria for an entry
will trigger that entry\'s actions. Processing stops at the first
matching entry, so put more specific matching criteria at the start of
the list. Entries in the file are separated by blank lines. The various
available criteria are:

`protocol`

:   A comma separated list of protocols, for example: `http, https`. If
    absent, there is no constraint on protocol.

`url`

:   A regular expression that must match against the entire (unquoted)
    URL

`fragment_matches`

:   A regular expression that must match against the fragment (part
    after #) in the URL

`mime`

:   A comma separated list of MIME types, for example:
    `text/*, image/*, application/pdf`. You can add MIME types to kitty
    by creating a file named `mime.types`{.interpreted-text role="file"}
    in the `kitty configuration directory <confloc>`{.interpreted-text
    role="ref"}. Useful if your system MIME database does not have
    definitions you need. This file is in the standard format of one
    definition per line, like: `text/plain rst md`. Note that the MIME
    type for directories is `inode/directory`. MIME types are detected
    based on file extension, not file contents.

`ext`

:   A comma separated list of file extensions, for example:
    `jpeg, tar.gz`

`file`

:   A shell glob pattern that must match the filename, for example:
    `image-??.png`

## Scripting the opening of files with kitty {#launch_actions}

On macOS you can use `Open With`{.interpreted-text role="guilabel"} in
Finder or drag and drop files and URLs onto the kitty dock icon to open
them with kitty. Similarly on Linux, you can associate certain files
types to open in kitty. The default actions are:

-   Open text files in your editor and images using the icat kitten.
-   Run shell scripts in a shell
-   Open SSH urls using the ssh command

These actions can also be executed from the command line by running:

    kitty +open file_or_url another_url ...

    # macOS only
    open -a kitty.app file_or_url another_url ...

Since macOS lacks an official interface to set default URL scheme
handlers, kitty has a command you can use for it. The first argument for
is the URL scheme, and the second optional argument is the bundle id of
the app, which defaults to kitty, if not specified. For example:

``` sh
# Set kitty as the handler for ssh:// URLs
kitty +runpy 'from kitty.fast_data_types import cocoa_set_url_handler; import sys; cocoa_set_url_handler(*sys.argv[1:]); print("OK")' ssh
# Set someapp as the handler for xyz:// URLs
kitty +runpy 'from kitty.fast_data_types import cocoa_set_url_handler; import sys; cocoa_set_url_handler(*sys.argv[1:]); print("OK")' xyz someapp.bundle.identifier
```

You can customize these actions by creating a
`launch-actions.conf`{.interpreted-text role="file"} file in the
`kitty config directory <confloc>`{.interpreted-text role="ref"}, just
like the `open-actions.conf`{.interpreted-text role="file"} file above.
For example:

::: {.literalinclude language="conf" start-at="# Open script files" end-before="'''.splitlines()))"}
../kitty/open[actions.py]{#actions.py}
:::
# Overview

## Design philosophy

[\|kitty\|](##SUBST##|kitty|) is designed for power keyboard users. To
that end all its controls work with the keyboard (although it fully
supports mouse interactions as well). Its configuration is a simple,
human editable, single file for easy reproducibility (I like to store
configuration in source control).

The code in [\|kitty\|](##SUBST##|kitty|) is designed to be simple,
modular and hackable. It is written in a mix of C (for performance
sensitive parts), Python (for easy extensibility and flexibility of the
UI) and Go (for the command line `kittens`{.interpreted-text
role="term"}). It does not depend on any large and complex UI toolkit,
using only OpenGL for rendering everything.

Finally, [\|kitty\|](##SUBST##|kitty|) is designed from the ground up to
support all modern terminal features, such as Unicode, true color,
bold/italic fonts, text formatting, etc. It even extends existing text
formatting escape codes, to add support for features not available
elsewhere, such as colored and styled (curly) underlines. One of the
design goals of [\|kitty\|](##SUBST##|kitty|) is to be easily extensible
so that new features can be added in the future with relatively little
effort.

## Tabs and Windows

[\|kitty\|](##SUBST##|kitty|) is capable of running multiple programs
organized into tabs and windows. The top level of organization is the
`OS window <os_window>`{.interpreted-text role="term"}. Each OS window
consists of one or more `tabs <tab>`{.interpreted-text role="term"}.
Each tab consists of one or more
`kitty windows <window>`{.interpreted-text role="term"}. The kitty
windows can be arranged in multiple different
`layouts <layout>`{.interpreted-text role="term"}, like windows are
organized in a tiling window manager. The keyboard controls (which are
`all customizable
<conf-kitty-shortcuts>`{.interpreted-text role="ref"}) for tabs and
windows are:

### Scrolling

  Action                      Shortcut
  --------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------
  Line up                     `scroll_line_up`{.interpreted-text role="sc"} (also `⌥+⌘+⇞`{.interpreted-text role="kbd"} and `⌘+↑`{.interpreted-text role="kbd"} on macOS)
  Line down                   `scroll_line_down`{.interpreted-text role="sc"} (also `⌥+⌘+⇟`{.interpreted-text role="kbd"} and `⌘+↓`{.interpreted-text role="kbd"} on macOS)
  Page up                     `scroll_page_up`{.interpreted-text role="sc"} (also `⌘+⇞`{.interpreted-text role="kbd"} on macOS)
  Page down                   `scroll_page_down`{.interpreted-text role="sc"} (also `⌘+⇟`{.interpreted-text role="kbd"} on macOS)
  Top                         `scroll_home`{.interpreted-text role="sc"} (also `⌘+↖`{.interpreted-text role="kbd"} on macOS)
  Bottom                      `scroll_end`{.interpreted-text role="sc"} (also `⌘+↘`{.interpreted-text role="kbd"} on macOS)
  Previous shell prompt       `scroll_to_previous_prompt`{.interpreted-text role="sc"} (see `shell_integration`{.interpreted-text role="ref"})
  Next shell prompt           `scroll_to_next_prompt`{.interpreted-text role="sc"} (see `shell_integration`{.interpreted-text role="ref"})
  Browse scrollback in less   `show_scrollback`{.interpreted-text role="sc"}
  Browse last cmd output      `show_last_command_output`{.interpreted-text role="sc"} (see `shell_integration`{.interpreted-text role="ref"})
  Search scrollback in less   `search_scrollback`{.interpreted-text role="sc"} (also `⌘+F`{.interpreted-text role="kbd"} on macOS)

The scroll actions only take effect when the terminal is in the main
screen. When the alternate screen is active (for example when using a
full screen program like an editor) the key events are instead passed to
program running in the terminal.

### Tabs

  Action              Shortcut
  ------------------- ---------------------------------------------------------------------------------------------------------------------------------------------
  New tab             `new_tab`{.interpreted-text role="sc"} (also `⌘+t`{.interpreted-text role="kbd"} on macOS)
  Close tab           `close_tab`{.interpreted-text role="sc"} (also `⌘+w`{.interpreted-text role="kbd"} on macOS)
  Next tab            `next_tab`{.interpreted-text role="sc"} (also `⌃+⇥`{.interpreted-text role="kbd"} and `⇧+⌘+]`{.interpreted-text role="kbd"} on macOS)
  Previous tab        `previous_tab`{.interpreted-text role="sc"} (also `⇧+⌃+⇥`{.interpreted-text role="kbd"} and `⇧+⌘+[`{.interpreted-text role="kbd"} on macOS)
  Next layout         `next_layout`{.interpreted-text role="sc"}
  Move tab forward    `move_tab_forward`{.interpreted-text role="sc"}
  Move tab backward   `move_tab_backward`{.interpreted-text role="sc"}
  Set tab title       `set_tab_title`{.interpreted-text role="sc"} (also `⇧+⌘+i`{.interpreted-text role="kbd"} on macOS)

### Windows

  Action                  Shortcut
  ----------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  New window              `new_window`{.interpreted-text role="sc"} (also `⌘+↩`{.interpreted-text role="kbd"} on macOS)
  New OS window           `new_os_window`{.interpreted-text role="sc"} (also `⌘+n`{.interpreted-text role="kbd"} on macOS)
  Close window            `close_window`{.interpreted-text role="sc"} (also `⇧+⌘+d`{.interpreted-text role="kbd"} on macOS)
  Resize window           `start_resizing_window`{.interpreted-text role="sc"} (also `⌘+r`{.interpreted-text role="kbd"} on macOS)
  Next window             `next_window`{.interpreted-text role="sc"}
  Previous window         `previous_window`{.interpreted-text role="sc"}
  Move window forward     `move_window_forward`{.interpreted-text role="sc"}
  Move window backward    `move_window_backward`{.interpreted-text role="sc"}
  Move window to top      `move_window_to_top`{.interpreted-text role="sc"}
  Visually focus window   `focus_visible_window`{.interpreted-text role="sc"}
  Visually swap window    `swap_with_window`{.interpreted-text role="sc"}
  Focus specific window   `first_window`{.interpreted-text role="sc"}, `second_window`{.interpreted-text role="sc"} \... `tenth_window`{.interpreted-text role="sc"} (also `⌘+1`{.interpreted-text role="kbd"}, `⌘+2`{.interpreted-text role="kbd"} \... `⌘+9`{.interpreted-text role="kbd"} on macOS) (clockwise from the top-left)

Additionally, you can define shortcuts in `kitty.conf`{.interpreted-text
role="file"} to focus neighboring windows and move windows around
(similar to window movement in `vim`{.interpreted-text role="program"}):

    map ctrl+left neighboring_window left
    map shift+left move_window right
    map ctrl+down neighboring_window down
    map shift+down move_window up
    ...

You can also define a shortcut to switch to the previously active
window:

    map ctrl+p nth_window -1

`nth_window`{.interpreted-text role="ac"} will focus the nth window for
positive numbers (starting from zero) and the previously active windows
for negative numbers.

To switch to the nth OS window, you can define
`nth_os_window`{.interpreted-text role="ac"}. Only positive numbers are
accepted, starting from one.

::: {#detach_window}
You can define shortcuts to detach the current window and move it to
another tab or another OS window:

    # moves the window into a new OS window
    map ctrl+f2 detach_window
    # moves the window into a new tab
    map ctrl+f3 detach_window new-tab
    # moves the window into the previously active tab
    map ctrl+f3 detach_window tab-prev
    # moves the window into the tab at the left of the active tab
    map ctrl+f3 detach_window tab-left
    # moves the window into a new tab created to the left of the active tab
    map ctrl+f3 detach_window new-tab-left
    # asks which tab to move the window into
    map ctrl+f4 detach_window ask
:::

Similarly, you can detach the current tab, with:

    # moves the tab into a new OS window
    map ctrl+f2 detach_tab
    # asks which OS Window to move the tab into
    map ctrl+f4 detach_tab ask

Note that tabs can be re-arranged, detached and moved to another OS
Window in the same kitty instance using drag and drop.

Finally, you can define a shortcut to close all windows in a tab other
than the currently active window:

    map f9 close_other_windows_in_tab

## Other keyboard shortcuts

The full list of actions that can be mapped to key presses is available
`here </actions>`{.interpreted-text role="doc"}. To learn how to do more
sophisticated keyboard mappings, such as modal mappings, per application
mappings, etc. see `mapping`{.interpreted-text role="doc"}.

  Action                                               Shortcut
  ---------------------------------------------------- ------------------------------------------------------------------------------------------------------------------
  Show this help                                       `show_kitty_doc`{.interpreted-text role="sc"}
  Copy to clipboard                                    `copy_to_clipboard`{.interpreted-text role="sc"} (also `⌘+c`{.interpreted-text role="kbd"} on macOS)
  Paste from clipboard                                 `paste_from_clipboard`{.interpreted-text role="sc"} (also `⌘+v`{.interpreted-text role="kbd"} on macOS)
  Paste from selection                                 `paste_from_selection`{.interpreted-text role="sc"}
  Pass selection to program                            `pass_selection_to_program`{.interpreted-text role="sc"}
  Increase font size                                   `increase_font_size`{.interpreted-text role="sc"} (also `⌘++`{.interpreted-text role="kbd"} on macOS)
  Decrease font size                                   `decrease_font_size`{.interpreted-text role="sc"} (also `⌘+-`{.interpreted-text role="kbd"} on macOS)
  Restore font size                                    `reset_font_size`{.interpreted-text role="sc"} (also `⌘+0`{.interpreted-text role="kbd"} on macOS)
  Toggle fullscreen                                    `toggle_fullscreen`{.interpreted-text role="sc"} (also `⌃+⌘+f`{.interpreted-text role="kbd"} on macOS)
  Toggle maximized                                     `toggle_maximized`{.interpreted-text role="sc"}
  Input Unicode character                              `input_unicode_character`{.interpreted-text role="sc"} (also `⌃+⌘+space`{.interpreted-text role="kbd"} on macOS)
  Open URL in web browser                              `open_url`{.interpreted-text role="sc"}
  Reset the terminal                                   `reset_terminal`{.interpreted-text role="sc"} (also `⌥+⌘+r`{.interpreted-text role="kbd"} on macOS)
  Edit `kitty.conf`{.interpreted-text role="file"}     `edit_config_file`{.interpreted-text role="sc"} (also `⌘+,`{.interpreted-text role="kbd"} on macOS)
  Reload `kitty.conf`{.interpreted-text role="file"}   `reload_config_file`{.interpreted-text role="sc"} (also `⌃+⌘+,`{.interpreted-text role="kbd"} on macOS)
  Debug `kitty.conf`{.interpreted-text role="file"}    `debug_config`{.interpreted-text role="sc"} (also `⌥+⌘+,`{.interpreted-text role="kbd"} on macOS)
  Open a [\|kitty\|](##SUBST##|kitty|) shell           `kitty_shell`{.interpreted-text role="sc"}
  Increase background opacity                          `increase_background_opacity`{.interpreted-text role="sc"}
  Decrease background opacity                          `decrease_background_opacity`{.interpreted-text role="sc"}
  Full background opacity                              `full_background_opacity`{.interpreted-text role="sc"}
  Reset background opacity                             `reset_background_opacity`{.interpreted-text role="sc"}

## Configuring kitty

[\|kitty\|](##SUBST##|kitty|) is highly configurable, everything from
keyboard shortcuts to painting frames-per-second. Press
`edit_config_file`{.interpreted-text role="sc"} in kitty to open its
fully commented sample config file in your text editor. For details see
the `configuration docs <conf>`{.interpreted-text role="doc"}.

You can quickly browse all available mappable actions by pressing
`command_palette`{.interpreted-text role="sc"}, see
`kittens/command-palette`{.interpreted-text role="doc"} for details.

::: {.toctree hidden=""}
conf
:::

## Layouts

A `layout`{.interpreted-text role="term"} is an arrangement of multiple
`kitty windows <window>`{.interpreted-text role="term"} inside a
top-level `OS window <os_window>`{.interpreted-text role="term"}. The
layout manages all its windows automatically, resizing and moving them
as needed. You can create a new `window`{.interpreted-text role="term"}
using the `new_window`{.interpreted-text role="sc"} key combination.

Currently, there are seven layouts available:

-   **Fat** \-- One (or optionally more) windows are shown full width on
    the top, the rest of the windows are shown side-by-side on the
    bottom
-   **Grid** \-- All windows are shown in a grid
-   **Horizontal** \-- All windows are shown side-by-side
-   **Splits** \-- Windows arranged in arbitrary patterns created using
    horizontal and vertical splits
-   **Stack** \-- Only a single maximized window is shown at a time
-   **Tall** \-- One (or optionally more) windows are shown full height
    on the left, the rest of the windows are shown one below the other
    on the right
-   **Vertical** \-- All windows are shown one below the other

By default, all layouts are enabled and you can switch between layouts
using the `next_layout`{.interpreted-text role="sc"} key combination.
You can also create shortcuts to select particular layouts, and choose
which layouts you want to enable, see
`conf-kitty-shortcuts.layout`{.interpreted-text role="ref"} for
examples. The first layout listed in `enabled_layouts`{.interpreted-text
role="opt"} becomes the default layout.

For more details on the layouts and how to use them see
`the documentation
<layouts>`{.interpreted-text role="doc"}.

::: {.toctree hidden=""}
layouts
:::

## Extending kitty

kitty has a powerful framework for scripting. You can create small
terminal programs called `kittens <kittens_intro>`{.interpreted-text
role="doc"}. These can be used to add features to kitty, for example,
`editing remote files <kittens/remote_file>`{.interpreted-text
role="doc"} or
`inputting Unicode characters <kittens/unicode_input>`{.interpreted-text
role="doc"}. They can also be used to create programs that leverage
kitty\'s powerful features, for example,
`viewing images <kittens/icat>`{.interpreted-text role="doc"} or
`diffing files with image support
<kittens/diff>`{.interpreted-text role="doc"}.

You can `create your own kittens to scratch your own itches
<kittens/custom>`{.interpreted-text role="doc"}.

For a list of all the builtin kittens, run `kitten` in kitty, or to
browse some of the more prominent ones, see
`see here <kittens>`{.interpreted-text role="ref"}.

Additionally, you can use the `watchers <Watchers>`{.interpreted-text
role="ref"} framework to create Python scripts that run in response to
various events such as windows being resized, closing, having their
titles changed, etc.

Finally, there is remote control which allows you to control kitty from
anywhere, even across a network! See below for more about remote
control.

::: {.toctree hidden=""}
kittens[intro]{#intro}
:::

## Remote control

[\|kitty\|](##SUBST##|kitty|) has a very powerful system that allows you
to control it from the
`shell prompt, even over SSH <remote-control>`{.interpreted-text
role="doc"}. You can change colors, fonts, open new
`windows <window>`{.interpreted-text role="term"},
`tabs <tab>`{.interpreted-text role="term"}, set their titles, change
window layout, get text from one window and send text to another, etc.
The possibilities are endless. See the
`tutorial <remote-control>`{.interpreted-text role="doc"} to get
started.

::: {.toctree hidden=""}
remote-control
:::

## Sessions

You can control the `tabs <tab>`{.interpreted-text role="term"},
`kitty window <window>`{.interpreted-text role="term"} layout, working
directory, startup programs, etc. by creating a *session* file and using
the `kitty --session`{.interpreted-text role="option"} command line flag
or the `startup_session`{.interpreted-text role="opt"} option in
`kitty.conf`{.interpreted-text role="file"}. You can also easily switch
between sessions with a keypress. See `sessions`{.interpreted-text
role="doc"} for details.

## Creating tabs/windows

kitty can be told to run arbitrary programs in new
`tabs <tab>`{.interpreted-text role="term"},
`windows <window>`{.interpreted-text role="term"} or
`overlays <overlay>`{.interpreted-text role="term"} at a keypress. To
learn how to do this, see `here <launch>`{.interpreted-text role="doc"}.

::: {.toctree hidden=""}
launch
:::

## Mouse features

-   You can click on a URL to open it in a browser.
-   You can double click to select a word and then drag to select more
    words.
-   You can triple click to select a line and then drag to select more
    lines.
-   You can triple click while holding `Ctrl+Alt`{.interpreted-text
    role="kbd"} to select from clicked point to end of line.
-   You can right click to extend a previous selection.
-   You can hold down `Ctrl+Alt`{.interpreted-text role="kbd"} and drag
    with the mouse to select in columns.
-   Selecting text automatically copies it to the primary clipboard (on
    platforms with a primary clipboard).
-   You can middle click to paste from the primary clipboard (on
    platforms with a primary clipboard).
-   You can right click while holding `Ctrl+Shift`{.interpreted-text
    role="kbd"} to open the output of the clicked on command in a pager
    (requires `shell_integration`{.interpreted-text role="ref"})
-   You can select text with kitty even when a terminal program has
    grabbed the mouse by holding down the `Shift`{.interpreted-text
    role="kbd"} key

All these actions can be customized in `kitty.conf`{.interpreted-text
role="file"} as described
`here <conf-kitty-mouse.mousemap>`{.interpreted-text role="ref"}.

You can also customize what happens when clicking on
`hyperlinks`{.interpreted-text role="term"} in kitty, having it open
files in your editor, download remote files, open things in your
browser, etc. For details, see `here <open_actions>`{.interpreted-text
role="doc"}.

Additionally, various bits of the kitty UI itself work with the mouse.
You can drag and drop tabs in the tab bar to re-order them or move them
from one OS Window to another, or even pop them out into a new OS
Window. You can drag window borders to resize windows. You can double
click on empty regions of the tab bar to create new tabs or double click
on an existing tab to rename it.

::: {.toctree hidden=""}
open[actions]{#actions}
:::

## Font control

[\|kitty\|](##SUBST##|kitty|) has extremely flexible and powerful font
selection features. You can specify individual families for the regular,
bold, italic and bold+italic fonts. You can even specify specific font
families for specific ranges of Unicode characters. This allows precise
control over text rendering. It can come in handy for applications like
powerline, without the need to use patched fonts. See the various font
related configuration directives in `conf-kitty-fonts`{.interpreted-text
role="ref"}.

## The scrollback buffer {#scrollback}

[\|kitty\|](##SUBST##|kitty|) supports scrolling back to view history,
just like most terminals. You can use either keyboard shortcuts or the
mouse scroll wheel to do so. [\|kitty\|](##SUBST##|kitty|) displays an
interactive `scrollbar`{.interpreted-text role="opt"} along the right
edge of the window that shows your current position in the scrollback.
You can click and drag the scrollbar to quickly navigate through the
history.

However, [\|kitty\|](##SUBST##|kitty|) has an extra, neat feature.
Sometimes you need to explore the scrollback buffer in more detail,
maybe search for some text or refer to it side-by-side while typing in a
follow-up command. [\|kitty\|](##SUBST##|kitty|) allows you to do this
by pressing the `show_scrollback`{.interpreted-text role="sc"} shortcut,
which will open the scrollback buffer in your favorite pager program
(which is `less`{.interpreted-text role="program"} by default). Colors
and text formatting are preserved. You can explore the scrollback buffer
comfortably within the pager.

Additionally, you can pipe the contents of the scrollback buffer to an
arbitrary, command running in a new `window`{.interpreted-text
role="term"}, `tab`{.interpreted-text role="term"} or
`overlay`{.interpreted-text role="term"}. For example:

    map f1 launch --stdin-source=@screen_scrollback --stdin-add-formatting less +G -R

Would open the scrollback buffer in a new `window`{.interpreted-text
role="term"} when you press the `F1`{.interpreted-text role="kbd"} key.
See `show_scrollback <show_scrollback>`{.interpreted-text role="sc"} for
details.

If you want to use it with an editor such as `nvim`{.interpreted-text
role="program"} to get more powerful features, see for example,
[kitty-scrollback.nvim](https://github.com/mikesmithgh/kitty-scrollback.nvim)
or [kitty-grab](https://github.com/yurikhan/kitty_grab) or see more tips
for using various editor programs, in
`this thread <719>`{.interpreted-text role="iss"}.

If you wish to store very large amounts of scrollback to view using the
piping or `show_scrollback <show_scrollback>`{.interpreted-text
role="sc"} features, you can use the
`scrollback_pager_history_size`{.interpreted-text role="opt"} option.

## Integration with shells

kitty has the ability to integrate closely within common shells, such as
[zsh](https://www.zsh.org/), [fish](https://fishshell.com) and
[bash](https://www.gnu.org/software/bash/) to enable features such as
jumping to previous prompts in the scrollback, viewing the output of the
last command in `less`{.interpreted-text role="program"}, using the
mouse to move the cursor while editing prompts, etc. See
`shell-integration`{.interpreted-text role="doc"} for details.

::: {.toctree hidden=""}
shell-integration
:::

## Multiple copy/paste buffers {#cpbuf}

In addition to being able to copy/paste from the system clipboard, in
[\|kitty\|](##SUBST##|kitty|) you can also setup an arbitrary number of
copy paste buffers. To do so, simply add something like the following to
your `kitty.conf`{.interpreted-text role="file"}:

    map f1 copy_to_buffer a
    map f2 paste_from_buffer a

This will allow you to press `F1`{.interpreted-text role="kbd"} to copy
the current selection to an internal buffer named `a` and
`F2`{.interpreted-text role="kbd"} to paste from that buffer. The buffer
names are arbitrary strings, so you can define as many such buffers as
you need.

## Marks

kitty has the ability to mark text on the screen based on regular
expressions. This can be useful to highlight words or phrases when
browsing output from long running programs or similar. To learn how this
feature works, see `marks`{.interpreted-text role="doc"}.

::: {.toctree hidden=""}
marks
:::
# Performance

The main goals for [\|kitty\|](##SUBST##|kitty|) performance are user
perceived latency while typing and \"smoothness\" while scrolling as
well as CPU usage. [\|kitty\|](##SUBST##|kitty|) tries hard to find an
optimum balance for these. To that end it keeps a cache of each rendered
glyph in video RAM so that font rendering is not a bottleneck.
Interaction with child programs takes place in a separate thread from
rendering, to improve smoothness. Parsing of the byte stream is done
using [vector CPU
instructions](https://en.wikipedia.org/wiki/Single_instruction,_multiple_data)
for maximum performance. Updates to the screen typically require sending
just a few bytes to the GPU.

There are two config options you can tune to adjust the performance,
`repaint_delay`{.interpreted-text role="opt"} and
`input_delay`{.interpreted-text role="opt"}. These control the
artificial delays introduced into the render loop to reduce CPU usage.
See `conf-kitty-performance`{.interpreted-text role="ref"} for details.
See also the `sync_to_monitor`{.interpreted-text role="opt"} option to
further decrease latency at the cost of some [screen
tearing](https://en.wikipedia.org/wiki/Screen_tearing) while scrolling.

## Benchmarks

Measuring terminal emulator performance is fairly subtle, there are
three main axes on which performance is measured: Energy usage for
typical tasks, Keyboard to screen latency, and throughput (processing
large amounts of data).

### Keyboard to screen latency

This is measured either with dedicated hardware, or software such as
[Typometer](https://pavelfatin.com/typometer/). Third party measurements
comparing kitty with other terminal emulators on various systems show
kitty has best in class keyboard to screen latency.

Note that to minimize latency at the expense of more energy usage, use
the following settings in kitty.conf:

    input_delay 0
    repaint_delay 2
    sync_to_monitor no
    wayland_enable_ime no

[Hardware based measurement on
macOS](https://thume.ca/2020/05/20/making-a-latency-tester/) show that
kitty and Apple\'s Terminal.app share the crown for best latency. These
measurements were done with `input_delay`{.interpreted-text role="opt"}
at its default value of `3 ms` which means kitty\'s actual numbers would
be even lower.

[Typometer based measurements on
Linux](https://github.com/kovidgoyal/kitty/issues/2701#issuecomment-911089374)
show that kitty has far and away the best latency of the terminals
tested.

### Throughput

kitty has a builtin kitten to measure throughput, it works by dumping
large amounts of data of different types into the tty device and
measuring how fast the terminal parses and responds to it. The
measurements below were taken with the same font, font size and window
size for all terminals, and default settings, on the same computer. They
clearly show kitty has the fastest throughput. To run the tests
yourself, run `kitten __benchmark__` in the terminal emulator you want
to test, where the kitten binary is part of the kitty install.

The numbers are megabytes per second of data that the terminal
processes. Measurements were taken under Linux/X11 with an
`AMD Ryzen 7 PRO 5850U`. Entries are in order of decreasing performance.
kitty is twice as fast as the next best.

  Terminal           ASCII   Unicode   CSI    Images   Average
  ------------------ ------- --------- ------ -------- ---------
  kitty 0.33         121.8   105.0     59.8   251.6    134.55
  gnometerm 3.50.1   33.4    55.0      16.1   142.8    61.83
  alacritty 0.13.1   43.1    46.5      32.5   94.1     54.05
  wezterm 20230712   16.4    26.0      11.1   140.5    48.5
  xterm 389          47.7    18.3      0.6    56.3     30.72
  konsole 23.08.04   25.2    37.7      23.6   23.4     27.48
  alacritty+tmux     30.3    7.8       14.7   46.1     24.73

In this table, each column represents different types of data. The CSI
column is for data consisting of a mix of typical formatting escape
codes and some ASCII only text.

:::: note
::: title
Note
:::

By default, the benchmark kitten suppresses actual rendering, to better
focus on parser speed, you can pass it the `--render` flag to not
suppress rendering. However, modern terminals typically render
asynchronously, therefore the numbers are not really useful for
comparison, as it is just a game about how much input to *batch* before
rendering the next frame. However, even with rendering enabled kitty is
still faster than all the rest. For brevity those numbers are not
included.
::::

:::: note
::: title
Note
:::

foot, iterm2 and Terminal.app are left out as they do not run under X11.
Alacritty+tmux is included just to show the effect of putting a terminal
multiplexer into the mix (halving throughput) and because alacritty
isn\'t remotely comparable to any of the other terminals feature wise
without tmux.
::::

:::: note
::: title
Note
:::

konsole, gnome-terminal and xterm do not support the [Synchronized
update](https://gitlab.com/gnachman/iterm2/-/wikis/synchronized-updates-spec)
escape code used to suppress rendering, if and when they gain support
for it their numbers are likely to improve by `20 - 50%`, depending on
how well they implement it.
::::

### Energy usage

Sadly, I do not have the infrastructure to measure actual energy usage
so CPU usage will have to stand in for it. Here are some CPU usage
numbers for the task of scrolling a file continuously in
`less`{.interpreted-text role="program"}. The CPU usage is for the
terminal process and X together and is measured using
`htop`{.interpreted-text role="program"}. The measurements are taken at
the same font and window size for all terminals on a
`Intel(R) Core(TM) i7-4820K CPU @ 3.70GHz` CPU with a
`Advanced Micro Devices, Inc. [AMD/ATI] Cape Verde XT [Radeon HD 7770/8760 / R7 250X]`
GPU.

  Terminal                        CPU usage (X + terminal)
  ------------------------------- --------------------------------------------
  [\|kitty\|](##SUBST##|kitty|)   6 - 8%
  xterm                           5 - 7% (but scrolling was extremely janky)
  termite                         10 - 13%
  urxvt                           12 - 14%
  gnome-terminal                  15 - 17%
  konsole                         29 - 31%

As you can see, [\|kitty\|](##SUBST##|kitty|) uses much less CPU than
all terminals, except xterm, but its scrolling \"smoothness\" is much
better than that of xterm (at least to my, admittedly biased, eyes).

## Instrumenting kitty

You can generate detailed per-function performance data using
[gperftools](https://github.com/gperftools/gperftools). Build
[\|kitty\|](##SUBST##|kitty|) with `make profile`. Run kitty and perform
the task you want to analyse, for example, scrolling a large file with
`less`{.interpreted-text role="program"}. After you quit, function call
statistics will be displayed in *KCachegrind*. Hence, profiling is best
done on Linux which has these tools easily available.
orphan

:   

# Working with the screen and history buffer contents

:::: warning
::: title
Warning
:::

The pipe action has been deprecated in favor of the
`launch <launch>`{.interpreted-text role="doc"} action which is more
powerful.
::::

You can pipe the contents of the current screen and history buffer as
`STDIN`{.interpreted-text role="file"} to an arbitrary program using the
`pipe` function. The program can be displayed in a kitty window or
overlay.

For example, the following in `kitty.conf`{.interpreted-text
role="file"} will open the scrollback buffer in less in an overlay
window, when you press `F1`{.interpreted-text role="kbd"}:

    map f1 pipe @ansi overlay less +G -R

The syntax of the `pipe` function is:

    pipe <input placeholder> <destination window type> <command line to run>

## The piping environment

The program to which the data is piped has a special environment
variable declared, `KITTY_PIPE_DATA` whose contents are:

    KITTY_PIPE_DATA={scrolled_by}:{cursor_x},{cursor_y}:{lines},{columns}

where `scrolled_by` is the number of lines kitty is currently scrolled
by, `cursor_(x|y)` is the position of the cursor on the screen with
`(1,1)` being the top left corner and `{lines},{columns}` being the
number of rows and columns of the screen.

You can choose where to run the pipe program:

`overlay`

:   An overlay window over the current kitty window

`window`

:   A new kitty window

`os_window`

:   A new top-level window

`tab`

:   A new window in a new tab

`clipboard, primary`

:   Copy the text directly to the clipboard. In this case the specified
    program is not run, so use some dummy program name for it.

`none`

:   Run it in the background

## Input placeholders

There are various different kinds of placeholders

`@selection`

:   Plain text, currently selected text

`@text`

:   Plain text, current screen + scrollback buffer

`@ansi`

:   Text with formatting, current screen + scrollback buffer

`@screen`

:   Plain text, only current screen

`@ansi_screen`

:   Text with formatting, only current screen

`@alternate`

:   Plain text, secondary screen. The secondary screen is the screen not
    currently displayed. For example if you run a fullscreen terminal
    application, the secondary screen will be the screen you return to
    when quitting the application.

`@ansi_alternate`

:   Text with formatting, secondary screen.

`@alternate_scrollback`

:   Plain text, secondary screen + scrollback, if any.

`@ansi_alternate_scrollback`

:   Text with formatting, secondary screen + scrollback, if any.

`none`

:   No input

You can also add the suffix `_wrap` to the placeholder, in which case
kitty will insert the carriage return at every line wrap location (where
long lines are wrapped at screen edges). This is useful if you want to
pipe to program that wants to duplicate the screen layout of the screen.
# Mouse pointer shapes

::: versionadded
0.31.0
:::

This is a simple escape code that can be used by terminal programs to
change the shape of the mouse pointer. This is useful for buttons/links,
dragging to resize panes, etc. It is based on the original escape code
proposal from xterm however, it properly specifies names for the
different shapes in a system independent manner, adds a stack for easy
push/pop of shapes, allows programs to query support and specifies
interaction with other terminal state.

The escape code is of the form:

    <OSC> 22 ; <optional first char> <comma-separates list of shape names> <ESC>\

Here, `<OSC>` is the bytes `<ESC>]` and `<ESC>` is the byte `0x1b`.
Spaces in the above are present for clarity only and should not be
actually used.

First some examples:

    # Set the pointer to a pointing hand
    <OSC> 22 ; pointer <ESC>\
    # Reset the pointer to default
    <OSC> 22 ; <ESC>\
    # Push a shape onto the stack making it the current shape
    <OSC> 22 ; >wait <ESC>\
    # Pop a shape off the stack restoring to the previous shape
    <OSC> 22 ; < <ESC>\
    # Query the terminal for what the currently set shape is
    <OSC> 22 ; ?__current__ <ESC>\

To demo the various shapes, simply run the following command inside
kitty:

    kitten mouse-demo

For more details see below.

## Setting the pointer shape

For set operations, the optional first char can be either `=` or
omitted. Follow the first char with the name of the shape. See the
`pointer_shape_names`{.interpreted-text role="ref"} table.

## Pushing and popping shapes onto the stack

The terminal emulator maintains a stack of shapes. To add shapes to the
stack, the optional first char must be `>` followed by a comma separated
list of shape names. See the `pointer_shape_names`{.interpreted-text
role="ref"} table. All the specified names are added to the stack, with
the last name being the top of the stack and the current shape. If the
stack is full, the entry at the bottom of the stack is evicted. Terminal
implementations are free to choose an appropriate maximum stack size,
with a minimum stack size of 16.

To pop shapes of the top of the stack the optional first char must be
`<`. The comma separated list of names is ignored. Once the stack is
empty further pops have no effect. An empty stack means the terminal is
free to use whatever pointer shape it likes.

## Querying support

Terminal programs can ask the terminal about this feature by setting the
optional first char to `?`. The comma separated list of names is then
considered the query to which the terminal must respond with an OSC 22
code. For example:

    <OSC> 22 ; ?__current__ <ESC>\
    results in
    <OSC> 22 ; shape_name <ESC>\

Here, `shape_name` will be a name from the table of shape names below or
`0` if the stack is empty, i.e., no shape is currently set.

To check if the terminal supports some shapes, pass the shape names and
the terminal will reply with a comma separated list of zeros and ones
where 1 means the shape name is supported and zero means it is not. For
example:

    <OSC> 22 ; ?pointer,crosshair,no-such-name,wait <ESC>\
    results in
    <OSC> 22 ; 1,1,0,1 <ESC>\

In addition to `__current__` there are a couple of other special names:

    __default__ - The terminal responds with the shape name of the shape used by default
    __grabbed__ - The terminal responds with the shape name of the shape used when the mouse is "grabbed"

## Interaction with other terminal features

The terminal must maintain separate shape stacks for the *main* and
*alternate* screens. This allows full screen programs, which are likely
to be the main consumers of this feature, to easily temporarily switch
back from the alternate screen, without needing to worry about pointer
shape state. Think of suspending a terminal editor to get back to the
shell, for example.

Resetting the terminal must empty both the shape stacks.

When dragging to select text, the terminal is free to ignore any mouse
pointer shape specified using this escape code in favor of one
appropriate for dragging. Similarly, when hovering over a URL or OSC 8
based hyperlink, the terminal may choose to change the mouse pointer
regardless of the value set by this escape code.

This feature is independent of mouse reporting. The changed pointer
shapes apply regardless of whether the terminal program has enabled
mouse reporting or not.

## Pointer shape names {#pointer_shape_names}

There is a well defined set of shape names that all conforming terminal
emulators must support. The list is based on the names used by the
[cursor property in the CSS
standard](https://developer.mozilla.org/en-US/docs/Web/CSS/cursor),
click the link to see representative images for the names. Valid names
must consist of only the characters from the set `a-z0-9_-`.

1.  alias
2.  cell
3.  copy
4.  crosshair
5.  default
6.  e-resize
7.  ew-resize
8.  grab
9.  grabbing
10. help
11. move
12. n-resize
13. ne-resize
14. nesw-resize
15. no-drop
16. not-allowed
17. ns-resize
18. nw-resize
19. nwse-resize
20. pointer
21. progress
22. s-resize
23. se-resize
24. sw-resize
25. text
26. vertical-text
27. w-resize
28. wait
29. zoom-in
30. zoom-out

To demo the various shapes, simply run the following command inside
kitty:

    kitten mouse-demo

## Legacy xterm compatibility

The original xterm proposal for this escape code used shape names from
the `X11/cursorfont.h`{.interpreted-text role="file"} header on X11
based systems. Terminal implementations wishing to maintain
compatibility with xterm can also implement these names as aliases for
the CSS based names defined in the
`pointer_shape_names`{.interpreted-text role="ref"} table.

The simplest mode of operation of this escape code, which is no leading
optional char and a single shape name is compatible with xterm.
# Press mentions of kitty

[Python Bytes 272](https://youtu.be/8HKliSbA-gQ?t=815) (Feb 2022)

:   A podcast demoing some of kitty\'s coolness

[Console #88](https://console.substack.com/p/console-88) (Jan 2022)

:   An interview with Kovid about kitty

## Video reviews

[Review (Jan 2021)](https://www.youtube.com/watch?v=TTzP2zYJn2k)

:   A kitty review by distrotube

[Review (Dec 2020)](https://www.youtube.com/watch?v=KUMkLhFeBrI)

:   A kitty review/intro by TechHut
# Terminal protocol extensions

[\|kitty\|](##SUBST##|kitty|) has extensions to the legacy terminal
protocol, to enable advanced features. These are typically in the form
of new or re-purposed escape codes. While these extensions are currently
[\|kitty\|](##SUBST##|kitty|) specific, it would be nice to get some of
them adopted more broadly, to push the state of terminal emulators
forward.

The goal of these extensions is to be as small and unobtrusive as
possible, while filling in some gaps in the existing xterm protocol. In
particular, one of the goals of this specification is explicitly not to
\"re-imagine\" the TTY. The TTY should remain what it is \-- a device
for efficiently processing text received as a simple byte stream.
Another objective is to only move the minimum possible amount of extra
functionality into the terminal program itself. This is to make it as
easy to implement these protocol extensions as possible, thereby
hopefully encouraging their widespread adoption.

If you wish to discuss these extensions, propose additions or changes to
them, please do so by opening issues in the [GitHub bug
tracker](https://github.com/kovidgoyal/kitty/issues).

::: {.toctree maxdepth="1"}
underlines graphics-protocol keyboard-protocol text-sizing-protocol
dnd-protocol multiple-cursors-protocol file-transfer-protocol
desktop-notifications pointer-shapes unscroll color-stack deccara
clipboard misc-protocol
:::
:::: sidebar

::: only
not man

**Screenshots**

<figure class="align-center">
<img src="/screenshots/quake-macos.webp" style="width:100.0%"
alt="/screenshots/quake-macos.webp" />
<figcaption>macOS</figcaption>
</figure>

<figure class="align-center">
<img src="/screenshots/quake-hypr.webp" style="width:100.0%"
alt="/screenshots/quake-hypr.webp" />
<figcaption>Linux</figcaption>
</figure>

<figure class="align-center">
<img src="/screenshots/panel.png" style="width:100.0%"
alt="/screenshots/panel.png" />
<figcaption>A sample panel on Linux</figcaption>
</figure>

How the screenshots `were generated <quake_ss>`{.interpreted-text
role="ref"}.
:::
::::
# Quickstart

::: {.toctree hidden=""}
binary build
:::

Pre-built binaries of [\|kitty\|](##SUBST##|kitty|) are available for
both macOS and Linux. See the
`binary install instructions </binary>`{.interpreted-text role="doc"}.
You can also `build from
source </build>`{.interpreted-text role="doc"}.

Additionally, you can use your favorite package manager to install the
[\|kitty\|](##SUBST##|kitty|) package, but note that some Linux
distribution packages are woefully outdated.
[\|kitty\|](##SUBST##|kitty|) is available in a vast number of package
repositories for macOS and Linux.

[![Number of repositories kitty is available in](https://repology.org/badge/tiny-repos/kitty-terminal.svg)](https://repology.org/project/kitty-terminal/versions)

See `Configuring kitty <conf>`{.interpreted-text role="doc"} for help on
configuring [\|kitty\|](##SUBST##|kitty|) and
`Invocation <invocation>`{.interpreted-text role="doc"} for the command
line arguments [\|kitty\|](##SUBST##|kitty|) supports.

For a tour of kitty\'s design and features, see the
`overview`{.interpreted-text role="doc"}.
# The kitty remote control protocol

The kitty remote control protocol is a simple protocol that involves
sending data to kitty in the form of JSON. Any individual command of
kitty has the form:

    <ESC>P@kitty-cmd<JSON object><ESC>\

Where `<ESC>` is the byte `0x1b`. The JSON object has the form:

``` json
{
    "cmd": "command name",
    "version": "<kitty version>",
    "no_response": "<Optional Boolean>",
    "kitty_window_id": "<Optional value of the KITTY_WINDOW_ID env var>",
    "payload": "<Optional JSON object>"
}
```

The `version` above is an array of the form `[0, 14, 2]`. If you are
developing a standalone client, use the kitty version that you are
developing against. Using a version greater than the version of the
kitty instance you are talking to, will cause a failure.

Set `no_response` to `true` if you don\'t want a response from kitty.

The optional payload is a JSON object that is specific to the actual
command being sent. The fields in the object for every command are
documented below.

As a quick example showing how easy to use this protocol is, we will
implement the `@ ls` command from the shell using only shell tools.

First, run kitty as:

    kitty -o allow_remote_control=socket-only --listen-on unix:/tmp/test

Now, in a different terminal, you can get the pretty printed `@ ls`
output with the following command line:

    echo -en '\eP@kitty-cmd{"cmd":"ls","version":[0,14,2]}\e\\' | socat - unix:/tmp/test | awk '{ print substr($0, 13, length($0) - 14) }' | jq -c '.data | fromjson' | jq .

There is also the statically compiled stand-alone executable `kitten`
that can be used for this, available from the [kitty
releases](https://github.com/kovidgoyal/kitty/releases) page:

    kitten @ --help

## Encrypted communication {#rc_crypto}

::: versionadded
0.26.0
:::

When using the `remote_control_password`{.interpreted-text role="opt"}
option communication to the terminal is encrypted to keep the password
secure. A public key is used from the
`KITTY_PUBLIC_KEY`{.interpreted-text role="envvar"} environment
variable. Currently, only one encryption protocol is supported. The
protocol number is present in `KITTY_PUBLIC_KEY`{.interpreted-text
role="envvar"} as `1`. The key data in this environment variable is
`Base-85 <1924>`{.interpreted-text role="rfc"} encoded. The algorithm
used is [Elliptic Curve Diffie
Helman](https://en.wikipedia.org/wiki/Elliptic-curve_Diffie–Hellman)
with the [X25519 curve](https://en.wikipedia.org/wiki/Curve25519). A
time based nonce is used to minimise replay attacks. The original JSON
command has the fields: `password` and `timestamp` added. The timestamp
is the number of nanoseconds since the epoch, excluding leap seconds.
Commands with a timestamp more than 5 minutes from the current time are
rejected. The command is then encrypted using AES-256-GCM in
authenticated encryption mode, with a symmetric key that is derived from
the ECDH key-pair by running the shared secret through SHA-256 hashing,
once. An IV of at least 96 bits of CSPRNG data is used. The tag for
authenticated encryption **must** be at least 128 bits long. The tag
**must** authenticate only the value of the `encrypted` field. A new
command is created and transmitted that contains the fields:

``` json
{
    "version": "<kitty version>",
    "iv": "base85 encoded IV",
    "tag": "base85 encoded AEAD tag",
    "pubkey": "base85 encoded ECDH public key of sender",
    "encrypted": "The original command encrypted and base85 encoded"
}
```

## Async and streaming requests

Some remote control commands require asynchronous communication, that
is, the response from the terminal can happen after an arbitrary amount
of time. For example, the `select-window` command requires the user to
select a window before a response can be sent. Such command must set the
field `async` in the JSON block above to a random string that serves as
a unique id. The client can cancel an async request in flight by adding
the `cancel_async` field to the JSON block. A async response remains in
flight until the terminal sends a response to the request. Note that
cancellation requests dont need to be encrypted as users must not be
prompted for these and the worst a malicious cancellation request can do
is prevent another sync request from getting a response.

Similar to async requests are *streaming* requests. In these the client
has to send a large amount of data to the terminal and so the request is
split into chunks. In every chunk the JSON block must contain the field
`stream` set to `true` and `stream_id` set to a random long string, that
should be the same for all chunks in a request. End of data is indicated
by sending a chunk with no data.
# Control kitty from scripts

[\|kitty\|](##SUBST##|kitty|) can be controlled from scripts or the
shell prompt. You can open new windows, send arbitrary text input to any
window, change the title of windows and tabs, etc.

Let\'s walk through a few examples of controlling
[\|kitty\|](##SUBST##|kitty|).

# Tutorial

Start by running [\|kitty\|](##SUBST##|kitty|) as:

``` sh
kitty -o allow_remote_control=yes -o enabled_layouts=tall
```

In order for control to work, `allow_remote_control`{.interpreted-text
role="opt"} or `remote_control_password`{.interpreted-text role="opt"}
must be enabled in `kitty.conf`{.interpreted-text role="file"}. Here we
turn it on explicitly at the command line.

Now, in the new [\|kitty\|](##SUBST##|kitty|) window, enter the command:

``` sh
kitten @ launch --title Output --keep-focus cat
```

This will open a new window, running the `cat`{.interpreted-text
role="program"} program that will appear next to the current window.

Let\'s send some text to this new window:

``` sh
kitten @ send-text --match cmdline:cat Hello, World
```

This will make `Hello, World` show up in the window running the
`cat`{.interpreted-text role="program"} program. The
`kitten @ send-text --match`{.interpreted-text role="option"} option is
very powerful, it allows selecting windows by their titles, the command
line of the program running in the window, the working directory of the
program running in the window, etc. See
`kitten @ send-text --help <at-send-text>`{.interpreted-text role="ref"}
for details.

More usefully, you can pipe the output of a command running in one
window to another window, for example:

``` sh
ls | kitten @ send-text --match 'title:^Output' --stdin
```

This will show the output of `ls`{.interpreted-text role="program"} in
the output window instead of the current window. You can use this
technique to, for example, show the output of running
`make`{.interpreted-text role="program"} in your editor in a different
window. The possibilities are endless.

You can even have things you type show up in a different window. Run:

``` sh
kitten @ send-text --match 'title:^Output' --stdin
```

And type some text, it will show up in the output window, instead of the
current window. Type `Ctrl+D`{.interpreted-text role="kbd"} when you are
ready to stop.

Now, let\'s open a new tab:

``` sh
kitten @ launch --type=tab --tab-title "My Tab" --keep-focus bash
```

This will open a new tab running the bash shell with the title \"My
Tab\". We can change the title of the tab to \"New Title\" with:

``` sh
kitten @ set-tab-title --match 'title:^My' New Title
```

Let\'s change the title of the current tab:

``` sh
kitten @ set-tab-title Master Tab
```

Now lets switch to the newly opened tab:

``` sh
kitten @ focus-tab --match 'title:^New'
```

Similarly, to focus the previously opened output window (which will also
switch back to the old tab, automatically):

``` sh
kitten @ focus-window --match 'title:^Output'
```

You can get a listing of available tabs and windows, by running:

``` sh
kitten @ ls
```

This outputs a tree of data in JSON format. The top level of the tree is
all `OS windows <os_window>`{.interpreted-text role="term"}. Each OS
window has an id and a list of `tabs <tab>`{.interpreted-text
role="term"}. Each tab has its own id, a title and a list of `kitty
windows <window>`{.interpreted-text role="term"}. Each window has an id,
title, current working directory, process id (PID) and command-line of
the process running in the window. You can use this information with
`kitten @ focus-window --match`{.interpreted-text role="option"} to
control individual windows.

As you can see, it is very easy to control [\|kitty\|](##SUBST##|kitty|)
using the `kitten @` messaging system. This tutorial touches only the
surface of what is possible. See `kitten @ --help` for more details.

In the example\'s above, `kitten @` messaging works only when run inside
a [\|kitty\|](##SUBST##|kitty|) window, not anywhere. But, within a
[\|kitty\|](##SUBST##|kitty|) window it even works over SSH. If you want
to control [\|kitty\|](##SUBST##|kitty|) from programs/scripts not
running inside a [\|kitty\|](##SUBST##|kitty|) window, see the section
on `using a socket for remote control <rc_via_socket>`{.interpreted-text
role="ref"} below.

Note that if all you want to do is run a single
[\|kitty\|](##SUBST##|kitty|) \"daemon\" and have subsequent
[\|kitty\|](##SUBST##|kitty|) invocations appear as new top-level
windows, you can use the simpler
`kitty --single-instance`{.interpreted-text role="option"} option, see
`kitty --help` for that.

# Remote control via a socket {#rc_via_socket}

To control kitty from outside kitty, it is necessary to setup a socket
to communicate with kitty. First, start [\|kitty\|](##SUBST##|kitty|)
as:

``` sh
kitty -o allow_remote_control=yes --listen-on unix:/tmp/mykitty
```

The `kitty --listen-on`{.interpreted-text role="option"} option tells
[\|kitty\|](##SUBST##|kitty|) to listen for control messages at the
specified UNIX-domain socket. See `kitty --help` for details. Now you
can control this instance of [\|kitty\|](##SUBST##|kitty|) using the
`kitten @ --to`{.interpreted-text role="option"} command line argument
to `kitten @`. For example:

``` sh
kitten @ --to unix:/tmp/mykitty ls
```

# The builtin kitty shell

You can explore the [\|kitty\|](##SUBST##|kitty|) command language more
easily using the builtin [\|kitty\|](##SUBST##|kitty|) shell. Run
`kitten @` with no arguments and you will be dropped into the
[\|kitty\|](##SUBST##|kitty|) shell with completion for
[\|kitty\|](##SUBST##|kitty|) command names and options.

You can even open the [\|kitty\|](##SUBST##|kitty|) shell inside a
running [\|kitty\|](##SUBST##|kitty|) using a simple keyboard shortcut
(`kitty_shell`{.interpreted-text role="sc"} by default).

:::: note
::: title
Note
:::

Using the keyboard shortcut has the added advantage that you don\'t need
to use `allow_remote_control`{.interpreted-text role="opt"} to make it
work.
::::

# Allowing only some windows to control kitty

If you do not want to allow all programs running in
[\|kitty\|](##SUBST##|kitty|) to control it, you can selectively enable
remote control for only some [\|kitty\|](##SUBST##|kitty|) windows.
Simply create a shortcut such as:

``` sh
map ctrl+k launch --allow-remote-control some_program
```

Then programs running in windows created with that shortcut can use
`kitten @` to control kitty. Note that any program with the right level
of permissions can still write to the pipes of any other program on the
same computer and therefore can control [\|kitty\|](##SUBST##|kitty|).
It can, however, be useful to block programs running on other computers
(for example, over SSH) or as other users.

:::: note
::: title
Note
:::

You don\'t need `allow_remote_control`{.interpreted-text role="opt"} to
make this work as it is limited to only programs running in that
specific window. Be careful with what programs you run in such windows,
since they can effectively control kitty, as if you were running with
`allow_remote_control`{.interpreted-text role="opt"} turned on.

You can further restrict what is allowed in these windows by using
`kitten @ launch --remote-control-password`{.interpreted-text
role="option"}.
::::

# Fine grained permissions for remote control

::: versionadded
0.26.0
:::

The `allow_remote_control`{.interpreted-text role="opt"} option
discussed so far is a blunt instrument, granting the ability to any
program running on your computer or even on remote computers via SSH the
ability to use remote control.

You can instead define remote control passwords that can be used to
grant different levels of control to different places. You can even
write your own script to decide which remote control requests are
allowed. This is done using the
`remote_control_password`{.interpreted-text role="opt"} option in
`kitty.conf`{.interpreted-text role="file"}. Set
`allow_remote_control`{.interpreted-text role="opt"} to `password` to
use this feature. Let\'s see some examples:

``` conf
remote_control_password "control colors" get-colors set-colors
```

Now, using this password, you can, in scripts run the command:

``` sh
kitten @ --password="control colors" set-colors background=red
```

Any script with access to the password can now change colors in kitty
using remote control, but only that and nothing else. You can even
supply the password via the `KITTY_RC_PASSWORD`{.interpreted-text
role="envvar"} environment variable, or the file
`~/.config/kitty/rc-pass`{.interpreted-text role="file"} to avoid having
to type it repeatedly. See `kitten @ --password-file`{.interpreted-text
role="option"} and `kitten @ --password-env`{.interpreted-text
role="option"}.

The `remote_control_password`{.interpreted-text role="opt"} can be
specified multiple times to create different passwords with different
capabilities. Run the following to get a list of all action names:

``` sh
kitten @ --help
```

You can even use glob patterns to match action names, for example:

``` conf
remote_control_password "control colors" *-colors
```

If no action names are specified, all actions are allowed.

If `kitten @` is run with a password that is not present in
`kitty.conf`{.interpreted-text role="file"}, then kitty will
interactively prompt the user to allow or disallow the remote control
request. The user can choose to allow or disallow either just that
request or all requests using that password. The user\'s decision is
remembered for the duration of that kitty instance.

:::: note
::: title
Note
:::

For password based authentication to work over SSH, you must pass the
`KITTY_PUBLIC_KEY`{.interpreted-text role="envvar"} environment variable
to the remote host. The `ssh kitten <kittens/ssh>`{.interpreted-text
role="doc"} does this for you automatically. When using a password,
`rc_crypto`{.interpreted-text role="ref"} is used to ensure the password
is kept secure. This does mean that using password based authentication
is slower as the entire command is encrypted before transmission. This
can be noticeable when using a command like
`kitten @ set-background-image` which transmits large amounts of image
data. Also, the clock on the remote system must match (within a few
minutes) the clock on the local system. kitty uses a time based nonce to
minimise the potential for replay attacks.
::::

## Customizing authorization with your own program {#rc_custom_auth}

If the ability to control access by action names is not fine grained
enough, you can define your own Python script to examine every remote
control command and allow/disallow it. To do so create a file in the
kitty configuration directory,
`~/.config/kitty/my_rc_auth.py`{.interpreted-text role="file"} and add
the following to `kitty.conf`{.interpreted-text role="file"}:

``` conf
remote_control_password "testing custom auth" my_rc_auth.py
```

`my_rc_auth.py`{.interpreted-text role="file"} should define a
`is_cmd_allowed` function as shown below:

``` py
def is_cmd_allowed(pcmd, window, from_socket, extra_data):
    cmd_name = pcmd['cmd']  # the name of the command
    cmd_payload = pcmd['payload']  # the arguments to the command
    # examine the cmd_name and cmd_payload and return True to allow
    # the command or False to disallow it. Return None to have no
    # effect on the command.

    # The command payload will vary from command to command, see
    # the rc protocol docs for details. Below is an example of
    # restricting the launch command to allow only running the
    # default shell.

    if cmd_name != 'launch':
        return None
    if cmd_payload.get('args') or cmd_payload.get('env') or cmd_payload.get('copy_cmdline') or cmd_payload.get('copy_env'):
        return False
    # prints in this function go to the parent kitty process STDOUT
    print('Allowing launch command:', cmd_payload)
    return True
```

:::: note
::: title
Note
:::

The payloads for the different remote control commands are documented in
the
`remote control protocol specification <rc_protocol>`{.interpreted-text
role="doc"}.
::::

# Mapping key presses to remote control commands {#rc_mapping}

If you wish to trigger a remote control command easily with just a
keypress, you can map it in `kitty.conf`{.interpreted-text role="file"}.
For example:

``` sh
map f1 remote_control set-spacing margin=30
```

Then pressing the `F1`{.interpreted-text role="kbd"} key will set the
active window margins to `30`. The syntax for what follows
`remote_control`{.interpreted-text role="ac"} is exactly the same as the
syntax for what follows `kitten @` above.

If you wish to ignore errors from the command, prefix the command with
an `!`. For example, the following will not return an error when no
windows are matched:

``` sh
map f1 remote_control !focus-window --match XXXXXX
```

If you wish to run a more complex script, you can use:

``` sh
map f1 remote_control_script /path/to/myscript
```

In this script you can use `kitten @` to run as many remote control
commands as you like and process their output.
`remote_control_script`{.interpreted-text role="ac"} is similar to the
`launch`{.interpreted-text role="ac"} command with
`--type=background --allow-remote-control`. For more advanced usage,
including fine grained permissions, setting env vars, command line
interpolation, passing data to STDIN, etc. the
`launch <launch>`{.interpreted-text role="doc"} command should be used.
Relative paths to scripts are interpreted with respect to the kitty
config directory.

:::: note
::: title
Note
:::

You do not need `allow_remote_control`{.interpreted-text role="opt"} to
use these mappings, as they are not actual remote programs, but are
simply a way to reuse the remote control infrastructure via keybings.
::::

# Broadcasting what you type to all kitty windows

As a simple illustration of the power of remote control, lets have what
we type sent to all open kitty windows. To do that define the following
mapping in `kitty.conf`{.interpreted-text role="file"}:

``` sh
map f1 launch --allow-remote-control kitty +kitten broadcast
```

Now press `F1`{.interpreted-text role="kbd"} and start typing, what you
type will be sent to all windows, live, as you type it.

# The remote control protocol

If you wish to develop your own client to talk to
[\|kitty\|](##SUBST##|kitty|), you can use the
`remote control protocol specification <rc_protocol>`{.interpreted-text
role="doc"}. Note that there is a statically compiled, standalone
executable, `kitten` available that can be used as a remote control
client on any UNIX like computer. This can be downloaded and used
directly from the [kitty
releases](https://github.com/kovidgoyal/kitty/releases) page:

``` sh
kitten @ --help
```

# Matching windows and tabs {#search_syntax}

Many remote control operations operate on windows or tabs. To select
these, the `--match` option is often used. This allows matching using
various sophisticated criteria such as title, ids, command lines, etc.
These criteria are expressions of the form `field:query`. Where
`field`{.interpreted-text role="italic"} is the field against which to
match and `query`{.interpreted-text role="italic"} is the expression to
match. They can be further combined using Boolean operators, best
illustrated with some examples:

``` sh
title:"My special window" or id:43
title:bash and env:USER=kovid
not id:1
(id:2 or id:3) and title:something
```

::: {.toctree hidden=""}
rc[protocol]{#protocol}
:::
# Sessions

kitty has robust support for sessions. A session is basically a simple
text file where you can define kitty windows, tabs and what programs to
run in them as well as how to layout the windows. kitty also supports
actions to easily
`create and switch between existing sessions <goto_session>`{.interpreted-text
role="ac"}, so that you can move seamlessly from working on one project
to another with a couple of keystrokes.

Let\'s see a quick example to get a feel of how easy it is to create
sessions. First, a session file to develop a project:

``` session
# Set the layout for the current tab
layout tall
# Set the working directory for windows in the current tab
cd ~/path/to/myproject
# Create the "main" window and run an editor in it to edit the project files
launch --title "Edit My Project" /usr/bin/nvim
# Create a side window to run a shell to build or test project
launch --title "Build My Project"
# Create another side window to keep an eye on some useful log file
launch --title "Log for my project" /usr/bin/tail -f /path/to/project/log/file
```

Save this file as
`~/path/to/myproject/launch.kitty-session`{.interpreted-text
role="file"}. Now when you want to work on the project, simply run:

``` sh
kitty --session ~/path/to/myproject/launch.kitty-session
```

You can also set the session in `kitty.conf`{.interpreted-text
role="file"} via `startup_session`{.interpreted-text role="opt"}.

Thus, it is very easy to create sessions and work on projects. To learn
how to create more complex sessions, see
`complex_sessions`{.interpreted-text role="ref"}.

## Creating/Switching to sessions with a keypress {#goto_session}

If you like to manage multiple sessions within a single terminal and
easily swap between them, kitty has you covered. You can use the
`goto_session`{.interpreted-text role="ac"} action in kitty.conf, like
this:

``` conf
# Press F7 and then c to jump to the "cool" project
map f7>c goto_session ~/path/to/cool/cool.kitty-session
# Press F7 and then h to jump to the "hot" project
map f7>h goto_session ~/path/to/hot/hot.kitty-session
# Browse and select from the list of known projects defined via goto_session commands
map f7>/ goto_session
# Browse and select from the list of active projects defined via goto_session commands
map f7>/ goto_session --active-only [=no]
# Same as above, but the sessions are listed alphabetically instead of by most recent
map f7>/ goto_session --sort-by=alphabetical
# Browse session files inside a directory and pick one
map f7>p goto_session ~/.local/share/kitty/sessions
# Go to the previously active session (larger negative numbers jump further back in history)
map f7>- goto_session -1
```

In this manner you can define as many projects/sessions as you like and
easily switch between them with a keypress.

When a directory path is supplied to `goto_session`{.interpreted-text
role="ac"}, kitty scans it for files ending in `.kitty-session`,
`.kitty_session` or `.session` and presents an interactive list. The
`--sort-by` option controls the ordering of that list just like it does
for globally known sessions.

You can also close sessions using the `close_session`{.interpreted-text
role="ac"} action, which closes all windows in the session with a single
keypress.

## Displaying the currently active session name

You can display the name of the currently active session file in the
kitty tab bar using `tab_title_template`{.interpreted-text role="opt"}.
For example, using the value:

    {session_name} {title}

will show you the name of the session file the current tab was loaded
from, as well as the normal tab title. Or alternatively, you can set the
tab title directly to a project name in the session file itself when
creating the tab, like this:

    new_tab My Project Name

## More complex sessions {#complex_sessions}

If you want to create more complex sessions, with sophisticated layouts,
such as `splits_layout`{.interpreted-text role="ref"}, the easiest way
is to set up the state you want to save manually by first starting kitty
like this:

``` sh
kitty -o 'map f1 save_as_session --use-foreground-process --relocatable'
```

Now create whatever splits and tabs you need and start whatever programs
such as editors, REPLs, debuggers, etc. you want to start in each of
them. Once kitty is the way you want it, press the
`F1`{.interpreted-text role="kbd"} key, and you will be prompted for a
path at which to save the session file. Specify the path and the session
will be saved there with the exact setup you created. The saved file
will even be opened in your editor for you to review, automatically.

:::: tip
::: title
Tip
:::

If you want session files to be saved to a specific directory regardless
of your current working directory, use the `--base-dir` option. For
example:

map f7\>s save[as_session]{#as_session} \--use-foreground-process
\--base-dir \~/.local/share/kitty/sessions

This is particularly useful when kitty is launched from system-wide
shortcuts where the working directory might not be your home directory.
Note that `--relocatable` is typically not used with `--base-dir`, since
relocatable is meant for session files that are co-located with their
project directories.
::::

If instead, you want to create these by hand, see the example below
which shows all the major keywords you can use in kitty session files:

``` session
# Set the layout for the current tab
layout tall
# Set the working directory for windows in the current tab. Relative paths
# are resolved with respect to the location of this session file.
cd ~
# Create a window and run the specified command in it
launch zsh
# Create a window with some environment variables set and run vim in it
launch --env FOO=BAR vim
# Set the title for the next window
launch --title "Chat with x" irssi --profile x
# Run a short lived command and see its output
launch --hold message-of-the-day

# Create a new tab
# The part after new_tab is the optional tab title which will be displayed in
# the tab bar, if omitted, the title of the active window will be used instead.
new_tab my tab
cd somewhere
# Set the layouts allowed in this tab
enabled_layouts tall,stack
# Set the current layout
layout stack
launch zsh

# Create a new OS window
# Any definitions specified before the first new_os_window will apply to first OS window.
new_os_window
# Set new window size to 80x24 cells
os_window_size 80c 24c
# Set the --title for the new OS window
os_window_title my fancy os window
# Set the --class for the new OS window
os_window_class mywindow
# Set the --name for the new OS window
os_window_name myname
# Change the OS window state to normal, fullscreen, maximized or minimized
os_window_state normal
launch sh
# Resize the current window (see the resize_window action for details)
resize_window wider 2
# Make the current window the active (focused) window in its tab
focus
# Make the current OS Window the globally active window
focus_os_window
launch emacs

# Create another tab
new_tab logs
launch tail -f /var/log/syslog

# Focus the first tab (index 0) when the session loads
# You can also use a match expression like: focus_tab title:logs
focus_tab 0

# Create a complex layout using multiple splits. Creates two columns of
# windows with two windows in each column. The windows in the first column are
# split 50:50. In the second column the windows are not evenly split.
new_tab complex tab
layout splits
# First window, set a user variable on it so we can focus it later
launch --var window=first
# Create the second column by splitting the first window vertically
launch --location=vsplit
# Create the third window in the second column by splitting the second window horizontally
# Make it take 40% of the height instead of 50%
launch --location=hsplit --bias=40
# Go back to focusing the first window, so that we can split it
focus_matching_window var:window=first
# Create the final window in the first column
launch --location=hsplit
```

:::: note
::: title
Note
:::

The `launch <launch>`{.interpreted-text role="doc"} command when used in
a session file cannot create new OS windows, or tabs.
::::

:::: note
::: title
Note
:::

Environment variables of the form `${NAME}` or `$NAME` are expanded in
the session file, except in the *arguments* (not options) to the launch
command. For example:

``` sh
launch --cwd=$THIS_IS_EXPANDED some-program $THIS_IS_NOT_EXPANDED
```
::::

## Making newly created windows join an existing session

Normally, after activating a session, if you create new windows/tabs
they don\'t belong to the session. If you would prefer to have them
belong to the currently active session, you can use the
`new_window_with_cwd`{.interpreted-text role="ac"} and
`new_tab_with_cwd`{.interpreted-text role="ac"} actions instead, like
this:

    map kitty_mod+enter new_window_with_cwd
    map kitty_mod+t new_tab_with_cwd
    map kitty_mod+n new_os_window_with_cwd

This will cause newly created windows and tabs to belong to the
currently active session, if any. Note that adding a window to a session
in this way is temporary, it does not edit the session file. If you wish
to update the session file of the currently active session, you can use
the following mapping for it:

    map f5 save_as_session --relocatable --use-foreground-process --match=session:. .

The two can be combined, using the `combine`{.interpreted-text
role="ac"} action. For even more control of what session a window is
added to use the `launch <launch>`{.interpreted-text role="doc"} command
with the `launch --add-to-session`{.interpreted-text role="option"}
flag.

## Sessions with remote connections

If you use the `ssh kitten </kittens/ssh>`{.interpreted-text role="doc"}
to connect to remote computers, `save_as_session`{.interpreted-text
role="ac"} is smart enough to save the ssh kitten invocation to your
session file, preserving the remote working directory and even the
currently running program on the remote host! Try it, run kitty with:

    kitty -o 'map f1 save_as_session --use-foreground-process --relocatable' --session <(echo "layout vertical\nlaunch\nlaunch")

Now in both windows, run:

    kitten ssh localhost

To connect them both to a remote computer (replace `localhost` with
another computer if you like). In one window change the directory to
/tmp and in the other start some program. Then press
`F1`{.interpreted-text role="kbd"} to save the session file. When you
run the session file in another kitty instance you will see both windows
re-created, as expected with the correct working directories and running
programs.

## Managing multi tab sessions in a single OS Window

The natural way to organise sessions in kitty is one per
`os_window`{.interpreted-text role="term"}. However, if you prefer to
manage multiple sessions in a single OS Window, you can configure the
kitty tab bar to only show tabs that belong to the currently active
session. To do so, use `tab_bar_filter`{.interpreted-text role="opt"} in
`kitty.conf`{.interpreted-text role="file"} set:

    tab_bar_filter session:~ or session:^$

This will restrict the tab bar to only showing tabs from the currently
active session as well tabs that do not belong to any session.
Furthermore, when you are in a window or tab that does not belong to any
session, the tab bar will show the tabs from the most recent active
session, to maintain context.

## Keyword reference

Below is the list of all supported keywords in session files along with
documentation for them.

`cd [path]`

:   Change the working directory for all windows in the current tab to
    `path`. Relative paths are resolved with respect to the directory
    containing the session file.

`focus`

:   Give keyboard focus to the window created by the previous launch
    command

`focus_matching_window`

:   Give keyboard focus to window that matches the specified expression.
    See `search_syntax`{.interpreted-text role="ref"} for the syntax for
    matching expressions.

`focus_os_window`

:   Give keyboard focus to the current OS Window. This is guaranteed to
    work only is some other OS Window in the current kitty process has
    focus, otherwise the window manager might block changing focus to
    prevent *focus stealing*.

`focus_tab [tab specifier]`

:   Set which tab should be active (focused) in the current OS Window.
    The tab specifier can be either a plain number (treated as a 0-based
    index) or a match expression. For example, `focus_tab 0` will focus
    the first tab, `focus_tab 1` the second tab, and
    `focus_tab title:logs` will focus the tab whose title matches
    \"logs\". See `search_syntax`{.interpreted-text role="ref"} for the
    full syntax of match expressions. This is useful for session files
    that create multiple tabs and want to ensure a specific tab is
    active when the session is loaded.

`enabled_layouts comma separated list of layout names`

:   Set the layouts allowed in the current tab. Same syntax as
    `enabled_layouts`{.interpreted-text role="opt"}.

`launch`

:   Create a new window running the specified command or the default
    shell if no command is specified. See `launch`{.interpreted-text
    role="doc"} for details. Note that creating tabs and OS Windows
    using launch is not supported in session files, use the dedicated
    keywords for these.

`layout name`

:   Set the layout for the current tab to the specified layout,
    including any specified options, see `layouts`{.interpreted-text
    role="doc"} for the available layouts and options.

`new_os_window`

:   Create a new OS Window. Any OS window related keywords specified
    before the first `new_os_window` will apply to the first OS Window.

`new_tab [tab title]`

:   Create a new tab with the specified title. If no title is specified,
    the title behaves just as for a regular tab in kitty.

`os_window_title`

:   Set the title for the current OS Window. The OS Window will then
    always have this title, it will not change based on the title of the
    currently active window inside the OS Window.

`os_window_class`

:   Set the class part of WM[CLASS]{#class} or Wayland Application Id
    for the current OS Window

`os_window_name`

:   Set the name part of WM[CLASS]{#class} or Wayland Window tag for the
    current OS Window

`os_window_size`

:   Set the size of the current OS Window, can be specified in pixels or
    cells. For example: 80c 24c is a window of width 80 cells by 24
    cells.

`os_window_state`

:   Set the state of the current OS Window, can be: `normal`,
    `fullscreen`, `maximized` or `minimized`

`resize_window`

:   Resize the current window. See the `resize_window`{.interpreted-text
    role="ac"} action for details. For example: resize[window]{#window}
    wider 2

`set_layout_state`

:   This keyword is only used in session files generated by the
    `save_as_session`{.interpreted-text role="ac"} action, it\'s syntax
    is undocumented and for internal use only.

`title`

:   Set the title for the next window. Deprecated, use `launch --title`
    instead.

## The save[as_session]{#as_session} action {#save_as_session}

This action can be mapped to a key press in
`kitty.conf`{.interpreted-text role="file"}. It will save the currently
open OS Windows, tabs, windows, running programs, working directories,
etc. into a session file. It is a convenient way to
`complex_sessions`{.interpreted-text role="ref"}. The options this
action takes are documented below.
# Shell integration {#shell_integration}

kitty has the ability to integrate closely within common shells, such as
[zsh](https://www.zsh.org/), [fish](https://fishshell.com) and
[bash](https://www.gnu.org/software/bash/) to enable features such as
jumping to previous prompts in the scrollback, viewing the output of the
last command in `less`{.interpreted-text role="program"}, using the
mouse to move the cursor while editing prompts, etc.

::: versionadded
0.24.0
:::

# Features

-   Open the output of the last command in a pager such as
    `less`{.interpreted-text role="program"}
    (`show_last_command_output`{.interpreted-text role="sc"})
-   Jump to the previous/next prompt in the scrollback
    (`scroll_to_previous_prompt`{.interpreted-text role="sc"} /
    `scroll_to_next_prompt`{.interpreted-text role="sc"})
-   Click with the mouse anywhere in the current command to move the
    cursor there
-   Hold `Ctrl+Shift`{.interpreted-text role="kbd"} and right-click on
    any command output in the scrollback to view it in a pager
-   The current working directory or the command being executed are
    automatically displayed in the kitty window titlebar/tab title
-   The text cursor is changed to a bar when editing commands at the
    shell prompt
-   `clone_shell`{.interpreted-text role="ref"} with all environment
    variables and the working directory copied
-   `Edit files in new kitty windows <edit_file>`{.interpreted-text
    role="ref"} even over SSH
-   Glitch free window resizing even with complex prompts. Achieved by
    erasing the prompt on resize and allowing the shell to redraw it
    cleanly.
-   Sophisticated completion for the `kitty`{.interpreted-text
    role="program"} command in the shell.
-   When confirming a quit command if a window is sitting at a shell
    prompt, it is not counted (for details, see
    `confirm_os_window_close`{.interpreted-text role="opt"})

# Configuration

Shell integration is controlled by the
`shell_integration`{.interpreted-text role="opt"} option. By default,
all integration features are enabled. Individual features can be turned
off or it can be disabled entirely as well. The
`shell_integration`{.interpreted-text role="opt"} option takes a space
separated list of keywords:

disabled

:   Turn off all shell integration. The shell\'s launch environment is
    not modified and `KITTY_SHELL_INTEGRATION`{.interpreted-text
    role="envvar"} is not set. Useful for
    `manual integration <manual_shell_integration>`{.interpreted-text
    role="ref"}.

no-rc

:   Do not modify the shell\'s launch environment to enable integration.
    Useful if you prefer to load the kitty shell integration code
    yourself, either as part of
    `manual integration <manual_shell_integration>`{.interpreted-text
    role="ref"} or because you have some other software that sets up
    shell integration. This will still set the
    `KITTY_SHELL_INTEGRATION`{.interpreted-text role="envvar"}
    environment variable when kitty runs the shell.

no-cursor

:   Turn off changing of the text cursor to a bar when editing shell
    command line.

no-title

:   Turn off setting the kitty window/tab title based on shell state.
    Note that for the fish shell kitty relies on fish\'s native title
    setting functionality instead.

no-cwd

:   Turn off reporting the current working directory. This is used to
    allow `new_window_with_cwd`{.interpreted-text role="ac"} and similar
    to open windows logged into remote machines using the
    `ssh kitten <kittens/ssh>`{.interpreted-text role="doc"}
    automatically with the same working directory as the current window.
    Note that for the fish shell this will not disable its built-in
    current working directory reporting.

no-prompt-mark

:   Turn off marking of prompts. This disables jumping to prompt,
    browsing output of last command and click to move cursor
    functionality. Note that for the fish shell this does not take
    effect, since fish always marks prompts.

no-complete

:   Turn off completion for the kitty command. Note that for the fish
    shell this does not take effect, since fish already comes with a
    kitty completion script.

no-sudo

:   Do not alias `sudo`{.interpreted-text role="program"} to ensure the
    kitty terminfo files are available in the sudo environment. This is
    needed if you have sudo configured to disable setting of environment
    variables on the command line. By default, if sudo is configured to
    allow all commands for the current user, setting of environment
    variables at the command line is also allowed. Only if commands are
    restricted is this needed.

## More ways to browse command output

You can add further key and mouse bindings to browse the output of
commands easily. For example to select the output of a command by right
clicking the mouse on the output, define the following in
`kitty.conf`{.interpreted-text role="file"}:

``` conf
mouse_map right press ungrabbed mouse_select_command_output
```

Now, when you right click on the output, the entire output is selected,
ready to be copied.

The feature to jump to previous prompts (
`scroll_to_previous_prompt`{.interpreted-text role="sc"} and
`scroll_to_next_prompt`{.interpreted-text role="sc"}) and mouse actions
(`mouse_select_command_output`{.interpreted-text role="ac"} and
`mouse_show_command_output`{.interpreted-text role="ac"}) can be
integrated with browsing command output as well. For example, define the
following mapping in `kitty.conf`{.interpreted-text role="file"}:

``` conf
map f1 show_last_visited_command_output
```

Now, pressing `F1`{.interpreted-text role="kbd"} will cause the output
of the last jumped to command or the last mouse clicked command output
to be opened in a pager for easy browsing.

In addition, You can define shortcut to get the first command output on
screen. For example, define the following in
`kitty.conf`{.interpreted-text role="file"}:

``` conf
map f1 show_first_command_output_on_screen
```

Now, pressing `F1`{.interpreted-text role="kbd"} will cause the output
of the first command output on screen to be opened in a pager.

You can also add shortcut to scroll to the last jumped position. For
example, define the following in `kitty.conf`{.interpreted-text
role="file"}:

``` conf
map f1 scroll_to_prompt 0
```

# How it works

At startup, kitty detects if the shell you have configured (either
system wide or the `shell`{.interpreted-text role="opt"} option in
`kitty.conf`{.interpreted-text role="file"}) is a supported shell. If
so, kitty injects some shell specific code into the shell, to enable
shell integration. How it does so varies for different shells.

::: tab
zsh

For zsh, kitty sets the `ZDOTDIR`{.interpreted-text role="envvar"}
environment variable to make zsh load kitty\'s
`.zshenv`{.interpreted-text role="file"} which restores the original
value of `ZDOTDIR`{.interpreted-text role="envvar"} and sources the
original `.zshenv`{.interpreted-text role="file"}. It then loads the
shell integration code. The remainder of zsh\'s startup process proceeds
as normal.
:::

::: tab
fish

For fish, to make it automatically load the integration code provided by
kitty, the integration script directory path is prepended to the
`XDG_DATA_DIRS`{.interpreted-text role="envvar"} environment variable.
This is only applied to the fish process and will be cleaned up by the
integration script after startup. No files are added or modified.
:::

::: tab
bash

For bash, kitty starts bash in POSIX mode, using the environment
variable `ENV`{.interpreted-text role="envvar"} to load the shell
integration script. This prevents bash from loading any startup files
itself. The loading of the startup files is done by the integration
script, after disabling POSIX mode. From the perspective of those
scripts there should be no difference to running vanilla bash.
:::

Then, when launching the shell, kitty sets the environment variable
`KITTY_SHELL_INTEGRATION`{.interpreted-text role="envvar"} to the value
of the `shell_integration`{.interpreted-text role="opt"} option. The
shell integration code reads the environment variable, turns on the
specified integration functionality and then unsets the variable so as
to not pollute the system.

The actual shell integration code uses hooks provided by each shell to
send special escape codes to kitty, to perform the various tasks. You
can see the code used for each shell below:

<details>
<summary>Click to toggle shell integration code</summary>

:::: tab
zsh

::: {.literalinclude language="zsh"}
../shell-integration/zsh/kitty-integration
:::
::::

:::: tab
fish

::: {.literalinclude language="fish" force=""}
../shell-integration/fish/vendor[conf.d]{#conf.d}/kitty-shell-integration.fish
:::
::::

:::: tab
bash

::: {.literalinclude language="bash"}
../shell-integration/bash/kitty.bash
:::
::::

</details>

# Shell integration over SSH

The easiest way to have shell integration work when SSHing into remote
systems is to use the `ssh kitten <kittens/ssh>`{.interpreted-text
role="doc"}. Simply run:

    kitten ssh hostname

And, by magic, you will be logged into the remote system with fully
functional shell integration. Alternately, you can
`setup shell integration manually
<manual_shell_integration>`{.interpreted-text role="ref"}, by copying
the kitty shell integration scripts to the remote server and editing the
shell rc files there, as described below.

# Shell integration in a container

Install the kitten [standalone
binary](https://github.com/kovidgoyal/kitty/releases/latest/download/kitten-linux-amd64)
in the container somewhere in the PATH, then you can log into the
container with:

``` sh
docker exec -ti container-id kitten run-shell --shell=/path/to/your/shell/in/the/container
```

The kitten will even take care of making the kitty terminfo database
available in the container automatically.

# Clone the current shell into a new window {#clone_shell}

You can clone the current shell into a new kitty window by simply
running the `clone-in-kitty`{.interpreted-text role="command"} command,
for example:

``` sh
clone-in-kitty
clone-in-kitty --type=tab
clone-in-kitty --title "I am a clone"
```

This will open a new window running a new shell instance but with all
environment variables and the current working directory copied. This
even works over SSH when using `kittens/ssh`{.interpreted-text
role="doc"}.

The `clone-in-kitty`{.interpreted-text role="command"} command takes
almost all the same arguments as the `launch <launch>`{.interpreted-text
role="doc"} command, so you can open a new tab instead or a new OS
window, etc. Arguments of launch that that don\'t make sense when
cloning are ignored. Most prominently, the following options are
ignored:
`--allow-remote-control <launch --allow-remote-control>`{.interpreted-text
role="option"},
`--copy-cmdline <launch --copy-cmdline>`{.interpreted-text
role="option"}, `--copy-env <launch
--copy-env>`{.interpreted-text role="option"},
`--stdin-source <launch --stdin-source>`{.interpreted-text
role="option"}, `--marker <launch --marker>`{.interpreted-text
role="option"} and `--watcher <launch --watcher>`{.interpreted-text
role="option"}.

`clone-in-kitty`{.interpreted-text role="command"} can be configured to
source arbitrary code in the cloned window using environment variables.
It will automatically clone virtual environments created by the
`Python venv module
<https://docs.python.org/3/library/venv.html>`{.interpreted-text
role="link"} or `Conda
<https://conda.io/>`{.interpreted-text role="link"}. In addition,
setting the env var `KITTY_CLONE_SOURCE_CODE`{.interpreted-text
role="envvar"} to some shell code will cause that code to be run in the
cloned window with `eval`. Similarly, setting
`KITTY_CLONE_SOURCE_PATH`{.interpreted-text role="envvar"} to the path
of a file will cause that file to be sourced in the cloned window. This
can be controlled by `clone_source_strategies`{.interpreted-text
role="opt"}.

`clone-in-kitty`{.interpreted-text role="command"} works by asking the
shell to serialize its internal state (mainly CWD and env vars) and this
state is transmitted to kitty and restored by the shell integration
scripts in the cloned window.

# Edit files in new kitty windows even over SSH {#edit_file}

``` sh
edit-in-kitty myfile.txt
edit-in-kitty --type tab --title "Editing My File" myfile.txt
# open myfile.txt at line 75 (works with vim, neovim, emacs, nano, micro)
edit-in-kitty +75 myfile.txt
```

The `edit-in-kitty`{.interpreted-text role="command"} command allows you
to seamlessly edit files in your default `editor`{.interpreted-text
role="opt"} in new kitty windows. This works even over SSH (if you use
the `ssh kitten <kittens/ssh>`{.interpreted-text role="doc"}), allowing
you to easily edit remote files in your local editor with all its bells
and whistles.

The `edit-in-kitty`{.interpreted-text role="command"} command takes
almost all the same arguments as the `launch <launch>`{.interpreted-text
role="doc"} command, so you can open a new tab instead or a new OS
window, etc. Not all arguments are supported, see the discussion in the
`clone_shell`{.interpreted-text role="ref"} section above.

In order to avoid remote code execution, kitty will only execute the
configured editor and pass the file path to edit to it and it will strip
all environment variables from the `edit-in-kitty`{.interpreted-text
role="command"} command line. Additionally, parsing of colors is more
limited, reading colors from config files is not allowed.

:::: note
::: title
Note
:::

To edit files using sudo the best method is to set the `SUDO_EDITOR`
environment variable to `kitten edit-in-kitty` and then edit the file
using the `sudoedit` or `sudo -e` commands.
::::

# Using shell integration in sub-shells, containers, etc. {#run_shell}

::: versionadded
0.29.0
:::

To start a sub-shell with shell integration automatically setup, simply
run:

    kitten run-shell

This will start a sub-shell using the same binary as the currently
running shell, with shell-integration enabled. To start a particular
shell use:

    kitten run-shell --shell=/bin/bash

To run a command before starting the shell use:

    kitten run-shell ls .

This will run `ls .` before starting the shell.

This will even work on remote systems where kitty itself is not
installed, provided you use the
`SSH kitten <kittens/ssh>`{.interpreted-text role="doc"} to connect to
the system. Use `kitten run-shell --help` to learn more.

# Manual shell integration {#manual_shell_integration}

The automatic shell integration is designed to be minimally intrusive,
as such it won\'t work for sub-shells, terminal multiplexers,
containers, etc. For such systems, you should either use the
`run-shell <run_shell>`{.interpreted-text role="ref"} command described
above or setup manual shell integration by adding some code to your
shells startup files to load the shell integration script.

First, in `kitty.conf`{.interpreted-text role="file"} set:

``` conf
shell_integration disabled
```

Then in your shell\'s rc file, add the lines:

::: tab
zsh

``` sh
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi
```
:::

::: tab
fish

``` fish
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end
```
:::

::: tab
bash

``` sh
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
fi
```
:::

The value of `KITTY_SHELL_INTEGRATION`{.interpreted-text role="envvar"}
is the same as that for `shell_integration`{.interpreted-text
role="opt"}, except if you want to disable shell integration completely,
in which case simply do not set the
`KITTY_SHELL_INTEGRATION`{.interpreted-text role="envvar"} variable at
all.

In a container, you will need to install the kitty shell integration
scripts and make sure the `KITTY_INSTALLATION_DIR`{.interpreted-text
role="envvar"} environment variable is set to point to the location of
the scripts.

# Integration with other shells

There exist third-party integrations to use these features for various
other shells:

-   Jupyter console and IPython via a patch (`4475`{.interpreted-text
    role="iss"})
-   [xonsh](https://github.com/xonsh/xonsh/issues/4623)
-   [Nushell](https://github.com/nushell/nushell/discussions/12065): Set
    `$env.config.shell_integration = true` in your `config.nu` to enable
    it.

# Notes for shell developers

The protocol used for marking the prompt is very simple. You should
consider adding it to your shell as a builtin. Many modern terminals
make use of it, for example: kitty, iTerm2, WezTerm, DomTerm

Just before starting to draw the PS1 prompt send the escape code:

``` none
<OSC>133;A<ST>
```

Just before starting to draw the PS2 prompt send the escape code:

``` none
<OSC>133;A;k=s<ST>
```

Just before running a command/program, send the escape code:

``` none
<OSC>133;C<ST>
```

Optionally, when a command is finished its \"exit status\" can be
reported as:

``` none
<OSC>133;D;exit status as base 10 integer<ST>
```

Here `<OSC>` is the bytes `0x1b 0x5d` and `<ST>` is the bytes
`0x1b 0x5c`. This is exactly what is needed for shell integration in
kitty. For the full protocol, that also marks the command region, see
[the iTerm2 docs](https://iterm2.com/documentation-escape-codes.html).

kitty additionally supports several extra fields for the `<OSC>133;A`
command to control its behavior, separated by semi-colons. They are:

`redraw=0`

:   this tells kitty that the shell will not redraw the prompt on resize
    so it should not erase it

`special_key=1`

:   this tells kitty to use a special key instead of arrow keys to move
    the cursor on mouse click. Useful if arrow keys have side-effects
    like triggering auto complete. The shell integration script then
    binds the special key, as needed.

`k=s`

:   this tells kitty that the secondary (PS2) prompt is starting at the
    current line.

`click_events=1|2`

:   this tells kitty that the shell is capable of handling mouse click
    events. kitty will thus send a click event to the shell when the
    user clicks somewhere in the prompt. The shell can then move the
    cursor to that position or perform some other appropriate action.
    Without this, kitty will instead generate a number of fake key
    events to move the cursor to the clicked location, which is not
    fully robust. A value of `1` will cause the click events to have
    absolute y co-ordinates, a value of `2` will cause them to have
    y-coordinates relative to the top line of the current prompt. In
    relative mode, y is zero for cells on the top line of the current
    prompt. The current prompt here is either the secondary (PS2) or
    primary prompt. If the secondary prompt is on the same line or above
    the mouse position, then the reported y will be with respect to
    that, otherwise with respect to the primary prompt. The click event
    is encoded in the SGR encoding from xterm.

kitty also optionally supports sending the cmdline going to be executed
with `<OSC>133;C` as:

``` none
<OSC>133;C;cmdline=cmdline encoded by %q<ST>
or
<OSC>133;C;cmdline_url=cmdline as UTF-8 URL %-escaped text<ST>
```

Here, *encoded by %q* means the encoding produced by the %q format to
printf in bash and similar shells. Which is basically shell escaping
with the addition of using [ANSI C
quoting](https://www.gnu.org/software/bash/manual/html_node/ANSI_002dC-Quoting.html#ANSI_002dC-Quoting)
for control characters (`$''` quoting).
# Support kitty development ❤️

My goal with [\|kitty\|](##SUBST##|kitty|) is to move the stagnant
terminal ecosystem forward. To that end kitty has many foundational
features, such as: `image support
<graphics-protocol>`{.interpreted-text role="doc"},
`superlative performance <performance>`{.interpreted-text role="doc"},
`various enhancements to the terminal protocol <protocol-extensions>`{.interpreted-text
role="doc"}, etc. These features allow the development of rich terminal
applications, such as
`Side-by-side diff <kittens/diff>`{.interpreted-text role="doc"} and
`Unicode input
<kittens/unicode_input>`{.interpreted-text role="doc"}.

If you wish to support this mission and see the terminal ecosystem
evolve, consider donating so that I can devote more time to
[\|kitty\|](##SUBST##|kitty|) development. I have personally written
[almost all kitty
code](https://github.com/kovidgoyal/kitty/graphs/contributors).

You can choose to make either a one-time payment via PayPal or become a
*patron* of kitty development via one of the services below:

<style>
#support-buttons {
    display: flex;
    flex-wrap: wrap;
}

.support-button {
    box-sizing: border-box;
    border-radius: 6px;
    display: inline-block;
    cursor: pointer;
    color: rgb(51, 51, 51);
    font-size: inherit;
    font-family: Arial;
    font-weight: bold;
    padding: 8px 24px;
    text-decoration: none;
    margin-left: 1em;
    outline: 0;
    border-width: 0;
}

.support-button:hover {
    transform: scale(1.2);
    border: solid 1px rgb(92, 184, 92);
}

.support-button:visited {
    color: rgb(51, 51, 51);
    outline: 0;
}

#support-buttons > div {
    margin-top: 3ex;
    text-align: center;
}

#paypal input[type=submit] {
    background: linear-gradient(rgb(92, 184, 92) 5%, rgb(62, 142, 62) 100%) rgb(92, 184, 92);
    padding-top: 10px; padding-bottom: 10px;
    color: rgb(51, 51, 51);
    border: 1px solid rgb(92, 184, 92);
}

a.support-button {
    background: linear-gradient(rgb(92, 184, 92) 5%, rgb(62, 142, 62) 100%) rgb(92, 184, 92);
    color: rgb(51, 51, 51);
}

</style>

<div id="support-buttons">

<div id="github">
    <a class="support-button" href="https://github.com/sponsors/kovidgoyal">Patronage via GitHub</a>
</div>


<div id="patreon">
    <a class="support-button" href="https://www.patreon.com/bePatron?u=917933">Patronage via Patreon</a>
</div>

<div id="liberapay">
    <a class="support-button" href="https://liberapay.com/kovidgoyal/donate">Patronage via Liberapay</a>
</div>

<div>
    <form id="paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post" title="Contribute to support calibre development">
        <input type="hidden" name="cmd" value="_s-xclick" />
        <input type="hidden" name="hosted_button_id" value="FEELASHWEL5HS" />
        <input class="support-button" type="submit" name="submit" value="One time support via PayPal" />
        <img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1" />
    </form>
</div>

</div>
# Colored and styled underlines

[\|kitty\|](##SUBST##|kitty|) supports colored and styled (wavy)
underlines. This is of particular use in terminal based text editors
such as `vim`{.interpreted-text role="program"} and
`emacs`{.interpreted-text role="program"} to display red, wavy
underlines under mis-spelled words and/or syntax errors. This is done by
re-purposing some SGR escape codes that are not used in modern terminals
([CSI
codes](https://en.wikipedia.org/wiki/ANSI_escape_code#CSI_(Control_Sequence_Introducer)_sequences))

To set the underline style:

    <ESC>[4:0m  # no underline
    <ESC>[4:1m  # straight underline
    <ESC>[4:2m  # double underline
    <ESC>[4:3m  # curly underline
    <ESC>[4:4m  # dotted underline
    <ESC>[4:5m  # dashed underline
    <ESC>[4m    # straight underline (for backwards compat)
    <ESC>[24m   # no underline (for backwards compat)

To set the underline color (this is reserved and as far as I can tell
not actually used for anything):

    <ESC>[58...m

This works exactly like the codes `38, 48` that are used to set
foreground and background color respectively.

To reset the underline color (also previously reserved and unused):

    <ESC>[59m

The underline color must remain the same under reverse video, if it has
a color, if not, it should follow the foreground color.

To detect support for this feature in a terminal emulator, query the
terminfo database for the `Su` boolean capability.
# Unscrolling the screen {#unscroll}

This is a small extension to the [SD (Pan up) escape
code](https://vt100.net/docs/vt510-rm/SD.html) from the VT-420 terminal.
The `SD` escape code normally causes the text on screen to scroll down
by the specified number of lines, with empty lines appearing at the top
of the screen. This extension allows the new lines to be filled in from
the scrollback buffer instead of being blank.

The motivation for this is that many modern shells will show completions
in a block of lines under the cursor, this causes some of the on-screen
text to be lost even after the completion is completed, because it has
scrolled off screen. This escape code allows that text to be restored.

If the scrollback buffer is empty or there is no scrollback buffer, such
as for the alternate screen, then the newly inserted lines must be
empty, just as with the original `SD` escape code. The maximum number of
lines that can be scrolled down is implementation defined, but must be
at least one screen worth.

The syntax of the escape code is identical to that of `SD` except that
it has a trailing `+` modifier. This is legal under the [ECMA 48
standard](https://www.ecma-international.org/publications-and-standards/standards/ecma-48/)
and unused for any other purpose as far as I can tell. So for example,
to unscroll three lines, the escape code would be:

    CSI 3 + T

See [discussion
here](https://gitlab.freedesktop.org/terminal-wg/specifications/-/issues/30).

::: versionadded
0.20.2
:::

Also supported by the terminals:

-   [mintty](https://github.com/mintty/mintty/releases/tag/3.5.2)
# Wide gamut color formats

kitty supports modern wide gamut color formats for precise color
specification. These formats can be used anywhere a color value is
accepted in the configuration (foreground, background, color0-color255,
etc.).

## OKLCH Colors

OKLCH is a perceptually uniform color space, ideal for creating color
themes. The format is:

    foreground oklch(0.9 0.05 140)
    color1     oklch(0.7 0.25 25)

Parameters:

-   **L** (Lightness): 0 to 1, where 0 is black and 1 is white
-   **C** (Chroma): 0 to approximately 0.4, represents color saturation
-   **H** (Hue): 0 to 360 degrees (0=red, 120=green, 240=blue)

Benefits:

-   Perceptually uniform - equal changes produce equal perceived
    differences
-   Adjusting lightness preserves hue (unlike HSL)
-   Industry standard for modern color design

Example:

    foreground oklch(0.9 0.05 140)
    color1     oklch(0.65 0.25 29)    # Vibrant red-orange
    color2     oklch(0.65 0.25 142)   # Vibrant green
    color3     oklch(0.70 0.19 90)    # Warm yellow

## CIE LAB Colors

CIE LAB is a device-independent color space designed to approximate
human vision.

The format is:

    background lab(20 5 -10)
    color4     lab(50 0 -50)

Parameters:

-   **L**: Lightness, 0 to 100 (0 = black, 100 = white)
-   **a**: Green (-) to red (+), typically -100 to +100
-   **b**: Blue (-) to yellow (+), typically -100 to +100

Example:

    background lab(10 0 0)           # Very dark neutral gray
    foreground lab(90 0 0)           # Very light neutral gray
    color1     lab(50 60 40)         # Red
    color4     lab(50 0 -50)         # Blue

## Gamut Mapping

When you specify colors in OKLCH or CIE LAB formats that are outside the
sRGB color gamut, kitty automatically converts them using the CSS Color
Module Level 4 gamut mapping algorithm:

-   Preserves the original lightness and hue as much as possible
-   Reduces chroma (saturation) until the color fits within the
    displayable range
-   Uses perceptual color difference (deltaE OK) to minimize visible
    changes
-   Maximizes color saturation while staying in gamut

This ensures that wide gamut colors gracefully degrade on standard sRGB
displays while taking full advantage of wide gamut displays when
available. The mapping happens automatically - you don\'t need to do
anything special.

For example, `oklch(0.7 0.4 25)` might be too saturated for sRGB but
will be automatically adjusted to fit while preserving the perceived hue
and lightness.

## References

-   [CSS Color Module Level 4](https://www.w3.org/TR/css-color-4/)
-   [OKLCH Color Space](https://bottosson.github.io/posts/oklab/)
