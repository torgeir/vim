if has("mac")
  
  " command t 
  macmenu &File.New\ Tab key=<nop>
  noremap <silent> <d-t> <esc>:CommandT<cr>
  inoremap <silent> <d-t> <esc>:CommandT<cr>
  vnoremap <silent> <d-t> <esc>:CommandT<cr>

  " textmate like save
  macmenu &File.Save key=<nop>
  noremap <d-s> <esc>:w<cr>
  inoremap <d-s> <esc>:w<cr>
  vnoremap <d-s> <esc>:w<cr>

  " cmd-w to close
  macmenu &File.Close key=<nop>
  noremap <silent> <d-w> <esc>:q<cr>
  inoremap <silent> <d-w> <esc>:q<cr>
  vnoremap <silent> <d-w> <esc>:q<cr>

  " textmate like delete down
  nnoremap <d-d> yydd
  vnoremap <d-d> d

  " textmate like delete up
  nnoremap <d-D> yyddk
  vnoremap <d-D> dk

  " toggle comments with nerdcommenter
  nnoremap <D-/> <leader>ci
  inoremap <D-/> <esc><leader>cia
  vnoremap <D-/> <leader>cigv

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

  " tab navigation
  for i in [1,2,3,4,5,6,7,8,9]
    exec "nnoremap <d-" . i . "> :silent call GoToTab(" . i . ")<cr>"
    exec "inoremap <d-" . i . "> <esc>:silent call GoToTab(" . i . ")<cr>a"
  endfor

  " nnmap cmd+shift+t so we can...
  " macmenu &File.Open\ Tab\.\.\. key=<nop>

endif
