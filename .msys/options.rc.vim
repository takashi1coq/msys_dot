" 行番号
set number
" スワップファイルを作成しない
set noswapfile
" 折り返さない
set nowrap
" undoFileを/tmpに作成
set undofile
set undodir=/tmp
" 大文字小文字を区別しない
set ignorecase
"エンコーディング
set fileencodings=utf-8,euc-jp,ucs-bom,iso-2022-jp,sjis,cp932,latin1
" ステータスラインを常に表示
set laststatus=2
" ステータスラインの内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ENC=%{&fileencoding}]\ [%{getcwd()}]\ [LOW=%l/%L]

"タブもろもろ可視化
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<
"タブをスベース4
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" カーソル行をハイライト
set cursorline
" x削除でレジスタに格納しない
nnoremap x "_x

"ターミナル以外はバッファ開いたらパスをチェンジ
au BufEnter * if &buftype !=# 'terminal' | execute 'lcd ' fnameescape(expand('%:p:h')) | endif

" 標準カラースキームを使用
colorscheme desert

" ------関連性が高いのでこちらに記載vim用------
" クリップボード共有
set clipboard+=unnamed
"C-vで最新レジスタ貼り付け
noremap! <C-v> <C-r>*


" ------filetypeの存在しないものを追加する------
"au BufNewFile,BufRead *.toml setf conf


" ------msys特殊対応------
" bs効かない問題
set backspace=indent,eol,start
" カーソルの見た目を変更
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

"" terminal特殊設定
"
"" terminalならfiletype=terminal
"function! s:bufnew()
"    if &buftype == "terminal" && &filetype == ""
"        set filetype=terminal
"    endif
"endfunction
"
"" terminal固有設定
"function! s:filetype()
"   set modifiable
"   set write
"endfunction
"
"augroup my-terminal
"    autocmd!
"   " BufNew の時点では 'buftype' が設定されていないので timer イベントでごまかすなど…
"    autocmd BufNew * call timer_start(0, { -> s:bufnew() })
"    autocmd FileType terminal call s:filetype()
"augroup END

