if isdirectory(expand("~/.vim/bundle/Vundle.vim"))
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Bundle 'VundleVim/Vundle.vim'
    Bundle 'easymotion/vim-easymotion'

    call vundle#end()            " required
    filetype plugin indent on    " required
endif
