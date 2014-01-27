let g:multicursor_quit = 'q'

nnoremap <c-c><c-n> :call MultiCursorPlaceCursor()<cr>ye/<c-r><c-"><cr>
nnoremap <c-c><c-w> :call MultiCursorSearch("<c-r><c-w>")<cr>
nnoremap <c-c><c-m> :call MultiCursorManual()<cr>
nnoremap <c-c><c-v> :call MultiCursorVisual()<cr>
nnoremap <c-c><c-c> :call MultiCursorRemoveCursors()<cr>
