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

if (( ${+commands[which][nvim]} ))
then
  alias vim='nvim'
fi

alias v='nvim'
alias vnvim='nvim ~/.config/nvim/init.vim'
alias vtmux='nvim ~/.tmux.conf'
alias vzsh='nvim ~/.zshrc'

# LazyApps

alias lg='lazygit'
alias ld='lazydocker'

## ECL (Eye Candy Land) Zone

# enable color

autoload -U colors && colors

# Choose one to be your prompt

# PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
# PS1=$'\e[0;31m$ \e[0m'
# PS1="%F{214}%K{000}%m%F{015}%K{000}:%F{039}%K{000}%~%F{015}%K{000}\$ "
#PS1='%(?.%F{green}.%F{red})%n@%m:%~%# %f'
#PS1='20%D %* > '
#PS1=' %F{green}%* : %~ %f > '
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'
# RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
PS1='%(?.%F{green}.%F{red})%* : %~ %f%F{yellow}${vcs_info_msg_0_}%f > '
# PS1='%(?.%F{green}.%F{red})%n@%m:%F{141}%d$ %F{reset}'
# PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

## Variables Zone

export EDITOR=nvim || export EDITOR=vim

## Source Plugins

source ~/.zsh_plugins.sh

## Change bind keys so that I can move faster

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
