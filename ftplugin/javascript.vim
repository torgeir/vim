" load node js tags
setlocal tags+=~/.vim/tags/nodejs

" create tags
silent! !ctags -R &
