" copy path
if exists("g:loaded_copypath")
    finish
endif

let g:loaded_copypath = 1

" if option is set then use open.
if !exists('g:copypath_copy_to_unnamed_register')
    let g:copypath_copy_to_unnamed_register = 0
endif

function! CopyPath()
    let @+=expand('%:p')
    " copy unnamed register.
    if g:copypath_copy_to_unnamed_register
        let @"=expand('%:p')
    endif
endfunction

function! CopyFileName()
    let @+=expand('%:t')
    " copy unnamed register.
    if g:copypath_copy_to_unnamed_register
        let @"=expand('%:t')
    endif
endfunction

command! -nargs=0 CopyPath     call CopyPath()
command! -nargs=0 CopyFileName call CopyFileName()

" いらない空白削除コマンド
command! EndSpaceDel :%s/\s\+$//ge

" dein refresh
command! -nargs=0 DeinRefreshRuntimePath call dein#recache_runtimepath()

" debug用 EXコマンド結果出力 {{{
command!
    \ -nargs=+
    \ -complete=command
    \ Capture
    \ call s:cmd_capture([<f-args>])

function! s:cmd_capture(args)
    " バッファ名
    let bufname = 'Capture' . join(a:args)
    $tabnew
    silent put =C(join(a:args))
    " 削除用レジスタの1，2行目削除？
    1,2delete _
endfunction

function! C(cmd) "{{{
    redir => result
    silent execute a:cmd
    redir END
    return result
endfunction "}}}

" }}}

if has('vim_starting')
    " 再読込 {{{
    command!
        \ -nargs=0
        \ -complete=command
        \ Myvimrc
        \ call s:reload_myvimrc()

    function! s:reload_myvimrc()
        source $MYVIMRC
        call dein#recache_runtimepath()
    endfunction
    " }}}
endif

" --- tabline

" 各タブページのカレントバッファ名+αを表示
function! s:tabpage_label(n)
  " t:title と言う変数があったらそれを使う
  let title = gettabvar(a:n, 'title')
  if title !=# ''
    return title
  endif

  " タブページ内のバッファのリスト
  let bufnrs = tabpagebuflist(a:n)

  " カレントタブページかどうかでハイライトを切り替える
  let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

  " バッファが複数あったらバッファ数を表示
  let no = len(bufnrs)
  if no is 1
    let no = ''
  endif
  " タブページ内に変更ありのバッファがあったら '+' を付ける
  let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
  let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける

  " カレントバッファ
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
  let fname = fnamemodify(bufname(curbufnr), ':t')

  let label = ' '. no . mod . sp . fname. ' '

  return '%' . a:n . 'X' . hi . label . '%T%#TabLineFill#'
endfunction

function! MakeTabLine()
  let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
  let sep = '  '  " タブ間の区切り
  let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
  let info = expand('%:p:h')
  return tabpages . '%=' . info  " タブリストを左に、情報を右に表示
endfunction

" tabnew のコマンド化
command! Tabnew :$tabnew
