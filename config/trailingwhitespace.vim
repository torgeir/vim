augroup show_whitespaces
  autocmd!
  autocmd BufEnter * call NotifyWhitespace()
  autocmd InsertEnter * call ClearNotifiedWhitespace()
  autocmd InsertLeave * call NotifyWhitespace()
augroup END

" tests
"   should not show in red\ 
"   should show in red 

function! NotifyWhitespace()
  let b:funky_whitespace_matches = []

  " highlight stupid os x alt+space char
  call add(b:funky_whitespace_matches, matchadd("SpellBad", " "))

  " highlight lines ending in non-escaped whitespace
  highlight TrailingWhitespace ctermbg=red guibg=red guifg=red
  match TrailingWhitespace /\(\\\)\@<!\s$/ " negative lookbehind for escape char \ before any trailing space(s) (i.e. don't match if \ the preceeds space)
endfunction

function! ClearNotifiedWhitespace()
  " remove alt+space highlights
  call filter(b:funky_whitespace_matches, 'Matchdelete_safe(v:val)')
  let b:funky_whitespace_matches = []

  " remove trailing whitespace matches
  match none
endfunction

function! Matchdelete_safe(match)
  try | call matchdelete(a:match) | catch | | endtry
endfunction
