
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundle
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'troydm/easybuffer.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'

"--------------------------------------------------------------------------
" General Settings
"--------------------------------------------------------------------------
" be iMproved
set nocompatible

" Set 256 colours
set t_Co=256

" Default color scheme
let g:solarized_termcolors=256
set background=dark

" Hack to get colorscheme after loaded
autocmd VimEnter * colorscheme solarized

" Remember line history
set history=700

" Enable filtype plugin
filetype on
filetype plugin on
filetype indent on

" Fast saving, instead of :w! just <leader>w
nmap <leader>w :w!<cr>

" Auto reload file when changed outside of vim
set autoread

" Map [ and ]  to buffer cycle
map <leader>[ :bprevious<CR>
map <leader>] :bnext<CR>

" Set Paste Toggle to <F2>
set pastetoggle=<F2>

"--------------------------------------------------------------------------
" Interface
"--------------------------------------------------------------------------
" Always show line numbers
set number

" Always show ruler
set ruler

" Set command bar height to 2
set cmdheight=2

" Allow change buffer without saving
set hid

" Backspaces do their job
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
set smartcase

" Hilight searched strings
set hlsearch

" Search like modern browsers
set incsearch

" Don't redraw while executing macros
set nolazyredraw

" Use magic for regex
set magic

" Show matching braces
set showmatch

" Blink this many thenths of a second
set mat=2

" No sound on errors!!!
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" UTF-8 Encoding
set encoding=utf8

" Enable Syntax hilighting
syntax enable

" Line and Col Hilighting
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
au BufLeave * set nocursorline nocursorcolumn
au BufEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"--------------------------------------------------------------------------
" Backups, files and undo
"--------------------------------------------------------------------------
" No backups as we version control
set nobackup
set nowb
set noswapfile

" Persistent undo
set undodir=~/.vim_runtime/undodir
set undofile

"--------------------------------------------------------------------------
" Text & indentation
"--------------------------------------------------------------------------
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500
set bs=2

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

"--------------------------------------------------------------------------
" Movement
"--------------------------------------------------------------------------
" Map space to search and ctrl-space to reverse search
map <space> /
map <c-space> ?

" Easier way to move windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Arrow keys do nothing, EVIL arrows
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Close current buffer
map <leader>bd :Bclose<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=usetab
    set stal=0
catch
endtry

" I don't know what this does :p
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif
    if bufnr("%") == l:currentBufNum
        new
    endif
    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

"Scroll before reaching bottom of screen
set scrolloff=8 

"--------------------------------------------------------------------------
" Nerd Tree
"--------------------------------------------------------------------------
autocmd vimenter * if !argc() | NERDTree | endif
map <leader>nt :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1

"--------------------------------------------------------------------------
" CtrlP
"--------------------------------------------------------------------------
nmap <leader>p :CtrlP .<cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,/logs/*,*.pyc

"--------------------------------------------------------------------------
" EasyBuffer
"--------------------------------------------------------------------------
map <leader>eb :EasyBuffer<CR>

"--------------------------------------------------------------------------
"" Powerline
"--------------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'

"--------------------------------------------------------------------------
" Status Line
"--------------------------------------------------------------------------
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %* "buffer number
set statusline +=%{fugitive#statusline()} "vim fugitive
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
