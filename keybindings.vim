" move line(s) of text 
nnoremap <silent> <leader>j mz:m+<cr>`z
nnoremap <silent> <leader>k mz:m-2<cr>`z
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

  " unix terminal
  exec "nnoremap <leader>" . i . "  :silent call GoToTab(" . i . ")<cr>"
endfor

" tab next/previous
noremap  <leader><tab> :tabn<cr>
inoremap <leader><tab> <esc>:tabn<cr>a
noremap  <leader><s-tab> :tabp<cr>
inoremap <leader><s-tab> <esc>:tabp<cr>a

" tab movement
nnoremap <silent> <c-tab> :tabnext<cr>
nnoremap <silent> <c-s-tab> :tabprevious<cr>

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
noremap ? /\v
noremap / /\v

" replace word under cursor
map <leader>r :%s/\<<c-r><c-w>\>//gc

" keep search matches in window center
nnoremap * *zzzv 
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" center screen when jumping through the changelist
nnoremap g; g;zz
nnoremap g, g,zz

" quickfix window for last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" clear highligted search
nnoremap <silent> <leader><space> :nohlsearch<cr>

" expand blocks on <cr> inside
inoremap <cr> <c-r>=ExpandBlock(["[]", "{}"])<cr>

" bash like command line keys 
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-k> <c-u>
cnoremap <c-n> j
cnoremap <c-p> k

" general leader bindings
nnoremap <leader>m  :make!<cr><cr>:cc<cr>
nnoremap <leader>nn  :! node %<cr>
nnoremap <leader>nb  :! npm install<cr>
nnoremap <leader>i  :set list!<cr>
nnoremap <leader>ev :tabe ~/.vim/.vimrc<cr>
nnoremap <leader>eg :tabe ~/.vim/.gvimrc<cr>
nnoremap <leader>ek :tabe ~/.vim/keybindings.vim<cr>
nnoremap <leader>ef :tabe ~/.vim/functions.vim<cr>
nnoremap <leader>es :tabe ~/.vim/snippets/<cr>
nnoremap <leader>c  :Bclose<cr>

" clean up whitespace file wide
nnoremap <leader>W :%s/\s\+$//e<cr>:%s/ / /e<cr>let @/=''<cr>

" sort css properties
command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort

ab loremm Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

" store sessions on exit, reload on enter
" autocmd VimEnter * nested :call LoadSession()
" autocmd VimLeave * :call MakeSession()
