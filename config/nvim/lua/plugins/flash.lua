return {
    -- フォーカス移動を自由自在にするやつ (easymotionの後継)
    {
        "folke/flash.nvim",
        event = "VeryLazy", -- f/t 強化を起動直後から効かせるため先読み
        ---@type Flash.Config
        opts = {},
        -- NOTE: `s` はウィンドウ操作プレフィックス(base.lua)で使うため、
        --       flashのジャンプは <leader>s 系に逃がしている。
        keys = {
            {
                "<leader>s",
                mode = { "n", "x", "o" },
                function() require("flash").jump() end,
                desc = "Flash jump",
            },
            {
                "<leader>S",
                mode = { "n", "x", "o" },
                function() require("flash").treesitter() end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc = "Toggle Flash Search",
            },
        },
    },
}
