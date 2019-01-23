" ! は同名上書き
function! DefxExplorer(dir)
    let l:cmd = join([
        \ 'Defx',
        \ '-buffer-name=myDefx',
        \ '-show-ignored-files',
        \ '-split=no',
        \ '-columns=git:mark:filename:type:time'
        \ ], ' ')
    $tabnew
    execute l:cmd. ' '. a:dir
endfunction

nnoremap <silent> <Space>f :call DefxExplorer("`expand('%:p:h')`")<CR>
nnoremap <silent> <Space>w :call DefxExplorer("~/work")<CR>

" filename sizeを指定
call defx#custom#column('filename', {
      \ 'min_width': 35,
      \ 'max_width': 35,
      \ })
