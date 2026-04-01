return {
    -- タブ操作を簡単にするやつ
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        -- version = '^1.0.0', -- optional: only update when a new 1.x version is released
        config = function(_, opts)
            require('barbar').setup(opts)

            vim.keymap.set('n', '<Leader>h', '<Cmd>BufferPrevious<CR>')
            vim.keymap.set('n', '<Leader>l', '<Cmd>BufferNext<CR>')
            vim.keymap.set('n', '<Leader>q', '<Cmd>BufferClose<CR>')
            vim.keymap.set('n', '<C-h>', '<Cmd>BufferMovePrevious<CR>')
            vim.keymap.set('n', '<C-l>', '<Cmd>BufferMoveNext<CR>')
            vim.keymap.set('n', '<Leader>;', '<Cmd>BufferGoto 1<CR>')
            vim.keymap.set('n', '<Leader>1', '<Cmd>BufferGoto 1<CR>')
            vim.keymap.set('n', '<Leader>2', '<Cmd>BufferGoto 2<CR>')
            vim.keymap.set('n', '<Leader>3', '<Cmd>BufferGoto 3<CR>')
            vim.keymap.set('n', '<Leader>4', '<Cmd>BufferGoto 4<CR>')
            vim.keymap.set('n', '<Leader>5', '<Cmd>BufferGoto 5<CR>')
            vim.keymap.set('n', '<Leader>6', '<Cmd>BufferGoto 6<CR>')
            vim.keymap.set('n', '<Leader>7', '<Cmd>BufferGoto 7<CR>')
            vim.keymap.set('n', '<Leader>8', '<Cmd>BufferGoto 8<CR>')
            vim.keymap.set('n', '<Leader>9', '<Cmd>BufferGoto 9<CR>')
            vim.keymap.set('n', "<Leader>'", '<Cmd>BufferLast<CR>')
            vim.keymap.set('n', '<Leader>p', '<Cmd>BufferPickDelete<CR>')
            vim.keymap.set('n', '<Leader>r', '<Cmd>BufferRestore<CR>')
            vim.keymap.set('n', '<Leader>P', '<Cmd>BufferPin<CR>')
            vim.keymap.set('n', '<Leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>')
            vim.keymap.set('n', '<Leader>bd', '<Cmd>BufferOrderByDirectory<CR>')
            vim.keymap.set('n', '<Leader>bl', '<Cmd>BufferOrderByLanguage<CR>')
            vim.keymap.set('n', '<Leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>')
        end,
    }
}
