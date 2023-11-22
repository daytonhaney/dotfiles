return {
	  "nvim-treesitter/nvim-treesitter",
	  event = { "BufReadPre", "BufNewFile" },
	  build = ":TSUpdate",
	  dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	  },
	  config = function()
		-- import nvim-treesitter plugin
		local treesitter = require "nvim-treesitter.configs".setup {
			playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = 'o',
				toggle_hl_groups = 'i',
				toggle_injected_languages = 't',
				toggle_anonymous_nodes = 'a',
				toggle_language_display = 'I',
				focus_language = 'f',
				unfocus_language = 'F',
				update = 'R',
				goto_node = '<cr>',
				show_help = '?',
			},
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"rust",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"vue",
				"bash",
				"lua",
				"gitignore",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			highlight = {
				enable = true,
			  },
			  -- enable indentation
			  indent = { enable = true },
			  -- enable autotagging (w/ nvim-ts-autotag plugin)
			  autotag = {
				enable = true,
			  },
			}end
		}
