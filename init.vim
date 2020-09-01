

filetype off
call plug#begin('~/.local/share/nvim/plugged')

" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'

Plug 'godlygeek/tabular'

Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'dracula/vim', {'as': 'dracula'}

call plug#end()

filetype plugin indent on

syntax enable

autocmd BufReadPost *.rs setlocal filetype=rust


" Automatically start language servers

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" nnoremap <silent> K :call <SID>show_documentation()<CR>

let mapleader = ","
let g:mapleader = ","


" Required for operations modifying multiple buffers at once, like rename
set hidden

" Mappings
nnoremap <leader>w :w!<cr>
nnoremap <leader><space> :noh<cr>

inoremap jk <esc>

nmap <C-J> :bnext<cr>
nmap <C-K> :bprev<cr>
map <leader>bd :bdelete<cr>

nmap <tab> %
vmap <tab> %

" Something about the colors are weird? idk...
set termguicolors

colorscheme dracula

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Use spaces instead of tabs
set expandtab

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show line numbers by default
set number
if exists('+relativenumber')
    set relativenumber
endif

" Fast terminal connection
set ttyfast

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set nowrap

set gdefault

