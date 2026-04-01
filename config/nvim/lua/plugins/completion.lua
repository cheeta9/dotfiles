return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            keymap = {
                preset = "enter",
                ["<C-Tab>"] = { "show", "show_documentation", "hide_documentation" },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = { documentation = { auto_show = true } },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                markdown = { "lsp", "path", "snippets" },
                mdx = { "lsp", "path", "snippets" },
            },
            fuzzy = {
                -- versionを指定してないとバイナリが特定できずLuaにfallbackするwarningが表示される
                implementation = "prefer_rust_with_warning",
            },
        },
        opts_extend = { "sources.default" },
    },
}
