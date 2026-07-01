return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- JS/TS 系は各リポジトリの .prettierrc を尊重して prettier で整形
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                jsonc = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
                -- ubiregi-server 用（.rubocop.yml を尊重）
                ruby = { "rubocop" },
            },
            format_on_save = function(bufnr)
                -- :FormatDisable / :FormatDisable! / 環境変数で無効化できる
                if
                    vim.g.disable_autoformat
                    or vim.b[bufnr].disable_autoformat
                    or os.getenv("FORMATTER_DISABLE") == "1"
                then
                    return
                end
                -- prettier/rubocop は 500ms だと間に合わないことがあるので余裕を持たせる
                return { timeout_ms = 1500, lsp_format = "fallback" }
            end,
        })

        -- 保存時フォーマットの ON/OFF（旧 format.lua から移植）
        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                vim.b.disable_autoformat = true -- このバッファだけ無効
            else
                vim.g.disable_autoformat = true -- 全体で無効
            end
        end, { desc = "Disable autoformat-on-save", bang = true })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, { desc = "Re-enable autoformat-on-save" })
    end,
}
