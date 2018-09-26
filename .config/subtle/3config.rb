#
# Author::  Christoph Kappel <unexist@dorfelite.net>
# Version:: $Id$
# License:: GNU GPL
#
# = Subtle default configuration # {{{
#
# This file will be installed as default and can also be used as a starter for
# an own custom configuration file. The system wide config usually resides in
# +/etc/xdg/subtle+ and the user config in +HOME/.config/subtle+, both locations
# are dependent on the locations specified by +XDG_CONFIG_DIRS+ and
# +XDG_CONFIG_HOME+.

begin
  require "#{ENV["HOME"]}/hg/subtle-contrib/ruby/launcher.rb"

  # Set fonts
   Subtle::Contrib::Launcher.fonts = [
    "xft:Pragmata:pixelsize=9:antialias=true",
   ]
rescue LoadError => error
  puts error
end


# == Options
#
# Border size in pixel of the windows

# Window move/resize steps in pixel per keypress
set :step, 5

# Window screen border snapping
set :snap, 10

set :gap, 3

# Default starting gravity for windows (0 = gravity of last client)
set :gravity, :center

# Make transient windows urgent
set :urgent, false

# Honor resize size hints globally
set :resize, true

# Screen strut for e.g. other panels (left, right, top, bottom)

# Font string either take from e.g. xfontsel or use xft
#set :font, "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"
set :font, "xft:pragmata:pixelsize=9"

# Space around windows

# Panel size padding (left, right, top, bottom)

# Separator between sublets
set :separator, "//"

# Outline border size in pixel of panel items #}}}


screen 1 do
  # Add stipple to panels
  stipple false

  # Content of the bottom panel
  bottom     [ :title, :spacer, :views, ]

  # Content of the top panel
  top  [ :spacer, :mpd, :separator, :clock, ]
end #}}}


# Colors of focus window title
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

# }}}

# == Gravities# {{{

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

# }}}


# Switch current view
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

# Select next and prev view */
grab "KP_Add",      :ViewNext
grab "KP_Subtract", :ViewPrev

# Move mouse to screen1, screen2, ...
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4

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
grab "XF86HomePage", "firefox"

# Media Keys
grab "XF86AudioPlay", "mpc toggle"
grab "XF86AudioPrev", "mpc prev"
grab "XF86AudioNext", "mpc next"
grab "XF86AudioStop", "mpc stop"
grab "XF86AudioMedia", "/home/spjulius/bin/mpm"
grab "XF86AudioLowerVolume", "/home/spjulius/bin/volume -d 5"
grab "XF86AudioRaiseVolume", "/home/spjulius/bin/volume -i 5"
grab "XF86AudioMute", "/home/spjulius/bin/volume -t"
grab "W-XF86AudioMedia", "albumbler"

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end # }}}

# == Tags# {{{

# Simple tags
tag "terms",   "xterm|[u]?rxvt"
tag "browser", "uzbl|opera|firefox|navigator"
tag "filem",   "thunar|gtk2fontsel|lxappearance" 
tag "editor",  "gedit"
tag "chat",    "emesene|pidgin"

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


# == Views # {{{

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

end #}}}

# == Sublets# {{{

sublet :fuzzytime do
  locale        "es"
end

sublet :pacman do
  interval      60
  separator     "/"
  label_color   "#D23D3D"
  count_color   "#404040"
end

sublet :smpd do
  artist_color  "#8542FF"
  title_color   "#505050"
  pause_color   "#101010"
end

# }}}

# == Hooks# {{{
on :start do

  # Create missing tags
  views = Subtlext::View.all.map { |v| v.name }
  tags  = Subtlext::Tag.all.map { |t| t.name }
 
  views.each do |v|
    unless(tags.include?(v))
      t = Subtlext::Tag.new(v)
      t.save
    end
  end
end

on :client_create do |c|
  view = Subtlext::View.current
  tags = c.tags.map { |t| t.name }
 
  # Add tag to view
  view.tag(view.name) unless(view.tags.include?(view.name))
 
  # Exclusive for clients with default tag only
  if(tags.include?("default") and 1 == tags.size)
    c.tags = [ view.name ]
  end
    
  # Focus client on creation
  c.views.first.jump
  c.focus
end

#}}}
