" set modifiable
setlocal nofoldenable

" defx key mapping
nnoremap <silent><buffer><expr> l defx#async_action('open')
nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
