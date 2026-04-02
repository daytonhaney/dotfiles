return {
  'dmtrKovalenko/fff.nvim',
  build = function()
    -- Tries to use rustup toolchain to build from source automatically
    require("fff.download").download_or_build_binary()
  end,
  config = function()
    require('fff').setup({})
  end,
}

