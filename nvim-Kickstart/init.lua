

require("anchor")
-- require("strapsp")
require("ui")
require("core")
require("options")



require('mason')


vim.cmd([[:set laststatus=3]]) -- Global Status Line

-- CursorLine Setup
vim.cmd([[:hi CursorLineNr guibg=NONE guifg=#ffffff]]) -- Highlight cursorline
vim.cmd([[:set cursorline]])                           -- Highlight cursorline
vim.cmd([[:set cursorlineopt=number]]) 