""" Common Setting """"
" Edit
set smartindent
set backspace=indent,eol,start                  "バックスペースで各種消せるよう
set virtualedit=block
" Views
set title                                       "ウインドウのタイトルバーにファイルのパス情報等を表示する
set number                                      "行番号を表示する
set cursorline                                  "カーソル行をハイライト
" Tab default
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smarttab
set fileencoding=utf-8
set ambiwidth=double
" Controls
set whichwrap=b,s,h,l,<,>,[,]                   "カーソル行を行頭、行末で止まらないように
set mouse=a                                     "マウスモード有効
" Search
set ignorecase                                  "大文字と小文字を区別しない
set smartcase                                   "大文字を含めた検索はその通りに検索する
set incsearch                                   "インクリメンタルサーチを行う
set hlsearch                                    "検索結果をハイライト表示する
set wrapscan                                    "循環検索オン
set infercase                                   "補完の際大文字小文字を区別しない
" Other
set wildmenu                                    "ナビゲーションバーを有効に
set tw=0                                        "自動改行オフ
set clipboard=unnamed,unnamedplus               "クリップボードをWindowsと連携する
set hidden                                      "変更中のでも保存せずで他のファイルを表示
set switchbuf=useopen                           "新しく開く代りに既に開いているバッファを
set vb t_vb=                                    "ビープ音を消す
set novisualbell
set nostartofline                               "移動コマンドを使った時行頭に移動しない
set matchpairs& matchpairs+=<:>                 "<>を対応括弧ペアに
set matchtime=3                                 "対応括弧表示を3秒に
set wrap                                        "ウィンドウより長い行は折り畳む
set textwidth=0                                 "テキストの最大幅を無効に
set shiftround                                  "インデントをshiftwidthの倍数に
set history=10000                               "コマンド、検索の履歴を１万個まで
set noswapfile                                  "スワップファイルを作成しない

""" Keymaps """"
nnoremap ; :
nnoremap s <Nop>
nnoremap <silent>sh     <C-w>h
nnoremap <silent>sj     <C-w>j
nnoremap <silent>sk     <C-w>k
nnoremap <silent>sl     <C-w>l
nnoremap <silent>sH     <C-w>H
nnoremap <silent>sJ     <C-w>J
nnoremap <silent>sK     <C-w>K
nnoremap <silent>sL     <C-w>L
nnoremap <silent><C-\>  :vsplit<CR>
nnoremap <silent><C-_>  :split<CR>
nnoremap <silent><C-h>  :bprev<CR>
nnoremap <silent><C-l>  :bnext<CR>
nnoremap <silent><C-w>  :bdelete<CR>
nnoremap <silent><C-a>  ^
nnoremap <silent><C-e>  $
inoremap <silent>jj     <ESC>
"Delete Highlight y Esc twice
nnoremap <silent><ESC><ESC> :nohl<CR>

""" Leader settings """"
let mapleader = "\<SPACE>"
nnoremap <Leader>a ggVG
noremap  <Leader>h ^
noremap  <Leader>l $
noremap  <Leader>m %
nnoremap <Leader>R :%s/<C-r><C-w>//g<LEFT><LEFT>

""" Visualize Tab, Space, Emptyline """
set list
set listchars=tab:>.,trail:･,extends:>,precedes:<,nbsp:%
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

""" dein.vim """
set runtimepath+=$XDG_DATA_HOME/dein/repos/github.com/Shougo/dein.vim

if dein#load_state($XDG_DATA_HOME . '/dein')
    call dein#begin($XDG_DATA_HOME . '/dein')

    call dein#load_toml($XDG_CONFIG_HOME . '/nvim/dein.toml', {'lazy': 0})
    call dein#load_toml($XDG_CONFIG_HOME . '/nvim/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

""" Highlight settings """
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi Folded ctermbg=none
hi EndOfBuffer ctermbg=none
hi CursorLineNr ctermbg=4 ctermfg=0
hi clear CursorLine

