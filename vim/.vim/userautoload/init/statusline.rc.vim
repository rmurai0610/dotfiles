" Status line
set laststatus=2
function! GetGitBranch()
  let l:is_git_dir = system('echo -n $(git -C ' . expand('%:p:h') . ' rev-parse --is-inside-work-tree)')
  if l:is_git_dir is# 'true'
    let s:git_branch = ' Git: ' . trim(system('git -C ' . expand('%:p:h'). ' rev-parse --abbrev-ref HEAD')) . ' '
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
  return '%#TermCursorNC#' . s:git_branch
endfunction

function! SetStatusLine()
  return StatusLineMode() . '%#TermCursorNC# %f %*' . '%=' . StatusLineGit()
endfunction


set noshowmode
set statusline=%!SetStatusLine()
