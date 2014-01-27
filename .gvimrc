set antialias
set guioptions-=rL                          " no scrollbar
set guioptions-=T                           " hide toolbar
set guioptions-=m                           " hide menus

if has('mac')
  colorscheme badwolf
  set guifont=Monaco:h16
  set fuoptions=maxhorz,maxvert             " fullscreen takes up whole screen"

  source ~/.vim/keybindings.macvim.vim

  "au WinLeave * set nocursorline
  "au WinEnter * set cursorline
  "set cursorline

elseif has("unix")
  colorscheme solarized
  set background=light
  set guifont=Inconsolata\ 21
  if &lines < 30 " adjust minimum size on ubuntu
    set lines=30 columns=100
  endif
endif

" other cool ones: molokai, getafe, wombat, solarized, ir_black
" cool default ones: macvim, slate, desert

" hightlight current word
" highlight flicker gui=bold
" au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'
