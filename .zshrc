# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.local/bin:$HOME/.local/usr/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export NVIM_APPNAME="nvim-j"
export PATH=$PATH:~/.local/share/nvim-Kodo/mason/bin
export PATH=$PATH:/usr/share/swift/usr/bin
export PATH=$PATH:~/zig-0.11.0
export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)
#. "$HOME/.asdf/asdf.sh"
export PATH=$PATH:/usr/local/go/bin

export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
. "$HOME/.cargo/env"
[ -d ${HOME}/.local/share/bob/nvim-bin ] && {
export PATH="${HOME}/.local/share/bob/nvim-bin${PATH:+:${PATH}}"
export PATH=$PATH:~/.local/share/nvim/mason/bin
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind

ZSH_THEME="robbyrussell"
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi
plugins=(gh git ssh)

alias ls='exa -lbF --icons'
alias l='exa -lbF --icons'
alias ll='exa -lba  --color always --icons'
alias llm='exa -lb--sort=modified'
alias la='exa -lbhHigUmuSa --time-style=long-iso --color-scale'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --color-scale'
alias code='codium'
alias lS='exa -1'
alias lt='exa --tree --level=99'


source $ZSH/oh-my-zsh.sh

