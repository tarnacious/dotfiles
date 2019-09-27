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

" don't confuse webpack reloader
set backupcopy=yes

set tabstop=2
set shiftwidth=2
set expandtab
set nu

let mapleader = ","

nnoremap <leader>y "+y
nnoremap <leader>p "+p

vnoremap <leader>y "+y
vnoremap <leader>p "+p

" Mappings for finding files with fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>


nnoremap <leader>av ggVG
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ag :Ack<cr>
nnoremap <leader>sp :setlocal spell spelllang=en_au<cr>
nnoremap <leader>ct :!ctags -R .<cr>
nnoremap <leader>nt :NERDTree<cr>
nnoremap <leader>at :ALEToggle<CR>

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

autocmd FileType c,cpp,java,php,ruby,python,coffee,js,javascript,clojure,ld,s,html autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

autocmd Filetype scss setlocal ts=2 sts=2 sw=2

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-ruby/vim-ruby'
Plug 'rodjek/vim-puppet'
Plug 'davewongillies/vim-eyaml'

call plug#end()

let g:ale_fixers = {'javascript': ['prettier_standard']}

filetype plugin indent on
syntax on

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


syntax enable
set background=dark
" colorscheme solarized

let NERDTreeIgnore = ['\.pyc$', '\.so$', '\.swp$']

nnoremap <Leader>Q :%s/=\(\x\x\<BAR>\n\)/\=submatch(1)=='\n'?'':nr2char('0x'.submatch(1))/ge<CR>
vnoremap <Leader>Q :s/=\(\x\x\<BAR>\n\)/\=submatch(1)=='\n'?'':nr2char('0x'.submatch(1))/ge<CR>

map <leader>jr :set makeprg=rubocop <CR>:make % %:r<CR>:copen<CR>
