let s:previousMarks = []
let s:marks = []
let s:highlights = []
let s:highlightColor = "Search"

" sets a mark at the current cursor position
function! s:SetMark()
  let l:mark = getpos(".")
  call s:AddMark(l:mark)
  call s:HighlightMark(l:mark)
  call s:LogPos("mark", l:mark)
endfunction

" adds a getpos() mark to the list of marks
function! s:AddMark(mark)
  call add(s:marks, a:mark)
endfunction

" clears out all marks and their highlight
function! s:ClearMarks()
  let s:marks = []
  call s:RemoveHighlights()
  call s:Log("cleared")
endfunction

" highlights all marks in the list
function! s:HighlightMarks()
  call s:RemoveHighlights()

  for l:mark in s:marks
    call s:HighlightMark(mark)
  endfor
endfunction

" highlights a single mark in a line
function! s:HighlightMark(mark)
  let l:line = a:mark[1]
  let l:col  = a:mark[2]
  call add(s:highlights, matchadd(s:highlightColor, '\%'.l:line.'l\%'.l:col.'c.'))
endfunction

" removes highlights for all marks
function! s:RemoveHighlights()
  for l:highlight in s:highlights
    call s:RemoveHighlight(l:highlight)
  endfor
  let s:highlights = []
endfunction

" removes highlight for one mark, ignores nonexisting highlights
function! s:RemoveHighlight(highlight)
  try
    call matchdelete(a:highlight)
  catch /\V\^Vim(call):E803:/
    " ignore not found
  endtry
endfunction

" kills a single mark, removing it and its highlight
function! s:KillMark()
  let l:target = getpos(".")
  let l:newMarks = []

  for l:i in range(0, len(s:marks) - 1)
    let l:mark = s:marks[l:i]
    " re-add all that is not the killed one
    if l:mark[1] != l:target[1] || l:mark[2] != l:target[2]
      call add(l:newMarks, l:mark)
    else
      call s:LogPos("kill", l:target)
    endif
  endfor

  let s:marks = l:newMarks

  call s:HighlightMarks()

endfunction

" cycle through all marks, jumping to each one
let s:current = 0
function! s:CycleMarks()
  call s:GotoMark(s:current)
  let s:current = (s:current + 1) % len(s:marks)
endfunction

" move the cursor to a mark
function! s:GotoMark(n)
  if a:n >= len(s:marks)
    call s:Log("no mark", a:n)
    return
  endif

  let l:mark = s:marks[a:n]
  call setpos(".", l:mark)

  call s:LogPos("goto", l:mark)
endfunction

" perform command at all marks
function! s:PerformCommand(command)

  " bail out
  if a:command ==# ""
    call s:Log("abort")
    return
  endif

  " in reverse helps for non overlapping deletes in the same line, so the marks do not move
  for l:mark in reverse(s:marks)
    call s:PerformCommandAtMark(l:mark, a:command)
  endfor

  call s:RemoveHighlights()

  " (naivly) fix marks that may have invalid positions after command has been
  for l:mark in s:marks
    call s:FixPositions(l:mark)
  endfor

  call s:HighlightMarks()

  call s:Log("performed :normal", a:command, "on", len(s:marks), "marks")
endfunction

" attempts to fix and update the position for invalid marks after commands have been run
function! s:FixPositions(mark)
  let l:lineLength = strlen(getline(a:mark[1]))
  let l:markPos = a:mark[2]

  " end of line moved in front of  cursor
  if l:markPos >= l:lineLength
    " set mark to end of line
    let a:mark[2] = l:lineLength
  endif
endfunction

" perform a command in normal mode based on what the user typed
function! s:PerformCommandAtMark(mark, command)
  call setpos(".", a:mark)
  exe "normal! " . a:command
endfunction

" log current marks and highlights
function! s:LogMarks()
  call s:Log("log", s:marks, s:highlights)
endfunction

" log a mark's position
function! s:LogPos(text, mark)
  call s:Log(a:text, a:mark[2] . "," . a:mark[1])
endfunction

" vararg debug function
function! s:Log(...)
  echo "marks: " . join(a:000, " ")
endfunction

nnoremap <c-c><c-m> :call <SID>PerformCommand(input(":normal "))<cr>
nnoremap <c-c><c-n> :call <SID>SetMark()<cr>
nnoremap <c-c><c-k> :call <SID>KillMark()<cr>
nnoremap <c-c><c-h> :call <SID>HighlightMarks()<cr>
nnoremap <c-c><c-l> :call <SID>LogMarks()<cr>
nnoremap <c-c><c-d> :call <SID>ClearMarks()<cr>
nnoremap <c-c><c-x> :call <SID>CycleMarks()<cr>
