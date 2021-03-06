set antialias
set guioptions-=rL                          " no scrollbar
set guioptions-=T                           " hide toolbar
set guioptions-=m                           " hide menus

if has('mac')
  set guifont=Monaco:h17
  set fuoptions=maxhorz,maxvert             " fullscreen takes up whole screen

  source ~/.vim/keybindings.macvim.vim

  let g:hybrid_use_iTerm_colors = 1

  "au WinLeave * set nocursorline
  "au WinEnter * set cursorline
  "set cursorline

elseif has("unix")
  set guifont=Inconsolata\ 21
  if &lines < 30 " adjust minimum size on ubuntu
    set lines=30 columns=100
  endif
  
elseif has("win32")
  set guifont=Inconsolata:h14
endif
