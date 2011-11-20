if has("unix")

  " command t
  noremap <silent> <m-t> <esc>:CommandT<cr>
  inoremap <silent> <m-t> <esc>:CommandT<cr>
  vnoremap <silent> <m-t> <esc>:CommandT<cr>

  " textmate like save
  noremap <m-s> <esc>:w<cr>
  inoremap <m-s> <esc>:w<cr>
  vnoremap <m-s> <esc>:w<cr>

  " alt-w to close
  noremap <m-w> <esc>:q<cr>:wincmd p<cr>

  " textmate like delete down
  nnoremap <m-d> yydd
  vnoremap <m-d> d

  " textmate like delete up
  nnoremap <m-D> yyddk
  vnoremap <m-D> dk

  " toggle comments
  nnoremap <m-/> <leader>ci
  inoremap <m-/> <esc><leader>cia
  vnoremap <m-/> <leader>cigv

  " move lines of text using alt-[jk]
  nnoremap <silent> <m-j> mz:m+<cr>`z
  nnoremap <silent> <m-k> mz:m-2<cr>`z
  vnoremap <silent> <m-j> :m'>+<cr>`<my`>mzgv`yo`z
  vnoremap <silent> <m-k> :m'<-2<cr>`>my`<mzgv`yo`z

  " tab navigation
  for i in [1,2,3,4,5,6,7,8,9]
    " windows/unix gui
    exec "nnoremap <m-" . i . "> :silent call GoToTab(" . i . ")<cr>"
    exec "inoremap <m-" . i . "> <esc>:silent call GoToTab(" . i . ")<cr>a"
  endfor

endif
