return {
	"folke/which-key.nvim",
	keys = { "<leader>", " ", "'" },
	lazy = true,
	config = function()
		require("which-key")

		local wk = require("which-key")
		local leader = " "

		wk.setup = {}

		local key_map = {
			key_lables = {
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
				c = { ":PrismTelescope<cr>", "Kolorschemes" },
			},
			g = {
				name = "Grapple",
				a = { ":GrappleTag<cr>", "Add A Bookmark" },
				t = { ":GrappleToggle<cr>", "Toggle Bookmark" },
				r = { ":GrappleUntag<cr>", "Remove Bookmark" },
				g = { ":GrapplePopup tags<cr>", "Show All Bookmarks" },
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
				p = { ":vsplit term://top<CR>", "View Processes" }, -- may change
			},
			e = {
				name = "File Tree",
				-- e = {":<cmd>NvimTreeToggle<CR>", "Open File Tree"}
			},

			l = {
				name = "Misc",
				l = { ":Lazy<cr>", "Open Lazy" },
				t = { ":Trouble<cr>", "Open Trouble" },
				c = { ":lua require('telescope') vim.lsp.buf.code_action()<cr>", "Show Code Actions" },
				m = { ":Mason<cr>", "Open Mason" },

				n = { ":Neogit<cr>", "Open Neogit" },
				s = { ":SymbolsOutline<cr>", "Overview of file" },
				w = { ":SessionSave<cr>", "Save this session" },
			},
			s = {
				name = "Split screen",
				["|"] = { ":<space>s|", "Verticle Split" },
				["-"] = { ":<space>s-", "Horizontal Split" },
			},
		}
		-- Map Enter key to select in Telescope
		vim.api.nvim_set_keymap("n", "p", [[<Cmd>Telescope send<CR>]], { noremap = true, silent = true })
		local opts = { prefix = "<leader>" }
		wk.register(mappings, opts, key_map)
	end,
}
