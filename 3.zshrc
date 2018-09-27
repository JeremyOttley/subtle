setopt PROMPT_SUBST
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd
unsetopt menu_complete
unsetopt flowcontrol

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

PROMPT='C:%{${${${(%):-%~}//\//\\}/\~/\\gazbit}%${#${${(%):-%~}//\//\\}/\~/\\\$HOME}G%}> '

export PATH="${HOME}/.local/bin:$PATH"
screenfetch -A 'Windows' -D 'Windows97'

export HISTSIZE=1000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=1000

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

export PAGER="less"

export LESS_TERMCAP_mb=$(printf "\e[0;3${mainc}m")    # start blink
export LESS_TERMCAP_md=$(printf "\e[0;3${mainc}m")    # start bold
export LESS_TERMCAP_so=$(printf "\e[7;3${mainc}m")    # start standout
export LESS_TERMCAP_us=$(printf "\e[1;4;3${mainc}m")  # start underline
export LESS_TERMCAP_me=$(printf "\e[0m")              # stop blink, bold
export LESS_TERMCAP_se=$(printf "\e[0m")              # stop standout
export LESS_TERMCAP_ue=$(printf "\e[0m")              # stop underline

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
# goenv
if which goenv &> /dev/null; then
  eval "$(goenv init -)"
fi

alias lls='ls -lh --sort=size --reverse'
alias llt='ls -l -t -r'
alias ls="ls --color=auto"
alias l="ls -lah"
alias grep="grep --color=auto"
alias lls='ls -lh --sort=size --reverse'
alias llt='ls -l -t -r'
alias history='history 1'
alias hs='history | grep '
alias screen='screen -R -D'
alias tma='tmux attach -t'
alias tmn='tmux new -s'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

if which fzf &> /dev/null && which rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
    --color=bg+:#DEECF9,bg:#FFFFFF,spinner:#3f5fff,hl:#586e75
    --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#3f5fff
    --color=marker:#3f5fff,fg+:#839496,prompt:#3f5fff,hl+:#3f5fff'
fi

autoload -U compinit && compinit
autoload -U colors && colors

zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export KEYTIMEOUT=1

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

zle -N zle-line-init
zle -N zle-keymap-select

bindkey "\e[3~" delete-char
bindkey '^?' backward-delete-char
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# emacs mode is less surprising to new shell users
bindkey -e

############# zsh escape code fixes #############
# home key
bindkey "^[[1~" beginning-of-line

# end key
bindkey "^[[4~" end-of-line

# delete key
bindkey "^[[3~" delete-char

# backspace key
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

# numeric keypad fixes

# numeric keypad return (enter)
bindkey "${terminfo[kent]}" accept-line

# `0` and `.`
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."

# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"

# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"

# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"

# + -  * /
bindkey -s "^[Ol" "+"
bindkey -s "^[OS" "-"
bindkey -s "^[OR" "*"
bindkey -s "^[OQ" "/"
