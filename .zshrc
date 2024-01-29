export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export NVIM_APPNAME="nvim-j"
export PATH=$PATH:~/.local/share/nvim-Kodo/mason/bin
export PATH=$PATH:/usr/share/swift/usr/bin
export ZSH="$HOME/.oh-my-zsh"
. "$HOME/.asdf/asdf.sh"

ZSH_THEME="robbyrussell"


COMPLETION_WAITING_DOTS="true"
export PATH=$PATH:~/zig-0.11.0


plugins=(zsh-syntax-highlighting zsh-autosuggestions git)


source $ZSH/oh-my-zsh.sh
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim-j'
 else
   export EDITOR='nvim-j'
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

alias ls='exa -lbF --icons'
alias l='exa -lbF --icons'
alias ll='exa -lba  --color always --icons'
alias llm='exa -lb--sort=modified'
alias la='exa -lbhHigUmuSa --time-style=long-iso --color-scale'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --color-scale'
alias code='codium'
alias lS='exa -1'
alias lt='exa --tree --level=99'
alias nvim-j='nvim-Kodo'
source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
[ -d ${HOME}/.luarocks/bin ] && {
  export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
}
. "$HOME/.cargo/env"
[ -d ${HOME}/.local/share/bob/nvim-bin ] && {
export PATH="${HOME}/.local/share/bob/nvim-bin${PATH:+:${PATH}}"
export STARSHIP_CONFIG=~/.config/starship.toml
export PATH=$PATH:~/.local/share/nvim/mason/bin
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
source /home/user/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

