#!/usr/bin/env zsh

# keybindings
bindkey -e
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
WORDCHARS='~!#$%^&*(){}[]<>?+;-_'

# no cd
setopt auto_cd

# source z'goodies
if [[ -n "$HOMEBREW_PREFIX" ]]; then
  source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  # not a login shell in WSL
  source $HOME/.zprofile
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# launch completion system
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# source other zsh files
for zfile in "${ZSH:-$HOME/.config/zsh}"/*.zsh; do
  source "$zfile"
done
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.config/zsh/custom}"
if [[ -d $ZSH_CUSTOM ]]; then
  for zfile in "$ZSH_CUSTOM"/*.zsh; do
    source "$zfile"
  done
fi

# enable substitution in the prompt
setopt prompt_subst

# config for prompt
prompt='%B%F{blue}%1/%f%b %F{green}$(git_prompt_branch)%f$ '
