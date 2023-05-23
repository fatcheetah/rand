" better defaults
syntax on
set number
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set viminfo+='1000,n~/.viminfo

" better search
set hlsearch
set showmatch
set ignorecase
set smartcase

" better explorer
set wildmenu
set wildmode=longest:full,full
set path+=**
let g:netrw_banner=0
let g:netrw_liststyle=3

" wrapping text with indicator
set wrap
set linebreak
set breakindent
set showbreak=~\    "

" theme bits
set background=dark
set t_Co=8
set laststatus=2
set statusline+=%m\%f\%r%=%y\%l\:%c
set belloff=all
highlight Comment ctermfg=green
