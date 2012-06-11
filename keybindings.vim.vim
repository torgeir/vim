" move line of text using alt-[jk]
nnoremap <silent> <leader>j mz:m+<cr>`z
nnoremap <silent> <leader>k mz:m-2<cr>`z
vnoremap <silent> <leader>j :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <silent> <leader>k :m'<-2<cr>`>my`<mzgv`yo`z

" leader-s save
noremap  <leader>s <esc>:w<cr>
inoremap <leader>s <esc>:w<cr>
vnoremap <leader>s <esc>:w<cr>

" leader-w to close
noremap  <silent> <leader>w <esc>:q<cr>:wincmd p<cr>
vnoremap <silent> <leader>w <esc>:q<cr>:wincmd p<cr>
inoremap <silent> <leader>w <esc>:q<cr>:wincmd p<cr>

" tab navigation
for i in [1,2,3,4,5,6,7,8,9]
  " os x
  exec "nnoremap <d-" . i . "> :silent call GoToTab(" . i . ")<cr>"
  exec "inoremap <d-" . i . "> <esc>:silent call GoToTab(" . i . ")<cr>a"

  " unix terminal
  exec "nnoremap <leader>" . i . " :silent call GoToTab(" . i . ")<cr>"
endfor

" tab next/previous
noremap  <leader><tab> :tabn<cr>
inoremap <leader><tab> <esc>:tabn<cr>a

noremap  <leader><s-tab> :tabp<cr>
inoremap <leader><s-tab> <esc>:tabp<cr>a
