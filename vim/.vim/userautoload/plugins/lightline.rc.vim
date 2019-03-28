set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [['mode', 'paste' ]],
      \   'right': [['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']],
      \ },
      \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ },
      \ }
