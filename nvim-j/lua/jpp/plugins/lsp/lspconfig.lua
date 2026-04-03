return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvimdev/lspsaga.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local on_attach = function(client, bufnr)
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { buffer = bufnr, desc = "Show LSP references" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { buffer = bufnr, desc = "Show LSP definitions" })
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { buffer = bufnr, desc = "Show LSP implementations" })
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { buffer = bufnr, desc = "Show LSP type definitions" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "See available code actions" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Smart rename" })
			vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { buffer = bufnr, desc = "Show buffer diagnostics" })
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show line diagnostics" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Go to previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Go to next diagnostic" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { buffer = bufnr, desc = "Restart LSP" })
		end

		vim.lsp.config.html = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config.ts_ls = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config.biome = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config.cssls = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config.tailwindcss = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config.svelte = {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		}

		vim.lsp.config.emmet_ls = {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		}

		vim.lsp.config.pyright = {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "basic",
					},
				},
			},
		}

		vim.lsp.config.lua_ls = {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					telemetry = { enable = false },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		}

		vim.lsp.enable("html")
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("biome")
		vim.lsp.enable("cssls")
		vim.lsp.enable("tailwindcss")
		vim.lsp.enable("svelte")
		vim.lsp.enable("emmet_ls")
		vim.lsp.enable("pyright")
		vim.lsp.enable("lua_ls")
	end,
}
