nnoremap <Leader>g  :<C-u>Denite -auto_preview grep<CR>
nnoremap <Leader>cg :<C-u>DeniteCursorWord grep<CR>
nnoremap <Leader>f  :<C-u>DeniteProjectDir file/rec<CR>
nnoremap <Leader>z  :<C-u>DeniteProjectDir file/old<CR>
nnoremap <Leader>r  :<C-u>Denite register<CR>
nnoremap <Leader>b  :<C-u>Denite buffer<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
  nnoremap <silent><buffer><expr> <ESC>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

