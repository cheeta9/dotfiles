vim.cmd.packadd 'packer.nvim'

require('packer').startup(function()
  -- colorscheme
  use {
    'morhetz/gruvbox',
    config = function()
      vim.cmd.colorscheme("gruvbox")
      -- highlight settings
      vim.cmd [[
        hi Normal ctermbg=none
        hi NonText ctermbg=none
        hi LineNr ctermbg=none
        hi Folded ctermbg=none
        hi EndOfBuffer ctermbg=none
        hi CursorLineNr ctermbg=5 ctermfg=255
        hi clear CursorLine
      ]]
    end
  }
  -- airline
  use 'vim-airline/vim-airline'
  use {
    'vim-airline/vim-airline-themes',
    config = function()
      vim.g.airline_theme = 'gruvbox'
    end
  }

  -- Gitのステータスをファイル左横に表示するやつ
  use {
    'airblade/vim-gitgutter',
    config = function()
      vim.opt.updatetime = 100
      vim.keymap.set('n', ']h', '<Plug>(GitGutterNextHunk)')
      vim.keymap.set('n', '[h', '<Plug>(GitGutterPrevHunk)')
      vim.keymap.set('n', 'ghs', '<Plug>(GitGutterStageHunk)')
      vim.keymap.set('n', 'ghu', '<Plug>(GitGutterUndoHunk)')
      vim.keymap.set('n', 'ghp', '<Plug>(GitGutterPreviewHunk)')
    end
  }

  -- vim上でGit操作可能にするやつ
  use {
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
    end
  }

  use { 'wbthomason/packer.nvim', opt = true }
end)

