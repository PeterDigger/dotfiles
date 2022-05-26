# Check for antibody installed or not
if command -v antibody >/dev/null ;then
	if [ ! -f "$ZDOTDIR/zsh_plugins.sh" ];then
		printf "Generating zsh_plugins.sh...\n"
		antibody bundle < $ZDOTDIR/zsh_plugins.txt > $ZDOTDIR/zsh_plugins.sh
	fi
else
	printf "Antibody is not installed. \nPlease install by \"curl -sfL git.io/antibody | sh -s - -b /usr/local/bin\" \n"
fi

## General Settings -------------------------

# Autoload built-in functions
autoload -Uz compinit vcs_info colors && colors
compinit

# useful options
setopt autocd extendedglob nomatch menucomplete correct interactive_comments

# Disable Ctrl+S
stty stop undef

# Enable History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# beep bye
unsetopt BEEP

## Change bind keys so that I can move faster
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

## Variables Zone
if [ -f "~/.config/vim" ]; then
	export VIMDIR="~/.config/vim"
	export VIMINIT="source ~/.config/vim/vimrc"
fi
export EDITOR=nvim || export EDITOR=vim

## Alias Zone -------------------------

# Check Exa
if command -v exa >/dev/null ;then
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
if command -v nvim >/dev/null ;then
	alias vim='nvim'
	alias v='nvim'
	alias vzsh='nvim ~/.config/zsh/.zshrc'
	alias vnvim='nvim ~/.config/nvim/init.vim'
	alias vtmux='nvim ~/.tmux.conf'
else
	alias vzsh='vim ~/.config/zsh/.zshrc'
	alias vnvim='vim ~/.config/nvim/init.vim'
	alias vtmux='vim ~/.tmux.conf'
	alias v='vim'
fi


# LazyApps
if command -v lazygit >/dev/null ;then
	alias lg='lazygit'
fi

if command -v lazydocker >/dev/null ;then
	alias ld='lazydocker'
fi

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

## ECL (Eye Candy Land) Zone -------------------------

## Choose one to be your prompt
# PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
# PS1=$'\e[0;31m$ \e[0m'
# PS1="%F{214}%K{000}%m%F{015}%K{000}:%F{039}%K{000}%~%F{015}%K{000}\$ "
#PS1='%(?.%F{green}.%F{red})%n@%m:%~%# %f'
#PS1='20%D %* > '
#PS1=' %F{green}%* : %~ %f > '
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'
# RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
PS1='%(?.%F{green}.%F{red})%* (%m) : %~ %f%F{yellow}${vcs_info_msg_0_}%f > '
# PS1='%(?.%F{green}.%F{red})%n@%m:%F{141}%d$ %F{reset}'
# PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

## Source Plugins -------------------------
source $ZDOTDIR/zsh_plugins.sh
