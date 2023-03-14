#!/usr/bin/env zsh

# AWS
export AWS_DEFAULT_REGION="us-east-1"

# Git tokens
export GITLAB_TOKEN="<REPLACE_ME>"
export BITBUCKET_TOKEN="<REPLACE_ME>"

# Languages
# nvm
export NVM_DIR="$HOME/.nvm"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# dotnet
export DOTNET_ROOT="/usr/local/opt/dotnet@6/libexec"

# Directories
export PATH="$PYENV_ROOT/bin:node_modules/.bin:$HOME/.local/bin:$HOME/.krew/bin:$HOME/.dotnet/tools:/usr/local/opt/dotnet@6/bin:$PATH"
export REPO_DIR="$HOME/Repos"

# ZSH setup locations
export ZSH="$HOME/.config/zsh"
export ZSH_CUSTOM="$HOME/.config/zsh/custom"

export EDITOR="code -w"
