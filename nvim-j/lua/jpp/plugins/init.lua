-- here are plugs that right now dont really need a separate config file,
--
--
-- however harpoon do have separate files

return {
	{ "nvim-lua/popup.nvim" },
    {"rafamadriz/friendly-snippets" },
	{ "christoomey/vim-tmux-navigator" },
    {
    "VPavliashvili/json-nvim",
    ft = "json", -- only load for json filetype
    },
	{ "bluz71/vim-nightfly-guicolors" },
    { "dmtrKovalenko/fff.nvim" },
	{ "petertriho/nvim-scrollbar" },
	{ "kevinhwang91/nvim-hlslens" },

	-- { "focus.nvim" },

	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
