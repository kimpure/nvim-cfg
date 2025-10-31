set formatoptions-=o
set formatoptions-=r

" Runtime to code
nnoremap <buffer><silent> <F5> <cmd>!lune run %<CR>

" Format code
nnoremap <buffer><silent> <space>f <cmd>silent !stylua %<CR>

