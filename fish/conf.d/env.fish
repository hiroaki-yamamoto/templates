set -xg NPM_PACKAGES "$HOME/.npm-packages"
set -xg GOPATH "$HOME/go"
set -xg GO111MODULE "on"

set -xgp PATH \
  $GOPATH/bin \
  $NPM_PACKAGES/bin \
  $HOME/opt/*/bin \
  $HOME/.gem/ruby/*/bin

set -xg EDITOR "vim"
set -xg VISUAL "$EDITOR"
set -xg PINENTRY "/usr/bin/pinentry-qt"
set -xg CHROME_BIN "/usr/bin/chromium"

# set -xg SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
