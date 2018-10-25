#Load auto completion module, colors, and history functions.
autoload -U compinit promptinit colors smart-insert-last-word
compinit
promptinit
colors

zstyle ':completion:*:default' menu select=1 ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

#Prompt
PROMPT="[%{$fg[green]%B%}%n%{%b$reset_color%}@%{$fg[magenta]%B%}%M%{%b$reset_color%} (%{$fg[yellow]%B%}%l%{%b$reset_color%}) %{$fg[cyan]%B%}%~%{%b$reset_color%}]"
case $(id -u) in
    0)
        PROMPT="${PROMPT}# "
    ;;
    *)
        PROMPT="${PROMPT}$ "
    ;;
esac
export PROMPT

#Set autocd (is known as bash) and autopushd.
setopt autocd autopushd
#Set displaying shrinked completion
setopt list_packed extended_glob
#Set waiting 10 sec. when rm *
#setopt rmstar_wait
#Set going home when pushd without arguments.
setopt pushd_to_home
#Set ignoring history duplication.
setopt hist_ignore_dups hist_ignore_all_dups
#Ignore space in the history file.
setopt hist_ignore_space
#Increase history,
setopt inc_append_history
#Ignore pushd duplication.
setopt pushd_ignore_dups
#Completion alias
setopt completealiases
#Prompt spell fix,
setopt prompt_subst always_last_prompt

xhost +local:root>/dev/null 2>&1
if [ $(uname) = "Linux" ]; then
  alias ls="ls --color=auto"
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
  alias curl="curl -fLC - --retry 3 --retry-delay 3"
elif [ $(uname) = "Darwin" ]; then
  alias ls="ls -G"
fi

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# for guake
bindkey "\eOF" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "\e[3~" delete-char # Del
bindkey "^W" insert-last-word

# Include NVM
# source /usr/share/nvm/init-nvm.sh

if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
  function chpwd {
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
  }

  chpwd
}
