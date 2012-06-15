" more keywords
let g:tlTokenList = ["TODO", "todo"]

for todo in g:tlTokenList
  call matchadd("DiffAdd", todo)
endfor

" remap key
map <leader>l <Plug>TaskList
