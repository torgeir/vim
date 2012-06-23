" sets width of tabbar
let g:tagbar_width = 30

" shows selected tag in tagbar
let g:tagbar_autoshowtag = 1

" use compact style
let g:tagbar_compact = 1

" toggle tagbar
noremap <silent> <f7> :TagbarToggle<cr>:wincmd p<cr>
