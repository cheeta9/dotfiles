vim.cmd.packadd 'packer.nvim'

require('packer').startup(function()
  -- colorscheme
  use 'morhetz/gruvbox'
  -- airline
  use 'vim-airline/vim-airline'
  use {
    'vim-airline/vim-airline-themes',
    config = function() vim.g.airline_theme = 'gruvbox' end
  }

  -- Gitのステータスをファイル左横に表示するやつ
  use 'airblade/vim-gitgutter'
  -- vim上でGit操作可能にするやつ
  use 'tpope/vim-fugitive'

  use { 'wbthomason/packer.nvim', opt = true }
end)

