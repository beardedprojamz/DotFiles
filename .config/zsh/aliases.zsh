#!/usr/bin/env zsh

# cd
alias .r="cd $REPO_DIR"
alias .f="cd $REPO_DIR/dotfiles"
alias .v="cd $VSCODE_WORKSPACE_FOLDER"

# misc
alias cO="curl -O"
alias htop="sudo htop"
alias src='source "$HOME/.zshrc"'

# ls
alias ls="exa"
alias sl="exa"
alias ll="exa --long --all"
alias lt="exa --long --tree --level=3 --color=always | less -R"

# docker
alias dex="docker exec -it"

# kubernetes
alias kc="kubectl"
alias kargo="kubectl -n argocd"
alias kx="kubectl config get-contexts"
alias kxu="kubectl config use-context"
alias kxs="kubectl config set-context"
alias kmon="kubectl -n monitoring"

# terraform
alias tf="terraform"
alias tf-gitlab-init="terraform init -backend-config=config.http.tfbackend -backend-config=\"username=deybhayden\" -backend-config=\"password=$GITLAB_TOKEN\""

# vscode
alias vc="code"
alias v-="code -"
alias vd="code -d"
alias vdiff="code -d"
