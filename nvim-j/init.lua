vim.g.mapleader = " "
require("jpp.core")
require("jpp.lazy")

function NeovimTalk()
	print("Hello, Welcome to Neovim!")
end

vim.api.nvim_create_user_command("TalkDrityToMe", NeovimTalk, {})

function WakeUp()
	local date = os.date("*t")
	local time = os.date("*t")
	local message = "| Keep it going, stay motivated. Fuel up and open the docs...stay off twitter. Rinse and repeat."
	print(os.date("%A,%m %B %Y - "), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec), message)
end

vim.api.nvim_create_autocmd("CursorHold", { callback = WakeUp })
vim.keymap.set("n", "<leader>u", NeovimTalk)

-- autocomplete  ctrl + g. in cmp.lua
