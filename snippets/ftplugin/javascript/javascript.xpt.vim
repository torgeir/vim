XPTemplate priority=lang-1

let s:f = g:XPTfuncs()

" strip directory portion of a pathname
function! s:f.strip_path(pathname)
  return substitute(system("basename " .  shellescape(a:pathname)), "\n", "", 'g')
endfunction

" camel cases words separated by -
function! s:f.camelize(str)
  return substitute(a:str, '-\(\w*\)', '\u\1', 'g')
endfunction


XPT f " js anonymous function
XSET arg*|post=ExpandIfNotEmpty(', ', 'arg*')
function (`arg*^) {`^}


XPT : " js key:value pair
`key^: `value^`...^,
`key^: `value^`...^


XPT silly " js console.silly
console.silly(`what?^);


XPT info " js console.info
console.info(`what?^);


XPT log " js console.log
console.log(`what?^);


XPT warn " js console.warn
console.warn(`what?^);


XPT error " js console.err
console.error(`what?^);


XPT req " node require module
var `module^camelize(strip_path(V()))^ = require('``module^');


XPT isnode " js in-node-check
if (typeof module !== 'undefined' && "exports" in module) {
  module.exports = `module^;
}


XPT package " node js package.json
XSET keyword*|post=ExpandIfNotEmpty(', ', 'keyword*')
{
      "name": "`name (without spaces)^"
  , "description": "`description^"
  , "version": "0.0.1"
  , "keywords": [`keyword*^]
  , "author": "torgeir thoresen <@torgeir>"
  , "dependencies": {
        "`dependency^": "`version^"`...^,
        "`dependency^": "`version^"`...^^
  }
  , "engines": { "node": "0.6.x" }
  , "main": "index"
}


XPT ex " js buster bdd expect
expect(`obj^).to`Equal^(`^);


XPT after " js buster bdd after
after(function (`done^) {
  `cursor^
});


XPT before " js buster bdd before
before(function (`done^) {
  `cursor^
});


XPT describe " js buster bdd describe
describe('`a piece of functionality^', function () {
  `cursor^
});


XPT it " js buster bdd it
it('`does what^', function (`done^) {
  `cursor^
});


XPT tc " js buster testCase
buster.testCase('`a piece of functionality^', {
  `cursor^
});


XPT tt " js buster test
'`does something^': function (`done^) {
  `cursor^
}`,^


XPT ifbust " js buster in-node-check
if (typeof require == 'function' && typeof module == 'object') {
  buster = require('buster');
}

buster.spec.expose();
`cursor^
