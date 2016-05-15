set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on

"enable syntax
syntax enable

"general
set t_Co=256
colorscheme Aplof/apolf
set noundofile
set mouse=a
set mousehide

set history=1000
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd

set list
set listchars=trail:•

set backspace=indent,eol,start
set linespace=0
set number
set showmatch
set scrolljump=5
set scrolloff=3
set autoindent
set smartindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set nojoinspaces

set undofile
set nobackup
set noswapfile

set cursorline

set laststatus=2

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
autocmd BufWritePre * :%s/\s\+$//e

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

command WQ wq
command Wq wq
command W w
command Q q

map <Enter> o<ESC>
map <S_Enter) O<ESC>

imap jk <ESC>
