local M = {}
local stats = require("lazy").stats()
M.statusstyle = 'fancy'
local logos = setmetatable({
    TEXT = 

        [[
      █████████████████████████████████████
      ██                                 ██
      ██       ██    ███████   ███████   ██
      ██      ░██ ░██░░░░██ ░██░░░░██    ██
      ██      ░██ ░██   ░██ ░██   ░██    ██
      ██      ░██ ░███████  ░███████     ██
      ██      ░██ ░██░░░░   ░██░░░░      ██
      ██  ██   ██ ░██       ░██          ██
      ██  ░░█████ ░██       ░██          ██
      ██    ░░░░░  ░░        ░░          ██
      █████████████████████████████████████

        ]],
    UWU = [[
      ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄
      ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄
      ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄
      ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄
      ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄
      ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄
      ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄
      ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿
      ]],
    UWU2 = [[
             █████████████████
         ████▌█████▌█ ████████▐▀██▀
       ▄█████ █████▌ █ ▀██████▌█▄▄▀▄
       ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀
      ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█
        ███ ▌▄█▌  ▀  ▀██  ▀██████▌
         ▀█▌▀██▀ ▄         ███▐███
          ███     ▀█▀     ▐██▐███▀▌
          ▌█▌█▄         ▄▄████▀ ▀
            █▀██▄▄▄ ▄▄▀▀▒█▀█
      ]],
  },
  {
    __index = function(logos, key)
      return logos[key]
    end,
  }
)
M.dashboard = {
  header = vim.split(logos.TEXT, "\n"),
  buttons = {
    {"💡     New File","SPC n  "},
    { "🔭     Find File", "SPC f f" },
    { "🗄️     Recent Files", "SPC f g" },
    { "🔍     Find Word", "SPC f r" },
    {"📌     Harpoon", "SPC SPC"},
  },
  message = {
    "  ",
  },
  footer = {
    "Loaded " ..stats.count..  " plugins",
  }
}

return M
