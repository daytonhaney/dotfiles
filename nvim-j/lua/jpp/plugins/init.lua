-- plugins without a config
return {
	{ "nvim-lua/popup.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "bluz71/vim-nightfly-guicolors" },
	{ "ThePrimeagen/vim-be-good" },
	{ "petertriho/nvim-scrollbar" },
	{ "kevinhwang91/nvim-hlslens" },
	{ "gaborvecsei/usage-tracker.nvim" },
	-- { "focus.nvim" },
	{ "nvim-treesitter/playground" },
	{
		"codota/tabnine-nvim",
		build = "./dl_binaries.sh",
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
