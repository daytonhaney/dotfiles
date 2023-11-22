-- here are plugs that right now dont really need a separate config file,
--
--
-- however harpoon do have separate files

return {

	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- or
	-- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}},
	{ "vidocqh/auto-indent.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "bluz71/vim-nightfly-guicolors" },

	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"ThePrimeagen/vim-be-good",
	},
	{
		"petertriho/nvim-scrollbar",
	},
	{
		"kevinhwang91/nvim-hlslens",
	},
	{
		"gaborvecsei/usage-tracker.nvim",
	},
	{
		"focus.nvim",
	},
	{
		"rainbow-delimiters.nvim",
	},
	{
		"nvim-treesitter/playground",
	},
	{
		"codota/tabnine-nvim",
		build = "./dl_binaries.sh",
	},
	{
		{
			"Exafunction/codeium.vim",
			event = "BufEnter",
		},
	},
}
