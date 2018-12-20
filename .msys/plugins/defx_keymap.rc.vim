" defx key mapping
nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> l defx#do_action('open', 'wincmd w \| drop'). '<C-w>w'
nnoremap <silent><buffer><expr> <CR> defx#do_action('open', 'wincmd w \| drop'). '<C-w>w'. ':<C-u>q<CR>'
nnoremap <silent><buffer><expr> <C-t> defx#do_action('open', 'tabnew')
nnoremap <silent><buffer><expr> N defx#do_action('new_file')
nnoremap <silent><buffer><expr> D defx#do_action('new_directory')
nnoremap <silent><buffer><expr> r defx#do_action('rename')
nnoremap <silent><buffer><expr> d defx#do_action('remove')
nnoremap <silent><buffer><expr> m defx#do_action('move')
nnoremap <silent><buffer><expr> p defx#do_action('paste')
nnoremap <silent><buffer><expr> <ESC><ESC> defx#do_action('quit')

nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
