return {
	"folke/which-key.nvim",
	keys = { "<leader>", " ", "'" },
	lazy = true,
	config = function()
		local wk = require("which-key")
		local leader = " "
		wk.setup({})

		local key_map = {
			key_labels = { 
				["<space>"] = "SPC",
				["<TAB>"] = "TAB",
			},
		}

		local mappings = {
			["<space>"] = {
				name = "Harpoon",
				["<space>"] = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "Toggle Harpoon Menu" },
				["<TAB>"] = { ":NvimTreeFindFile<CR>", "Nvim Tree" },
				q = { ":q<CR>", "Exit (neovim)" },
			},
			q = {
				name = "File",
				q = { ":q<cr>", "Quit" },
				w = { ":wq<cr>", "Save & Quit" },
				s = { ":w<cr>", "Save" },
				f = { ":lua vim.lsp.buf.format()<CR>", "Format file" },
				x = { ":bdelete<cr>", "Close" },
			},
			f = {
				name = "Telescope",
				f = { ":Telescope find_files<cr>", "Find Files" },
				g = { ":Telescope oldfiles<cr>", "Recently Opened" },
				r = { ":Telescope live_grep<cr>", "Find String" },
				c = { ":Telescope grep_string<cr>", "Find String Under Cursor" },
			},
			t = {
				name = "Tab",
				t = { ":ToggleTerm<cr>", "Split Below" },
			},
			a = {
				name = "terminal $:",
				t = { ":ToggleTerm<CR>", "Bash Zsh Fish" },
			},
			p = {
				name = "Processes (TOP)",
				p = { ":vsplit term://top<CR>", "View Processes" },
			},
			l = {
				name = "Misc",
				l = { ":Lazy<cr>", "Open Lazy" },
				t = { ":Trouble<cr>", "Open Trouble" },
				c = { ":lua require('telescope.builtin').lsp_code_actions()<cr>", "Show Code Actions" },
			},
			s = {
				name = "Split screen",
				["|"] = { ":vsplit<CR>", "Vertical Split" }, 
				["-"] = { ":split<CR>", "Horizontal Split" },
			},
		}

		local opts = { prefix = "<leader>" }
		wk.register(mappings, opts)
	end,
}
