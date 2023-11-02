local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
    {
      "andweeb/presence.nvim",
      event = { "BufReadPost" },
      config = function()
        require("anchor")
      end
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        -- Add TabNine support, make sure you ran :CmpTabnineHub after installation.
        {
          "tzachar/cmp-tabnine",
          build = "./install.sh",
          dependencies = "hrsh7th/nvim-cmp",
        },
      },
    },
  
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    lazy = false
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = 'BufRead',
    config = function() require('anchor.ui.devicons') end,
    lazy = false
  },
  {
    'kyazdani42/nvim-tree.lua',
    lazy = false,
    cmd = "NvimTreeToggle",
    config = function() require('anchor.util.nvim-tree') end
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", ' ', "'", "`" },
    lazy = true,
    config = function() require('anchor.util.which-key') end
  },
  {
    'nvim-lua/plenary.nvim',
    lazy = false,
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    lazy = false,
    dependencies = { 'plenary.nvim' },
    config = function() require('anchor.util.telescope') end
  },
  {
    "ThePrimeagen/harpoon",
          dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      },
    config = function() require("anchor.util.harpoon") end,
    enabled = true,
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    config = function() require('anchor.ui.colorizer') end,
    lazy = true
  },

  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'lua.anchor.ui.alpha'.setup(require'alpha.themes.startify'.config)
    end

  },
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
		},

		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.go" },
		{ import = "lazyvim.plugins.extras.lang.java" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.test.core" },
		{ import = "lazyvim.plugins.extras.util.project" },
		{ import = "lazyvim.plugins.extras.ui.edgy" },
		{ import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },

		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		version = false, -- always use the latest git commit
	},
	install = { colorscheme = { "oxocarbon" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
