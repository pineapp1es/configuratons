" enable vim functionality and remove vi-compatibility (enabled by default but whatever)
set nocompatible

" syntax highlighting
syntax on

" no vim startup msg
set shortmess+=I

" line number mode ON
set number

" relative line number s
set relativenumber

" always show status line
set laststatus=2

" highlight search match
set hlsearch
set ignorecase
" case sensitive IF caps included in saerch
set smartcase
" incremental SEARCH
set incsearch

" enable visual BELL
set visualbell

" Enable mouse support
set mouse+=a

" rmoev menu bar in gui
:set guioptions -=m 
" remove toolbar in gui
:set guioptions -=T
" change color in gui
:colorscheme slate
