-- set leader key to space bar
vim.g.mapleader = " "

local keymap = vim.keymap -- add all keymaps into keymap variable and return it

---------------------
-- General Keymaps -------------------




-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')


-- window management
keymap.set("n", "<leader>S|", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>S-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>S||", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height


keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>t.", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>t,", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
