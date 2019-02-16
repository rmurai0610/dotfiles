let g:ale_sign_column_always = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'

nmap <C-e> [ale]
nnoremap <silent> [ale]<C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> [ale]<C-j> <Plug>(ale_next_wrap)

nnoremap <silent> [ale]<C-o> :lop<CR>
nnoremap <silent> [ale]<C-q> :lcl<CR>

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'python': ['flake8'],
\   'c': ['clang'],
\   'cpp': ['clang'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'python': ['autopep8'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

" Python setting
let g:ale_python_flake8_options = '--max-line-length 120'
let g:ale_python_autopep8_options = '--max-line-length 120'

" C setting
let g:ale_c_clang_options = '-std=c11 -Wall'
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: google, IndentWidth: 4, AccessModifierOffset: -4, ColumnLimit: 119}"'

" C++ setting
"
let g:ale_cpp_clang_options = '-std=c++14 -Wall'
let g:ale_cpp_clangformat_options = '-style="{
      \ BasedOnStyle: google,
      \ IndentWidth: 4,
      \ AccessModifierOffset: -4,
      \ ColumnLimit: 119
      \ }"'
