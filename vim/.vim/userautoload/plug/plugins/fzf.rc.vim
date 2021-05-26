nnoremap <C-f>                 :Files<CR>
nnoremap <C-g>                 :GFiles<CR>
nnoremap <C-b>                 :Buffers<CR>
nnoremap <Leader>g             :Rg<CR>
nnoremap <Leader><Leader>      :CocFzfList<CR>
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
