
filetype off

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'

Plug 'godlygeek/tabular'

Plug 'majutsushi/tagbar'

Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-operator-user'

Plug 'dracula/vim', {'as': 'dracula'}

Plug 'rhysd/vim-clang-format'
Plug 'rust-lang-nursery/rustfmt'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

filetype plugin indent on

syntax enable

let mapleader = ","
let g:mapleader = ","

" NOTE(afrazer, 2020-12-25): I prefer not italicizing keywords like auto or f64, I find
" that it's inconsistent across built-in types and user-defined types, which drives me crazy...
let g:dracula_italic = 0

autocmd BufReadPost *.rs setlocal filetype=rust
autocmd BufReadPost *.h setlocal filetype=cpp
autocmd BufReadPost *.hpp setlocal filetype=cpp

" Automatically start language servers

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev)


nmap <silent> gt <Plug>(coc-action-doHover)


" nmap <leader>x <Plug>(coc-action-doQuickfix)
nmap <silent> <leader>x :call <SID>run_quickfix()<CR>

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

nnoremap <silent> L :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>R :call <SID>rebuild()<CR>
function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! s:rebuild()
    call CocRebuild
endfunction

function! s:run_quickfix()
    call CocAction("doQuickfix")
endfunction

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

autocmd FileType c,cpp,rust nnoremap <buffer><leader>F :<C-u>ClangFormat<cr>
" autocmd FileType c,cpp vnoremap <leader>F :ClangFormat<cr>
autocmd FileType c,cpp,rust vnoremap <buffer><leader>F :ClangFormat<cr>
nmap <leader>C :ClangFormatAutoToggle<cr>

autocmd FileType h,hpp,c,cpp setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s

nnoremap \c :set cursorline!<cr>

nmap <leader>T :TagbarToggle<cr>

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
set relativenumber

" Fast terminal connection
set ttyfast

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set nowrap

set gdefault

" Specific manipulations for certain filetypes
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/

function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

" Delete trailing white space on save
autocmd BufWrite *.cfg :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.d :call DeleteTrailingWS()
autocmd BufWrite *.hpp :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.ml :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()
autocmd BufWrite *.sql :call DeleteTrailingWS()

" Get rid of whitespace explicitly
nnoremap <leader>W :call DeleteTrailingWS()<cr>

