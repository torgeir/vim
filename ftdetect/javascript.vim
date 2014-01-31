augroup json_filetype
  autocmd!
  autocmd BufNewFile,BufRead *.js    set filetype=javascript
  autocmd BufNewFile,BufRead *.json    set filetype=javascript
  autocmd BufNewFile,BufRead *.traceur set filetype=javascript
augroup END
