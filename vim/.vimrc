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
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'shirk/vim-gas'
Plugin 'jplaut/vim-arduino-ino'
call vundle#end()
filetype plugin indent on
"=================================================================
"some general setup
"=================================================================
let mapleader=","
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
"=================================================================
"syntastic setup
"=================================================================
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
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

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
"=================================================================
"You Complete Me setup
"=================================================================
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
map <F9> :YcmCompleter FixIt<CR>
nnoremap <Leader>g :YcmCompleter GoTo
aug QFClose
      au!
      au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END
"=================================================================
"UltiSnips setup
"=================================================================
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"=================================================================
"ctrlp setup
"=================================================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"=================================================================
"remap few keys
"=================================================================
command WQ wq
command Wq wq
command W w
command Q q

map <Enter> o<ESC>
imap jk <ESC>
imap /* /*<ESC>A*/<ESC>hi
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-\> <C-W>v
"=================================================================
