local M = {}
local stats = require("lazy").stats()
M.statusstyle = "fancy"
local logos = setmetatable({
	TEXT_NAME = [[
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

	KEEPING_IT_REAL = [[

                                                          :-==:     .          ..  
                                                    :==-=+%%: +*:=*  #+  .+--=.
                       .......                      :     .@* *#:+# ++@- %#    
                   .::::::::::..                          :@- ##.. =*:=@.=#:.- 
                  :----::::::...                         =*:  ::   -   -: .::- 
               .-=-----::::::..                       :=-                     
               =++===--::.:::...    .               :=-    .-                 
               :==+++==-::::::...   .. .            =#*+*#*#*:                 
               :==++++===-:.......    .:                                       
       --      .-===++++:..........    .                                       
      .+-       :=++++=-..:-...--::.            ::--::..                       
      -=.       .::::::-::-=-:-=-::.            :-=------:..                   
      ==.    .:*+. .:.:=+=-==++=-:.....         -=======--::.                  
     :=-.  .-+*+. ::.:-=+*---:==-:.....         :++=+++==-::.                  
     ===-.-=*+-  -=+-:-==*+:. :-:.. ..     . .. .+=+***+-::...                 
    :++**++++-  =+***+---=-..:.....       .  .:.:++****==-:...                 
    =+++=**-.  -+*****+=--::---=:....   ..   .:.:++***++==-::.                 
   .=+===+=:.:-=++===-:::  .:==:  .    .     .:::=++***+=---:..                
   .++===::-===-----:.  .     .......       .  ..:=+++++==--:...               
  .=++==--::.:=+==-:        :-=::::.         .  : .-====+=-::::..
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

	EVIL = [[
        "            :h-                                  Nhy`               ",
        "           -mh.                           h.    `Ndho               ",
        "           hmh+                          oNm.   oNdhh               ",
        "          `Nmhd`                        /NNmd  /NNhhd               ",
        "          -NNhhy                      `hMNmmm`+NNdhhh               ",
        "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
        "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
        "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
        "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
        " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
        " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
        " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
        " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
        "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
        "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
        "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
        "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
        "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
        "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
        "       //+++//++++++////+++///::--                 .::::-------::   ",
        "       :/++++///////////++++//////.                -:/:----::../-   ",
        "       -/++++//++///+//////////////               .::::---:::-.+`   ",
        "       `////////////////////////////:.            --::-----...-/    ",
        "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
        "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
        "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
        "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
        "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
        "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
        "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
        "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
        "                        .-:mNdhh:.......--::::-`                    ",
        "                           yNh/..------..`                          ",
        "                                                                    ",
        "N E O V I M - v " .. version.major .. "." .. version.minor,
        "",        
    ]],

	BISON = [[
               .                                                      .      
          .n                   .                 .                  n.          
     .   .dP                  dP                   9b                 9b.    .   
        qXb         .       dX                     Xb       .        dXp     t  
   dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb 
   9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP 
    9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP  
     `9XXXXXXXXXXXXXXXXXXXXX'~   ~`OOO8b   d8OOO'~   ~`XXXXXXXXXXXXXXXXXXXXXP'   
       `9XXXXXXXXXXXP' `9XX'          `98v8P'         `XXP' `9XXXXXXXXXXXP'     
           ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~         
                           )b.  .dbo.dP'`v'`9b.odb.  .dX(                        
                         ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.                       
                        dXXXXXXXXXXXP'   .   `9XXXXXXXXXXXb                      
                       dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb                     
                       9XXb'   `XXXXXb.dX|Xb.dXXXXX'   `dXXP                     
                        `'      9XXXXXX(   )XXXXXXP      `'                      
                                 XXXX X.`v'.X XXXX                              
                                 XP^X'`b   d'`X^XX                               
                                 X. 9  `   '  P )X                               
                                 `b  `       '  d'                               
                                  `             '                                

    ]],

	CHAD = [[
                                                                    
                            ⣿⣿⣿⣿⡏⣀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿
                            ⣿⣿⣿⢏⣴⣿⣷⠀⠀⠀⠀⠀⢾⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿
                            ⣿⣿⣟⣾⣿⡟⠁⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣷⢢⠀⠀⠀⠀⠀⠀⠀⢸⣿
                            ⣿⣿⣿⣿⣟⠀⡴⠄⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⣿
                            ⣿⣿⣿⠟⠻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠶⢴⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⣿
                            ⣿⣁⡀⠀⠀⢰⢠⣦⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⡄⠀⣴⣶⣿⡄⣿
                            ⣿⡋⠀⠀⠀⠎⢸⣿⡆⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⠗⢘⣿⣟⠛⠿⣼
                            ⣿⣿⠋⢀⡌⢰⣿⡿⢿⡀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⡇⠀⢸⣿⣿⣧⢀⣼
                            ⣿⣿⣷⢻⠄⠘⠛⠋⠛⠃⠀⠀⠀⠀⠀⢿⣧⠈⠉⠙⠛⠋⠀⠀⠀⣿⣿⣿⣿⣿
                            ⣿⣿⣧⠀⠈⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠟⠀⠀⠀⠀⢀⢃⠀⠀⢸⣿⣿⣿⣿
                            ⣿⣿⡿⠀⠴⢗⣠⣤⣴⡶⠶⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡸⠀⣿⣿⣿⣿
                            ⣿⣿⣿⡀⢠⣾⣿⠏⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠉⠀⣿⣿⣿⣿
                            ⣿⣿⣿⣧⠈⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿
                            ⣿⣿⣿⣿⡄⠈⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿
                            ⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿
                            ⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
                            ⣿⣿⣿⣿⣿⣦⣄⣀⣀⣀⣀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
                          
    ]],

	_NEOVIM_ = [[ 
               ████ ██████           █████      ██
              ███████████             █████ 
              █████████ ███████████████████ ███   ███████████
             █████████  ███    █████████████ █████ ██████████████
            █████████ ██████████ █████████ █████ █████ ████ █████
          ███████████ ███    ███ █████████ █████ █████ ████ █████ 
         ██████  █████████████████████ ████ █████ █████ ████ ██████
 ]],
}, {

	__index = function(logos, key)
		return logos[key]
	end,
})
M.dashboard = {
	header = vim.split(logos.KEEPING_IT_REAL, "\n"),
	buttons = {
		{ "💡     new file", "SPC n  " },
		{ "🔭     find file", "SPC f f" },
		{ "🗄️     recent files", "SPC f g" },
		{ "🔍     find word", "SPC f r" },
		{ "📌     harpoon", "SPC SPC" },
		{ "🔧     menu", "SPC" },
	},
	message = {
		" ",
	},
	footer = function()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		return { "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms" }
	end,
}

return M
