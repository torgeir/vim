" bundle install
nnoremap ,bi :BundleInstall<cr>

" make jk do <esc>
inoremap jk <esc>l

" look up :help <word-under-cursor>
nnoremap <c-h> :he <c-r><c-w><cr>

" sane line movements
nnoremap j gj
nnoremap k gk

" tab navigation
for i in [1,2,3,4,5,6,7,8,9]
  " os x
  exec "nnoremap <d-" . i . "> :silent :normal " . i . "gt<cr>"

  " general
  exec "nnoremap <leader>" . i . " :silent :normal " . i . "gt<cr>"
endfor

" don't exit visual mode when shifting
vnoremap < <i> >gv2l

" toggles
noremap <silent> <f2> :YRShow<cr>
noremap <silent> <f3> :GundoToggle<cr>
noremap <silent> <f4> :setlocal paste!<cr>
noremap <silent> <f5> :TagbarToggle<cr>
noremap <silent> <f6> :call CustomFileBrowserToggle()<cr>

" nerdtree
noremap <silent> <leader>nf :NERDTreeFind<cr>

" tasklist
noremap <leader>l <Plug>TaskList<cr>

" rainbow parenthesis and colors
noremap <leader>R :RainbowParenthesesToggle<cr>

" moving between windows
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" fix regex search
noremap ? ?\v
noremap / /\v

" visually select previously searched word
nnoremap \ <esc>//s<cr>v//e+1<cr>

" keep search matches in window center
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" center screen when jumping through the changelist
nnoremap g; g;zz
nnoremap g, g,zz

" quickfix window for last search
nnoremap <silent> <leader><space>q :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" clear highligted search
nnoremap <silent> <leader><space> :set hlsearch!<cr>

" expand blocks on <cr> inside
inoremap <cr> <c-r>=ExpandBlock(["[]", "{}"])<cr>

" bash like command line keys
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-k> <c-u>
cnoremap <c-y> <down>

" general leader bindings
nnoremap <leader>n  "zyiw:exe "!npm install " . @z<cr>
nnoremap <leader>nb :! npm install<cr>
nnoremap <leader>i  :set list!<cr>

" vim edits
nnoremap <leader>ev :tabe ~/.vim/.vimrc<cr>
nnoremap <leader>eg :tabe ~/.vim/.gvimrc<cr>
nnoremap <leader>ek :tabe ~/.vim/keybindings.vim<cr>
nnoremap <leader>ef :tabe ~/.vim/functions.vim<cr>
nnoremap <leader>es :tabe ~/.vim/snippets/<cr>
nnoremap <leader>ed :tabe ~/Dropbox/dotfiles/<cr>

" move line(s) of text
nnoremap <silent> <leader>j mz:m+<cr>`z==
nnoremap <silent> <leader>k mz:m-2<cr>`z==
vnoremap <silent> <leader>j :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <silent> <leader>k :m'<-2<cr>`>my`<mzgv`yo`z

" vim-fugitive
nnoremap <leader>gac :Gcommit -m -a ""<LEFT>
vnoremap <leader>gb :<c-u>!git blame <c-r>=expand("%:p") <cr> \| sed -n <c-r>=line("'<") <cr>,<c-r>=line("'>") <cr>p <cr>
nnoremap <leader>gc :Gcommit -m ""<LEFT>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gr :if confirm('Gread?', "&Yes\n&No", 1)==1 <bar> :Gread <bar> endif<cr><cr>
nnoremap ]h :GitGutterNextHunk<cr>
nnoremap [h :GitGutterPrevHunk<cr>
nnoremap <leader>ghs :GitGutterStageHunk<cr>
nnoremap <leader>ghr :GitGutterRevertHunk<cr>

" open folds
nnoremap <space> za

" clean up whitespace file wide, sets mark a initially, and jumps back
nnoremap <leader>W mw:%s/\(\\\)\@<!\s*$//e<cr>:%s/ / /e<cr>:let @/=''<cr>`w

" leader-s save
noremap  <leader>s <esc>:w<cr>
inoremap <leader>s <esc>:w<cr>

" leader-w to close
noremap  <silent> <leader>w <esc>:q<cr>:wincmd p<cr>
inoremap <silent> <leader>w <esc>:q<cr>:wincmd p<cr>

" hex editor
nnoremap <leader>hon :%!xxd<cr>
nnoremap <leader>hof :%!xxd -r<cr>

" highlight interresting words in pretty colors
nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>
nnoremap <silent> <leader>hd :call HiInterestingClear()<cr>

" textmate like formatting
nnoremap <leader>q gqap
vnoremap <leader>q gq

" replace word under cursor
nnoremap <leader>r :%s/\<<c-r><c-w>\>//gc

" go to tests for file
nnoremap <leader>gt :call GoToTest('tabe')<cr>
nnoremap <leader>ge :call GoToTest('e')<cr>
nnoremap <leader>gtv :call GoToTest('vs')<cr>
nnoremap <leader>gts :call GoToTest('sp')<cr>

" align lines on = or :
nnoremap <leader>a= :Tabularize /=<cr>
vnoremap <leader>a= :Tabularize /=<cr>
nnoremap <leader>a: :Tabularize /:\zs<cr>
vnoremap <leader>a: :Tabularize /:\zs<cr>

" run tests in "tests" screen tab, name the session with c-a:sessionname dione
nnoremap <silent> <leader>. :call system("screen -S dione -p tests -X stuff 'clear; make browser-test'$'\012'")<cr>

" sort css properties
command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort

ab lorem Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

" store sessions on exit, reload on enter
" autocmd VimEnter * nested :call LoadSession()
" autocmd VimLeave * :call MakeSession()

" variable refactorings
vnoremap ev <esc>:call Extract_variable()<cr>
vnoremap ei <esc>:call Inline_variable()<cr>

" change inside
onoremap in( :normal! f(vi(<cr>
onoremap in[ :normal! f[vi[<cr>
onoremap in{ :normal! f{vi{<cr>

" change numbers
onoremap N  :<c-u>call NumberTextObject(0)<cr>
xnoremap N  :<c-u>call NumberTextObject(0)<cr>
onoremap aN :<c-u>call NumberTextObject(1)<cr>
xnoremap aN :<c-u>call NumberTextObject(1)<cr>
onoremap iN :<c-u>call NumberTextObject(1)<cr>
xnoremap iN :<c-u>call NumberTextObject(1)<cr>
