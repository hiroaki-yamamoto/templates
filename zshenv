HISTFILE=~/.history
HISTSIZE=100
SAVEHIST=100
export NPM_PACKAGES="${HOME}/.npm-packages"
export GOPATH="${HOME}/go"
export GO111MODULE=on
export GOPRIVATE=github.com
export GIT_TERMINAL_PROMPT=1
_PATH=(
  ${GOPATH}/bin
  ${NPM_PACKAGES}/bin
  ${HOME}/opt/*/bin
  ${HOME}/.gem/ruby/*/bin
  ${HOME}/.cargo/bin
  ${HOME}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin
)
_PATH=$(printf ":%s" ${_PATH[@]})

export EDITOR="vim"
export VISUAL="${EDITOR}"
export PINENTRY="/usr/bin/pinentry-qt"
export FPATH="${FPATH}:${HOME}/zsh_completion"
export PATH="${_PATH:1}:${PATH}"
typeset -U path PATH
export CHROME_BIN="/usr/bin/chromium"
export COMPOSE_DOCKER_CLI_BUILD=1
