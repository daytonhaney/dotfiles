vim.g.mapleader = " "
require("jpp.core")
require("jpp.lazy")

function WakeUp()
	local date = os.date("*t")
	local time = os.date("*t")
	local message = "| Keep it going, stay motivated!"
	print(os.date("%A,%m %B %Y"), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec), message)
end


