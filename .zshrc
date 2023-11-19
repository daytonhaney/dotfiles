# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Start Znap
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVIM_APPNAME="nvim-Lazyman"
export PATH=$PATH:~/.local/share/nvim-Kodo/mason/bin

export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="robbyrussell"


COMPLETION_WAITING_DOTS="true"
export PATH=$PATH:~/zig-0.11.0


plugins=(git)


source $ZSH/oh-my-zsh.sh

source ./.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
 else
   export EDITOR='nvim-j'
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

alias ls='exa -lbF'
alias l='exa -lbF --icons'
alias ll='exa -lba  --color always --icons'
alias llm='exa -lb--sort=modified'
alias la='exa -lbhHigUmuSa --time-style=long-iso --color-scale'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --color-scale'
alias code='code-insiders'
alias lS='exa -1'
alias lt='exa --tree --level=2'

source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
[ -d ${HOME}/.luarocks/bin ] && {
  export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
}
. "$HOME/.cargo/env"
[ -d ${HOME}/.local/share/bob/nvim-bin ] && {
export PATH="${HOME}/.local/share/bob/nvim-bin${PATH:+:${PATH}}"
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"
source <(/usr/local/bin/starship init zsh --print-full-init)%
source /home/user/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
