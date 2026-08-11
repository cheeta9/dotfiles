-- glibcが古いマシンでは新しいnvimが使えず、nvim-treesitterのmainブランチ(新API)は
-- この設定(旧configs API)と非互換のため、そのnvimでのみ旧APIを維持しているmaster
-- ブランチに固定する(新しいnvimが使えるMacなどはそのままmainを追従させる)
local is_old_nvim = vim.fn.has("nvim-0.11") == 0

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = is_old_nvim and 'master' or nil,
        build = ':TSUpdate',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects', branch = is_old_nvim and 'master' or nil },
        },
        main = 'nvim-treesitter.configs',
        opts = {
            highlight = {
                enable = true,
                disable = {},
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                },
                move = { enable = true },
                swap = { enable = true },
            },
        },
    },

    -- コード文脈に沿って選択範囲を拡大するやつ
    {
        'RRethy/nvim-treesitter-textsubjects',
        config = function()
            require("nvim-treesitter-textsubjects").configure({
                prev_selection = ",",
                keymaps = {
                    ["."] = "textsubjects-smart",
                    ["<CR>"] = "textsubjects-container-outer",
                    ["i<CR>"] = "textsubjects-container-inner",
                },
            })
        end,
    },

    -- 一行⇔複数行の展開をやるやつ
    {
        "Wansmer/treesj",
        keys = {
            { "<Leader>j", "<cmd>TSJToggle<cr>", desc = "treesj Toggle split join" },
        },
        opts = { use_default_keymaps = false, max_join_length = 1500 },
    },
}
