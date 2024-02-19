local colorscheme = require("jpp.plugins.colorscheme")
--vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "jpp.plugins" }, { import = "jpp.plugins.lsp" } }, {
	install = {
		colorscheme = { "solarized-okaka", "nightfly" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	--{
	--	"elixir-tools/elixir-tools.nvim",
	--	version = "*",
	--	event = { "BufReadPre", "BufNewFile" },
	--	config = function()
	--		local elixir = require("lua.jpp.plugins.elixir")
	--		local elixirls = require("elixir.elixirls")
	--
	--		elixir.setup({
	--			nextls = { enable = true },
	--			credo = {},
	--			elixirls = {
	--				enable = true,
	--				settings = elixirls.settings({
	--					dialyzerEnabled = false,
	--					enableTestLenses = false,
	--				}),
	--				on_attach = function(client, bufnr)
	--					vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
	--					vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
	--					vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
	--				end,
	--			},
	--		})
	--	end,
	--	dependencies = {
	--		"nvim-lua/plenary.nvim",
	--	},
	--},
})
