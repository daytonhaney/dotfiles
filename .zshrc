# Uncomment temporarily to profile Zsh startup:
# zmodload zsh/zprof

# -----------------------------------------------------------------------------
# Environment and PATH
# -----------------------------------------------------------------------------

# Add a directory to PATH only when it exists and is not already present.
path_prepend() {
  [[ -d "$1" ]] && path=("$1" $path)
}

path_append() {
  [[ -d "$1" ]] && path+=("$1")
}

# Zsh keeps $path and $PATH synchronized.
typeset -U path PATH

# User executables
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.local/usr/bin"
path_prepend "$HOME/.luarocks/bin"
path_prepend "$HOME/.cargo/bin"
path_prepend "$HOME/.opencode/bin"

# Bob-managed Neovim
path_prepend "$HOME/.local/share/bob/nvim-bin"

# Neovim Mason executables
path_append "$HOME/.local/share/nvim/mason/bin"

# Optional manually installed toolchains
path_append "/usr/local/go/bin"
path_append "$HOME/zig-0.11.0"

# Go binaries
if command -v go >/dev/null 2>&1; then
  export GOPATH="$(go env GOPATH)"
  path_append "$GOPATH/bin"
fi

# Odin toolchain
export ODIN_ROOT="$HOME/dev/odin-toolchain/odin-linux-amd64-nightly+2026-05-07"
path_append "$ODIN_ROOT"

# -----------------------------------------------------------------------------
# Oh My Zsh
# -----------------------------------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  zsh-autosuggestions
  fast-syntax-highlighting
)

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# -----------------------------------------------------------------------------
# Neovim
# -----------------------------------------------------------------------------

export NVIM_APPNAME="nvim-j"

for config_file in \
  "$HOME/.config/nvim-Lazyman/.nvimsbind" \
  "$HOME/.config/nvim-Lazyman/.lazymanrc"
do
  [[ -r "$config_file" ]] && source "$config_file"
done

# Use vi on remote systems and Neovim locally.
if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR="vi"
  export VISUAL="vi"
else
  export EDITOR="nvim"
  export VISUAL="nvim"
fi

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

command -v codium >/dev/null 2>&1 && alias code="codium"

if command -v eza >/dev/null 2>&1; then
  alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'
else
  alias la='ls -lah'
fi

# -----------------------------------------------------------------------------
# Interactive tools
# -----------------------------------------------------------------------------

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v tirith >/dev/null 2>&1; then
  eval "$(tirith init --shell zsh)"
fi

# Uncomment with zprof at the top to inspect startup performance:
# zprof | head -20
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> Codex installer >>>
export PATH="/home/pablo/.local/bin:$PATH"
# <<< Codex installer <<<
source ~/.local/share/icons-in-terminal/icons_bash.sh
