" textmate like save
macmenu &File.Save key=<nop>
noremap  <d-s> <esc>:w<cr>
inoremap <d-s> <esc>:w<cr>
vnoremap <d-s> <esc>:w<cr>

" cmd-w to close
macmenu &File.Close key=<nop>
noremap  <silent> <d-w> <esc>:q<cr>
inoremap <silent> <d-w> <esc>:q<cr>
vnoremap <silent> <d-w> <esc>:q<cr>

" move lines of text using alt-[jk]
nnoremap <silent> ª mz:m-2<cr>`z
nnoremap <silent> √ mz:m+<cr>`z
vnoremap <silent> ª :m'<-2<cr>`>my`<mzgv`yo`z
vnoremap <silent> √ :m'>+<cr>`<my`>mzgv`yo`z

" textmate-like indent/deintent
nnoremap <m-s-tab> mz<<`z2h
nnoremap <m-tab> mz>>`z2l
vnoremap <m-tab> mz>><esc>gv`z2l
vnoremap <m-s-tab> mz<<<esc>gv`z2h
inoremap <m-tab> <esc>mzi<c-o>>><esc>`z2la
inoremap <m-s-tab> <esc>mzi<c-o><<<esc>`z2ha

" go to tag mapping doesnt work on os x
" so use cmd+alt+9
nnoremap <d-]> <c-]>
