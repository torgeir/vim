" Open on vim open
" autocmd VimEnter * TagbarOpen

" sets width of tabbar
let g:tagbar_width = 30

" navigate to tags with single click
let g:tagbar_singleclick = 1

" minimum fold level
let g:tagbar_foldlevel = 2

" shows selected tag in tagbar
let g:tagbar_autoshowtag = 1

" use compact style
let g:tagbar_compact = 1

" sort
let g:tagbar_sort = 1

" set autofocos on open
" let g:tagbar_autofocus = 1

" autmatically close when moving to a tag 
" let g:tagbar_autoclose = 0

" toggle tagbar
noremap <silent> <f7> :TagbarToggle<cr>:wincmd p<cr>
