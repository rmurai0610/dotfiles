nnoremap <Leader>g  :<C-u>Denite -auto_preview grep<CR>
nnoremap <Leader>cg :<C-u>DeniteCursorWord grep<CR>
nnoremap <Leader>f  :<C-u>DeniteProjectDir file_rec<CR>
nnoremap <Leader>z  :<C-u>DeniteProjectDir file_old<CR>
nnoremap <Leader>r  :<C-u>Denite register -mode=normal<CR>
nnoremap <Leader>b  :<C-u>Denite buffer -mode=normal<CR>
call denite#custom#option('default', 'prompt', '>')
call denite#custom#var('file_rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#map(
      \ 'insert',
      \ '<Down>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<Up>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \'insert',
      \'<C-x>',
      \'<denite:do_action:split>',
      \'noremap')
call denite#custom#map(
      \'insert',
      \'<C-v>',
      \'<denite:do_action:vsplit>',
      \'noremap')

