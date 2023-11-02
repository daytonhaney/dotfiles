
local wk = require("which-key")
wk.setup {
}

local mappings = {
  ["<space>"] =
  {
    name = 'Harpoon',
    ["<space>"] = {":<SPC><cr>", "add file"},
    ["<space><space>"] = {"<leader><leader>", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Add file to Harpoon" },
    { "<leader><spaee>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Harpoon Menu" },
  },
  q = {
    name = 'File',
    q = { ":q<cr>", "Quit" },
    w = { ":wq<cr>", "Save & Quit" },
    s = { ":w<cr>", "Save" },
    f = { ":lua vim.lsp.buf.format()<CR>", "Format file" },
    x = { ":bdelete<cr>", "Close" },
  },
  f = {
    name = 'Telescope',
    f = { ":Telescope find_files<cr>", "Find Files" },
    g = { ":Telescope oldfiles<cr>", "Recently Opened" },
    r = { ":Telescope live_grep<cr>", "Find String" },
    c = { ":PrismTelescope<cr>", "Kolorschemes" },
  },
  G = {
    name = "Grapple",
    a = { ":GrappleTag<cr>", "Add A Bookmark" },
    t = { ":GrappleToggle<cr>", "Toggle Bookmark" },
    r = { ":GrappleUntag<cr>", "Remove Bookmark" },
    g = { ":GrapplePopup tags<cr>", "Show All Bookmarks" }
  },
  t = {
    name = "Terminal",
    t = { ":ToggleTerm<cr>", "Split Below" },
  },
  l = {
    name = "Misc",
    l = { ":Lazy<cr>", "Open Lazy" },
    t = { ":Trouble<cr>", "Open Trouble" },
    c = { ":lua require('telescope') vim.lsp.buf.code_action()<cr>", "Show Code Actions" },
    m = { ":Mason<cr>", "Open Mason" },
    n = { ":Neogit<cr>", "Open Neogit" },
    s = { ":SymbolsOutline<cr>", "Overview of file" },
    w = { ":SessionSave<cr>", "Save this session" }
  },

  z = {name = "Workbench"}, 
}

-- Map Enter key to select in Telescope
vim.api.nvim_set_keymap('n', '<CR>', [[<Cmd>Telescope send<CR>]], { noremap = true, silent = true })



local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
