# vi mode
set -o vi

# Insert mode
bind -m vi-insert '"jj": vi-movement-mode'
bind -m vi-insert '"\C-p": previous-history'
bind -m vi-insert '"\C-n": next-history'
bind -m vi-insert '"\C-e": end-of-line'
bind -m vi-insert '"\C-a": beginning-of-line'
bind -m vi-insert '"\ef": forward-word'
bind -m vi-insert '"\eb": backward-word'

# Command (normal) mode
bind -m vi-command '"H": beginning-of-line'
bind -m vi-command '"L": end-of-line'
bind -m vi-command '"k": ""'
bind -m vi-command '"j": ""'
bind -m vi-command '"v": ""' # Don't edit command with default editor (nvim)

bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on" # show candidates before cycling
bind "set show-all-if-ambiguous on"
bind "set colored-stats on" # color completion candidates

# Show mode in command prompt (note: 38 is fg color and 48 bg color; 2 means
# truecolor (i.e rgb) and 5 256color)
bind "set show-mode-in-prompt on"
bind 'set vi-ins-mode-string \1\e[38;5;235;48;2;97;175;239;1m\2 I '\
'\1\e[38;2;97;175;239;48;2;208;208;208;1m\2\1\e[0m\2\1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[38;5;235;48;2;152;195;121;1m\2 N '\
'\1\e[38;2;152;195;121;48;2;208;208;208;1m\2\1\e[0m\2\1\e[2 q\2'
# Switch to block cursor before executing a command
bind -m vi-insert 'RETURN: "\e\n"'

# Cycle forward with TAB and backwards with S-Tab when using menu-complete
bind -m vi-insert '"\C-i": menu-complete'
bind -m vi-insert '"\e[Z": menu-complete-backward'

# Bind C-p and C-n to search the history conditional on input (like zsh) instead
# of simply going up or down
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'

# Use bracketed paste (i.e distinguish between typed and pasted text)
bind 'set enable-bracketed-paste on'

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
if type "npm" > /dev/null 2>&1; then
    PATH="$HOME/.node_modules/bin:$PATH"
    export npm_config_prefix="$HOME/.node_modules"
fi
if type "go" > /dev/null 2>&1; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

export EDITOR=nvim
export MANPAGER="nvim -c 'set ft=man' -"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ll='ls -lah'
alias ls='ls -F --color=auto'
alias o='open'
if [ "$OSTYPE" == 'linux-gnu' ]; then
    alias open='xdg-open'
    alias ss='sudo su'
    if type "feh" > /dev/null 2>&1; then
        alias iv='feh'
    fi
fi

if type "mpv" > /dev/null 2>&1; then
    # (P)hot(b)ooth (webcam)
    alias pb='mpv tv:// --tv-height=500 --tv-width=400 --tv-fps=60 '\
'--no-quiet'
fi



cd() { builtin cd "$@" && ls -F --color=auto; }

gl() {
        # TODO: Add preview
        git log --graph --color=always \
            --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
        fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
            --bind "ctrl-m:execute:
                        (grep -o '[a-f0-9]\{7\}' | head -1 |
                        xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                        {}
        FZF-EOF"
    }
fi
