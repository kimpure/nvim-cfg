set formatoptions-=o
set formatoptions-=r

" Runtime to code
nnoremap <buffer><silent> <F5> :luafile %<CR>

" Format code
nnoremap <buffer><silent> <space>f <cmd>silent !stylua %<CR>

