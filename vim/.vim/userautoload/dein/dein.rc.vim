if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let s:dein_path = expand('~/.vim/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_path)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
endif
execute 'set runtimepath^=' . s:dein_repo_path

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  call dein#add(s:dein_repo_path)

  " Load plugins
  call dein#load_toml('~/.vim/userautoload/dein/plugins.toml', {'lazy': 0})
  call dein#load_toml('~/.vim/userautoload/dein/plugins-lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Check installed plugins on startup and install.
if dein#check_install()
 call dein#install()
endif
