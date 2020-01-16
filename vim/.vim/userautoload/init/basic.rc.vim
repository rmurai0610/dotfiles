" General
let mapleader = "\<Space>"
syntax enable
set mouse=a
set mousehide
set number
set relativenumber
set showmatch
set lbr
set nowrap
set cursorline
set clipboard=unnamedplus
set wildmenu
set nohlsearch
set fillchars=""
set backspace=indent,eol,start
set sidescrolloff=5
set scrolloff=3
set wildmenu
set splitright
set splitbelow
set lazyredraw
set inccommand=nosplit
if !has('gui_running')
  set t_Co=256
endif

set encoding=utf-8

" Whitespace
set list
set listchars=trail:•
autocmd BufWritePre * :%s/\s\+$//e

" Indentations/Spaces
set nojoinspaces
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype c setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype cpp setlocal ts=4 sw=4 sts=0 expandtab

" Wrapping for text files
function! SetTextFileWrap()
  set wrap
  nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
  nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
endfunction
au BufReadPost,BufNewFile *.md,*.txt,*.tex call SetTextFileWrap()

" Save undo info
let s:undo_dir = expand('~/.vim/undo')
if !isdirectory(s:undo_dir)
  call mkdir(s:undo_dir, 'p')
endif
execute 'set undodir=' . s:undo_dir
set undofile

" No swap files
set noswapfile

" Open latex
let g:tex_flavor = "latex"

" Close quickfix window automatically
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Neovim setting
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
