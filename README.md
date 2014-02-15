# vim/macvim/gvim config + awesome plugins

## It has

Internets most awesome vim plugins

- vundle - the best plugin manager for vim. Paste the git repo and :BundleInstall. Done.
- xptemplate - the best snippet engine
- fugitive - insanely good git plugin
- ctrlp; filetype, hackernews, registers
- nerdtree - a file browser
- gist - list, edit, post gists
- git gutter - git line diff status in the gutter
- gundo - visualize the undo tree, jump around
- tabular - align stuff across lines on a special character
- surround - ingenious mappings for surrounding stuff with '")]} and the like
- supertab - what tab ougth to be like
- emmet - zencoding for vim
- unimpaired - handy bracket mappings

Other stuff I like

- vimux - tmux with ease, from vim
- tagbar - show tags - easily jump to methods, variables etc
- commentary - comment and uncomment based on vim movements
- lightline - nice window layout
- yankstack - clipboard manager
- tasklist - show your todos in a handy list
- multicursor - sublime like multiple cursors for vim
- syntastic - syntax checking plugin
- js-mask - change `function ()` for `f ()` in js

Even more stuff I like

- dispatch - run programs asyncronously outside vim, perfect for build and test
- js beautifier - call JsBeautify() to beautify your minified scripts
- star search - search for the word under the cursor with *
- rainbow parentheses - I like colors
- goyo - distraction free writing, awesome for presentations

### beautiful color themes

muon, monokai-refined, badwolf

### highlighting

js, nginx, clojure, applescript, coffee script, io, mustache, handlebars, typescript, node, markdown, puppet, scala, jade, stylus, less, css colors, less, yaml, json

## Installing

Backup old files

    $ mv .vim    .vim.bak   && \
      mv .vimrc  .vimrc.bak && \
      mv .gvimrc .gvimrc.bak

Install

    $ git clone http://github.com/torgeir/vim.git && \
      ln -s vim .vim                              && \
      ln -s vim/.vimrc                            && \
      ln -s vim/.gvimrc

Done!
