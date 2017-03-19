set nocompatible
filetype off
"=================================================================
"VimPlug setup
"=================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'rmurai0610/Apolf'
Plug 'rmurai0610/wacc_syntax'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-vinegar'
Plug 'easymotion/vim-easymotion'
Plug 'kchmck/vim-coffee-script'
Plug 'craigemery/vim-autotag'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'fishbullet/deoplete-ruby'
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/a.vim'
Plug 'Shougo/denite.nvim'
Plug 'Raimondi/delimitMate'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
call plug#end()
filetype plugin indent on
"=================================================================
"some general setup
"=================================================================
let mapleader = "\<Space>"
syntax enable                      " Enables syntax
set t_Co=256                       " Allows use of 256 colors
colorscheme apolf                  " Set up the colourscheme
set list
set listchars=trail:•              " Highlight the white spaces
autocmd BufWritePre * :%s/\s\+$//e " Every time the file is written, delete all trailing white space
set backspace=indent,eol,start     " Backspace for dummies
set linespace=0                    " No extra spaces between rows
set number                         " Line numbers on
set showmatch                      " Show matching brackets/parenthesis
set scrolljump=5                   " Lines to scroll when cursor leaves screen
set scrolloff=3                    " Minimum lines to keep above and below cursor
set foldenable                     " Auto fold code
set nowrap                         " Do not wrap long lines
set autoindent                     " Indent at the same level of the previous line
set smartindent                    " Indent like Java
set shiftwidth=2                   " Use indents of 2 spaces
set expandtab                      " Tabs are spaces, not tabs
set tabstop=2                      " An indentation every four columns
set softtabstop=2                  " Let backspace delete indent
set nojoinspaces                   " Prevents inserting two spaces after punctuation on a join (J)
set splitright                     " Puts new vsplit windows to the right of the current
set splitbelow                     " Puts new split windows to the bottom of the current
set history=1000
set noundofile
set noswapfile
set nobackup
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set mouse=a                        " Allows mouse to be used
set mousehide                      " Hide it when not in use
set cursorline
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
set lazyredraw
set clipboard=unnamed
set fillchars=""                  " Remove ugly column of pipe
set path=$PWD/**
set wildmenu
set nohlsearch
" save undo info
if !isdirectory($HOME."/.vim")
  call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
  call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
autocmd filetype crontab setlocal nobackup nowritebackup
set undodir=~/.vim/undo-dir
set undofile
"=================================================================
"lightline setup
"=================================================================
set laststatus=2
"=================================================================
"NerdTree setup
"=================================================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"=================================================================
"EasyMotion setup
"=================================================================
let g:EasyMotion_do_mapping = 0
map <Leader>s <Plug>(easymotion-tn)
" Search n character
map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
"=================================================================
"UltiSnips setup
"=================================================================
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"=================================================================
"Clang format
"=================================================================
let g:clang_format#command = '/usr/local/Cellar/clang-format/2016-08-03/bin/clang-format'
let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -4,
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "AllowShortFunctionsOnASingleLine" : "false",
      \ "AllowShortIfStatementsOnASingleLine" : "false",
      \ "ColumnLimit" : 80,
      \ "Standard" : "C++11"}
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
"=================================================================
" Deoplete
"=================================================================
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#sources#clang#libclang_path ='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header ='/Library/Developer/CommandLineTools/usr/lib/clang'
autocmd CompleteDone * pclose!
"=================================================================
" NeoMake
"=================================================================
if (expand('%:e')=='c' || expand('%:e')=='cpp')
  let g:neomake_cpp_enabled_makers=['clang']
  let g:neomake_cpp_clang_args=["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
  let g:neomake_open_list=2
  autocmd! BufWritePost * Neomake!
else
  autocmd! BufWritePost * Neomake
endif

" autoclose quickfix window
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" move the quickfix underneath all the time
autocmd FileType qf wincmd J
"=================================================================
" ultisnips
"=================================================================
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
"=================================================================
" autotag
"=================================================================
let g:autotagTagsFile="tags"
"=================================================================
" Denite
"=================================================================
nnoremap <Leader>g  :<C-u>Denite -auto_preview grep<CR>
nnoremap <Leader>cg :<C-u>DeniteCursorWord grep<CR>
nnoremap <Leader>f  :<C-u>Denite file_rec<CR>
"=================================================================
" Tagbar
"=================================================================
nmap <F8> :TagbarToggle<CR>
"=================================================================
"remap few keys
"=================================================================
command WQ wq
command Wq wq
command W w
command Q q

nnoremap <c-S-f> mzgg=G`z
nnoremap <Enter> o<ESC>
inoremap jk <ESC>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-\> <C-W>v
nnoremap ; :
nnoremap <Leader>w :w<CR>
tnoremap jk <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
"=================================================================
" quick terminal
"=================================================================
let s:is_quick_terminal_open = 0
function QuickTerminal()
  if (s:is_quick_terminal_open)
    bd! quick_terminal
    let s:is_quick_terminal_open = 0
  else
    botright 10 new
    terminal
    call feedkeys("\<C-\>\<C-n>")
    f quick_terminal
    call feedkeys("i")
    let s:is_quick_terminal_open = 1
  end
endfunction

nnoremap <Leader><Leader> :call QuickTerminal()<CR>
