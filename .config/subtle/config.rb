# -*- encoding: utf-8 -*-

set :increase_step, 10
set :border_snap, 10
set :default_gravity, :ct66
set :urgent_dialogs, false
set :honor_size_hints, false
set :gravity_tiling, false
set :click_to_focus, false
set :skip_pointer_warp, false
set :skip_urgent_warp, false

screen 1 do
  top    [ :title, :center, :views, :center, :spacer, :separator, :tray, :spacer, :clock ]
  bottom [ ]
end

style :all do
  background  "#000000"
  icon        "#c80069"
  border      "#59002f", 1
  padding     0, 7
  font        "xft:FiraCode Regular-10:antialias=true"
end
style :views do
  padding 1, 4, 1, 4
  foreground  "#ffc863"
  background  "#000000"
  style :focus do
    foreground  "#ffda95"
    padding     1, 4, 1, 4
    background  "#111111"
    border_bottom "#aa2222", 2
  end
  style :urgent do
    padding     1, 3, 0, 3
    foreground  "#dbdcdc"
    background  "#ffffff"
  end
  style :occupied do
    padding     1, 4, 1, 4
    foreground  "#f3005d"
    background  "#191919"
  end
end
style :sublets do
    padding   1, 1, 1, 1
    border    "#191919", 2
  foreground  "#757575"
  background  "#191919"
end
style :separator do
  foreground  "#dadada"
  background  "#260014"
  separator   " <<< "
end
style :title do
  padding     1, 1, 1, 1
  foreground  "#994166"
  background  "#111111"
end
style :clients do
  active    "#303030", 2
  inactive  "#202020", 2
  margin    1
  width     50
end
style :subtle do
  margin      0, 0, 0, 0
  padding     0, 0, 0, 0
  panel       "#111111"
  background  "#222222"
  stipple     "#757575"
end

col_red     = Subtlext::Color.new("#b94b64")
col_blue    = Subtlext::Color.new("#4e89b0")
coffee      = Subtlext::Color.new("#c0ffee")
yellow      = Subtlext::Color.new("#fdc3c1")

sublet :clock do
  interval 1
  format_string "#{yellow}%a %b %d, %H:%M:%S"
  show_icons false
end

gravity :center_1,       [   0,   0,  100,  88 ]
gravity :tl_a1,     [   0,   0,  33,  33 ]
gravity :tl_a2,     [   0,   0,  50,  33 ]
gravity :tl_a3,     [   0,   0,  67,  33 ]
gravity :tl_b1,     [   0,   0,  33,  50 ]
gravity :tl_b2,     [   0,   0,  50,  50 ]
gravity :tl_b3,     [   0,   0,  67,  50 ]
gravity :tl_c1,     [   0,   0,  33,  67 ]
gravity :tl_c2,     [   0,   0,  50,  67 ]
gravity :tl_c3,     [   0,   0,  67,  67 ]
gravity :tc_a1,     [   0,   0, 100,  50 ]
gravity :tc_a2,     [   0,   0, 100,  67 ]
gravity :tc_a3,     [   0,   0, 100,  33 ]
gravity :tc_b1,     [  33,   0,  34,  33 ]
gravity :tc_b2,     [  33,   0,  34,  50 ]
gravity :tc_b3,     [  33,   0,  34,  67 ]
gravity :tr_a1,     [  67,   0,  33,  33 ]
gravity :tr_a2,     [  50,   0,  50,  33 ]
gravity :tr_a3,     [  33,   0,  67,  33 ]
gravity :tr_b1,     [  67,   0,  33,  50 ]
gravity :tr_b2,     [  50,   0,  50,  50 ]
gravity :tr_b3,     [  33,   0,  67,  50 ]
gravity :tr_c1,     [  67,   0,  33,  67 ]
gravity :tr_c2,     [  50,   0,  50,  67 ]
gravity :tr_c3,     [  33,   0,  67,  67 ]
gravity :l_a1,      [   0,  33,  33,  34 ]
gravity :l_a2,      [   0,  33,  50,  34 ]
gravity :l_a3,      [   0,  33,  67,  34 ]
gravity :l_b1,      [   0,   0,  33, 100 ]
gravity :l_b2,      [   0,   0,  50, 100 ]
gravity :l_b3,      [   0,   0,  67, 100 ]
gravity :ct,        [   0,   0, 100, 100 ]
gravity :ct33,      [  33,  33,  34,  34 ] 
gravity :ct66,      [  25,  25,  50,  50 ], :vert
gravity :ct40,      [  0,  33,  100,  34 ]
gravity :r_a1,      [  67,  33,  33,  34 ]
gravity :r_a2,      [  50,  33,  50,  34 ]
gravity :r_a3,      [  33,  33,  67,  34 ]
gravity :r_b1,      [  67,   0,  33, 100 ]
gravity :r_b2,      [  50,   0,  50, 100 ]
gravity :r_b3,      [  33,   0,  67, 100 ]
gravity :bl_a1,     [   0,  67,  33,  33 ]
gravity :bl_a2,     [   0,  67,  50,  33 ]
gravity :bl_a3,     [   0,  67,  67,  33 ]
gravity :bl_b1,     [   0,  50,  33,  50 ]
gravity :bl_b2,     [   0,  50,  50,  50 ]
gravity :bl_b3,     [   0,  50,  67,  50 ]
gravity :bl_c1,     [   0,  33,  33,  67 ]
gravity :bl_c2,     [   0,  33,  50,  67 ]
gravity :bl_c3,     [   0,  33,  67,  67 ]
gravity :bc_a1,     [   0,  50, 100,  50 ]
gravity :bc_a2,     [   0,  33, 100,  67 ]
gravity :bc_a3,     [   0,  67, 100,  33 ]
gravity :bc_b1,     [  33,  67,  34,  33 ]
gravity :bc_b2,     [  33,  50,  34,  50 ]
gravity :bc_b3,     [  33,  33,  34,  67 ]
gravity :br_a1,     [  67,  67,  33,  33 ]
gravity :br_a2,     [  50,  67,  50,  33 ]
gravity :br_a3,     [  33,  67,  67,  33 ]
gravity :br_b1,     [  67,  50,  33,  50 ]
gravity :br_b2,     [  50,  50,  50,  50 ]
gravity :br_b3,     [  33,  50,  67,  50 ]
gravity :br_c1,     [  67,  33,  33,  67 ]
gravity :br_c2,     [  50,  33,  50,  67 ]
gravity :br_c3,     [  33,  33,  67,  67 ]
gravity :sp_br,     [  70,  85,  30,  15 ]
gravity :sp_bl,     [   0,  85,  30,  15 ]
gravity :sp_tr,     [  70,   0,  30,  15 ]
gravity :sp_tl,     [   0,   0,  30,  15 ]

gravity :gimp_i,    [  10,   0,  80, 100 ]
gravity :gimp_t,    [   0,   0,  10, 100 ]
gravity :gimp_d,    [  90,   0,  10, 100 ]

grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4
grab "KP_Add",      :ViewNext
grab "KP_Subtract", :ViewPrev
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4
grab "W-C-r", :SubtleReload
grab "W-C-S-r", :SubtleRestart
grab "W-C-q", :SubtleQuit
grab "W-B1", :WindowMove
grab "W-B3", :WindowResize
grab "W-f", :WindowFloat
grab "W-space", :WindowFull
grab "W-s", :WindowStick
grab "W-equal", :WindowZaphod
grab "W-r", :WindowRaise
grab "W-l", :WindowLower
grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight
grab "W-q", :WindowKill
grab "W-KP_9", [ :tr_a1, :tr_a2, :tr_a3, :tr_b1, :tr_b2, :tr_b3, :tr_c1, :tr_c2, :tr_c3 ]
grab "W-KP_8", [ :tc_b1, :tc_b2, :tc_b3, :tc_a3, :tc_a1, :tc_a2 ]
grab "W-KP_7", [ :tl_a1, :tl_a2, :tl_a3, :tl_b1, :tl_b2, :tl_b3, :tl_c1, :tl_c2, :tl_c3 ]
grab "W-KP_6", [ :r_a1,  :r_a2,  :r_a3,  :r_b1,  :r_b2,  :r_b3 ]
grab "W-KP_5", [ :ct33,  :ct66,  :ct,    :ct40           ]
grab "W-KP_4", [ :l_a1,  :l_a2,  :l_a3,  :l_b1,  :l_b2,  :l_b3 ]
grab "W-KP_3", [ :br_a1, :br_a2, :br_a3, :br_b1, :br_b2, :br_b3, :br_c1, :br_c2, :br_c3 ]
grab "W-KP_2", [ :bc_b1, :bc_b2, :bc_b3, :bc_a3, :bc_a1, :bc_a2  ] 
grab "W-KP_1", [ :bl_a1, :bl_a2, :bl_a3, :bl_b1, :bl_b2, :bl_b3, :bl_c1, :bl_c2, :bl_c3 ]
grab "W-KP_0", [ :sp_br,        :sp_bl,          :sp_tr,            :sp_tl          ]
grab "W-Return", "urxvtc"
grab "W-p", "dmenu_run -b -fn '-*-inconsolata-*-*-*-*-*-*-*-*-*-*-*-*' -nb 'rgb:18/20/22' -nf 'rgb:ef/ef/ef' -sb 'rgb:aa/00/5f' -sf 'rgb:ff/da/95'"
grab "W-S-r", "urxvtc -name ranger -e ranger"
grab "W-S-m", "urxvtc -name ncmpcpp -e ncmpcpp"
grab "W-w", "chromium"
grab "S-F2" do |c|
  puts c.name
end
grab "S-F3" do
  puts Subtlext::VERSION
end

tag "media_full" do
  match "libreoffice|zathura|klavaro"
  gravity :ct
end
tag "terms" do
  match "urxvtc"
end
tag "music" do
  match :instance => "ncmpcpp"
  gravity :ct33
end
tag "chat" do
  match :instance => "irssi"
end
tag "fixed" do
  match   "display"
  fixed true
end
tag "browser" do
  match   "chromium|navigator"
  gravity :center_1
end
tag "editor" do
  match  "[g]?vim"
  resize true
end
tag "resize" do
  match  "sakura|gvim"
  resize true
end
tag "gravity" do
  gravity :center
end
tag "stick" do
  match "mplayer|geeqie|sxiv"
  float true
  stick false
end
tag "float" do
  match "nitrogen|display"
  float true
end
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
tag "gimp_scum" do
  match :role => "gimp-.*|screenshot"
end
tag "files" do
  match :instance => "ranger"
end
tag "flash" do
  match "<unknown>|plugin-container|exe|operapluginwrapper|npviewer.bin"
end

view "terms" do
  match "terms|files|default"
end
view "www" do
  match "browser"
end
view "media" do
    match "media|stick|music|chat"
end
view "reader" do
    match "media_full"
end

# Autostart
on :start do
end
