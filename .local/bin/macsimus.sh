#!/usr/bin/env bash

# Ensure there's a place for source code
REPO_DIR="$HOME/Repos"
[ ! -d $REPO_DIR ] && mkdir $REPO_DIR

if [[ ! $(brew --version) ]]; then
  echo "Install core utils from Xcode"
  xcode-select --install

  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  if [[ $(uname -m) == 'arm64' ]]; then
    # Apple M1
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    # Intel Mac
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  echo "Installing latest zsh & z'goodies..."
  brew install zsh zsh-autosuggestions zsh-syntax-highlighting
  ZSH_PATH="$HOMEBREW_PREFIX/bin/zsh"
  echo $ZSH_PATH | sudo tee -a /etc/shells
  chsh -s $ZSH_PATH

  echo "Installing brews"

  # Languages
  brew install nvm pyenv terraform

  # Tools
  brew install awscli clamav direnv exa fd gh git git-crypt gpgme hugo jq netcat nmap ripgrep stow telnet vegeta yq

  # Kubernetes
  brew install argo argocd helm kubeseal kustomize
  brew install argoproj/tap/kubectl-argo-rollouts
  (
    set -x
    cd "$(mktemp -d)" &&
      OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
      ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
      KREW="krew-${OS}_${ARCH}" &&
      curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
      tar zxvf "${KREW}.tar.gz" &&
      ./"${KREW}" install krew
  )

  echo "Tap some casks"
  brew tap homebrew/cask
  brew tap homebrew/cask-drivers
  brew tap homebrew/cask-fonts

  echo "Installing casks"
  brew install --cask \
    confluent-cli docker figma flycut font-hack google-chrome google-drive imageoptim \
    keepingyouawake keybase logitech-options macsvg mongodb-compass pgadmin4 postman \
    session-manager-plugin slack sequel-ace visual-studio-code zoom

  echo "Installing global python tools"
  pyenv install 3.10.4
  pyenv global 3.10.4
  export PYENV_ROOT="$HOME/.pyenv"
  eval "$(pyenv init --path)"
  pip install --upgrade pip
  pip install black flake8 pipenv

  echo "Installing global npms"
  export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
  nvm install 16
  npm install -g aws-cdk eslint firebase-tools npm-check-updates prettier yarn

  echo "Stowing files"
  mkdir -p .local .config
  stow -t ~ .
  cp clamav/freshclam.conf "$HOMEBREW_PREFIX/etc/clamav"

  echo "GitHub CLI login"
  gh auth login
else
  brew update
  brew upgrade
  brew cleanup -s
  brew doctor
  brew cleanup
fi
