""""""""""""""""""""""""""""""""""""""""
" Test runnner
""""""""""""""""""""""""""""""""""""""""
" inspiration from https://github.com/dahu/VimTestRunner/blob/master/plugin/vimtestrunner.vim
 
" hi Green guifg=green ctermfg=2
" hi Red guifg=red ctermfg=1
" 
" let g:makeprgs = { 'javascript': { 'file' : 'expresso\ -I\ lib\ ', 'project' : 'expresso\ -I\ lib' }}
" 
" let g:run_tests = 0
" 
" " toggles test runner on file write event
" function! ToggleTestRunner()
"   if !g:run_tests
"     echo 'Test runner:' | echohl Green | echon ' on' | echohl
"     augroup tests
"       autocmd BufWritePost * call RunTests('')
"     augroup END
"     let g:run_tests = 1
"   else
"     echo 'Test runner:' | echohl Red | echon ' off' | echohl
"     autocmd! tests
"     let g:run_tests = 0
"   endif
" endfunction
" 
" " runs tests for current file 
" function! RunTestsForFile()
"   call RunTests(expand('%:h') . '/' . expand('%:t')) 
" endfunction
" 
" " runs test (make) based on filetype
" function! RunTests(target)
"   let b:ft = &filetype 
"   if !has_key(g:makeprgs, b:ft)
"     return
"   endif
" 
"   silent w
"   if len(a:target) 
"     exec 'set makeprg=' . g:makeprgs[b:ft]['file']
"   else
"     exec 'set makeprg=' . g:makeprgs[b:ft]['project']
"   endif
"   call RunMake(a:target)
"   call ShowTestReport()
" endfunction
" 
" " runs make with arguments
" function! RunMake(args)
"   exec 'make! ' . a:args
" endfunction
" 
" " displays test report in vim status line
" function! ShowTestReport()
"   let passed = 1
"   for error in getqflist()
"     if error['valid']
"       let passed = 0
"       break
"     endif
"   endfor
"   call Bar(passed)
" endfunction
" 
" " show red or green bar based on wether or not tests passed
" function! Bar(passed)
"   if a:passed
"     redraw
"     echo '> ' | echohl Green | echon 'Tests passed!' | echohl
"   else	
"     echo '> ' | echohl Red | echon 'Tests failed.' | echohl
"   endif
" endfunction
