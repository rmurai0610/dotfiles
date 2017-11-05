set nocompatible

filetype off
"=================================================================
"VimPlug setup
"=================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
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
"Plug 'zchee/deoplete-clang'
Plug 'Tweekmonster/deoplete-clang2'
Plug 'fishbullet/deoplete-ruby'
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
Plug 'vim-scripts/a.vim'
Plug 'Shougo/denite.nvim'
Plug 'Raimondi/delimitMate'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'bonsaiben/bootstrap-snippets'
Plug 'jelera/vim-javascript-syntax'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-expand-region'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tell-k/vim-autopep8'
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
set shiftwidth=4                   " Use indents of 2 spaces
set expandtab                      " Tabs are spaces, not tabs
set tabstop=4                      " An indentation every four columns
set softtabstop=4                  " Let backspace delete indent
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
"airline setup
"=================================================================
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
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
let g:clang_format#command = '/usr/local/bin/clang-format'
let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -4,
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "AllowShortFunctionsOnASingleLine" : "false",
      \ "AllowShortIfStatementsOnASingleLine" : "false",
      \ "ColumnLimit" : 120,
      \ "Standard" : "C++11"}
let g:clang_format#detect_style_file = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc ClangFormatAutoEnable
"=================================================================
" Deoplete
"=================================================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:SuperTabClosePreviewOnPopupClose = 1

" deoplete tab-complete
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:deoplete#sources#clang#libclang_path ='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header ='/Library/Developer/CommandLineTools/usr/lib/clang'
autocmd CompleteDone * pclose!
let g:neosnippet#enable_completed_snippet = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
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

let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_python_enabled_makers=['pep8']
let g:neomake_python_pep8_args=['--max-line-length=120']

nnoremap <Leader>e :ll<CR>
nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>p :lprev<CR>


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
nnoremap <Leader>f  :<C-u>DeniteProjectDir file_rec<CR>

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
"=================================================================
" Tagbar
"=================================================================
nmap <F8> :TagbarToggle<CR>
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
"=================================================================
" Emmet setting
"=================================================================
let g:user_emmet_expandabbr_key='<Tab>'
autocmd FileType html,css,scss,sass EmmetInstall
"=================================================================
" vim-expand-region setting
"=================================================================
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"=================================================================
" auto pep8
"=================================================================
"function! Preserve(command)
    "" Save the last search.
    "let search = @/
    "" Save the current cursor position.
    "let cursor_position = getpos('.')
    "" Save the current window position.
    "normal! H
    "let window_position = getpos('.')
    "call setpos('.', cursor_position)
    "" Execute the command.
    "execute a:command
    "" Restore the last search.
    "let @/ = search
    "" Restore the previous window position.
    "call setpos('.', window_position)
    "normal! zt
    "" Restore the previous cursor position.
    "call setpos('.', cursor_position)
"endfunction

"function! Autopep8()
    "call Preserve(':silent %!autopep8 --max-line-length=120 -')
"endfunction

"autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>
"autocmd BufWrite *.{py} :call Autopep8()
"=================================================================
" remap few keys
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

