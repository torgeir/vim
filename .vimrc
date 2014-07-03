let mapleader = ","

" before plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" load plugins
Bundle "gmarik/vundle"
source ~/.vim/bundles.vim

" after plugins
filetype indent plugin on

" keys and functions
source ~/.vim/keybindings.vim
source ~/.vim/functions.vim

" plugin config
source ~/.vim/config/ctrlp.vim
source ~/.vim/config/evervim.vim
source ~/.vim/config/filebrowser.vim
source ~/.vim/config/multicursor.vim
source ~/.vim/config/omni.vim
source ~/.vim/config/tasklist.vim
source ~/.vim/config/unstack.vim
source ~/.vim/config/xptemplate.vim
source ~/.vim/config/yankstack.vim
source ~/.vim/config/tagbar.vim
source ~/.vim/config/syntastic.vim
source ~/.vim/config/statusline.vim

" tags - from driectory of current file, then cwd, then upwards to /
set tags=./tags,tags;/

""""""""""""""""""""""""""""""""""""""""
" settings
""""""""""""""""""""""""""""""""""""""""
colorscheme muon
syntax on                         " highlight
set backspace=indent,eol,start    " intuitive backspacing in insert mode
set encoding=utf-8                " encoding
set hidden                        " allow unsaved buffer switches
set history=1000                  " keep longer history
set relativenumber                " line numbers relative to cursor
set autoread                      " automatically re-read file on outside change
set nocompatible                  " dont bother being compatible with vi
set lazyredraw                    " dont redraw until macro is complete
set mouse=a                       " enable mouse in all modes

set autoindent                    " keep indent on newline
set smartindent                   " auto-indent (block/language)
set shiftround                    " round to whole indents
set shiftwidth=2                  " indent = 2 chars
set softtabstop=2                 " 2 tab = 2 spaces
set expandtab                     " tabs are spaces
set wrap linebreak nolist         " soft wrap lines
set breakat=" "                   " where to insert line breaks
let &showbreak="↪ "               " character to visualize breaks

set noesckeys                     " don't wait for esc!

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
" runtime ftplugin/man.vim          " enable viewing manpages with :Man <smtn>

set ignorecase                    " use smart case searching, only search for \
set smartcase                     " case sensitive words if search has capital
set incsearch                     " ...dynamically as they are typed.
set wrapscan                      " make search wrap
set hlsearch                      " highlight search-terms
set hlsearch!

set formatoptions-=t              " don't hard wrap

" disable all bells
set noerrorbells
set visualbell
set t_vb=

" custom invisibles
set listchars=tab:▸\ ,eol:¬

" turn backup off (.swp)
set nobackup
set nowb
set noswapfile

" improve menu on :e <tab>
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn
set wildignore+=node_modules
set wildignore+=target,classes
set wildignore+=dist
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.DS_Store
set wildignore+=*.orig

" dictionary
set dictionary+=/usr/share/dict/words

" statusline
set laststatus=2

" splitting
set splitright splitbelow

" tab labels
set guitablabel=%{GuiTabLabel()}

" wrap lines in diff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" needs to happen last
source ~/.vim/config/removewierdspaces.vim
