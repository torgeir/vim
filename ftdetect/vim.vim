augroup vim_filetype
  autocmd!
  autocmd BufNewFile,BufRead *.vim set filetype=vim
  autocmd BufNewFile,BufRead $MYVIMRC set filetype=vim
  autocmd BufNewFile,BufRead $MYGVIMRC set filetype=vim
augroup END

augroup vimrc_and_gvimrc_reload
  autocmd!
  if has("gui_running")
    autocmd BufWritePost .*imrc,*.vim so $MYVIMRC | so $MYGVIMRC
  else
    autocmd BufWritePost .vimrc,*.vim so $MYVIMRC
  endif
augroup END
