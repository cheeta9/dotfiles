---@module "lazy"
---@type LazyPluginSpec[]

-- glibcが古いマシンでは新しいnvimが使えず、最新のnvim-lspconfigは起動のたびに
-- 「Nvim 0.11+を使え」という非推奨警告を出してくるため、そのnvimでのみ
-- 警告が入る直前のコミットに固定する(新しいnvimが使えるMacなどは最新を追従させる)
local is_old_nvim = vim.fn.has("nvim-0.11") == 0

return {
    {
        "neovim/nvim-lspconfig",
        commit = is_old_nvim and "5bfcc89fd155b4ffc02d18ab3b7d19c2d4e246a7" or nil,
        cond = not vim.g.vscode,
        event = { "FileType", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        dependencies = {
            { "mason-org/mason.nvim" },
            { "mason-org/mason-lspconfig.nvim" },
            { "b0o/schemastore.nvim" },
            { "saghen/blink.cmp" },
        },
        config = function()
            require("plugins.lsp.attach")
            require("plugins.lsp.code-actions")
            require("plugins.lsp.diagnostic")
            require("plugins.lsp.server-register")
        end,
    },
    { import = "plugins.lsp.conform" },
    { import = "plugins.lsp.lazydev" },
    { import = "plugins.lsp.lspsaga" },
    { import = "plugins.lsp.tiny-code-action" },
    { import = "plugins.lsp.tiny-inline-diagnostic" },
}
