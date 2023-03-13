syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set hlsearch
set ruler
set statusline=%F%m%r%h%w\         " status line of file location
set statusline+=\ %=[line\ %l\/%L] " r-align status bar current line
set backspace=indent,eol,start     " normal backspace
set background=dark                " better terminal support
set nocompatible            
set path+=**                       " better :find
set mouse=a                        " allow mouse nav
set wildmenu                       " enable wildmenu
set wildmode=longest:full,full     " wildlist
:set belloff=all                   " disable flashing, alarms

let g:netrw_banner=0               " disable annoying banner
let g:netrw_liststyle=3            " tree view
