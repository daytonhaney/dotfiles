--require("core") -- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

--ocal custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

-- require("core.utils").load_mapptings()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

-- vim.opt.rtp:prepend(lazypath)
-- require("plugins")
