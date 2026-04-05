return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "python", "go", "gomod", "gowork", "gosum" },
			indent = { enable = true },
		})
	end,
}
