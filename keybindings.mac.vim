if !has("gui_running")

  " tab navigation
  for i in [1,2,3,4,5,6,7,8,9]
    exec "nnoremap <leader>" . i . " :silent call GoToTab(" . i . ")<cr>"
    exec "inoremap <leader>" . i . " <esc>:silent call GoToTab(" . i . ")<cr>a"
  endfor

endif
