let g:polyglot_disabled = ['latex']
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufRead,BufNewFile *.h,*.c setfiletype c

