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
nnoremap tt :<C-u>$tabnew<Cr>
"windowごとタブを閉じる
nnoremap tq :<C-u>tabc<Cr>
"アクティブ以外閉じるをto
nnoremap to :<C-u>tabo<Cr>
"gfで新しいタブで開く
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
" terminal jjでノーマルモード
tnoremap <silent> <ESC> <C-\><C-n>
command! -nargs=* Terminal $tabnew | term ++curwin <args>
" Escをjj
inoremap jj <ESC>
" 再読み込み
nnoremap <silent> <F2> :Myvimrc<CR>
" コード入力モード
noremap! <C-t> <C-v>
" バッファの移動
nnoremap <silent> <C-j> :silent bprev<CR>
nnoremap <silent> <C-k> :silent bnext<CR>
" 日本語訳 ※ https://github.com/soimort/translate-shell/
vnoremap <silent> <C-g> :w !trans -b -sl=en -tl=ja -x $MYPROXY<CR>
"<F9>,<F10>,でタブそのものを移動
nnoremap <silent> <F9> :<C-u>tabm -1<CR>
nnoremap <silent> <F10> :<C-u>tabm +1<CR>
" mark
nnoremap <F7> mF
nnoremap <F8> 'F
" qで閉じる
nnoremap q <C-w>c
