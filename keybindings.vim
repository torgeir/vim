" make jk do <esc>
inoremap jk <esc>l

" tab navigation
for i in [1,2,3,4,5,6,7,8,9]
  " os x
  exec "nnoremap <d-" . i . ">      :silent call GoToTab(" . i . ")<cr>"
  exec "inoremap <d-" . i . "> <esc>:silent call GoToTab(" . i . ")<cr>a"

  " general
  exec "nnoremap <leader>" . i . "      :silent call GoToTab(" . i . ")<cr>"
  exec "inoremap <leader>" . i . " <esc>:silent call GoToTab(" . i . ")<cr>a"
endfor

" don't exit visual mode when shifting
vnoremap < <gv2h
vnoremap > >gv2l

" sane line movements
nnoremap j gj
nnoremap k gk

" toggles
noremap <silent> <f2> :YRShow<cr>
noremap <silent> <f3> :GundoToggle<cr>
noremap <silent> <f4> :setlocal paste!<cr>
noremap <silent> <f6> :call CustomFileBrowserToggle()<cr>
noremap <silent> <f7> :TagbarToggle<cr>:wincmd p<cr>

" nerdtree
noremap <silent> <leader>nt :NERDTreeFind<cr>

" tasklist
noremap <leader>l <Plug>TaskList

" rainbow parenthesis and colors
noremap <leader>R :RainbowParenthesesToggle<cr>

" moving between windows
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" faster window size
nnoremap <c-w>+ 3<c-w>+
nnoremap <c-w>- 3<c-w>-
nnoremap <c-w>> 6<c-w>>
nnoremap <c-w>< 6<c-w><

" faster scroll (ey du fb)
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>

" fix regex search
noremap ? ?\v
noremap / /\v

" visually select previously searched word
"noremap <c-n> <esc>//s<cr>v//e+1<cr>

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
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>

" clean up whitespace file wide, sets mark a initially, and jumps back
nnoremap <leader>W mw:%s/\(\\\)\@<!\s*$//e<cr>:%s/ / /e<cr>:let @/=''<cr>`w

" leader-s save
noremap  <leader>s <esc>:w<cr>
inoremap <leader>s <esc>:w<cr>
vnoremap <leader>s <esc>:w<cr>

" leader-w to close
noremap  <silent> <leader>w <esc>:q<cr>:wincmd p<cr>
vnoremap <silent> <leader>w <esc>:q<cr>:wincmd p<cr>
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
nnoremap <leader>e :call GoToTest('e')<cr>
nnoremap <leader>gtv :call GoToTest('vs')<cr>
nnoremap <leader>gts :call GoToTest('sp')<cr>

" align lines on = or :
noremap  <leader>a= :Tabularize /=<cr>
vnoremap <leader>a= :Tabularize /=<cr>
noremap  <leader>a: :Tabularize /:\zs<cr>
noremap  <leader>a: :Tabularize /:\zs<cr>

" run tests in "tests" screen tab, name the session with c-a:sessionname dione
nnoremap <silent> <leader>. :call system("screen -S dione -p tests -X stuff 'clear; make browser-test'$'\012'")<cr>

" sort css properties
command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort

ab lorem Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

" store sessions on exit, reload on enter
" autocmd VimEnter * nested :call LoadSession()
" autocmd VimLeave * :call MakeSession()
"

" change inside
onoremap in( :normal! f(vi(<cr>
onoremap in[ :normal! f[vi[<cr>
onoremap in{ :normal! f{vi{<cr>

" change numbers. great for CSS
" TODO: Handle floats.
onoremap N  :<c-u>call NumberTextObject(0)<cr>
xnoremap N  :<c-u>call NumberTextObject(0)<cr>
onoremap aN :<c-u>call NumberTextObject(1)<cr>
xnoremap aN :<c-u>call NumberTextObject(1)<cr>
onoremap iN :<c-u>call NumberTextObject(1)<cr>
xnoremap iN :<c-u>call NumberTextObject(1)<cr>

