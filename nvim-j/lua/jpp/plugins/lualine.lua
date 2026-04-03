return {
	"feline-nvim/feline.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local feline = require("feline")
		local lazy_status = require("lazy.status")

		local colors = {
			bg = "#112638",
			bg_alt = "#1a2f4a",
			fg = "#c3ccdc",
			fg_alt = "#7a8a9a",
			green = "#3EFFDC",
			yellow = "#FFDA7B",
			orange = "#FF9E64",
			red = "#FF4A4A",
			blue = "#65D1FF",
			purple = "#FF61EF",
			cyan = "#3EFFDC",
		}

		local vi_mode_colors = {
			["NORMAL"] = colors.green,
			["INSERT"] = colors.blue,
			["VISUAL"] = colors.purple,
			["OP"] = colors.green,
			["REPLACE"] = colors.red,
			["COMMAND"] = colors.yellow,
			["SELECT"] = colors.orange,
			["LINEWISE"] = colors.orange,
			["BLOCKWISE"] = colors.orange,
		}

		local vi_mode_text = {
			["NORMAL"] = "NORMAL",
			["INSERT"] = "INSERT",
			["VISUAL"] = "VISUAL",
			["OP"] = "OP",
			["REPLACE"] = "REPLACE",
			["COMMAND"] = "COMMAND",
			["SELECT"] = "SELECT",
			["LINEWISE"] = "LINE",
			["BLOCKWISE"] = "BLOCK",
		}

		local lualine_theme = {
			bg = colors.bg,
			fg = colors.fg,
			green = colors.green,
			yellow = colors.yellow,
			orange = colors.orange,
			red = colors.red,
			blue = colors.blue,
			purple = colors.purple,
			cyan = colors.cyan,
		}

		local icons = {
			git_branch = "  ",
			fileinfo = " 󰈔 ",
			lsp = " 󰌵 ",
			filetype = " 󰌨 ",
			fileformat = " 󰏱 ",
			cwd = " 󰉋 ",
			position = " Ln ",
			percentage = " 󰈙 ",
			scroll_bar = " █",
		}

		local components = {
			active = {},
			inactive = {},
		}

		table.insert(components.active, {
			{
				provider = function()
					return vi_mode_text[vim.fn.mode()] or "  "
				end,
				hl = function()
					local mode = vim.fn.mode()
					return {
						fg = vi_mode_colors[mode] or colors.bg,
						bg = colors.bg_alt,
						bold = true,
					}
				end,
				right_sep = {
					str = "  ",
					hl = colors.bg_alt,
				},
			},
			{
				provider = "git_branch",
				icon = icons.git_branch,
				hl = { fg = colors.orange, bg = colors.bg },
				left_sep = {
					str = "  ",
					hl = colors.bg_alt,
				},
				right_sep = "  ",
			},
			{
				provider = "fileinfo",
				icon = icons.fileinfo,
				hl = { fg = colors.fg, bg = colors.bg },
				left_sep = "  ",
				right_sep = {
					str = "  ",
					hl = colors.bg_alt,
				},
			},
			{
				provider = "diagnostic.errors",
				hl = { fg = colors.red, bg = colors.bg_alt },
				icon = " 󰅗 ",
				right_sep = " ",
			},
			{
				provider = "diagnostic.warnings",
				hl = { fg = colors.yellow, bg = colors.bg_alt },
				icon = " 󰅝 ",
				right_sep = " ",
			},
			{
				provider = "diagnostic.hints",
				hl = { fg = colors.blue, bg = colors.bg_alt },
				icon = " 󰅡 ",
				right_sep = "  ",
			},
			{
				provider = "lsp_client_names",
				icon = icons.lsp,
				hl = { fg = colors.cyan, bg = colors.bg },
				left_sep = "  ",
				right_sep = "  ",
			},
			{
				provider = "filetype",
				icon = icons.filetype,
				hl = { fg = colors.fg, bg = colors.bg_alt },
				left_sep = {
					str = "  ",
					hl = colors.bg,
				},
				right_sep = "  ",
			},
			{
				provider = "fileformat",
				icon = icons.fileformat,
				hl = { fg = colors.fg, bg = colors.bg },
				left_sep = "  ",
				right_sep = "  ",
			},
			{
				provider = function()
					return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
				icon = icons.cwd,
				hl = { fg = colors.fg, bg = colors.bg },
				left_sep = "  ",
				right_sep = "  ",
			},
			{
				provider = "cursor_position",
				icon = icons.position,
				hl = { fg = colors.fg, bg = colors.bg_alt },
				left_sep = {
					str = "  ",
					hl = colors.bg,
				},
				right_sep = "  ",
			},
			{
				provider = "line_percentage",
				icon = icons.percentage,
				hl = { fg = colors.fg, bg = colors.bg },
				left_sep = "  ",
				right_sep = "  ",
			},
			{
				provider = "scroll_bar",
				hl = { fg = colors.blue, bg = colors.bg },
				left_sep = "  ",
			},
		})

		table.insert(components.inactive, {
			{
				provider = "fileinfo",
				icon = icons.fileinfo,
				hl = { fg = colors.fg_alt, bg = colors.bg },
				left_sep = "  ",
				right_sep = "  ",
			},
			{
				provider = "filetype",
				icon = icons.filetype,
				hl = { fg = colors.fg_alt, bg = colors.bg },
				left_sep = "  ",
			},
		})

		feline.setup({
			components = components,
			theme = lualine_theme,
		})
	end,
}
