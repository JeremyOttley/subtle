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

#  regular

BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
PURPLE="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37m\]"

#  bold

BBLACK="\[\e[1;30m\]"
BRED="\[\e[1;31m\]"
BGREEN="\[\e[1;32m\]"
BYELLOW="\[\e[1;33m\]"
BBLUE="\[\e[1;34m\]"
BPURPLE="\[\e[1;35m\]"
BCYAN="\[\e[1;36m\]"
BWHITE="\[\e[1;37m\]"

#  color off

COFF="\[\e[0m\]"

#  colorize git_ps1

colorize() 
{
	if [[ $EUID == 0 ]]; then
		PS1='\u@\h:\W \$ '
	else
		# 'Not' or 'not' depends on different version of git
		local is_rep=$(echo `git status 2>&1` | grep -o "Not a git repository" )
		local INFO="$BGREEN\u$BBLUE@$BGREEN\h:$BCYAN\w"
		if [[ ${#is_rep} -eq 0 ]]; then
			local git_status=$(__git_ps1 "%s")
			local rep_clean=$(echo `git status` | grep -o "nothing to commit")
			local untracked=$(echo `git status` | grep -o "Untracked")
			if [[ ${#rep_clean} -ne 0 ]]; then ## repository is clean;
				local GIT=$BGREEN$git_status=$COFF
			elif [[ ${#untracked} -ne 0 ]]; then ## untracked file presents
				local GIT=$BPURPLE$git_status+$COFF
			else
				local GIT=$BYELLOW$git_status*$COFF
			fi
		else ## not a git repository
			local GIT=$COFF
		fi
		PS1="$INFO $GIT \$ "
	fi
}

PROMPT_COMMAND=colorize

#  ESC P: DEVICE Control String, outputs a string directly to the host
#+ terminal without interpretation. ST is string terminator.
#  DCS = \033P ST = \033\
#  vt100 responds to OSC only when it's from output. so use echo/printf
#  An OSC string starts with ESC ] m to set different terminal properties,
#+ and use BEL(\007) to terminate an OSC string.
#  So,for vt100/vt220, to set color beyond 15, just:
#  echo -ne "\033P\033]4;color_index;rgb:rr/gg/bb\007\033\\"
#  for xterm/urxvt, do:
#  echo -ne "\033]4;color_index;rgb:rr/gg/bb\033\\"
printf "\033]4;16;rgb:FF/92/EB\033\\"
printf "\033]4;17;rgb:36/D6/46\033\\"
printf "\033]4;18;rgb:19/B0/A1\033\\"
printf "\033]4;19;rgb:FF/7A/00\033\\"
printf "\033]4;20;rgb:BA/A3/9C\033\\"
printf "\033]4;21;rgb:AB/6C/FF\033\\"
printf "\033]4;22;rgb:69/C7/81\033\\"
printf "\033]4;23;rgb:9C/B3/BA\033\\"
printf "\033]4;24;rgb:00/D5/FF\033\\"
