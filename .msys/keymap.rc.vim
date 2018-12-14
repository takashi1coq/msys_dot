"ノーマルモード時のみ;と:を入れ替える
nnoremap ; :
nnoremap : ;
"コマンド履歴
nnoremap <sid>(command-line-enter) q:
nmap ;; <sid>(command-line-enter)
autocmd FileType vim nnoremap <buffer> q <C-w>c
"helpもqで閉じられるように
autocmd FileType help nnoremap <buffer> q <C-w>c
"ウィドウ間の移動をwとする
nnoremap <C-w> <C-w>w
"新しいタブをtt
nnoremap tt :<C-u>tabnew<Cr>
"アクティブ以外閉じるをto
nnoremap to :<C-u>tabo<Cr>
"gfを必ず新しいタブで開く
nnoremap gf <C-w>gf
"aaで全選択
nmap <silent> aa ggVG$
"C-l,C-h,でタブ移動
nnoremap <silent> <c-l> gt
nnoremap <silent> <c-h> gT
"esc2回でハイライト解除
set hlsearch
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
" ビジュアルモードで選択した部分を*で検索できる
vnoremap * "zy:let @/ = @z<CR>n
" 検索結果を真ん中
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
" Ctrl-p で差し替え後も連続コピー
vnoremap <silent> <C-p> "0p<CR>
" terminal escでノーマルモード
tnoremap jj <C-\><C-n>
" Escをjj
inoremap jj <ESC>
" 再読み込み
nnoremap <silent> <F2> :source $MYVIMRC<CR>
" コード入力モード
noremap! <C-t> <C-v>
" バッファの移動
nnoremap <silent> <C-j> :silent bprev<CR>
nnoremap <silent> <C-k> :silent bnext<CR>
