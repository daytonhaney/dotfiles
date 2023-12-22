

case $- in
*i*) ;;
*) return ;;
esac
export NVIM_APPNAME="nvim-j"
export PATH=$PATH:~/.config/nvim-j
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
alias l='exa -lbF --icons'
alias ls='exa -lbF'
alias ll='exa -lba --color always --icons'
alias llm='exa -lbGd --git --sort=modified'
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
alias code='codium'

alias lS='exa -1'
alias lt='exa --tree --level=2'
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

