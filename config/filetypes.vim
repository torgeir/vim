augroup vim_filetype
  autocmd!
  autocmd BufNewFile,BufRead *.vim set filetype=vim
  autocmd BufNewFile,BufRead $MYVIMRC set filetype=vim
  autocmd BufNewFile,BufRead $MYGVIMRC set filetype=vim
augroup END

augroup json_filetype
  autocmd!
  autocmd BufNewFile,BufRead *.json    set filetype=javascript
  autocmd BufNewFile,BufRead *.traceur set filetype=javascript
augroup END

augroup xml_filetype
  autocmd!
  autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
augroup END
