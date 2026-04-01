return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "codedark",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { { "filename", path = 1 } },
                lualine_b = { "branch" },
                lualine_c = {
                    "'%='",
                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                        separator = "  |  ",
                    },
                    {
                        "diagnostics",
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    },
                },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
        })
    end,
}
