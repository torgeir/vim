" custom snippets
set runtimepath+=~/.vim/snippets/

" avoid conflict
let g:SuperTabMappingForward = '<Plug>supertabKey'

" if nothing matched in xpt, try supertab
let g:xptemplate_fallback = '<Plug>supertabKey'

" xpt uses <Tab> as trigger key
let g:xptemplate_key = '<Tab>'

" show matches, if several
"let g:xptemplate_always_show_pum = 1
