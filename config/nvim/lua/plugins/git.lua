return {
    -- Gitのステータスをファイル左横に表示するやつ (旧 vim-gitgutter を gitsigns に一本化)
    -- barbar もこのプラグインをタブのgitステータス表示に使う
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            vim.opt.updatetime = 100
            local gs = require('gitsigns')
            gs.setup({
                on_attach = function(bufnr)
                    local function map(lhs, rhs, desc)
                        vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
                    end
                    -- hunk移動 (gitgutter の ]h / [h を踏襲)
                    map(']h', function() gs.nav_hunk('next') end, 'Next hunk')
                    map('[h', function() gs.nav_hunk('prev') end, 'Prev hunk')
                    -- hunk操作 (gitgutter の gh* を踏襲)
                    map('ghs', gs.stage_hunk, 'Stage hunk')
                    map('ghu', gs.reset_hunk, 'Reset hunk (作業変更を破棄)')
                    map('ghp', gs.preview_hunk, 'Preview hunk')
                    -- gitsigns で増えた便利機能
                    map('ghb', function() gs.blame_line({ full = true }) end, 'Blame line')
                    map('ghB', gs.toggle_current_line_blame, 'Toggle line blame')
                end,
            })
        end,
    },

    -- vim上でGit操作可能にするやつ
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<Leader>ga', ':G add %:p<CR><CR>')
            vim.keymap.set('n', '<Leader>gc', ':G commit<CR><CR>')
            vim.keymap.set('n', '<Leader>gs', ':G status<CR>')
            vim.keymap.set('n', '<Leader>gp', ':G push<CR>')
            vim.keymap.set('n', '<Leader>gd', ':G diff<CR>')
            vim.keymap.set('n', '<Leader>gl', ':G log<CR>')
            vim.keymap.set('n', '<Leader>glo', ':G log --oneline<CR>')
            vim.keymap.set('n', '<Leader>gb', ':G blame<CR>')
        end,
    },
}
