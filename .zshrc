typeset -U PATH
autoload colors; colors;

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

setopt inc_append_history
setopt share_history

autoload -U compinit
compinit -i

unsetopt menu_complete
unsetopt flowcontrol
setopt prompt_subst
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd
zmodload -i zsh/complist

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH/cache/
zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
  "$_ssh_config[@]"
  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  "$HOST"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' users off

# Vim Keybindings
bindkey -v

# Make up/down arrow put the cursor at the end of the line
# instead of using the vi-mode mappings for these keys
bindkey "\eOA" up-line-or-history
bindkey "\eOB" down-line-or-history
bindkey "\eOC" forward-char
bindkey "\eOD" backward-char

# CTRL-R to search through history
bindkey '^R' history-incremental-search-backward
# CTRL-S to search forward in history
bindkey '^S' history-incremental-search-forward
# Accept the presented search result
bindkey '^Y' accept-search

# Use the arrow keys to search forward/backward through the history,
# using the first word of what's typed in as search word
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Use the same keys as bash for history forward/backward: Ctrl+N/Ctrl+P
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Backspace working the way it should
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char

# Some emacs keybindings won't hurt nobody
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

alias lls='ls -lh --sort=size --reverse'
alias llt='ls -l -t -r'

alias history='history 1'
alias hs='history | grep '

# Screen
alias screen='screen -R -D'

# tmux
alias tma='tmux attach -t'
alias tmn='tmux new -s'

# ceedee dot dot dot
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

mkd() {
  mkdir -p $1 && cd $1
}

# Change to jekyll
serve() {
  local port=${1:-8000}
  local ip=$(ipconfig getifaddr en0)
  echo "Serving on ${ip}:${port} ..."
  python -m SimpleHTTPServer ${port}
}

spinner() {
  while
  do
    for i in "-" "\\" "|" "/"
    do
      echo -n " $i \r\r"
      sleep .1
    done
  done
}

f() {
  find . -iname "*${1}*"
}

git_prompt_info() {
  local dirstatus=" OK"
  local dirty="%{$fg_bold[red]%} X%{$reset_color%}"

  if [[ ! -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
    dirstatus=$dirty
  fi

  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo "%{$fg_bold[green]%}${ref#refs/heads/}$dirstatus%{$reset_color%}"
}

export EDITOR='vim'

# Reduce delay for key combinations in order to change to vi mode faster
# See: http://www.johnhawthorn.com/2012/09/vi-escape-delays/
# Set it to 10ms
export KEYTIMEOUT=1

# Encoding problems with gem
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# golang
export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
# goenv
if which goenv &> /dev/null; then
  eval "$(goenv init -)"
fi

if which fzf &> /dev/null && which rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
    --color=bg+:#DEECF9,bg:#FFFFFF,spinner:#3f5fff,hl:#586e75
    --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#3f5fff
    --color=marker:#3f5fff,fg+:#839496,prompt:#3f5fff,hl+:#3f5fff'
fi

## extra

export LESS_TERMCAP_mb=$(printf "\e[0;3${mainc}m")    # start blink
export LESS_TERMCAP_md=$(printf "\e[0;3${mainc}m")    # start bold
export LESS_TERMCAP_so=$(printf "\e[7;3${mainc}m")    # start standout
export LESS_TERMCAP_us=$(printf "\e[1;4;3${mainc}m")  # start underline
export LESS_TERMCAP_me=$(printf "\e[0m")              # stop blink, bold
export LESS_TERMCAP_se=$(printf "\e[0m")              # stop standout
export LESS_TERMCAP_ue=$(printf "\e[0m")              # stop underline

setopt PROMPT_SUBST

function slim_path {
    local grey="%{\e[38;5;244m%}"
    local reset="%{\e[0m%}"
    local cwd="%2~"
    cwd="${(%)cwd}" # expand
    echo "$grey${cwd//\//$reset/$grey}$reset %m" # colour
}

function slim_prompt {
    local u_sts="%{\e[%(1j.1.0);3%(0?.$mainc.1)m%}%(!.#.$)%{\e[0m%}"
    local v_sts=">"
    [ "$KEYMAP" = 'vicmd' ] && v_sts="-"
    echo "$u_sts $v_sts"
}

function zle-line-init zle-keymap-select {
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

PROMPT='$(slim_prompt) '
RPROMPT='$(slim_path)'

function slim_wrap {
    local txt="$1"
    local ext="${2:-0}"
    local int="${3:-38;5;244}"

    echo "\e[${ext}m[\e[${int}m${txt}\e[${ext}m]"
}

function slim-magic-enter {
    local err="$?"

    [ -n "$BUFFER" ] && {zle accept-line; return}

    local clr_w="\e[0m"
    local clr_g="\e[38;5;244m"
    local raw_r="0;31"
    local raw_rb="1;31"

    # user@host
    local user_host="$clr_g%n$clr_w@$clr_g%m$clr_w"
    local user_host_e="${(%)user_host}"

    # full working dir
    local cwd="$clr_g%~$clr_w"
    local cwd_e="${(%)cwd}"
    local cwd_c="${cwd_e//\//$clr_w/$clr_g}"

    # jobs
    local job_n="$(jobs | sed -n '$=')"

    local iline="$(slim_wrap $user_host_e:$cwd_c)"
    [ "$job_n" -gt 0 ] && iline="$iline $(slim_wrap "$job_n&")"
    [ "$err" != "0" ] && iline="$iline $(slim_wrap "$err" $raw_r $raw_rb)"

    printf "$iline$clr_w\n"

    local output="$(ls -C --color="always" -w $COLUMNS)"
    local output_len="$(echo "$output" | sed -n '$=')"

    if [ -n "$output" ]; then
        if [ "$output_len" -gt "$((LINES - 2))" ]; then
            printf "$output\n" | "$PAGER" -R
        else
            printf "$output\n" | sed "s/^/  | /"
        fi
    fi
    zle redisplay
}

zle -N slim-magic-enter
bindkey -M main  "^M" slim-magic-enter
bindkey -M vicmd "^M" slim-magic-enter

rc(){
	systemctl list-unit-files --type=service |\
	sed 's/.service//g' |\
	sed '/static/d' |\
	sed '/indirect/d' |\
	sed '/systemd/d' |\
	sed '/dbus-org/d' |\
	sed '/canberra/d'|\
	sed '/wpa_supplicant/d' |\
	sed '/netctl/d' |\
	sed '/rfkill/d' |\
	sed '/krb5/d' |\
	tail -n+2 |\
	head -n -2 |\
	sed 's/\(^.*enabled.*$\)/[x] \1/' |\
	sed 's/enabled//g' |\
	sed 's/\(^.*disabled.*$\)/[ ] \1/' |\
	sed 's/disabled//g' |\
	sed 's/[ \t]*$//' |\
	while read line; do
			if [[ $line == *'[x]'* ]]; then
				printf "\033[0;32m$line\n"
			else
				printf "\033[1;30m$line\n"
			fi
	done
}

setopt PROMPT_SUBST
PROMPT='C:%{${${${(%):-%~}//\//\\}/\~/\\gazbit}%${#${${(%):-%~}//\//\\}/\~/\\\$HOME}G%}> '
