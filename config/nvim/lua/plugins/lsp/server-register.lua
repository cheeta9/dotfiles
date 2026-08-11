require("mason").setup()
require("mason-lspconfig").setup()

local other_lsp = {
  -- list
  "eslint",
  "jsonls",
  "lua_ls",
}

-- vim.lsp.enable()はnvim 0.11以降のAPIなので、古いnvim(glibcが古いマシンなど)では
-- 旧来のlspconfig[server].setup()にフォールバックする
if vim.fn.has("nvim-0.11") == 1 then
  for _, server_name in pairs(other_lsp) do
    vim.lsp.enable(server_name)
  end
else
  local lspconfig = require("lspconfig")
  for _, server_name in pairs(other_lsp) do
    lspconfig[server_name].setup({})
  end
end
