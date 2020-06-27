let g:coc_global_extensions = ['coc-highlight', 'coc-python', 'coc-cmake', 'coc-pyright', 'coc-snippets']

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd          <Plug>(coc-definition)
nmap <silent> gy          <Plug>(coc-type-definition)
nmap <silent> gi          <Plug>(coc-implementation)
nmap <silent> gr          <Plug>(coc-references)
nmap <silent> rn          <Plug>(coc-rename)
nmap <silent> <leader>qf  <Plug>(coc-fix-current)
nmap <silent> <leader>ac  <Plug>(coc-codeaction)
nmap <silent> <leader>c      :<C-u>CocList commands<cr>
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

command! -nargs=0 Format :call CocAction('format')
