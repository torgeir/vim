if has("unix")

  colorscheme solarized
  
  " load vim-in-unix-shell shortcuts
  source ~/.vim/keybindings.vim.vim

endif

" project tree
autocmd VimEnter * call CdIfDirectory(expand("<amatch>"))
autocmd FocusGained,BufWritePost * call RefreshTree()
"autocmd WinEnter * call CloseIfOnlySidebarsLeft()

" toggle yankring 
noremap <silent> <f2> :YRShow<cr>

" toggle gundo 
noremap <silent> <f3> :GundoToggle<cr>

" toggle paste
noremap <silent> <f4> :setlocal paste!<cr>

" toggle bg
"noremap <silent> <f5> :call ToggleMolokaiBg()<cr>
call togglebg#map("<f5>")

" toggle nerdtree
noremap <silent> <f6> :call CustomNerdTreeToggle()<cr>

" toggle tagbar
noremap <silent> <f7> :TagbarToggle<cr>:wincmd p<cr>

" command-t
noremap <silent> <leader>t :CommandT<cr>

" ack search
noremap <leader>f :Ack!<space>

" scratch pad
noremap <silent> <leader><enter> :Scratch<cr>

" Replace word under cursor, 
map <leader>r :%s/\<<c-r><c-w>\>//gc

" colorize hex
noremap <leader>C :ColorToggle<cr>

" rainbow parenthesis
noremap <leader>R :RainbowParenthesesToggle<cr>

" disable arrows
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" tab movement
nnoremap <silent> <c-tab> :tabnext<cr>
nnoremap <silent> <c-s-tab> :tabprevious<cr>

" moving between windows
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" window size
nnoremap <c-w>+ 3<c-w>+
nnoremap <c-w>- 3<c-w>-
nnoremap <c-w>> 6<c-w>>
nnoremap <c-w>< 6<c-w><

" faster scroll - ey du fb
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>

" hex editor
nnoremap <leader>hon :%!xxd<cr>
nnoremap <leader>hof :%!xxd -r<cr>

" textmate like formatting
nnoremap <leader>q gqip

" keep search matches in window center
nnoremap * *zzzv 
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" expand blocks on <cr> inside
inoremap <cr> <c-r>=ExpandBlock(["[]", "{}"])<cr>

" don't exit visual mode when shifting
vnoremap < <gv2h
vnoremap > >gv2l

" bash like command line keys 
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-k> <c-u>
cnoremap <c-n> j
cnoremap <c-p> k

" general leader bindings
nnoremap <leader>m  :make!<cr><cr>:cc<cr>
nnoremap <leader>mn :cn<cr>
nnoremap <leader>nn  :! node %<cr>
nnoremap <leader>nb  :! npm install<cr>
nnoremap <leader>i  :set list!<cr>
nnoremap <leader>ev :tabe ~/.vim/.vimrc<cr>
nnoremap <leader>eg :tabe ~/.vim/.gvimrc<cr>
nnoremap <leader>ek :tabe ~/.vim/keybindings.vim<cr>
nnoremap <leader>ef :tabe ~/.vim/functions.vim<cr>
nnoremap <leader>es :tabe ~/.vim/snippets/<cr>
nnoremap <leader>c  :Bclose<cr>

" insert semicolon, comma, dot at line end
nnoremap <leader>} mzA}<esc>`z
nnoremap <leader>) mzA)<esc>`z
nnoremap <leader>; mzA;<esc>`z
nnoremap <leader>, mzA,<esc>`z
nnoremap <leader>. mzA.<esc>`z
vnoremap <leader>} :s/$/}/g<cr>;
vnoremap <leader>) :s/$/)/g<cr>;
vnoremap <leader>; :s/$/;/g<cr>;
vnoremap <leader>, :s/$/,/g<cr>,
vnoremap <leader>. :s/$/./g<cr>.

" clean up whitespace file wide
nnoremap <leader>W :%s/\s\+$//<cr>:%s/ / /<cr>:let @/=''<cr>

" change filetypes
nnoremap <silent> <leader>fth :set filetype=html<cr>
nnoremap <silent> <leader>ftj :set filetype=javascript<cr>
nnoremap <silent> <leader>ftc :set filetype=css<cr>

" clear highligted search
nnoremap <silent> <leader><space> :set hlsearch!<cr>

" quickfix window for last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" fix regex search
"noremap ? /\v
"noremap / /\v

" sort css properties
command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort

ab loremm Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

" store sessions on exit, reload on enter
" autocmd VimEnter * nested :call LoadSession()
" autocmd VimLeave * :call MakeSession()
