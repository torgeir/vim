# [m|g]?vim configuration

Repo holding personal vim files.

## Installation

Backup old vim settings

    $ mv .vim    .vim.bak   && \
      mv .vimrc  .vimrc.bak && \
      mv .gvimrc .gvimrc.bak

Step by step installation, from `~/`

    $ git clone http://github.com/torgeir/vim.git
    $ cd vim
    $ git submodule update --init --recursive
    $ cd ..
    $ ln -s vim .vim
    $ ln -s vim/.vimrc
    $ ln -s vim/.gvimrc

One liner

    $ git clone http://github.com/torgeir/vim.git && \
      cd vim                                      && \
      git submodule update --init --recursive     && \
      cd ..                                       && \
      ln -s vim .vim                              && \
      ln -s vim/.vimrc                            && \
      ln -s vim/.gvimrc

Done!
