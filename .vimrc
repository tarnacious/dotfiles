set nocompatible
filetype plugin on
syntax on
filetype indent on
syntax enable

set wildmenu 
set hid
set showmatch

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set tabstop=4
set shiftwidth=4
set expandtab
set nu

let mapleader = ","

nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>av ggVG
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sp :setlocal spell spelllang=en_au<cr>
nnoremap <leader>nt :NERDTree<cr>

inoremap jk <esc>

"Move line by paragraph
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"Tab-style buffer switching
map <C-S-tab> :bprev<CR>
map <C-tab> :bnext<CR>

set clipboard=unnamed

let g:slime_target = "tmux"

"Strip trailing white space
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,coffee,js autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Vundle
filetype off    
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script'
Bundle 'klen/python-mode'
filetype plugin indent on


set background=dark
colorscheme solarized

let NERDTreeIgnore = ['\.pyc$', '\.so$', '\.swp$']
