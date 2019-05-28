" ---grep---
" grep
nnoremap <silent> <Space>g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
" visual grep
vnoremap <silent> <Space>g :<C-u>DeniteCursorWord grep -buffer-name=search-buffer-denite<CR>
" grep buffer replay
nnoremap <silent> <Space>r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
" grep list jump
nnoremap <silent> <C-n> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
nnoremap <silent> <C-b> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>

" ---list---
" current list
nnoremap <silent> <Space>u :<C-u>Denite file_rec -default-action=left_tabopen<CR>
" buffer list
nnoremap <silent> <Space>b :<C-u>Denite buffer -default-action=left_tabopen<CR>
" vim config list
nnoremap <silent> <Space>v :<C-u>Denite file_rec:~/msys_dot -default-action=left_tabopen<CR>
" mark list
nnoremap <silent> <Space>m :<C-u>Denite mark -default-action=left_tabopen<CR>

" ---keymap---
" list move
call denite#custom#map('insert', '<C-j>','<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>','<denite:move_to_previous_line>', 'noremap')

" new tab open
function! LeftDeniteTabOpen(context) abort
    let l:mylist = []
    for target in a:context['targets']
        let l:path = target['action__path']
        if filereadable(expand(l:path))
            call add(l:mylist, l:path)
        endif
        let l:str = join(l:mylist, ' ')
        silent execute ':MyTabNew 0 '. l:str
endfunction
call denite#custom#action('file,buffer,mark,menu',
                        \ 'left_tabopen',
                        \ 'LeftDeniteTabOpen', {'is_quit' : 'v:true'})
function! RightDeniteTabOpen(context) abort
    let l:mylist = []
    for target in a:context['targets']
        let l:path = target['action__path']
        if filereadable(expand(l:path))
            call add(l:mylist, l:path)
        endif
        let l:str = join(l:mylist, ' ')
        silent execute ':MyTabNew $ '. l:str
endfunction
call denite#custom#action('file,buffer,mark,menu',
                        \ 'left_tabopen',
                        \ 'LeftDeniteTabOpen', {'is_quit' : 'v:true'})
" new tab open keymap
call denite#custom#map('insert', '<C-t>','<denite:do_action:left_tabopen>', 'noremap')

" toggle_select
call denite#custom#map('insert', '<C-n>', '<denite:toggle_select>')
call denite#custom#map('insert', '<C-a>', '<denite:toggle_select_all>')


" ---denite-git---
command! Gitstatus Denite gitstatus
