HISTFILE=~/.history
HISTSIZE=10
SAVEHIST=10
NPM_PACKAGES="${HOME}/.npm-packages"
export GOPATH="${HOME}/Documents/Workspace/go"
_PATH=(
  ${GOPATH}/bin
  ${NPM_PACKAGES}/bin
  ${HOME}/.gem/ruby/*/bin
  ${HOME}/opt/*/bin
)
_PATH=$(printf ":%s" ${_PATH[@]})

export EDITOR="vim"
export VISUAL="${EDITOR}"
export PINENTRY="/usr/bin/pinentry-qt"
export FPATH="${FPATH}:${HOME}/zsh_completion"
export PATH="${_PATH:1}:${PATH}"
typeset -U path PATH
export CHROME_BIN="/usr/bin/chromium"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
