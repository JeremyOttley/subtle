# -*- encoding: utf-8 -*-

begin
  require "#{ENV["HOME"]}/hg/subtle-contrib/ruby/launcher.rb"

  # Set fonts
   Subtle::Contrib::Launcher.fonts = [
    "xft:PT_Serif-Web-Regular:pixelsize=9:antialias=true",
   ]
rescue LoadError => error
  puts error
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

# Keys

    grab "XF86Tools",            "mpd"
    grab "XF86AudioPlay",        "ncmpcpp toggle"
    grab "XF86AudioPrev",        "ncmpcpp prev"
    grab "XF86AudioNext",        "ncmpcpp next"
    #grab "XF86AudioMute",        "volume-controle.rb toggle"
    #grab "XF86AudioLowerVolume", "volume-controle.rb down"
    #grab "XF86AudioRaiseVolume", "volume-controle.rb up"

# Tags

tag "terminal", "urxvt|urxvtc|xterm|konsole|kitty"
tag "web",      "qutebrowser|dwb|iceweasel|midori|chromium|icedove|hotot|pidgin"

# Views

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

# Hooks

on :start do
      Subtlext::Subtle.spawn "sh ~/.fehbg"
      Subtlext::Subtle.spawn "mpd"
      Subtlext::Subtle.spawn "sleep 2s && subtler -r"
      Subtlext::Subtle.spawn "compton -CGbc -t -8 -l -9 -r 6 -o 0.7 -m 1.0"
      Subtlext::Subtle.spawn "xautolock -time 15 -locker 'i3lock -ubi /home/gazbit/.wallpapers/*.png'" 
    end
