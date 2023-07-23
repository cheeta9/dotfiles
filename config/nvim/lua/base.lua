vim.cmd('autocmd!')

vim.opt.ambiwidth = 'double'
vim.opt.backspace = 'indent,eol,start'      -- バックスペースで各種消せるようにする
vim.opt.clipboard = 'unnamed,unnamedplus'   -- クリップボードをシステムと連携する
vim.opt.fileencoding = 'utf-8'
vim.opt.history = 10000                     -- コマンド、検索の履歴を1万個まで
vim.opt.matchtime = 3                       -- 対応括弧表示を3秒にする
vim.opt.mouse = 'a'                         -- マウスモード有効
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.switchbuf = 'useopen'              -- 新しく開く代わりに既に開いているバッファを使う
vim.opt.tabstop = 2
vim.opt.textwidth = 0                       -- テキストの最大幅を無効にする
vim.opt.tw = 0                              -- 自動改行オフ
vim.opt.virtualedit = 'block'
vim.opt.whichwrap = 'b,s,h,l,<,>,[,]'

vim.opt.autoindent = true
vim.opt.cursorline = true                   -- カーソル行をハイライトする
vim.opt.expandtab = true
vim.opt.hlsearch = true                     -- 検索結果をハイライト表示する
vim.opt.hidden = true                       -- 変更中でも保存せず他のファイルを表示する
vim.opt.ignorecase = true                   -- 大文字と小文字を区別しない
vim.opt.incsearch = true                    -- インクリメンタルサーチする
vim.opt.infercase = true                    -- 補完のときに大文字と小文字を区別しない
vim.opt.number = true                       -- 行番号を表示する
vim.opt.shiftround = true                   -- インデントをshiftwidthの倍数にする
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.smartcase = true                    -- 大文字を含めた検索はその通りに検索する
vim.opt.startofline = false                 -- 移動コマンドを使ったとき行頭に移動しない
vim.opt.swapfile = false                    -- スワップファイルを作成しない
vim.opt.title = true                        -- ウィンドウのタイトルバーにファイルパス情報等を表示する
vim.opt.visualbell = false
vim.opt.wildmenu = true                     -- ナビゲーションバーを表示する
vim.opt.wrap = true                         -- ウィンドウより長い行は折りたたむ
vim.opt.wrapscan = true                     -- 循環検索する

-- Keymaps
local keymap = vim.keymap
keymap.set('', '<C-a>', '^', { silent = true })
keymap.set('', '<C-e>', '$', { silent = true })
keymap.set('n', ';', ':')
keymap.set('n', 'sh', '<C-w>h', { silent = true })
keymap.set('n', 'sj', '<C-w>j', { silent = true })
keymap.set('n', 'sk', '<C-w>k', { silent = true })
keymap.set('n', 'sl', '<C-w>l', { silent = true })
keymap.set('n', 'sH', '<C-w>H', { silent = true })
keymap.set('n', 'sJ', '<C-w>J', { silent = true })
keymap.set('n', 'sK', '<C-w>K', { silent = true })
keymap.set('n', 'sL', '<C-w>L', { silent = true })
keymap.set('n', [[<C-\>]], ':vsplit<CR>', { silent = true })
keymap.set('n', '<C-_>', ':split<CR>', { silent = true })
keymap.set('n', '<ESC><ESC>', ':nohl<CR>', { silent = true })
keymap.set('i', 'jj', '<ESC>')

-- Leder settings
vim.g.mapleader = ' '
keymap.set('', '<Leader>m', '%')
keymap.set('n', '<Leader>a', 'ggVG')
keymap.set('n', '<Leader>R', ':%s/<C-r><C-w>//g<LEFT><LEFT>')

