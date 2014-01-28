let s:marks = []

function! s:GotoMark(n)
  if a:n >= len(s:marks)
    echom "no such mark " . a:n . " " . join(s:marks, ",")
    return
  endif

  let mark = s:marks[a:n]
  call setpos(".", mark)
  echom "go to mark " . a:n
endfunction

function! s:PerformCommandAtAllMarks(command)
  for mark in reverse(s:marks)
    call s:PerformCommand(mark, a:command)
  endfor
endfunction

function! s:PerformCommand(mark, command)
  call setpos(".", a:mark)
  exe "normal! " . a:command
endfunction

function! s:AddMark(c)
  call add(s:marks, a:c)
endfunction

function! s:SetMark()
  let loc = getpos(".")
  let mark = loc
  call s:AddMark(mark)
  call s:LogMarks()
endfunction

function! s:ClearMarks()
  let s:marks = []
  call s:LogMarks()
endfunction

function! s:LogMarks()
  echo s:marks
endfunction

function! s:Log(...)
  echo join(a:000, ",")
endfunction

" :scriptnames
noremap <leader>cm  :call <SID>PerformCommandAtAllMarks(input(""))<cr>
noremap <leader>cn  :call <SID>SetMark()<cr>
noremap <leader>cl  :call <SID>LogMarks()<cr>
noremap <leader>cd  :call <SID>ClearMarks()<cr>
noremap <leader>cg1 :call <SID>GotoMark(0)<cr>
noremap <leader>cg2 :call <SID>GotoMark(1)<cr>
noremap <leader>cg3 :call <SID>GotoMark(2)<cr>

