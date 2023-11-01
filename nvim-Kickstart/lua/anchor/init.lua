require("anchor.straps")
local lazy = require("lazy")
lazy.setup({
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    lazy = true,
    ensure_installed = {"javascript","typescript","html","rust", "go","c", "python"},
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function() require('lua.anchor.lsp.treesitter') end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    lazy = true
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    config = function() require('anchor.ui.colorizer') end,
    lazy = true
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = 'BufRead',
    config = function() require('anchor.ui.devicons') end,
    lazy = true,
  },

  {
    'kyazdani42/nvim-tree.lua',
    lazy = true,
    cmd = "NvimTreeToggle",
    config = function() require('anchor.util.nvim-tree') end
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", ' ', "'", "`" },
    lazy = true,
    config = function() require('anchor.util.which-key') end
  },
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    lazy = true,
    dependencies = { 'plenary.nvim' },
    config = function() require('anchor.util.telescope') end
  },
  {
    "ThePrimeagen/harpoon",
          dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      },
    config = function() require("anchor.util.harpoon") end,
        enabled = true,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    config = function() require('anchor.util.toggleterm') end,
    cmd = "ToggleTerm",
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufRead" },
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsDeleteLn' },
        },
      }
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    config = function() require('anchor.ui.indentlines') end,
    event = { "BufRead" },
  },
  {
    "williamboman/mason.nvim",
    cmd = {
      "MasonInstall",
      "MasonUninstall",
      "Mason",
      "MasonUninstallAll",
      "MasonLog",
    },
    lazy = true,
    config = function() require('anchor.lsp.mason') end,
  },
  {
    "terrortylor/nvim-comment",
    config = function() require('anchor.util.comments') end,
    lazy = true,
  },
  -- The funs begins
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    lazy = true,
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
    config = function()
      require "lua.anchor.lsp.lspconfig"
    end,
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = true,
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("anchor.lsp.luasnip")
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        event = "InsertEnter",
        lazy = true,
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    config = function()
      require("anchor.lsp.cmp")
    end,
  },
  {
    "LnL7/vim-nix",
    lazy = true,
    ft = 'nix',
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "InsertEnter" },
    opts = {
      signs = false,

    }
  },
  {
    'kevinhwang91/nvim-ufo',
    lazy = true,
    event = "BufReadPost",
    dependencies = 'kevinhwang91/promise-async'
  },
  {
    "folke/trouble.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    event = "BufRead",
    config = true,
  },
  {
    'simrat39/symbols-outline.nvim',
    cmd = "SymbolsOutline",
    lazy = true,
    config = function() require("anchor.util.symbols") end
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    opts = {
    },
    event = "LspAttach",
  },
  {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    config = function() require("anchor.util.grapple") end,
    cmd = {
      "GrappleCycle",
      "GrapplePopup",
      "GrappleReset",
      "GrappleSelect",
      "GrappleTag",
      "GrappleTags",
      "GrappleToggle",
      "GrappleUntag"
    }
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    lazy = true,
    cmd = {
      "HopAnywhere",
      "HopChar1",
      "HopChar2",
      "HopLine",
      "HopLineStart",
      "HopVertical",
      "HopWord"
    },
    config = function() require("anchor.util.hop") end
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function() require("anchor.lsp.saga") end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },

  {
    "onsails/lspkind.nvim",
    event = "InsertEnter",
    lazy = true,
  },
  {
    "elkowar/yuck.vim",
    ft = "yuck"
  },
  {
    "goolord/alpha-nvim",
    cmd = {
      "Alpha",
      "AlphaRedraw"
    },
    config = function()
      require("anchor.ui.alpha")
    end
  },
  {
    "chadcat7/prism",
    lazy = true,
    --dir = "~/Documents/prism/"
  },
  {
    "andweeb/presence.nvim",
    event = { "BufReadPost" },
    config = function()
      require("anchor.util.presence")
    end
  },
})
