imap <silent><C-k>     <Plug>(neosnippet_jump_or_expand)
smap <silent><C-k>     <Plug>(neosnippet_jump_or_expand)
xmap <silent><C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#enable_completed_snippet = 0
let g:neosnippet#expand_word_boundary = 1
autocmd MyAutoCmd CompleteDone * call neosnippet#complete_done()
