" highlight stupid os x alt+space char
call matchadd("spellbad", " ")

" highlight lines ending in non-escaped whitespace
highlight TrailingWhitespace ctermbg=red guibg=red guifg=red
autocmd BufWinLeave * call clearmatches() | call matchadd("spellbad", " ")
autocmd InsertEnter * call clearmatches() | call matchadd("spellbad", " ")
autocmd BufWinEnter,InsertLeave * call clearmatches() | call matchadd("spellbad", " ") | match TrailingWhitespace /\(\\\)\@<!\s$/ " negative lookbehind for escape char \ before any trailing space(s) (i.e. don't match if \ the preceeds space)
" test: should show in red 
" test: should not show in red\ 
