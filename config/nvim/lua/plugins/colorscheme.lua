return {
    -- colorscheme
    {
        'AlexvZyl/nordic.nvim',
        config = function()
            -- colorscheme apply
            vim.cmd('colorscheme nordic')

            -- transparent background
            vim.cmd([[
                hi Normal guibg=NONE ctermbg=NONE
                hi NormalNC guibg=NONE ctermbg=NONE
                hi NonText guibg=NONE ctermbg=NONE
                hi LineNr guibg=NONE ctermbg=NONE
                hi Folded guibg=NONE ctermbg=NONE
                hi EndOfBuffer guibg=NONE ctermbg=NONE
                hi SignColumn guibg=NONE ctermbg=NONE

                "hi NormalFloat guibg=NONE
                "hi FloatBorder guibg=NONE
                "hi TelescopeNormal ctermbg=0

                hi clear CursorLine
                hi CursorLineNr guibg=NONE
            ]])
        end,
    },
    { 'antharuu/BubbleGum' },
}
