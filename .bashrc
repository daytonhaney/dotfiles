# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac
export NVIM_APPNAME="nvim-Lazyman"
export PATH=$PATH:~/.local/share/nvim-Kodo/mason/bin
# Path to your oh-my-bash installation.
export OSH='/home/user/.oh-my-bash'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="font"


OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
# OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
	git
	composer
	ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
######NEOVIM ALIAS"########################



# Which plugins would you like to load? (plugins can be fosource <(/usr/local/bin/starship init zsh --print-full-init)% und in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
alias ls='exa -lbF'
alias l='exa -lbF'
alias ll='exa -lba --color always --icons'
alias llm='exa -lbGd --git --sort=modified'
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
alias code='code-insiders'

alias lS='exa -1'
alias lt='exa --tree --level=2'

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
alias nvim-j='nvim-Kodo'
# pnpm
export PNPM_HOME="/home/user/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
#export PATH="/home/user/.turso:$PATH"

export BUN_INSTALL="$HOME/.bun"

export PATH=$BUN_INSTALL/bin:$PATH

#source ~/.local/share/blesh/ble.sh

plugins=(
	git
	#bashmark
    #golang
	npm
	#aws
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format:
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
#! bash oh-my-bash.module
# scm themeing
SCM_THEME_PROMPT_DIRTY="×"
SCM_THEME_PROMPT_CLEAN="✓"
SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

# TODO: need a check for OS before adding this to the prompt
# ${debian_chroot:+($debian_chroot)}

#added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
	xterm*)
	TITLEBAR='\[\033]0;\w\007\]'
	;;
	*)
	TITLEBAR=""
	;;
esac

function _omb_theme_PROMPT_COMMAND() {
    PROMPT='${_omb_prompt_green}\u${_omb_prompt_normal}@${_omb_prompt_green}\h${_omb_prompt_normal}:${_omb_prompt_navy}\w${_omb_prompt_normal}${_omb_prompt_brown}$(prompt_char)$(git_prompt_info)${_omb_prompt_normal}\$ '
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
export PATH=$PATH:~/zig-0.11.0
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
if command -v zoxide > /dev/null; then
  eval "$(zoxide init bash)"
fi
export PATH=$PATH:~/.local/share/nvim-Kickstart/mason/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Source the Lazyman shell initialization for aliases and nvims selector
source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc

# Luarocks bin path
[ -d ${HOME}/.luarocks/bin ] && {
  export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
}
. "$HOME/.cargo/env"
# Bob neovim version manager path
[ -d ${HOME}/.local/share/bob/nvim-bin ] && {
  export PATH="${HOME}/.local/share/bob/nvim-bin${PATH:+:${PATH}}"
}

#source /dev/stdin <<<"$(/home/user/.cargo/bin/starship init bash --print-full-init)
__main() {
local major="${BASH_VERSINFO[0]}"
local minor="${BASH_VERSINFO[1]}"

if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
source <(/usr/local/bin/starship init bash --print-full-init)
else
source /dev/stdin <<<"$(/usr/local/bin/starship init bash --print-full-init)"
fi
}
__main
unset -f __main

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"
