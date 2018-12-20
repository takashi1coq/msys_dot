" ! は同名上書き
function! DefxExplorer(dir)
    let l:cmd = join([
        \ 'Defx',
        \ '-buffer-name=myDefx',
        \ '-show-ignored-files',
        \ '-split=vertical',
        \ '-columns=git:mark:filename:type:time:size'
        \ ], ' ')
    execute l:cmd. ' '. a:dir
endfunction

nnoremap <silent> <Space>f :call DefxExplorer("`expand('%:p:h')`")<CR>
nnoremap <silent> <Space>w :call DefxExplorer("~/work")<CR>
