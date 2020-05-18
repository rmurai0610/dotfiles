let g:ale_lint_on_enter = 1
let g:ale_linters = {
  \'cpp': ['clangd'],
  \'python': ['flake8'],
\}
let g:ale_fixers = {
  \'cpp': ['clang-format'],
  \'python': ['autopep8'],
\}
let g:ale_cpp_parse_compile_commands=1
let g:ale_fix_on_save = 1
