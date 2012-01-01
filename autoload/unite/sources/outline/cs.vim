"=============================================================================
"
" outline for cs
"
" Licensed under the MIT license:
" http://www.opensource.org/licenses/mit-license.php
"
"=============================================================================

function! unite#sources#outline#cs#outline_info()
  return s:outline_info
endfunction

"-----------------------------------------------------------------------------
" Outline Info

let s:outline_info = {
      \ 'heading'  : '^\s*\(public\|protected\|private\|namespace\).*',
      \ 'highlight_rules': [
      \   { 'name'     : 'type',
      \     'pattern'  : '/\zs[A-Z].*\ze(/' },
      \   ]
      \ }


function! s:outline_info.create_heading(which, heading_line, matched_line, context)
  if match(a:heading_line, 'namespace') >= 0
    let level = 1
  else
    let level =  match(a:heading_line, 'class') >= 0 ? 2 : 3
  endif
  let word = a:heading_line
  if level == 3
    let word = substitute(word, '^\s*public'  , '+', '')
    let word = substitute(word, '^\s*protected', '#' , '')
    let word = substitute(word, '^\s*private' , '-' , '')
  endif
  return {
        \ 'word'  : word,
        \ 'level' : level,
        \ }
endfunction

" vim: filetype=vim
