-- glibcが古いマシン(Ubuntu 20.04など)ではnvim 0.11以降のバイナリが動かせないため、
-- そのnvimでのみ、nvim-0.11必須になる直前のコミットにピン留めする
-- (新しいnvimが使えるMacなどはそのまま最新を追従させる)
local is_old_nvim = vim.fn.has("nvim-0.11") == 0

return {
    {
        "nvim-telescope/telescope.nvim",
        commit = is_old_nvim and "5255aa27c422de944791318024167ad5d40aad20" or nil,
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
                extensions = {},
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
