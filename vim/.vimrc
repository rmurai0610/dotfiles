if !has('nvim') || !has('nvim-0.3.1')
  echohl ErrorMsg
  echom 'Neovim version not satisfied, 0.3.1 and above is required'
  echohl None
  finish
endif
runtime! userautoload/init/*.vim
if exists('g:vscode')
else
  runtime! userautoload/plug/*.vim
endif
