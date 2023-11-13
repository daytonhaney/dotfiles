      return {
          -- snippet plugin
          "L3MON4D3/LuaSnip",
          lazy = true,
          dependencies = "rafamadriz/friendly-snippets",
          config = function()
            require("anchor.lsp.luasnip")
          end,


          
        }
