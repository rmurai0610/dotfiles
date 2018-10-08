set hidden
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ 'python': ['pyls'],
    \ 'html': ['html-languageserver', '--stdio'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'vue': ['vls'],
    \ }
let g:LanguageClient_autoStart = 1
" Let Ale perform the linting
let g:LanguageClient_diagnosticsEnable = 0
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
