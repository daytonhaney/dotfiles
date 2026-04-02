return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "rust", "python", "javascript", "typescript", "lua", "html", "css", "json", "markdown" },
			callback = function(args)
				vim.treesitter.start(args.buf)
				vim.bo[args.buf].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo[args.buf].foldmethod = "expr"
			end,
		})

		-- Python specific
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "python" },
			callback = function()
				vim.treesitter.query.set("python", "indents", {
					"(function_definition) @indent",
					"(class_definition) @indent",
					"(if_statement) @indent",
					"(for_statement) @indent",
					"(while_statement) @indent",
					"(with_statement) @indent",
					"(try_statement) @indent",
					"(except_clause) @indent",
				})
			end,
		})
	end,
}
