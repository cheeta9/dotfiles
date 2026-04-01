---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "neovim/nvim-lspconfig",
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
