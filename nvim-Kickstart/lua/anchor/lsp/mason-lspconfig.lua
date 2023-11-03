require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer","biome","tsserver","html","css","es-list" },
}
require'lspinstall'.setup() -- important
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end