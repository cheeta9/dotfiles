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
  use 'tpope/vim-fugitive'

  use { 'wbthomason/packer.nvim', opt = true }
end)

