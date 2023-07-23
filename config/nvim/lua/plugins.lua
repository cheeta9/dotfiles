vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
  -- 起動時に読み込むプラグイン
  use "tpope/vim-fugitive"

  -- 遅延読み込みのプラグイン
  use { "wbthomason/packer.nvim", opt = true }
end)

