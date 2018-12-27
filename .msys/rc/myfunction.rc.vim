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

" debug用 コマンド結果出力 {{{
command!
    \ -nargs=+
    \ -complete=command
    \ Capture
    \ call s:cmd_capture([<f-args>])

function! s:cmd_capture(args)
    " バッファ名
    let bufname = 'Capture' . join(a:args)
    tabnew
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
