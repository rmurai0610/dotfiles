" General
"
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
set clipboard=unnamed
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

" Status line
set laststatus=2
function! GetGitBranch()
  let l:is_git_dir = system('echo -n $(git rev-parse --is-inside-work-tree)')
  if l:is_git_dir is# 'true'
    let s:git_branch = ' Git: ' . trim(system('git rev-parse --abbrev-ref HEAD'))
  else
    let s:git_branch = ''
  endif
endfunction

autocmd BufEnter * call GetGitBranch()

function! StatusLineMode()
  let l:current_mode = mode()
  let l:current_mode_name = 'Normal'
  let l:current_mode_color = '#DiffText#'
  if l:current_mode ==? 'i'
    let l:current_mode_name = 'Insert'
    let l:current_mode_color = '#DiffAdd#'
  elseif l:current_mode ==? 'R'
    let l:current_mode_name = 'Replace'
    let l:current_mode_color = '#DiffDelete#'
  elseif l:current_mode ==? 'V' || l:current_mode ==?'v' || l:current_mode ==? "\<C-V>"
    let l:current_mode_name = 'Visual'
    let l:current_mode_color = '#DiffChange#'
  endif
  return '%' . l:current_mode_color . ' ' . l:current_mode_name . ' %*'
endfunction

function! StatusLineGit()
  return '%#TermCursorNC#' . s:git_branch . ' '
endfunction

function! SetStatusLine()
  return StatusLineMode() . '%#TermCursorNC# %f %*' . '%=' . StatusLineGit()
endfunction


set noshowmode
set statusline=%!SetStatusLine()
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
