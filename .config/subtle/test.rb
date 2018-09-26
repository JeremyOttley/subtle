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
