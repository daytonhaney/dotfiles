return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	ft = "rust",
	config = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<Leader>a", function()
						vim.cmd.RustLsp "codeAction"
					end, { buffer = bufnr, desc = "Rust code action" })
				end,
			},
		}
	end,
}
