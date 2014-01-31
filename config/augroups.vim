" highlight stupid os x alt+space char
call matchadd("spellbad", " ")

" highlight lines ending in non-escaped whitespace
highlight TrailingWhitespace ctermbg=red guibg=red guifg=red
autocmd BufWinLeave * call clearmatches() | call matchadd("spellbad", " ")
autocmd InsertEnter * call clearmatches() | call matchadd("spellbad", " ")
autocmd BufWinEnter,InsertLeave * call clearmatches() | call matchadd("spellbad", " ") | match TrailingWhitespace /\(\\\)\@<!\s$/ " negative lookbehind for escape char \ before any trailing space(s) (i.e. don't match if \ the preceeds space)
" test: should show in red 
" test: should not show in red\ 

augroup vimrc_and_gvimrc_reload
  autocmd!
  if has("gui_running")
    autocmd BufWritePost .*imrc,*.vim so $MYVIMRC | so $MYGVIMRC
  else
    autocmd BufWritePost .vimrc,*.vim so $MYVIMRC
  endif
augroup END

augroup vim_filetype
  autocmd!
  autocmd BufNewFile,BufRead *.vim set filetype=vim
  autocmd BufNewFile,BufRead $MYVIMRC set filetype=vim
  autocmd BufNewFile,BufRead $MYGVIMRC set filetype=vim
augroup END

augroup json_filetype
  autocmd!
  autocmd BufNewFile,BufRead *.js    set filetype=javascript
  autocmd BufNewFile,BufRead *.json    set filetype=javascript
  autocmd BufNewFile,BufRead *.traceur set filetype=javascript
augroup END

augroup xml_filetype
  autocmd!
  autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
augroup END

augroup node_js_tags
  autocmd!
  autocmd BufRead,BufNewFile *.js setlocal tags+=~/.vim/tags/nodejs
augroup END

" tags generation ?
autocmd BufWritePost *.js silent! !ctags -R &
