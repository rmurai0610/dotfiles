inoremap jk <ESC>

nnoremap <c-S-f> mzgg=G`z
nnoremap <Enter> o<ESC>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-\> <C-W>v
nnoremap ; :
nnoremap <Leader>w :w<CR>
nnoremap <C-n> :Lexplore<CR>

nnoremap <silent> <C-Space><C-h> :vertical res -5<CR>
nnoremap <silent> <C-Space><C-j> :res +5<CR>
nnoremap <silent> <C-Space><C-k> :res -5<CR>
nnoremap <silent> <C-Space><C-l> :vertical res +5<CR>

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

tnoremap jk <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
