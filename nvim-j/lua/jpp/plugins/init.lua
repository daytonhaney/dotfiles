-- here are plugs that right now dont really need a separate config file,
--
--
-- however harpoon do have separate files

return {
	{ "nvim-lua/popup.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "bluz71/vim-nightfly-guicolors" },

	{ "petertriho/nvim-scrollbar" },
	{ "kevinhwang91/nvim-hlslens" },

	-- { "focus.nvim" },
	{ "nvim-treesitter/playground" },


	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
