Followed nvim-josean (https://github.com/josean-dev/dev-environment-files) - Easy to ready scaffold for customization.

# dotfiles/nvim-j

<a href="https://dotfyle.com/daytonhaney/dotfiles-nvim-j"><img src="https://dotfyle.com/daytonhaney/dotfiles-nvim-j/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/daytonhaney/dotfiles-nvim-j"><img src="https://dotfyle.com/daytonhaney/dotfiles-nvim-j/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/daytonhaney/dotfiles-nvim-j"><img src="https://dotfyle.com/daytonhaney/dotfiles-nvim-j/badges/plugin-manager?style=flat" /></a>

## Install Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone https://github.com/daytonhaney/dotfiles.git ~/.config/daytonhaney/dotfiles
NVIM_APPNAME=daytonhaney/dotfiles/nvim-j nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=daytonhaney/dotfiles/nvim-j nvim
```

## Plugins

### colorscheme

- [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)

### completion

- [simrat39/rust-tools.nvim](https://dotfyle.com/plugins/simrat39/rust-tools.nvim)
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### debugging

- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
- [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### editing-support

- [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### game

- [ThePrimeagen/vim-be-good](https://dotfyle.com/plugins/ThePrimeagen/vim-be-good)

### git

- [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)

### indent

- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### keybinding

- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
- [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)
- [soulis-1256/hoverhints.nvim](https://dotfyle.com/plugins/soulis-1256/hoverhints.nvim)
- [nvimdev/lspsaga.nvim](https://dotfyle.com/plugins/nvimdev/lspsaga.nvim)
- [stevearc/aerial.nvim](https://dotfyle.com/plugins/stevearc/aerial.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### lua-colorscheme

- [ellisonleao/gruvbox.nvim](https://dotfyle.com/plugins/ellisonleao/gruvbox.nvim)

### marks

- [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### nvim-dev

- [anuvyklack/animation.nvim](https://dotfyle.com/plugins/anuvyklack/animation.nvim)
- [nvim-lua/popup.nvim](https://dotfyle.com/plugins/nvim-lua/popup.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### scrollbar

- [petertriho/nvim-scrollbar](https://dotfyle.com/plugins/petertriho/nvim-scrollbar)

### search

- [kevinhwang91/nvim-hlslens](https://dotfyle.com/plugins/kevinhwang91/nvim-hlslens)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)

### split-and-window

- [anuvyklack/windows.nvim](https://dotfyle.com/plugins/anuvyklack/windows.nvim)

### startup

- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### tabline

- [romgrk/barbar.nvim](https://dotfyle.com/plugins/romgrk/barbar.nvim)

### utility

- [sudormrfbin/cheatsheet.nvim](https://dotfyle.com/plugins/sudormrfbin/cheatsheet.nvim)
- [gaborvecsei/usage-tracker.nvim](https://dotfyle.com/plugins/gaborvecsei/usage-tracker.nvim)
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)

### web-development

- [roobert/tailwindcss-colorizer-cmp.nvim](https://dotfyle.com/plugins/roobert/tailwindcss-colorizer-cmp.nvim)

## Language Servers

- astro
- cssls
- elixirls
- emmet_ls
- graphql
- html
- lua_ls
- marksman
- prismals
- pyright
- ruff_lsp
- sqls
- svelte
- tailwindcss
- tsserver
- volar

This readme was generated by [Dotfyle](https://dotfyle.com)
![keepingitrea1](https://github.com/daytonhaney/dotfiles/assets/37848207/89b154a2-e073-4feb-beb2-d536bbd705ec)
