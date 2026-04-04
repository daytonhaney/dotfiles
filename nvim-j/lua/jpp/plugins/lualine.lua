return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- Custom function to get the diagnostic message of the current line
		local function get_line_diagnostic()
			local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
			if #diagnostics == 0 then
				return ""
			end
			-- Return the first diagnostic message found on the line
			local icon = "󰋽 "
			if diagnostics[1].severity == vim.diagnostic.severity.ERROR then
				icon = "󰅗 "
			elseif diagnostics[1].severity == vim.diagnostic.severity.WARN then
				icon = "󰅝 "
			end
			return icon .. diagnostics[1].message
		end

		lualine.setup({
			options = {
				theme = "tokyonight",
				globalstatus = true, -- As requested in your options
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = {
					"branch",
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 0,
					},
					{
						-- Macro recording status
						function()
							local reg = vim.fn.reg_recording()
							if reg == "" then
								return ""
							end
							return "󰑊 Recording @" .. reg
						end,
						color = { fg = "#FF4A4A", gui = "bold" },
					},
					{
						get_line_diagnostic, -- Show the actual diagnostic message
						color = { fg = "#FFDA7B" }, -- Highlight color for the message
					},
				},
				lualine_x = {
					{
						-- LSP status
						function()
							local msg = "No LSP"
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if next(clients) == nil then
								return msg
							end
							local client_names = {}
							for _, client in ipairs(clients) do
								table.insert(client_names, client.name)
							end
							return "󰌵 " .. table.concat(client_names, "|")
						end,
						color = { fg = "#3EFFDC" },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
