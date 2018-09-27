setopt PROMPT_SUBST
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



# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
#bindkey '^A' beginning-of-line
#bindkey '^E' end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey '^?' backward-delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
#
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
#
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

