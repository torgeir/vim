if !has("gui_running") " modifier commands screws up when in gvim

  " move line of text using alt-[jk]
  nnoremap <silent> j mz:m+<cr>`z
  nnoremap <silent> k mz:m-2<cr>`z
  vnoremap <silent> j :m'>+<cr>`<my`>mzgv`yo`z
  vnoremap <silent> k :m'<-2<cr>`>my`<mzgv`yo`z

  " save
  noremap  <leader>s <esc>:w<cr>
  inoremap <leader>s <esc>:w<cr>
  vnoremap <leader>s <esc>:w<cr>

  " alt-w to close
  noremap w <esc>:q<cr>:wincmd p<cr>

  " tab navigation
  for i in [1,2,3,4,5,6,7,8,9]
    " os x
    exec "nnoremap <d-" . i . "> :silent call GoToTab(" . i . ")<cr>"
    exec "inoremap <d-" . i . "> <esc>:silent call GoToTab(" . i . ")<cr>a"

    " unix terminal
    exec "nnoremap " . i . " :silent call GoToTab(" . i . ")<cr>"
    exec "inoremap " . i . " :silent call GoToTab(" . i . ")<cr>"
  endfor

endif
