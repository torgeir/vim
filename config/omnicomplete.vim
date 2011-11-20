" omni completion 
set ofu=syntaxcomplete#Complete

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1
