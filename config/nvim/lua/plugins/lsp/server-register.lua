require("mason").setup()
require("mason-lspconfig").setup()

local other_lsp = {
  -- list
  "eslint",
  "jsonls",
  "lua_ls",
}
for _, server_name in pairs(other_lsp) do
  vim.lsp.enable(server_name)
end
