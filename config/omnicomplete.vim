" omni completion 
set omnifunc=syntaxcomplete#Complete

augroup onmi_complete_filetypes
  autocmd!
  autocmd FileType css  set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml  set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
augroup END
