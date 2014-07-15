" to the right
let g:NERDTreeWinPos = "left"

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

" hijack NETRW for local files
let NERDTreeHijackNetrw = 1
let NERDTreeIgnore=['\.$', '\~$']

" project tree
augroup file_browser
  autocmd!

  " change cwd if directory on opening vim
  autocmd VimEnter * call CdIfDirectory(expand("<amatch>"))

  " refresh file browser when writing gaining focus/writing files
  autocmd FocusGained,BufWritePost * call RefreshFileBrowser()

  "autocmd WinEnter * call CloseIfOnlySidebarsLeft()
augroup END
