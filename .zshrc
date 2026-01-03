#zmodload zsh/zprof
# --------------------------------------------------
# Basic Environment and PATH setup (early for overrides)
# --------------------------------------------------

# User-specific bins first
export PATH="$HOME/.local/bin:$HOME/.local/usr/bin:$HOME/.luarocks/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/zig-0.11.0"

# Bob-managed Neovim (add early so 'nvim' resolves correctly)
if [[ -d "$HOME/.local/share/bob/nvim-bin" ]]; then
  export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
  # Mason bins (from Bob-managed installs)
  export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
fi

# --------------------------------------------------
# Oh My Zsh
# --------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="frontcube" 
plugins=(zsh-autosuggestions fast-syntax-highlighting)

source "$ZSH/oh-my-zsh.sh"


# --------------------------------------------------
# Neovim
# --------------------------------------------------

export NVIM_APPNAME="nvim-j"

# LazyMan NVIM bindings (nvims selector, aliases, etc.)
if [[ -f "$HOME/.config/nvim-Lazyman/.nvimsbind" ]]; then
  source "$HOME/.config/nvim-Lazyman/.nvimsbind"
fi

# Lazyman aliases and tools
if [[ -f "$HOME/.config/nvim-Lazyman/.lazymanrc" ]]; then
  source "$HOME/.config/nvim-Lazyman/.lazymanrc"
fi

# --------------------------------------------------
# Editor and Tools
# --------------------------------------------------

alias code="codium"

# Prefer nvim locally, fallback to vi over SSH
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# zoxide (better cd replacement)
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
#zprof | head -20
