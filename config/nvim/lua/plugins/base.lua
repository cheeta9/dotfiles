return {
    -- Neovim専用のluaライブラリ
    { "nvim-lua/plenary.nvim" },
    -- yank範囲をハイライトするやつ
    { "machakann/vim-highlightedyank" },
    -- 「閉じ」文字を補完するやつ
    { "cohama/lexima.vim" },
    -- 「囲み」文字を簡単に操作するやつ
    { "tpope/vim-surround" },
    -- 縦スクロールバーを表示するやつ
    { "dstein64/nvim-scrollview" },

    -- インデント表示するやつ
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = { enable = false },
                indent = { enable = true },
            })
        end,
    },

    -- コメントアウト・解除を簡単にするやつ
    {
        "preservim/nerdcommenter",
        config = function()
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDCompactSexyComs = 1
            vim.g.NERDDefaultAlign = "left"
            vim.keymap.set("n", "<C-c>", "<Plug>NERDCommenterToggle")
            vim.keymap.set("v", "<C-c>", "<Plug>NERDCommenterToggle<CR>gv")
        end,
    },

    -- 標準のインクリメント機能を拡張するやつ
    {
        "monaqa/dial.nvim",
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group({
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.constant.alias.bool,
                    augend.date.alias["%Y/%m/%d"],
                    augend.date.alias["%Y-%m-%d"],
                    augend.date.alias["%H:%M"],
                    augend.date.alias["%Y年%-m月%-d日"],
                    augend.date.alias["%Y年%-m月%-d日(%ja)"],
                    augend.constant.alias.ja_weekday,
                    augend.constant.alias.ja_weekday_full,
                },
            })
        end,
        keys = {
            {
                "<C-a>",
                function()
                    require("dial.map").manipulate("increment", "normal")
                end,
                mode = "n",
                desc = "dial increment",
            },
            {
                "<C-x>",
                function()
                    require("dial.map").manipulate("decrement", "normal")
                end,
                mode = "n",
                desc = "dial decrement",
            },
            {
                "<C-a>",
                function()
                    require("dial.map").manipulate("increment", "visual")
                end,
                mode = "v",
                desc = "dial increment",
            },
            {
                "<C-x>",
                function()
                    require("dial.map").manipulate("decrement", "visual")
                end,
                mode = "v",
                desc = "dial decrement",
            },
        },
    },

    -- JSONを扱いやすくするやつ
    {
        "elzr/vim-json",
        config = function()
            vim.opt.conceallevel = 2
            vim.opt.concealcursor = "niv"
            vim.g.vim_json_syntax_conceal = 0
        end,
    },

    -- キーバインドのナビゲーション
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}
