if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
  startx
  logout
fi
