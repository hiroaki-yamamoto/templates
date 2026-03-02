source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#Load auto completion module, colors, and history functions.
autoload -Uz compinit promptinit colors smart-insert-last-word
compinit
promptinit
colors

USER_PROMPT="%{%F{green}%B%}%n%{%b%f%}"
HOST_PROMPT="%{%F{magenta}%B%}%M%{%b%f%}"
TTY_PROMPT="%{%F{yellow}%B%}%l%{%b%f%}"
DIR_PROMPT="%{%F{cyan}%B%}%~%{%b%f%}"

#Prompt
PROMPT="[$USER_PROMPT@$HOST_PROMPT ($TTY_PROMPT) $DIR_PROMPT]"
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
elif [ $(uname) = "Darwin" ]; then
  alias ls="ls -G"
fi

alias curl="curl -fLC - --retry 3 --retry-delay 3"

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

# for keychain
eval $(keychain --eval id_ed25519 CFED0D7407192EBC4CA894C6EBCBD3A905EBD5FF)

# Include NVM
#source /usr/share/nvm/init-nvm.sh

if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
  chpwd() {
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
  }
  chpwd
}

if [ `dirname $TTY` = "/dev/pts" ]; then
  . /usr/share/powerline/bindings/zsh/powerline.zsh
fi

# Load Angular CLI autocompletion.
source <(ng completion script)

# qlty
export QLTY_INSTALL="$HOME/.qlty"
export PATH="$QLTY_INSTALL/bin:$PATH"
