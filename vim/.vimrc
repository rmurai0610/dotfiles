set nocompatible
filetype off
"=================================================================
"Vundle setup
"=================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'rmurai0610/Apolf'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
call vundle#end()
filetype plugin indent on
"=================================================================
"some general setup
"=================================================================
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
set shiftwidth=4                   " Use indents of 4 spaces
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
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
"=================================================================
"syntastic setup
"=================================================================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" Search n character
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
"=================================================================
"You Complete Me setup
"=================================================================
autocmd CompleteDone * pclose
"=================================================================
"Snipmate setup
"=================================================================
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
"=================================================================
"remap few keys
"=================================================================
command WQ wq
command Wq wq
command W w
command Q q
map <Enter> o<ESC>
map <S_Enter) O<ESC>
imap jk <ESC>
"=================================================================
