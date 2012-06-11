let g:molokai_original=0
colorscheme molokai

set antialias
set guioptions-=rL                          " no scrollbar
set guioptions-=T                           " hide toolbar
set guioptions-=m                           " hide menus

if has('mac')
  set guifont=Monaco:h19
  set fuoptions=maxhorz,maxvert             " fullscreen takes up whole screen"

  source ~/.vim/keybindings.macvim.vim

  "au WinLeave * set nocursorline
  "au WinEnter * set cursorline
  "set cursorline 

elseif has("unix")
  set guifont=Inconsolata\ 10
  set lines=30 columns=100                " set window size
endif

" other cool ones: molokai, getafe, wombat, solarized, ir_black
" cool default ones: macvim, slate, desert

" hightlight current word
" highlight flicker gui=bold
" au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'
