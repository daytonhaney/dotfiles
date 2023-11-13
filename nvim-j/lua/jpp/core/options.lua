local cmd = vim.cmd
local opt = vim.opt
local diagnostic = vim.diagnostic
--local sc = 'signcolumn=number'
local g = vim.g


--vim.o.signcolumn = "yes:2"
opt.relativenumber = true
opt.number = true
g.code_action_menu_window_border = 'single'

g.theme_cache = vim.fn.stdpath "data" .. "/colors_data/"
opt.splitbelow = true
opt.list = true
opt.splitright = true
-- opt.fileencoding = 'utf-8'
opt.termguicolors = true
opt.conceallevel = 0
opt.showtabline = 3
opt.tabline = ' '
opt.showmode = false
opt.backup = false
opt.number = true
opt.iskeyword:append("-")
opt.ruler = false
--set cmdheight=2
opt.ignorecase = true
opt.smartcase = true
opt.writebackup = false
opt.cursorline = true
opt.updatetime = 300
opt.timeoutlen = 100
opt.clipboard = "unnamedplus"
opt.hlsearch = true
opt.ignorecase = true
opt.scrolloff = 0
opt.sidescrolloff = 5
opt.foldcolumn = '0' -- '0' is not bad
opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the va
opt.termguicolors = true
opt.background = 'dark'
--opt.signcolumn = 'yes'
opt.foldlevelstart = 99
opt.foldenable = true
opt.mouse = "a" -- Mouse support for noobs
opt.cursorline = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.expandtab = true

cmd('set lazyredraw')
cmd('set nolist')
opt.laststatus = 0                  -- Global Status
diagnostic.config { signs = false } -- Removing diagnostic column
opt.updatetime = 250
opt.shadafile = "NONE"
opt.shadafile = ""
opt.swapfile = false
--opt.shortmess:append "sI"

-- Disabling some built in plugins
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
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
  "archlinux",
  "fzf",
  "tutor_mode_plugin",
  "sleuth",
  "vimgrep",
  "Man",
}

for _, plugin in ipairs(builtins) do
  g["loaded_" .. plugin] = 1
end

