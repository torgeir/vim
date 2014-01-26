" clean up whitespace file wide, sets mark a initially, and jumps back
nnoremap <leader>W mw:%s/\(\\\)\@<!\s*$//e<cr>:%s/ / /e<cr>:let @/=''<cr>`w

" make jk do <esc>
inoremap jk <esc>l

" change inside
onoremap in( :normal! f(vi(<cr>
onoremap in[ :normal! f[vi[<cr>
onoremap in{ :normal! f{vi{<cr>

" move line(s) of text
nnoremap <silent> <leader>j mz:m+<cr>`z==
nnoremap <silent> <leader>k mz:m-2<cr>`z==
vnoremap <silent> <leader>j :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <silent> <leader>k :m'<-2<cr>`>my`<mzgv`yo`z

" leader-s save
noremap  <leader>s <esc>:w<cr>
inoremap <leader>s <esc>:w<cr>
vnoremap <leader>s <esc>:w<cr>

" leader-w to close
noremap  <silent> <leader>w <esc>:q<cr>:wincmd p<cr>
vnoremap <silent> <leader>w <esc>:q<cr>:wincmd p<cr>
inoremap <silent> <leader>w <esc>:q<cr>:wincmd p<cr>

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

" toggle paste
noremap <silent> <f4> :setlocal paste!<cr>

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

" hex editor
nnoremap <leader>hon :%!xxd<cr>
nnoremap <leader>hof :%!xxd -r<cr>

" textmate like formatting
nnoremap <leader>q gqap
vnoremap <leader>q gq

" fix regex search
noremap ? ?\v
noremap / /\v

" replace word under cursor
map <leader>r :%s/\<<c-r><c-w>\>//gc

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
"nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

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
nnoremap <leader>m  :make!<cr><cr>:cc<cr>
nnoremap <leader>n  "zyiw:exe "!npm install " . @z<cr>
nnoremap <leader>nb :! npm install<cr>
nnoremap <leader>i  :set list!<cr>
nnoremap <leader>ev :tabe ~/.vim/.vimrc<cr>
nnoremap <leader>eg :tabe ~/.vim/.gvimrc<cr>
nnoremap <leader>ek :tabe ~/.vim/keybindings.vim<cr>
nnoremap <leader>ef :tabe ~/.vim/functions.vim<cr>
nnoremap <leader>es :tabe ~/.vim/snippets/<cr>
nnoremap <leader>ed :tabe ~/Dropbox/dotfiles/<cr>

" vim-fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>

" buster focus rocket
nnoremap <leader>bf  mb[{0f'a=> `b
nnoremap <leader>bfc mb[{0f'ldw`b

" buster comment
nnoremap <leader>bc  mb[{0f'a// `b
nnoremap <leader>bcc mb[{0f'ldw`b

" go to tests for file
nnoremap <leader>gt :call GoToTest('tabe')<cr>
nnoremap <leader>e :call GoToTest('e')<cr>
nnoremap <leader>gtv :call GoToTest('vs')<cr>
nnoremap <leader>gts :call GoToTest('sp')<cr>

" run tests in "tests" screen tab, name the session with c-a:sessionname dione
nnoremap <silent> <leader>. :call system("screen -S dione -p tests -X stuff 'clear; make browser-test'$'\012'")<cr>

" sort css properties
command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort

ab loremm Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

" store sessions on exit, reload on enter
" autocmd VimEnter * nested :call LoadSession()
" autocmd VimLeave * :call MakeSession()
