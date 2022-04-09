## Alias Zone 

# Check Exa

if (( ${+commands[which][exa]} ))
then
  #echo "exa is available"
  alias ll='exa --git -al'
  alias la='exa --git -a'
  alias l='exa --git'
  alias ls='exa --git'
else
  alias ll='ls -alF --color=auto'
  alias la='ls -A --color=auto'
  alias l='ls -CF --color=auto'
  alias ls='ls --color=auto'
fi

# Editor

alias v='nvim'
alias vnvim='nvim ~/.config/nvim/init.vim'
alias vtmux='nvim ~/.tmux.conf'
alias vzsh='nvim ~/.zshrc'

## ECL (Eye Candy Land) Zone

# enable color

autoload -U colors && colors

# Choose one to be your prompt

# PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
# PS1=$'\e[0;31m$ \e[0m'
# PS1="%F{214}%K{000}%m%F{015}%K{000}:%F{039}%K{000}%~%F{015}%K{000}\$ "
#PS1='%(?.%F{green}.%F{red})%n@%m:%~%# %f'
#PS1='20%D %* > '
PS1=' %F{green}%* : %~ %f > '
# PS1='%(?.%F{green}.%F{red})%n@%m:%F{141}%d$ %F{reset}'
# PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

## Variables Zone

export EDITOR=nvim || export EDITOR=vim

## Source Plugins

source ~/.zsh_plugins.sh
