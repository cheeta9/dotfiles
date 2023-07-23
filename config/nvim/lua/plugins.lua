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

  -- ファイラー
  use {
    'lambdalisue/fern.vim',
    'lambdalisue/nerdfont.vim',
    'lambdalisue/fern-renderer-nerdfont.vim',
    'lambdalisue/glyph-palette.vim'
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  -- 補完
  use {
    'hrsh7th/nvim-cmp',      --補完エンジン本体
    'hrsh7th/cmp-nvim-lsp',  --LSPを補完ソースに
    'hrsh7th/cmp-buffer',    --bufferを補完ソースに
    'hrsh7th/cmp-path',      --pathを補完ソースに
    'hrsh7th/vim-vsnip',     --スニペットエンジン
    'hrsh7th/cmp-vsnip',     --スニペットを補完ソースに
    'onsails/lspkind.nvim'   --補完欄にアイコンを表示
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
  }

  -- Gitのステータスをファイル左横に表示するやつ
  use 'airblade/vim-gitgutter'
  -- vim上でGit操作可能にするやつ
  use 'tpope/vim-fugitive'
  -- フォーカス移動を自由自在にするやつ
  use 'easymotion/vim-easymotion'
  -- yank範囲をハイライトするやつ
  use 'machakann/vim-highlightedyank'
  -- アイコンを提供するやつ
  use 'kyazdani42/nvim-web-devicons'
  -- タブ操作を簡単にするやつ
  use 'romgrk/barbar.nvim'
  -- 「閉じ」文字を補完するやつ
  use 'cohama/lexima.vim'
  -- 「囲み」文字を簡単に操作するやつ
  use 'tpope/vim-surround'
  -- 縦スクロールバーを表示するやつ
  use 'dstein64/nvim-scrollview'

  -- 選択範囲を段階的に広げるやつ
  use {
    'terryma/vim-expand-region',
    config = function()
      vim.keymap.set('', 'v', '<Plug>(expand_region_expand)')
      vim.keymap.set('', 'V', '<Plug>(expand_region_shrink)')
    end
  }
  -- JSONを扱いやすくするやつ
  use {
    'elzr/vim-json',
    config = function()
      vim.opt.conceallevel = 2
      vim.opt.concealcursor = 'niv'
      vim.g.vim_json_syntax_conceal = 0
    end
  }
  -- コメントアウト・解除を簡単にするやつ
  use {
    'preservim/nerdcommenter',
    config = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDCompactSexyComs = 1
      vim.g.NERDDefaultAlign = 'left'
      vim.keymap.set('n', '<C-c>', '<Plug>NERDCommenterToggle')
      vim.keymap.set('v', '<C-c>', '<Plug>NERDCommenterToggle<CR>gv')
    end
  }

  use { 'wbthomason/packer.nvim', opt = true }
end)

