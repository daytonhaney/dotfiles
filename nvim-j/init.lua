vim.g.mapleader = " "
require("jpp.core")
require("jpp.lazy")

--function NeovimTalk()
--	print("Hello, Welcome to Neovim!")
--end

--vim.api.nvim_create_user_command("TalkDrityToMe", NeovimTalk, {})

--function WakeUp()
--	local date = os.date("*t")
--	local time = os.date("*t")
--	local message = "| Keep it going, stay motivated!"
--	print(os.date("%A,%m %B %Y"), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec), message)
--end

--vim.api.nvim_create_autocmd("CursorHold", { callback = WakeUp, timeout_ms = 10000 })
--vim.keymap.set("n", "<leader>u", NeovimTalk)

-- autocomplete  ctrl + g. in cmp.lua

-- time = os.time()
--delay = 10
--newtime = time + delay
--while time < newtime do
--	time = os.time()
--	vim.api.nvim_create_autocmd("CursorHold", { callback = WakeUp})
--end
