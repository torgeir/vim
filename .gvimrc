let g:molokai_original=1
colorscheme molokai                         " wombat, solarized, ir_black - cool default ones: macvim, slate, desert

set antialias

set guioptions-=rL                          " no scrollbar
set guioptions-=T                           " hide toolbar
set guioptions-=m                           " hide menus
" set guioptions=aegitcm                      " disable menu in gui mode

if has('mac')

  source ~/.vim/keybindings.macvim.vim

  set fuoptions=maxhorz,maxvert             " fullscreen takes up whole screen"
  set guifont=Monaco:h16
  set transparency=0

  "au WinLeave * set nocursorline
  "au WinEnter * set cursorline
  "set cursorline 
  

elseif has("unix")

  source ~/.vim/keybindings.gvim.vim
endif

" hightlight current word
" highlight flicker gui=bold
" au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'
