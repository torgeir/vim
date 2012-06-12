" 256 colors
set t_Co=256

let mapleader = ","

" remove all auto commands
autocmd!

if has("gui_running")
  " reload vimrc and gvimrc on save
  autocmd BufWritePost .*imrc so ~/.vim/.vimrc
  autocmd BufWritePost .*imrc so ~/.vim/.gvimrc
  autocmd BufWritePost *.vim so ~/.vim/.vimrc
  autocmd BufWritePost *.vim so ~/.vim/.gvimrc
else
  " reload vimrc on save
  autocmd BufWritePost .vimrc so ~/.vim/.vimrc
  autocmd BufWritePost *.vim so ~/.vim/.vimrc
endif

" disabled plugins
let g:pathogen_disabled = ['gundo']

" load plugins
filetype off
call pathogen#infect()
call pathogen#helptags()

" config
source ~/.vim/keybindings.vim
source ~/.vim/functions.vim

" plugins
filetype on
filetype indent on
filetype plugin on

" plugin config
source ~/.vim/config/colorizer.vim
source ~/.vim/config/nerdtree.vim
source ~/.vim/config/omnicomplete.vim
source ~/.vim/config/ctrlp.vim
source ~/.vim/config/tasklist.vim
source ~/.vim/config/filetypes.vim
source ~/.vim/config/tagbar.vim
source ~/.vim/config/gundo.vim
source ~/.vim/config/yankring.vim

""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""
if has('mac')
  colorscheme molokai
else
  colorscheme solarized
endif
syntax on			  " highlight
set background=light		  " adjust colors
set backspace=indent,eol,start	  " intuitive backspacing in insert mode
set encoding=utf-8		  " encoding
set hidden			  " allow unsaved buffer switches
set history=1000		  " keep longer history
"set number			  " line numbers
set relativenumber                " line numbers relative to cursor
set title			  " adjust window title
set autoread			  " automatically re-read file on outside change
set magic			  " set magic on, for regular expressions
set nocompatible                  " dont bother being compatible with vi
set modelines=0                   " prevent security exploits in modelines
set lazyredraw                    " dont redraw until macro is complete

set autoindent			  " keep indent on newline
set smartindent			  " auto-indent (block/language)
set shiftround			  " round to whole indents
set shiftwidth=2		  " indent = 2 chars
set softtabstop=2		  " 2 tab = 2 spaces
set expandtab			  " tabs are spaces
set linebreak			  " break lines
set breakat=" "                   " where to insert line breaks
let &showbreak = " ↪ "            " character to visualize breaks

set iskeyword+=-                  " quotes are also keywords, so e.g. vi' works

" set columns=84	            " 84 - 4 = 80 char width
set numberwidth=6		  " linenumber width
set ruler			  " show ruler
set scrolloff=8			  " more context around the cursor as it scrolls

set showmatch			  " show matching chars (,{,..
set matchtime=3                   " blink matching chars for .x seconds
set matchpairs+=<:>               " add < > to matched pairs
runtime macros/matchit.vim	  " make % match if/else/..

set ignorecase			  " use smart case searching, only search for \
set smartcase			  " case sensitive words if search has capital
set nohlsearch			  " highlight search terms...
set incsearch			  " ...dynamically as they are typed.
set wrapscan			  " make search wrap
set hlsearch                      " turn off search highlights default
set hlsearch!

" disable all bells
set noerrorbells
set visualbell
set t_vb=

" custom invisibles
set listchars=tab:▸\ ,eol:¬
set nolist

" turn backup off (.swp)
set nobackup
set nowb
set noswapfile

" improve menu on :e <tab>
set wildmenu
set wildmode=list:longest
set wildignore+=.git,node_modules

" status line
set laststatus=2

" format the status line
set statusline=%y
set statusline+=\ "
set statusline+=%#error#%{&paste?'[paste]':''}%*
set statusline+=\ "
set statusline+=%F\ %m\ %r\ %h
set statusline+=\ %w
set statusline+=\ %r
set statusline+=\ "
set statusline+=%{CurDir()}
set statusline+=%=	                              " left-right separator
set statusline+=%h\ \ 
set statusline+=%c,%l/%L\ %P

" tab labels
set guitablabel=%{GuiTabLabel()}

" splitting windows in equal sizes below and right
set equalalways
set splitbelow splitright

" more tips
" http://www.rayninfo.co.uk/vimtips.html
