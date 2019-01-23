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
nnoremap <silent> <Space>u :<C-u>Denite file_rec<CR>
" vim config list
nnoremap <silent> <Space>v :<C-u>Denite file_rec:~/msys_dot<CR>

" ---keymap---
" list move
call denite#custom#map('insert', '<C-j>','<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>','<denite:move_to_previous_line>', 'noremap')
" new tab open
call denite#custom#map('insert', '<C-t>','<denite:do_action:my_tabopen>', 'noremap')
call denite#custom#action('file_rec', 'my_tabopen', 'MyTabOpenDenite', {'is_quit' : v:true})
function! MyTabOpenDenite(context) abort
    let s:target = a:context['targets'][0]
    let path = target['action__path']

    if filereadable(path)
        silent execute ':$tabnew '.path
    endif
endfunction

" toggle_select
call denite#custom#map('insert', '<C-n>', '<denite:toggle_select>')
call denite#custom#map('insert', '<C-a>', '<denite:toggle_select_all>')


" ---denite-git---
command! Gitstatus Denite gitstatus
