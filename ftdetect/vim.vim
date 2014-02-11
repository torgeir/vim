augroup vim_filetype
  autocmd!
  autocmd BufNewFile,BufRead .vimrc set filetype=vim
  autocmd BufNewFile,BufRead .gvimrc set filetype=vim
augroup END

augroup vimrc_and_gvimrc_reload
  autocmd!
  if has("gui_running")
    autocmd BufWritePost .*imrc,*.vim so $MYVIMRC | so $MYGVIMRC
  else
    autocmd BufWritePost .vimrc,*.vim so $MYVIMRC
  endif
augroup END
