" Extract variable refactoring
function! Extract_variable()
  let name = input('Enter variable name: ')
  exe 'normal gv'
  exe 'normal c' . name
  exe 'normal Ovar ' . name . ' = ;'
  exe 'normal P'
endfunction

" Extract variable refactoring
function! Inline_variable()
  exe 'normal \<esc>'
  let name = expand('<cword>')
  exe 'normal k$'
  " go to end of previous line
  call search('\<' . name . '\>', 'b')
  " step over 'var variable = '
  exe 'normal 2f w'
  " select everything to ;
  exe 'normal vt;'
  " delete to register k
  exe 'normal "kd'
  " delete line
  exe 'normal dd'
  " move back to variable
  call search(name)
  " select the variable
  exe 'normal viw'
  " replace it with the contents from register k
  exe 'normal "kp'
endfunction

vnoremap ev <esc>:call Extract_variable()<cr>
vnoremap ei <esc>:call Inline_variable()<cr>

" go to tests for file
function! GoToTest(split)
  exe "normal \<esc>:" . a:split . " test/**/*/" . expand('%:t:r') . '-test.' . expand('%:e') . "\<cr>"
endfunction

" If the parameter is a directory, cd into it
function! CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

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

" custom nerdtreetoggle ensures only ONE nerd_tree window
function! CustomFileBrowserToggle()
  if has('gui_running') && has("mac")
    "exe "normal \<esc>:maca toggleFileBrowser:\<cr>"
    exe "normal \<esc>:NERDTreeToggle \| :silent NERDTreeMirror \<cr>"
  else
    exe "normal \<esc>:NERDTreeToggle \| :silent NERDTreeMirror \<cr>"
  endif
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
    call CustomFileBrowserToggle()
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

" toggle molokai bg
function! ToggleMolokaiBg()
  if exists("g:molokai_original")
    let g:molokai_original = g:molokai_original ? 0 : 1
  endif
  syntax reset
  syntax on
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

" highlight interresting words in code
let s:matchids = []
function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    let matchid = matchadd("InterestingWord" . a:n, pat, 1)

    " keep it
    call add(s:matchids, matchid)

    " Move back to our original location.
    normal! `z
endfunction

function! HiInterestingClear()
  for mid in s:matchids
    call matchdelete(mid)
  endfor
  let s:matchids = []
endfunction

