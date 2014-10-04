XPTemplate priority=lang-1

let s:f = g:XPTfuncs()

" looks up ns from file
fun! s:f.ns()
  return "yes"
endfunction

XPT req
(:require `cursor^)

XPT ref
[`ns^ :refer [`cursor^]]

XPT def
(def `name^ `cursor^)

XPT defn
(defn `name^ 
  [`params^]
  `^)

XPT ns
(ns `ns^)
