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

" go to tests for file
function! GoToTest(split)
  exe "normal \<esc>:" . a:split . " tests/**/" . expand('%:t:r') . '-test.' . expand('%:e') . "\<cr>"
endfunction

" If the parameter is a directory, cd into it
function! CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)

  if (empty(a:directory))
    let directory = "."
  else
    let directory = explicitDirectory
  endif

  if directory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

endfunction

" NERDTree utility function
function! RefreshFileBrowser(...)
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

  if exists(":CtrlPClearCache") == 2
    CtrlPClearCache
  endif
endfunction

" return current dir for statusline
function! CurDir()
  let curdir = substitute(getcwd(), '/Users/torgeir/', "~/", "g")
  return curdir
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
function! SaveSession()
  let b:sessiondir = $HOME . "/tmp/vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/tmp/vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" text object for numbers, e.g. css
function! NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction

" show the stack of syntax hilighting classes affecting whatever is under the cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc

" close hidden buffers
command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

" Run text object with js macros
" function! RunJs(vt, ...)
"   let s = InputChar()
"   if s =~ "\<esc>" || s =~ "\<c-c>"
"     return
"   endif
"
"   " get start line and char
"   let [sl, sc] = getpos(a:0 ? "'<" : "'[")[1:2]
"   " get end line and char
"   let [el, ec] = getpos(a:0 ? "'>" : "']")[1:2]
"   if a:vt == 'line' || a:vt == 'V'
"     let currentbuffer = bufname("%")
"     let contentlines = getbufline(currentbuffer, sl, el)
"     call RunLinesWithJsMacros(contentlines, s)
"   else
"     echo "no such mode for vt"
"   endif
" endfunction

function! RunLinesWithJsMacros(lines, input)
  let showCompiled = 0
  if (a:input == 'l')
    let showCompiled = 1
  endif

  " let code = shellescape(join(a:lines, "\n"))

  " write to tmp file
  execute "w! ~/tmp/js-macro-from-vim-buffer.js"
  let command = ":Dispatch ~/.sweetjs-macros/load-macros.js " . showCompiled
  execute command
endfunction

" get the typed char
function! InputChar()
  let c = getchar()
  return type(c) == type(0) ? nr2char(c) : c
endfunction
