" If the parameter is a directory, cd into it
function! CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer or tagbar buffer
function! CloseIfOnlySidebarsLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif

  if exists("__Tagbar__")
    if bufwinnr("__Tagbar__") != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" toggle molokai bg
function! ToggleMolokaiBg()
  "let g:molokai_original = g:molokai_original ? 0 : 1
  "syntax reset
  "syntax on
endfunction


" NERDTree utility function
function! RefreshTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  endif

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      endif
    endif
  endif

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

" return current dir for statusline
function! CurDir()
  let curdir = substitute(getcwd(), '/Users/torgeir/', "~/", "g")
  return curdir
endfunction

" returns paste for status line (colors from molokai theme)
function! ShowPaste()
  if &paste
    hi StatusLine guifg=#F92672
  else
    hi StatusLine guifg=#455354 guibg=fg
  endif
  redrawstatus
  return ''
endfunction

" toggle molokai bg
function! ToggleMolokaiBg()
  let g:molokai_original = g:molokai_original ? 0 : 1
  syntax reset
  syntax on
endfunction

" custom nerdtreetoggle ensures only ONE nerd_tree window
function! CustomNerdTreeToggle()
    exe "normal \<esc>:NERDTreeToggle \| :silent NERDTreeMirror\<cr>"
endfunction

" changes tab
function! GoToTab(tab)
  let tagbarwinnr = bufwinnr("__Tagbar__")
  if tagbarwinnr != -1
    exe "normal \<esc>:TagbarClose\<cr>"
  endif

  let nerdtreewinnr = bufwinnr("NERD_tree_1") 
  if nerdtreewinnr != -1
    exe "normal \<esc>:NERDTreeToggle\<cr>"
  endif

  exe "normal " . a:tab . "gt"

  if tagbarwinnr != -1
    exe "normal \<esc>:TagbarOpen\<cr>"
  endif

  if nerdtreewinnr != -1
    call CustomNerdTreeToggle()
  endif

  wincmd p

endfunction

" expands a block on enter inside
function! ExpandBlock(blocks)
  let col = col('.') - 1
  let charBeforeCol = getline('.')[col-1]
  let charAtCol = getline('.')[col]

  for block in a:blocks
    let openingChar = block[0]
    let closingChar = block[1]

    if openingChar == charBeforeCol && closingChar == charAtCol
      return "\<del>\<cr>" . closingChar . "\<esc>O"
    endif
  endfor

  return "\<cr>"
endfunction

" shows +, number of windows, and file name in each tab
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor

  " Append the number of windows in the tab page if more than one
  let wincount = tabpagewinnr(v:lnum, '$')
  if wincount > 1
    let label .= wincount
  endif
  if label != ''
    let label .= ' '
  endif

  " Append the buffer name
  return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
endfunction


" remember sessions
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" ConqueTerm wrapper
" function! StartTerm()
"   execute 'ConqueTerm ' . $SHELL
"   setlocal listchars=tab:\ \
" endfunction

" completes block 
"function! CompleteBlock(char, ...)
"  let col = col('.') - 1
"  let charBeforeCol = getline('.')[col-1]
"  let charAtCol = getline('.')[col]
"
"  if charAtCol == a:char
"    call cursor(0, col + 2)
"    return ""
"  end
"
"  if a:0 > 0 && charAtCol !~ "[a-zA-Z_0-9!]"
"    if a:0 == 2 && a:2 == "1"
"      if charBeforeCol !~ "[a-zA-Z_0-9!]" && charBeforeCol != a:char
"        return a:char . a:1 . "\<left>"
"      endif
"    else
"      return a:char . a:1 . "\<left>"
"    endif
"  endif
"
"  return a:char
"endfunction

" removes outer block on backspace when cursor is inside/after
"function! RemoveEmptyBlock(blocks)
"  let col = col('.') - 1
"  let charBeforeBeforeCol = getline('.')[col-2]
"  let charBeforeCol = getline('.')[col-1]
"  let charAtCol = getline('.')[col]
"
"  for block in a:blocks
"    let openingChar = block[0]
"    let closingChar = block[1]
"
"    if openingChar == charBeforeCol && closingChar == charAtCol
"      return "\<right>\<bs>\<bs>"
"    elseif openingChar == charBeforeBeforeCol && closingChar == charBeforeCol
"      return "\<bs>\<bs>"
"    endif
"  endfor
"
"  return "\<bs>"
"endfunction

" toggles comments on selected lines 
" let g:comments = { 'vim' : '" ', 'javascript' : '// ', 'ruby' : '# ' }
" function! Comment()
"   let line = getline('.')
"   let comment = g:comments[&filetype]
"   if match(line, '^'.comment) >= 0
"     let line_wo_comment = substitute(line, '^'.comment, '', '')
"     call setline('.', line_wo_comment)
"   else
"     let line_w_comment = substitute(line, '^', comment, '')
"     call setline('.', line_w_comment)
"   endif
" endfunction

" function! RunScalaTest()
  " exe silent !make install
" endfunction

