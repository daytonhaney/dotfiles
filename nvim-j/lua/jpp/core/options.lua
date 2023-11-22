-- highlight character on 80th line
--highlight ColorColumn ctermbg=magenta
--call matchadd("ColorColumn", "\%81v", 100)
local cmd = vim.cmd
local opt = vim.opt
local diagnostic = vim.diagnostic
local g = vim

opt.laststatus = 3
opt.hidden = true
g.code_action_menu_window_border = "single"
opt.ch = 0
opt.spell = true
opt.pumheight = 10
opt.fileencoding = "utf-8"
opt.splitbelow = true
opt.list = true

opt.splitright = true
opt.termguicolors = true
opt.conceallevel = 0
opt.showtabline = 3
opt.tabline = " "
opt.showmode = false

opt.backup = false

opt.relativenumber = true
opt.nu = true
opt.numberwidth = 3
opt.ruler = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 100
opt.clipboard = "unnamedplus"
opt.hlsearch = true
opt.ignorecase = true
opt.scrolloff = 0
opt.sidescrolloff = 5
opt.foldcolumn = "0" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.mouse = "a" -- Mouse support for noobs
opt.cursorline = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 0
--opt.autoindent = true
opt.expandtab = true
opt.fillchars:append("eob:~")
opt.listchars:append("space: ")
cmd("set lazyredraw")
cmd("set nolist")
opt.laststatus = 0 -- Global Status
diagnostic.config({ signs = true }) -- Removing diagnostic column
opt.updatetime = 250
opt.shadafile = "NONE"
opt.shadafile = ""
opt.swapfile = false
opt.shortmess:append("sI")

opt.smartindent = true
--- Disabling some built in plugins
local builtins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"matchparen",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"logipat",
	"matchit",
	--  "tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	--"compiler",
	"bugreport",
	"ftplugin",
	"archlinux",
	"fzf",
	-- "tutor_mode_plugin",
	"sleuth",
	"vimgrep",
}

-- for the git diff
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#0A2B2B" })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#393939", bg = "#161616" })
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#161616" })
vim.api.nvim_set_hl(0, "DiffText", { bg = "#161616" })

-- neovide stuff
if vim.g.neovide then
	-- vim.g.neovide_transparency = 0.8
	vim.g.neovide_no_idle = true
	vim.g.neovide_refresh_rate = 165
	vim.g.neovide_padding_top = 45
	vim.g.neovide_padding_bottom = 40
	vim.g.neovide_padding_left = 40
	vim.g.neovide_padding_right = 20
	vim.opt.guifont = { "Iosevka Nerd Font Mono Bold", ":h20" }
	-- vim.opt.guifont = { "FiraCode Nerd Font", ":h20" }
end

for _, plugin in ipairs(builtins) do
	g["loaded_" .. plugin] = 1
end