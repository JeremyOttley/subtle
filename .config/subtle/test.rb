# -*- encoding: utf-8 -*-

begin
  require "#{ENV["HOME"]}/hg/subtle-contrib/ruby/launcher.rb"

  # Set fonts
   Subtle::Contrib::Launcher.fonts = [
    "xft:PT_Serif-Web-Regular:pixelsize=9:antialias=true",
   ]
rescue LoadError => error
  log = File.open("#{ENV["HOME"]}/subtle.log", "w+")
  log.write("Can't load launcher.rb")
end

#set :font, "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"

# General options

# Panels

screen 1 do
      top     [ ]
      bottom  [ ]
     
    end

# Addons

# Colors

background_1 =   ""
background_2 =   ""    

color_above =    ""
color_light =    ""
color_medium =   ""
color_dark =     ""

# Styles

style :title do
  padding     1, 10, 0
  foreground  "#aaaaaa"
  border_bottom "#303030", 0
  background  "#151515"
end

style :focus do
  padding     1, 4, 0, 4
  foreground  "#151515"
  background  "#739896"
end

style :urgent do
  padding     3, 4, 0, 4
  border_bottom "#8edf8d", 2
  foreground  "#ffffff"
  background  "#519f50"
end

style :occupied do
  padding     1, 4, 0, 4
  border_bottom "#303030", 2
  foreground  "#606060"
  background  "#151515"
end

style :views do
  padding     1, 4, 0, 4
  foreground  "#aaaaaa"
  background  "#151515"
end

style :sublets do
  padding     1, 10, 0
  foreground  "#707070"
  border_bottom "#303030", 0
  background  "#151515"
end

style :separator do
  padding     1, 0, 0
  foreground  "#983528"
  background  "#151515"
end

style :clients do
  active      "#739896", 3
  inactive    "#252525", 3
  margin      4
end

style :subtle do
  padding     2
  panel_top   "#151515"
  panel_bottom "#151515"
  launcher_top "#202020"
  launcher_bottom "#ff0000"
  stipple     "#757575"
end

# Gravities

# set :tiling, true

# Top left
gravity :tl_a1,             [   0,   0,  33,  33 ]
gravity :tl_a2,             [   0,   0,  50,  33 ]
gravity :tl_a3,             [   0,   0,  67,  33 ]

gravity :tl_b1,             [   0,   0,  33,  50 ]
gravity :tl_b2,             [   0,   0,  50,  50 ]
gravity :tl_b3,             [   0,   0,  67,  50 ]

gravity :tl_c1,             [   0,   0,  33,  67 ]
gravity :tl_c2,             [   0,   0,  50,  67 ]
gravity :tl_c3,             [   0,   0,  67,  67 ]

# Top center
gravity :tc_a1,             [   0,   0, 100,  50 ]
gravity :tc_a2,             [   0,   0, 100,  67 ]
gravity :tc_a3,             [   0,   0, 100,  33 ]

gravity :tc_b1,             [  33,   0,  34,  33 ]
gravity :tc_b2,             [  33,   0,  34,  50 ]
gravity :tc_b3,             [  33,   0,  34,  67 ]

# Top right
gravity :tr_a1,             [  67,   0,  33,  33 ]
gravity :tr_a2,             [  50,   0,  50,  33 ]
gravity :tr_a3,             [  33,   0,  67,  33 ]

gravity :tr_b1,             [  67,   0,  33,  50 ]
gravity :tr_b2,             [  50,   0,  50,  50 ]
gravity :tr_b3,             [  33,   0,  67,  50 ]

gravity :tr_c1,             [  67,   0,  33,  67 ]
gravity :tr_c2,             [  50,   0,  50,  67 ]
gravity :tr_c3,             [  33,   0,  67,  67 ]

# Left
gravity :l_a1,              [   0,  33,  33,  34 ]
gravity :l_a2,              [   0,  33,  50,  34 ]
gravity :l_a3,              [   0,  33,  67,  34 ]

gravity :l_b1,              [   0,  50,  33, 100 ]
gravity :l_b2,              [   0,  50,  50, 100 ]
gravity :l_b3,              [   0,  50,  67, 100 ]


# Center
gravity :center,            [   0,   0, 100, 100 ]

# Right
gravity :r_a1,              [  67,  33,  33,  34 ]
gravity :r_a2,              [  50,  33,  50,  34 ]
gravity :r_a3,              [  33,  33,  67,  34 ]

gravity :r_b1,              [  67,  50,  33, 100 ]
gravity :r_b2,              [  50,  50,  50, 100 ]
gravity :r_b3,              [  33,  50,  67, 100 ]

# Bottom left
gravity :bl_a1,             [   0,  67,  33,  33 ]
gravity :bl_a2,             [   0,  67,  50,  33 ]
gravity :bl_a3,             [   0,  67,  67,  33 ]

gravity :bl_b1,             [   0,  50,  33,  50 ]
gravity :bl_b2,             [   0,  50,  50,  50 ]
gravity :bl_b3,             [   0,  50,  67,  50 ]

gravity :bl_c1,             [   0,  33,  33,  67 ]
gravity :bl_c2,             [   0,  33,  50,  67 ]
gravity :bl_c3,             [   0,  33,  67,  67 ]

# Bottom center
gravity :bc_a1,             [   0,  50, 100,  50 ]
gravity :bc_a2,             [   0,  33, 100,  67 ]
gravity :bc_a3,             [   0,  67, 100,  33 ]

gravity :bc_b1,             [  33,  67,  34,  33 ]
gravity :bc_b2,             [  33,  50,  34,  50 ]
gravity :bc_b3,             [  33,  33,  34,  67 ]

# Bottom right
gravity :br_a1,             [  67,  67,  33,  33 ]
gravity :br_a2,             [  50,  67,  50,  33 ]
gravity :br_a3,             [  33,  67,  67,  33 ]

gravity :br_b1,             [  67,  50,  33,  50 ]
gravity :br_b2,             [  50,  50,  50,  50 ]
gravity :br_b3,             [  33,  50,  67,  50 ]

gravity :br_c1,             [  67,  33,  33,  67 ]
gravity :br_c2,             [  50,  33,  50,  67 ]
gravity :br_c3,             [  33,  33,  67,  67 ]

# Gimp
gravity :gimp_image,        [  10,   0,  80, 100 ]
gravity :gimp_toolbox,      [   0,   0,  10, 100 ]
gravity :gimp_dock,         [  90,   0,  10, 100 ]

# Keys

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-S-r", :SubtleRestart

# Quit subtle
grab "W-C-q", :SubtleQuit

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "W-f", :WindowFloat

# Launcher
grab "W-space" do Subtle::Contrib::Launcher.run; end

# Toggle sticky mode of window (will be visible on all views)
#grab "W-C-s", :WindowStick
grab "W-C-s" do |c| c.toggle_stick; c.tags = [ Subtlext::View.current.name ]; end

# Raise window
grab "W-r", :WindowRaise

# Lower window
grab "W-m", :WindowLower

# Select next windows
grab "W-h",  :WindowLeft
grab "W-j",  :WindowDown
grab "W-k",  :WindowUp
grab "W-l",  :WindowRight

# Kill current window
grab "W-S-k", :WindowKill

# Cycle between given gravities

grab "W-KP_7",  [ :tl_a1, :tl_a2, :tl_a3, :tl_b1, :tl_b2, :tl_b3, :tl_c1, :tl_c2, :tl_c3 ]
grab "W-KP_8",  [ :tc_a1, :tc_a2, :tc_a3, :tc_b1, :tc_b2, :tc_b3                         ]
grab "W-KP_9",  [ :tr_a1, :tr_a2, :tr_a3, :tr_b1, :tr_b2, :tr_b3, :tr_c1, :tr_c2, :tr_c3 ]

grab "W-KP_4",  [ :l_a1,  :l_a2,  :l_a3,  :l_b1,  :l_b2,  :l_b3 ]
grab "W-KP_6",  [ :r_a1,  :r_a2,  :r_a3,  :r_b1,  :r_b2,  :r_b3 ]

grab "W-KP_1",  [ :tl_a1, :tl_a2, :tl_a3, :tl_b1, :tl_b2, :tl_b3, :tl_c1, :tl_c2, :tl_c3 ]
grab "W-KP_2",  [ :bc_a1, :bc_a2, :bc_a3, :bc_b1, :bc_b2, :bc_b3                         ]
grab "W-KP_3",  [ :br_a1, :br_a2, :br_a3, :br_b1, :br_b2, :br_b3, :br_c1, :br_c2, :br_c3 ]

# In case no numpad is available e.g. on notebooks

grab "W-q",     [ :tl_a1, :tl_a2, :tl_a3, :tl_b1, :tl_b2, :tl_b3, :tl_c1, :tl_c2, :tl_c3 ]
grab "W-w",     [ :tc_a1, :tc_a2, :tc_a3, :tc_b1, :tc_b2, :tc_b3                         ]
grab "W-e",     [ :tr_a1, :tr_a2, :tr_a3, :tr_b1, :tr_b2, :tr_b3, :tr_c1, :tr_c2, :tr_c3 ]

grab "W-a",     [ :l_a1,  :l_a2,  :l_a3,  :l_b1,  :l_b2,  :l_b3 ]
grab "W-d",     [ :r_a1,  :r_a2,  :r_a3,  :r_b1,  :r_b2,  :r_b3 ]

grab "W-z",     [ :bl_a1, :bl_a2, :bl_a3, :bl_b1, :bl_b2, :bl_b3, :bl_c1, :bl_c2, :bl_c3 ]
grab "W-x",     [ :bc_a1, :bc_a2, :bc_a3, :bc_b1, :bc_b2, :bc_b3                         ]
grab "W-c",     [ :br_a1, :br_a2, :br_a3, :br_b1, :br_b2, :br_b3, :br_c1, :br_c2, :br_c3 ]

# Exec programs

grab "W-Return", "urxvt"
grab "A-F2", 'dmenu_run -fn "-*-terminus-medium-r-*-*-12-*-*-*-*-*-*-*" -nb "#202020" -nf "#757575" -sb "#757575" -sf "#202020" -p "RUN:" -i'
grab "XF86AudioMute", "amixer sset Master toggle"
grab "XF86AudioLowerVolume", "amixer set Master 1%- unmute"
grab "XF86AudioRaiseVolume", "amixer set Master 1%+ unmute"

    grab "XF86Tools",            "mpd"
    grab "XF86AudioPlay",        "ncmpcpp toggle"
    grab "XF86AudioPrev",        "ncmpcpp prev"
    grab "XF86AudioNext",        "ncmpcpp next"

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end # }}}

# Tags

tag "terminal", "urxvt|urxvtc|xterm|konsole|kitty"
tag "web",      "qutebrowser|dwb|iceweasel|midori|chromium|icedove|hotot|pidgin"

# Placement
tag "editor" do
  match  "[g]?vim"
  resize true
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

tag "resize" do
  match  "sakura|gvim"
  resize true
end

tag "gravity" do
  gravity :center
end

# Modes
tag "stick" do
  match "mplayer"
  float true
  stick true
end

tag "float" do
  match "display"
  float true
end

# Gimp
tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox$"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end

# Views

grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4
grab "W-5", :ViewSwitch5
grab "W-6", :ViewSwitch6
grab "W-7", :ViewSwitch7

(1..7).each do |i|
  grab "W-S-%d" % [ i ] do |c|
    views = Subtlext::View.all
    names = views.map { |v| v.name }
 
    # Sanity check
    if(i <= views.size)
      # Tag client
      tags = c.tags.reject { |t| names.include?(t.name) or "default" == t.name }
      tags << names[i - 1]
 
      c.tags = tags
 
      # Tag view
      views[i - 1].tag(names[i - 1])
    end
  end
end

view "TERMS" do
  match "terms|default"
  icon_only false
end

view "MISC" do
  match "editor"
end

view "INET" do
  match "browser"
end

view "FILEM" do
  match "gimp_.*|filem|chat"

end

# Sublets

sublet :mpd do
      format_string    "%artist% %title%"
      show_icons       false
      show_colors      true
      show_pause       true
      artist_color     color_medium
      title_color      color_light
      pause_color      color_medium
      stop_color       color_medium
      stop_text        "Stop"
      pause_text       "Pause"
      not_running_text "N/A"
    end
      
    sublet :clock2 do
      interval         30
      time_format      "%H:%M"
      time_color       color_above
      date_format      ""
    end

sublet :fuzzytime do
  locale        "en"
end



# Hooks

on :start do
  views = Subtlext::View.all.map { |v| v.name }
  tags  = Subtlext::Tag.all.map { |t| t.name }
  
      Subtlext::Subtle.spawn "sh ~/.fehbg"
      Subtlext::Subtle.spawn "mpd"
      Subtlext::Subtle.spawn "sleep 2s && subtler -r"
      Subtlext::Subtle.spawn "compton -CGbc -t -8 -l -9 -r 6 -o 0.7 -m 1.0"
      Subtlext::Subtle.spawn "xautolock -time 15 -locker 'i3lock -ubi /home/gazbit/.wallpapers/*.png'" 
    end

on :reload do
    Subtlext::Client.spawn( "sh ~/.config/polybar/launch.sh" )
end


#
# == Screen
#
# Generally subtle comes with two panels per screen, one on the top and one at
# the bottom. Each panel can be configured with different panel items and
# sublets screen wise. The default config uses top panel on the first screen
# only, it's up to the user to enable the bottom panel or disable either one
# or both.

# === Properties
#
# [*stipple*]    This property adds a stipple pattern to both screen panels.
#
#                Example: stipple "~/stipple.xbm"
#                         stipple Subtlext::Icon.new("~/stipple.xbm")
#
# [*top*]        This property adds a top panel to the screen.
#
#                Example: top [ :views, :title ]
#
# [*bottom*]     This property adds a bottom panel to the screen.
#
#                Example: bottom [ :views, :title ]

#
# Following items are available for the panels:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons (Can be used only once)
# [*:keychain*]  Display current chain (Can be used only once)
# [*:sublets*]   Catch-all for installed sublets
# [*:sublet*]    Name of a sublet for direct placement
# [*:spacer*]    Variable spacer (free width / count of spacers)
# [*:center*]    Enclose items with :center to center them on the panel
# [*:separator*] Insert separator
#
# Empty panels are hidden.
#
# === Links
#
# http://subforge.org/projects/subtle/wiki/Multihead
# http://subforge.org/projects/subtle/wiki/Panel
#

# Example for a second screen:
#screen 2 do
#  top    [ :views, :title, :spacer ]
#  bottom [ ]
#end

#
# == Styles
#
# Styles define various properties of styleable items in a CSS-like syntax.
#
# If no background color is given no color will be set. This will ensure a
# custom background pixmap won't be overwritten.
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Styles

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways
# to set a certain gravity, most convenient is to define a gravity via a tag or
# change them during runtime via grab. Subtler and subtlext can also modify
# gravities.
#
# A gravity consists of four values which are a percentage value of the screen
# size. The first two values are x and y starting at the center of the screen
# and he last two values are the width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   gravity :example, [ 0, 0, 100, 100 ]
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Gravity
#

#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Finding keys
#
# The best resource for getting the correct key names is
# */usr/include/X11/keysymdef.h*, but to make life easier here are some hints
# about it:
#
# * Numbers and letters keep their names, so *a* is *a* and *0* is *0*
# * Keypad keys need *KP_* as prefix, so *KP_1* is *1* on the keypad
# * Strip the *XK_* from the key names if looked up in
#   /usr/include/X11/keysymdef.h
# * Keys usually have meaningful english names
# * Modifier keys have special meaning (Alt (A), Control (C), Meta (M),
#   Shift (S), Super (W))
#
# === Chaining
#
# Chains are a combination of keys and modifiers to one or a list of keys
# and can be used in various ways to trigger an action. In subtle, there are
# two ways to define chains for grabs:
#
#   1. *Default*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Chain*: Define a list of grabs that need to be pressed in order
#
#      *Example*: grab "C-y Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*] = Button1 (Left mouse button)
# [*B2*] = Button2 (Middle mouse button)
# [*B3*] = Button3 (Right mouse button)
# [*B4*] = Button4 (Mouse wheel up)
# [*B5*] = Button5 (Mouse wheel down)
#
# ==== Modifiers
#
# [*A*] = Alt key
# [*C*] = Control key
# [*M*] = Meta key
# [*S*] = Shift key
# [*W*] = Super (Windows) key
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#   grab "C-a c",    "urxvt"
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Grabs
#

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# === Simple
#
# The simple way just needs a name and a regular expression to just handle the
# placement:
#
# Example:
#
#  tag "terms", "terms"
#
# === Extended
#
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# Example:
#
#  tag "terms" do
#    match   "xterm|[u]?rxvt"
#    gravity :center
#  end
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the
# default view. The default view can either be set by the user with adding the
# default tag to a view by choice or otherwise the first defined view will be
# chosen automatically.
#
# === Properties
#
# [*borderless*] This property enables the borderless mode for tagged clients.
#
#                Example: borderless true
#                Links:    http://subforge.org/projects/subtle/wiki/Tagging#Borderless
#                          http://subforge.org/projects/subtle/wiki/Clients#Borderless
#
# [*fixed*]      This property enables the fixed mode for tagged clients.
#
#                Example: fixed true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fixed
#                         http://subforge.org/projects/subtle/wiki/Clients#Fixed
#
# [*float*]      This property enables the float mode for tagged clients.
#
#                Example: float true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Float
#                         http://subforge.org/projects/subtle/wiki/Clients#Float
#
# [*full*]       This property enables the fullscreen mode for tagged clients.
#
#                Example: full true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fullscreen
#                         http://subforge.org/projects/subtle/wiki/Clients#Fullscreen
#
# [*geometry*]   This property sets a certain geometry as well as floating mode
#                to the tagged client, but only on views that have this tag too.
#                It expects an array with x, y, width and height values whereas
#                width and height must be >0.
#
#                Example: geometry [100, 100, 50, 50]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Geometry
#
# [*gravity*]    This property sets a certain to gravity to the tagged client,
#                but only on views that have this tag too.
#
#                Example: gravity :center
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Gravity
#
# [*match*]      This property adds matching patterns to a tag, a tag can have
#                more than one. Matching works either via plaintext, regex
#                (see man regex(7)) or window id. Per default tags will only
#                match the WM_NAME and the WM_CLASS portion of a client, this
#                can be changed with following possible values:
#
#                [*:name*]      Match the WM_NAME
#                [*:instance*]  Match the first (instance) part from WM_CLASS
#                [*:class*]     Match the second (class) part from WM_CLASS
#                [*:role*]      Match the window role
#                [*:type*]      Match the window type
#
#                Examples: match instance: "urxvt"
#                          match [:role, :class] => "test"
#                          match "[xa]+term"
#                Link:     http://subforge.org/projects/subtle/wiki/Tagging#Match
#
# [*position*]   Similar to the geometry property, this property just sets the
#                x/y coordinates of the tagged client, but only on views that
#                have this tag, too. It expects an array with x and y values.
#
#                Example: position [ 10, 10 ]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Position
#
# [*resize*]     This property enables the float mode for tagged clients.
#
#                Example: resize true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Resize
#                         http://subforge.org/projects/subtle/wiki/Clients#Resize
#
# [*stick*]      This property enables the float mode for tagged clients.
#
#                Example: stick true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Stick
#
# [*type*]       This property sets the tagged client to be treated as a specific
#                window type though as the window sets the type itself. Following
#                types are possible:
#
#                [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Desktop
#                [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dock
#                [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Toolbar
#                [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Splash
#                [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dialog
#
#                Example: type :desktop
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Type
#
# [*urgent*]     This property enables the urgent mode for tagged clients.
#
#                Example: stick true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Urgent
#
# [*zaphod*]     This property enables the zaphod mode for tagged clients.
#
#                Example: zaphod true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Zaphod
#                         http://subforge.org/projects/subtle/wiki/Clients#Zaphod
#
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Tagging
#

#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#
# Like tags views can be defined in two ways:
#
# === Simple
#
# The simple way is exactly the same as for tags:
#
# Example:
#
#   view "terms", "terms"
#
# === Extended
#
# The extended way for views is also similar to the tags, but with fewer
# properties.
#
# Example:
#
#  view "terms" do
#    match "terms"
#    icon  "/usr/share/icons/icon.xbm"
#  end
#
# === Properties
#
# [*match*]      This property adds a matching pattern to a view. Matching
#                works either via plaintext or regex (see man regex(7)) and
#                applies to names of tags.
#
#                Example: match "terms"
#
# [*dynamic*]    This property hides unoccupied views, views that display no
#                windows.
#
#                Example: dynamic true
#
# [*icon*]       This property adds an icon in front of the view name. The
#                icon can either be path to an icon or an instance of
#                Subtlext::Icon.
#
#                Example: icon "/usr/share/icons/icon.xbm"
#                         icon Subtlext::Icon.new("/usr/share/icons/icon.xbm")
#
# [*icon_only*]  This property hides the view name from the view buttons, just
#                the icon will be visible.
#
#                Example: icon_only true
#
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Tagging
#

#
# == Sublets
#
# Sublets are Ruby scripts that provide data for the panel and can be managed
# with the sur script that comes with subtle.
#
# === Example
#
#  sur install clock
#  sur uninstall clock
#  sur list
#
# === Configuration
#
# All sublets have a set of configuration values that can be changed directly
# from the config of subtle.
#
# There are three default properties, that can be be changed for every sublet:
#
# [*interval*]    Update interval of the sublet
# [*foreground*]  Default foreground color
# [*background*]  Default background color
#
# sur can also give a brief overview about properties:
#
# === Example
#
#   sur config clock
#
# The syntax of the sublet configuration is similar to other configuration
# options in subtle:
#
# === Example
#
#  sublet :clock do
#    interval      30
#    foreground    "#eeeeee"
#    background    "#000000"
#    format_string "%H:%M:%S"
#  end
#
#  === Link
#
# http://subforge.org/projects/subtle/wiki/Sublets
#

#
# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event.
#
# Following hooks exist so far:
#
# [*:client_create*]    Called whenever a window is created
# [*:client_configure*] Called whenever a window is configured
# [*:client_focus*]     Called whenever a window gets focus
# [*:client_kill*]      Called whenever a window is killed
#
# [*:tag_create*]       Called whenever a tag is created
# [*:tag_kill*]         Called whenever a tag is killed
#
# [*:view_create*]      Called whenever a view is created
# [*:view_configure*]   Called whenever a view is configured
# [*:view_jump*]        Called whenever the view is switched
# [*:view_kill*]        Called whenever a view is killed
#
# [*:tile*]             Called on whenever tiling would be needed
# [*:reload*]           Called on reload
# [*:start*]            Called on start
# [*:exit*]             Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   on :client_focus do |c|
#     puts c.name
#   end
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Hooks
#




# vim:ts=2:bs=2:sw=2:et:fdm=marker
