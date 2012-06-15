" ctrlp
let g:ctrlp_match_window_reversed = 0

" adjust height
let g:ctrlp_max_height = 12

" enable an extensions
let g:ctrlp_extensions = ['hackernews', 'register', 'tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'yankring', 'cmdline', 'menu']

"" fix enter
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<c-t>', '<MiddleMouse>'], 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>']}

" directry call an extension
fu! s:call_ctrlp_extension(ext)
    if !exists('g:ctrlp_builtins')
        ru ~/.vim/bundle/ctrlp/autoload/ctrlp.vim
    en
    cal ctrlp#init(ctrlp#{a:ext}#id())
endf

" Then create some mappings:
nnoremap <silent> <leader>tg  :call <SID>call_ctrlp_extension('tag')<cr>
nnoremap <silent> <leader>tb  :CtrlPBufTag<cr>
nnoremap <silent> <leader>tq  :call <SID>call_ctrlp_extension('quickfix')<cr>
nnoremap <silent> <leader>td  :call <SID>call_ctrlp_extension('dir')<cr>
nnoremap <silent> <leader>th  :call <SID>call_ctrlp_extension('hackernews')<cr>
nnoremap <silent> <leader>tr  :call <SID>call_ctrlp_extension('register')<cr>
nnoremap <silent> <leader>trs :call <SID>call_ctrlp_extension('rtscript')<cr>
nnoremap <silent> <leader>tu  :call <SID>call_ctrlp_extension('undo')<cr>
nnoremap <silent> <leader>tl  :call <SID>call_ctrlp_extension('line')<cr>
nnoremap <silent> <leader>ty  :call <SID>call_ctrlp_extension('yankring')<cr>
nnoremap <silent> <leader>tc  :call <SID>call_ctrlp_extension('cmdline')<cr>
nnoremap <silent> <leader>tm  :call <SID>call_ctrlp_extension('menu')<cr>
nnoremap <silent> <leader>tf  :call <SID>call_ctrlp_extension('filetype')<cr>
