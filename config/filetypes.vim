augroup json_filetype
  autocmd!
  autocmd BufNewFile,BufRead *.json set filetype=javascript
augroup END

augroup xml_filetype
  autocmd!
  autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
augroup END
