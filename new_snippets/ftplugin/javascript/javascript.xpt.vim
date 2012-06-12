XPTemplate priority=lang-1

let s:f = g:XPTfuncs()

" strip directory portion of a pathname
function! s:f.strip_path(pathname)
  return substitute(system("basename " .  shellescape(a:pathname)), "\n", "", 'g')
endfunction

XPT req " node require module
var `module^strip_path(V())^ = require('``module^');

XPT f " js anonymous function
XSET arg*|post=ExpandIfNotEmpty(', ', 'arg*')
function (`arg*^) {`^}
