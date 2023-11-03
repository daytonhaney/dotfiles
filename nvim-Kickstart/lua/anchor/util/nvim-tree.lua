require("nvim-tree").setup {

    renderer = {
      icons = {
        glyphs = {
          default = ' ',
          symlink = ' ',
          git = {
            untracked = " ",
          }
        },
        show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow = false,
        }
      }
    },
    actions = {
      open_file = {
        window_picker = {
          exclude = {
            filetype = {
              "packer",
              "qf"
            },
            buftype = {
              "terminal",
              "help"
            }
          },
        },
      },
    },
    filters = {
      exclude = { 'node_modules', '.cache',"venv" },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  
    hijack_directories = { enable = true },
    view = {
      width = "18%",
      side = "left",
    },
  }
  vim.cmd [[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
  ]]