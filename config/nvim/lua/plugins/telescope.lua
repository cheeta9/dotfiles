return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_strategy = "vertical",
                    file_ignore_patterns = { "^.git/", "^node_modules/" },
                    mappings = {
                        i = {},
                        n = {},
                    },
                },
                pickers = {},
                extentions = {},
            })

            -- key mappings
            local map = vim.keymap.set
            map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
            map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
            map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
            map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
            map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
        end,
    },
}
