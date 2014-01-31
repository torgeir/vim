let mapleader = ","

augroup vimrc_reload
  autocmd!
  if has("gui_running") " reload vimrc and gvimrc on save
    autocmd BufWritePost .*imrc,*.vim so $MYVIMRC | so $MYGVIMRC
  else " reload vimrc on save
    autocmd BufWritePost .vimrc,*.vim so $MYVIMRC
  endif
augroup END

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ciaranm/inkpot.git
" derekwyatt/vim-scala.git
" groenewege/vim-less.git
" tyok/js-mask
" hallison/vim-markdown.git
" jondistad/vimclojure.git
" ajf/puppet-vim.git
" mmalecki/vim-node.js.git
" wavded/vim-stylus.git
" digitaltoad/vim-jade.git
" vim-scripts/applescript.vim.git
" kchmck/vim-coffee-script.git
" vim-scripts/nginx.vim.git
" davidbalbert/vim-io.git
" nono/vim-handlebars.git
" leafgarland/typescript-vim.git
" MarcWeber/vim-addon-mw-utils.git
" tomtom/tlib_vim.git
" vim-scripts/TaskList.vim.git
" majutsushi/tagbar.git
" scrooloose/nerdtree.git
" scrooloose/nerdcommenter.git
" sjl/gundo.vim.git
" tpope/vim-repeat.git
" vim-scripts/YankRing.vim.git
" duff/vim-scratch.git
" greyblake/vim-preview.git
" lilydjwg/colorizer.git
" tpope/vim-surround.git
" vim-scripts/Tail-Bundle.git
" jpalardy/vim-slime
" mattn/gist-vim
" kien/rainbow_parentheses.vim
" kien/ctrlp.vim.git
" scrooloose/syntastic.git
" tsaleh/vim-supertab.git
" drmingdrmer/xptemplate.git
" endel/ctrlp-filetype.vim.git
" mattn/ctrlp-hackernews.git
" mattn/ctrlp-register.git
" mattn/webapi-vim.git
" tyru/open-browser.vim.git
" rbgrouleff/bclose.vim.git
" tpope/vim-fugitive.git
" maksimr/vim-jsbeautify.git
" Townk/vim-autoclose.git
" airblade/vim-gitgutter.git
" tpope/vim-fireplace.git
" tpope/vim-classpath.git
" guns/vim-clojure-static.git
" kakkyz81/evervim.git
" mattboehm/vim-unstack.git
" skammer/vim-css-color
" zerowidth/vim-copy-as-rtf.git
" godlygeek/tabular.git
" paradigm/vim-multicursor.git
" junegunn/goyo.vim.git
" tpope/vim-unimpaired.git
" nelstrom/vim-visual-star-search.git
" tpope/vim-abolish.git
" terryma/vim-expand-region.git
" tpope/vim-dispatch.git
" pangloss/vim-javascript.git

" disabled plugins
"let g:pathogen_disabled = []

" load plugins
"filetype off
"call pathogen#infect()
"call pathogen#helptags()

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
source ~/.vim/config/omnicomplete.vim
source ~/.vim/config/tasklist.vim
source ~/.vim/config/togglebg.vim
source ~/.vim/config/multicursor.vim
source ~/.vim/config/xptemplate.vim
source ~/.vim/config/yankring.vim
source ~/.vim/config/syntastic.vim
source ~/.vim/config/evervim.vim
source ~/.vim/config/unstack.vim

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
colorscheme badwolf
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
set wildmode=list:longest,full
set wildignore+=.git,node_modules,target

" dictionary
set dictionary+=/usr/share/dict/words

" status line
set laststatus=2

" format the status line
set statusline=%y
set statusline+=\ "
set statusline+=%#error#%{&paste?'[paste]':''}%*
set statusline+=\ "
set statusline+=%{fugitive#statusline()}
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

call matchadd("spellbad", " ")

" highlight lines ending in non-escaped whitespace
highlight TrailingWhitespace ctermbg=red guibg=red guifg=red
autocmd BufWinLeave * call clearmatches() | call matchadd("spellbad", " ")
autocmd InsertEnter * call clearmatches() | call matchadd("spellbad", " ")
autocmd BufWinEnter,InsertLeave * call clearmatches() | call matchadd("spellbad", " ") | match TrailingWhitespace /\(\\\)\@<!\s$/ " negative lookbehind for escape char \ before any trailing space(s) (i.e.  don't match if \ the preceeds space)

" test:
"   should show this one in red 
"   should not show this one in red\ 
