#!/usr/bin/env zsh

# nvm
if [[ -v $HOMEBREW_PREFIX ]]; then
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
else
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# pyenv
eval "$(pyenv init -)"
# direnv
eval "$(direnv hook zsh)"
# kubernetes
if type kubectl >/dev/null; then
  source <(kubectl completion zsh)
  source <(kubectl-argo-rollouts completion zsh)
fi
# terraform
complete -o nospace -C $HOMEBREW_PREFIX/bin/terraform terraform
