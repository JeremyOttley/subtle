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

# Sublets

# Hooks
