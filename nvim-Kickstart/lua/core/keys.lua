vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap



map('n', '<C-TAB>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n','<space> ',":lua require('harpoon.ui').toggle_quick_menu()<CR>",{noremap = true, silent = true})
