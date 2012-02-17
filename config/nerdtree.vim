" load plugin in current dir
autocmd VimEnter * NERDTree .

" hide it
autocmd VimEnter * NERDTreeToggle

" update CWD
let NERDTreeChDirMode = 2

" enable nice colors
let NERDChristmasTree = 1

" make it easy to see where we are
let NERDTreeHighlightCursorline = 1

" make bookmarks visible
let NERDTreeShowBookmarks = 1

" show hidden files
let NERDTreeShowHidden = 1

" don't hijack NETRW
let NERDTreeHijackNetrw = 1
let NERDTreeIgnore=['\.$', '\~$']
