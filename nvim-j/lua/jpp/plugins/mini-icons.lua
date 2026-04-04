return {
	"echasnovski/mini.icons",
	opts = {
		-- use it to mock nvim-web-devicons
		mock_nvim_web_devicons = true,
	},
	config = function(_, opts)
		require("mini.icons").setup(opts)
	end,
}
