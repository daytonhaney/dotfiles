local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
local lazy = require("lazy")
lazy.setup({
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function() require('core.treesitter') end
  },
  {

    'ray-x/web-tools.nvim',
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "shfmt",
          "shellcheck",
          "bash-language-server",
          "bash-debug-adapter",
          "json-lsp",
          "lua-language-server",
          "glow",
          "jdtls",
          "java-debug-adapter",
          "java-test",
          "rust-analyzer",
          "rustfmt",
          "pyright",
          "black",
        },
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "",
            package_uninstalled = "✗",
          },
        },
      keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
          cancel_installation = "<C-c>",
      },
    },
  },
      {
        "andweeb/presence.nvim",
        event = { "BufReadPost" },
        config = function()
          require("anchor")
        end
      },
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          -- Add TabNine support, make sure you ran :CmpTabnineHub after installation.
          {
            "tzachar/cmp-tabnine",
            build = "./install.sh",
            dependencies = "hrsh7th/nvim-cmp",
          },
        },
    {
      'windwp/nvim-ts-autotag',
      event = "InsertEnter",
      lazy = false
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = 'BufRead',
      config = function() require('anchor.ui.devicons') end,
      lazy = false
    },
    {
      'kyazdani42/nvim-tree.lua',
      lazy = false,
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
      lazy = false,
    },
    {
      'nvim-telescope/telescope.nvim',
      cmd = "Telescope",
      lazy = false,
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
      'NvChad/nvim-colorizer.lua',
      event = 'BufRead',
      config = function() require('anchor.ui.colorizer') end,
      lazy = true
    },
  
    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function ()
          require'lua.anchor.ui.alpha'.setup(require'alpha.themes.startify'.config)
      end
  
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
      "terrortylor/nvim-comment",
      config = function() require('anchor.util.comments') end,
      lazy = true,
    },
    -- The funs begins
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPost", "BufNewFile" },
      lazy = false,
      cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
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
      lazy = false
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
      'ray-x/web-tools.nvim'
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
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
    {  "RRethy/nvim-treesitter-endwise"},
    {"mfussenegger/nvim-ts-hint-textobject"},
    {"windwp/nvim-ts-autotag"},
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
        require("anchor")
      end
    },
    
    },
  

        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
          local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
          end
    
          local luasnip = require("luasnip")
          local cmp = require("cmp")
    
          local sources = {
            { name = "cmp_tabnine" },
          }
          opts.sources = cmp.config.sources(vim.list_extend(opts.sources, sources))
    
          opts.formatting = {
            format = function(entry, vim_item)
              local icons = require("lazyvim.config").icons.kinds
              if icons[vim_item.kind] then
                vim_item.kind = icons[vim_item.kind] .. vim_item.kind
              end
    
              -- Add tabnine icon and hide percentage in the menu
              if entry.source.name == "cmp_tabnine" then
                vim_item.kind = " [TabNine]"
                vim_item.menu = ""
    
                if (entry.completion_item.data or {}).multiline then
                  vim_item.kind = vim_item.kind .. " " .. "[ML]"
                end
              end
    
              local maxwidth = 80
              vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
    
              return vim_item
            end,
          }
    
          -- Disable ghost text for copilot/codium completions
          opts.experimental = {
            ghost_text = false,
          }
    
          -- add Ctrl-n and Ctrl-p to navigate through the completion menu
          opts.mapping = vim.tbl_extend("force", opts.mapping, {
            ["<C-n>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<C-p>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          })
        end,
      },
    })


  return function()
    local null_ls = require("null-ls")
    local btns = null_ls.builtins

  -- Please set additional flags for the supported servers here
  -- Don't specify any config here if you are using the default one.
    local sources = {
      btns.formatting.clang_format.with({
        filetypes = { "c", "cpp" },
        extra_args = require("completion.formatters.clang_format"),
      }),
      btns.formatting.prettier.with({
        filetypes = {
          "vue",
          "typescript",
          "javascript",
          "typescriptreact",
          "javascriptreact",
          "yaml",
          "html",
          "css",
          "scss",
          "sh",
          "markdown",
        },
      }),
      btns.diagnostics.markdownlint.with({
        extra_args = { "--disable MD033" },
      }),
    -- example for changing diagnostics_format
      btns.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{s} #{c}]" }),
    }

    require("modules.utils").load_plugin("null-ls", {
      border = "rounded",
      debug = false,
      log_level = "warn",
      update_in_insert = false,
      diagnostics_format = "[#{s} #{c}] #{m}",
      sources = sources,
    })

    require("completion.mason-null-ls").setup()

    -- Setup usercmd to register/deregister available source(s)
    local function _gen_completion()
      local sources_cont = null_ls.get_source({
        filetype = vim.api.nvim_get_option_value("filetype", { scope = "local" }),
      })
      local completion_items = {}
      for _, server in pairs(sources_cont) do
        table.insert(completion_items, server.name)
      end
      return completion_items
    end
    vim.api.nvim_create_user_command("NullLsToggle", function(opts)
      if vim.tbl_contains(_gen_completion(), opts.args) then
        null_ls.toggle({ name = opts.args })
      else
        vim.notify(
          string.format("[Null-ls] Unable to find any registered source named [%s].", opts.args),
          vim.log.levels.ERROR,
          { title = "Null-ls Internal Error" }
        )
      end
    end, {
      nargs = 1,
      complete = _gen_completion,
    })

    -- auto stop bashls, shellcheck and shfmt when editing docker-related files
    vim.api.nvim_create_autocmd("LspAttach", {
      pattern = {
        ".env",
      },
      callback = function()
        vim.api.nvim_command([[LspStop bashls]])
        vim.api.nvim_command([[NullLsToggle shellcheck]])
        vim.api.nvim_command([[NullLsToggle shfmt]])
      end,
  })

  require("util.completion").configure_format_on_save()
end
