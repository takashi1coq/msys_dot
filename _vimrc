"------------------デフォルト設定変更等------------------
"シンタックスハイライト
syntax enable
"ファイルタイプ検出
filetype plugin indent on

"------------------機能拡張------------------
" ヤンクの時にクリップボードにもセットする
set clipboard+=unnamed
" コマンドラインでの保管？
" set wildmode=longest:full,full

"------------------設定------------------
"行番号表示
set number
"編集中のファイル名表示
set title
"カーソル行に下線、ハイライト設定もできるとか http://rcmdnk.github.io/blog/2014/07/22/computer-vim/
set cursorline
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" タブとかもろもろハイライト
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<
" タブの入力をスペースに変換する
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 設定ファイルの作成先を指定
set directory=~/AppData/Local/Temp
set backupdir=~/AppData/Local/Temp
" アンドゥファイル
set undodir=~/AppData/Local/Temp
"エンコード設定
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
" ステータスラインを常に表示
set laststatus=2
" ステータスラインの内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ENC=%{&fileencoding}]\ [%{getcwd()}]\ [LOW=%l/%L]

"------------------キーマッピング------------------
" ノーマルモード時だけ ; と : を入れ替える
noremap ; :
noremap : ;
":help が q で閉じられるように
autocmd FileType help nnoremap <buffer> q <C-w>c
" コマンド履歴
nnoremap <sid>(command-line-enter) q:
nmap ;; <sid>(command-line-enter)
"新しいタブ
nnoremap <silent>tt :<C-u>$tabnew<Cr>
"現在のタブ以外全て閉じる
nnoremap <silent>to :<C-u>tabo<Cr>
" gf 新しいタブで開く
noremap gf <C-w>gf
" ウィンドウ切替
noremap <C-w> <C-w>w
" ウィンドウ回転
nnoremap <silent>s <C-w>H

"------------------オプション------------------
" エンコード 切り替えコマンド
command! Sjis set fileencoding=shift_jis
command! U8 set fileencoding=utf-8
" 末尾空白削除コマンド
command! EndSpaceDel :%s/\s\+$//ge
" ctr-v で最新レジスタ貼り付け 異端
noremap! <C-v> <C-r>*
noremap! <C-t> <C-v>

"%%入力で現在編集中のフォルダパスが展開されるようにする
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>
" aa で全選択とコピー
nmap <silent> aa ggVG$

" Rename ?
"command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
" Ctrl+h,lでタブ移動
nnoremap <silent> <c-l> gt
nnoremap <silent> <c-h> gT
" ハイライト解除
ret hlsearch
nnoremap <silent><ESC><ESC> :nohlsearch<CR>
" x削除でレジスタに格納しない
nnoremap x "_x
" ビジュアルモードで選択した部分を*で検索できる
vnoremap * "zy:let @/ = @z<CR>n
" 検索結果を真ん中
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
" Ctrl-p で連続コピー
vnoremap <silent> <C-p> "0p<CR>

"------------ コピーパスファンクション----------------
if exists("g:loaded_copypath")
    finish
endif
let g:loaded_copypath = 1

" if option is set then use open.
if !exists('g:copypath_copy_to_unnamed_register')
    let g:copypath_copy_to_unnamed_register = 0
endif

function CopyPath()
    let @*=expand('%:p')
    " copy unnamed register.
    if g:copypath_copy_to_unnamed_register
        let @"=expand('%:p')
    endif
endfunction

function CopyFileName()
    let @*=expand('%:t')
    " copy unnamed register.
    if g:copypath_copy_to_unnamed_register
        let @"=expand('%:t')
    endif
endfunction

command! -nargs=0 CopyPath     call CopyPath()
command! -nargs=0 CopyFileName call CopyFileName()
