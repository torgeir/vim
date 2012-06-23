" colors
set t_Co=256

let mapleader = ","

augroup vimrc_reload
  autocmd!
  if has("gui_running") " reload vimrc and gvimrc on save
    autocmd BufWritePost .*imrc,*.vim so $MYVIMRC | so $MYGVIMRC
  else " reload vimrc on save
    autocmd BufWritePost .vimrc,*.vim so $MYVIMRC
  endif
augroup END

" disabled plugins
let g:pathogen_disabled = [ 'gundo' ]

" load plugins
filetype off
call pathogen#infect()
call pathogen#helptags()

" plugins
filetype on
filetype indent on
filetype plugin on

" keys and functions
source ~/.vim/keybindings.vim
source ~/.vim/functions.vim

" plugin config
source ~/.vim/config/colorizer.vim
source ~/.vim/config/ctrlp.vim
source ~/.vim/config/filebrowser.vim
source ~/.vim/config/filetypes.vim
source ~/.vim/config/gundo.vim
source ~/.vim/config/omnicomplete.vim
source ~/.vim/config/rainbow.vim
source ~/.vim/config/scratch.vim
source ~/.vim/config/tagbar.vim
source ~/.vim/config/tasklist.vim
source ~/.vim/config/togglebg.vim
source ~/.vim/config/xptemplate.vim
source ~/.vim/config/yankring.vim
source ~/.vim/config/syntastic.vim

" tags - from driectory of current file, then cwd, then upwards to /
set tags=./tags,tags;/

" auto load tags from nodejs source when in js
augroup tags_for_nodejs
  autocmd!
  autocmd BufRead,BufNewFile *.js setlocal tags+=~/.vim/tags/nodejs
augroup END

" tags generation ?
"autocmd BufWritePost *.js silent! !ctags -R &

""""""""""""""""""""""""""""""""""""""""
" settings
""""""""""""""""""""""""""""""""""""""""
if has('mac')
  colorscheme molokai
else
  colorscheme solarized
endif
syntax on                         " highlight
set background=light              " adjust colors
set backspace=indent,eol,start    " intuitive backspacing in insert mode
set encoding=utf-8                " encoding
set hidden                        " allow unsaved buffer switches
set history=1000                  " keep longer history
set relativenumber                " line numbers relative to cursor
set autoread                      " automatically re-read file on outside change
set nocompatible                  " dont bother being compatible with vi
set lazyredraw                    " dont redraw until macro is complete

set autoindent                    " keep indent on newline
set smartindent                   " auto-indent (block/language)
set shiftround                    " round to whole indents
set shiftwidth=2                  " indent = 2 chars
set softtabstop=2                 " 2 tab = 2 spaces
set expandtab                     " tabs are spaces
set linebreak                     " break lines
set breakat=" "                   " where to insert line breaks
let &showbreak="↪ "             " character to visualize breaks

set iskeyword+=-                  " quotes are also keywords, so e.g. vi' works

" set columns=84                   " 84 - 4 = 80 char width
set numberwidth=6                 " linenumber width
set showcmd
set ruler                         " show ruler
set scrolloff=8                   " more context around the cursor as it scrolls

set showmatch                     " show matching chars (,{,..
set matchtime=3                   " blink matching chars for .x seconds
set matchpairs+=<:>               " add < > to matched pairs
runtime macros/matchit.vim        " make % match if/else/..
runtime ftplugin/man.vim          " enable viewing manpages with :Man <smtn>

set ignorecase                    " use smart case searching, only search for \
set smartcase                     " case sensitive words if search has capital
set incsearch                     " ...dynamically as they are typed.
set wrapscan                      " make search wrap
set hlsearch                      " highlight search-terms

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
set wildmode=longest,full
set wildignore+=.git,node_modules

" dictionary
set dictionary+=/usr/share/dict/words

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
set statusline+=%=                " left-right separator
set statusline+=%h\ \ 
set statusline+=%c,%l/%L\ %P

" splitting
set splitright splitbelow

" tab labels
set guitablabel=%{GuiTabLabel()}

" more tips
" http://www.rayninfo.co.uk/vimtips.html

" highlight lines ending in non-escaped whitespace
highlight TrailingWhitespace ctermbg=red guibg=red guifg=red
autocmd BufWinEnter * match TrailingWhitespace /\(\\\)\@<!\s$/ " negative lookbehind for escape char \ before any trailing space(s) (i.e.  don't match if \ the preceeds space)
autocmd BufWinLeave * call clearmatches()

" test:
"   should show this one in red 
"   should not show this one in red\ 

if has("mac") | match spellbad / / | endif

