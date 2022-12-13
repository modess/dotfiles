" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" indent correctly
filetype plugin indent on

" 256 color terminal
set t_Co=256

" leader binding
let mapleader = ","

" jk is escape
inoremap jk <esc>

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" turn on syntax highlighting
syntax on

" default colorscheme
colorscheme desert
set background=dark

" if vundle is installed
if isdirectory(expand("~/.vim/bundle/Vundle.vim"))
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Bundle 'VundleVim/Vundle.vim'

    Bundle 'sandeepcr529/Buffet.vim'
    Bundle 'tomtom/tcomment_vim'
    Bundle 'tomtom/tlib_vim'
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'airblade/vim-gitgutter'
    Bundle 'sheerun/vim-polyglot'
    Bundle 'bling/vim-airline'
    Bundle 'myusuf3/numbers.vim'
    Bundle 'editorconfig/editorconfig-vim'
    Bundle 'godlygeek/tabular'
    Bundle 'kristijanhusak/vim-hybrid-material'
    Bundle 'easymotion/vim-easymotion'

    " colorscheme
    "Bundle 'modess/molokai'
    call vundle#end()            " required
    filetype plugin indent on    " required

    colorscheme hybrid_material

    let g:jsx_ext_required = 0 " Allow JSX in normal JS files

    " disable relative line numbers in certain buffers
    let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree', 'startify', 'vimshell', 'w3m']

    " align
    map <Leader>v :Tabularize /=/<CR>
    map <Leader>V :Tabularize /=>/<CR>

    " nerdcommenter
    map <Leader>c <c-_><c-_>

    " airline
    " let g:airline_theme='light'
    let g:airline_powerline_fonts=1
    set laststatus=2  " always show the status bar

    " git gutter
    nmap <Leader>gn :GitGutterNextHunk<CR>
    nmap <Leader>gp :GitGutterPrevHunk<CR>
    set signcolumn=yes
    " let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
    " let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
    " let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
    " let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" general config
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
set linespace=14
set list
" set listchars=tab:-,eol:¬,nbsp:_
set encoding=utf-8
set fileencoding=utf-8
set cursorline
set ignorecase
set whichwrap+=<,>,[,],h,l
set go-=T

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" disable mouse
autocmd BufEnter * set mouse=

" disable arrow keys in normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" faster access to command line
nmap <space> :

" tabs
map <Leader>tn :tabnew<CR>
map <Leader>tp :tabprevious<CR>
map <Leader>tq :tabclose<CR>
map <Leader>. :tabnext<CR>

" search settings
set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" turn off swap files
set noswapfile
set nobackup
set nowb

" persistent undo
silent !mkdir ~/.backupvim/ > /dev/null 2>&1
set undodir=~/.backupvim/
set undofile

" indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ruler
set ruler
set colorcolumn=120

" folds
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" scrolling
set scrolloff=3
set sidescrolloff=10
set sidescroll=1

" remove search higlighting
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" splits
set splitright
set splitbelow
map <Leader>vs :vs<C-l><CR>
map <Leader>hs :split<CR>

" switch between previous and current buffer
nnoremap <leader><leader> <c-^>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" edit vimrc
map <Leader>ev :e $MYVIMRC<CR>

" move lines up/down
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

" reformat entire file
nmap <Leader>= ggVG=

" remove trailing white spaces on file save
match ErrorMsg '\s\+$'
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>0 :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" file type specific settings
augroup configgroup
    autocmd!

    au BufNewFile,BufRead *.md,*.markdown,*.txt set wrap
    au BufNewFile,BufReadPost *.hbs,*.coffee,*.js,*.md,*.markdown,*.sass,*.scss,*.yml,*.yaml setl shiftwidth=2 expandtab

    " Enable spellchecking for Markdown
    au FileType markdown setlocal spell

    " Automatically wrap at 80 characters for Markdown
    au BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" auto reload vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc so $MYVIMRC
augroup END
