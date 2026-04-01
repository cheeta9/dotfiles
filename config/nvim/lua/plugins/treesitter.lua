return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
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
                prev_selectio = ",",
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
