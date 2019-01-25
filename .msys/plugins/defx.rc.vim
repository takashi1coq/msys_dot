" file path now
function! DefxNowExplorer(dir)
call defx#custom#column('filename', {
      \ 'min_width': 35,
      \ 'max_width': 35,
      \ })
    let l:cmd = join([
        \ 'Defx',
        \ '-buffer-name=myDefx',
        \ '-show-ignored-files',
        \ '-split=vertical',
        \ '-columns=git:mark:filename:type:time'
        \ ], ' ')
    execute l:cmd. ' '. a:dir
endfunction

" workFolder
function! DefxWorkExplorer(dir)
call defx#custom#column('filename', {
      \ 'min_width': 50,
      \ 'max_width': 50,
      \ })
    let l:cmd = join([
        \ 'Defx',
        \ '-buffer-name=myDefx',
        \ '-show-ignored-files',
        \ '-columns=git:mark:filename:type:time'
        \ ], ' ')
    if expand('%:p') !=# ''
        $tabnew
    endif
    execute l:cmd. ' '. a:dir
endfunction

nnoremap <silent> <Space>f :call DefxNowExplorer("`expand('%:p:h')`")<CR>
nnoremap <silent> <Space>w :call DefxWorkExplorer("~/work")<CR>
