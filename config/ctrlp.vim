" dont reverse matches
let g:ctrlp_match_window_reversed = 0

" adjust height
let g:ctrlp_max_height = 12

"" fix enter
" let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<c-t>', '<MiddleMouse>'], 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>']}

" enable extensions
let g:ctrlp_extensions = ['hackernews', 'register', 'tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes']

" directry start an extension
fu! s:call_ctrlp_extension(ext)
    if !exists('g:ctrlp_builtins')
        ru ~/.vim/bundle/ctrlp/autoload/ctrlp.vim
    en
    cal ctrlp#init(ctrlp#{a:ext}#id())
endf

" ctrlp
let g:ctrlp_map = '<leader>t'
noremap <silent> <leader>T :CtrlPClearAllCaches<cr>
noremap <silent> <leader>b :CtrlPBuffer<cr>

" extension mappings
nnoremap <silent> <leader>ceg  :call <SID>call_ctrlp_extension('tag')<cr>
nnoremap <silent> <leader>ceb  :CtrlPBufTag<cr>
nnoremap <silent> <leader>ceq  :call <SID>call_ctrlp_extension('quickfix')<cr>
nnoremap <silent> <leader>ced  :call <SID>call_ctrlp_extension('dir')<cr>
nnoremap <silent> <leader>ceh  :call <SID>call_ctrlp_extension('hackernews')<cr>
nnoremap <silent> <leader>cer  :call <SID>call_ctrlp_extension('register')<cr>
nnoremap <silent> <leader>cers :call <SID>call_ctrlp_extension('rtscript')<cr>
nnoremap <silent> <leader>ceu  :call <SID>call_ctrlp_extension('undo')<cr>
nnoremap <silent> <leader>cel  :call <SID>call_ctrlp_extension('line')<cr>
nnoremap <silent> <leader>cef  :call <SID>call_ctrlp_extension('filetype')<cr>
