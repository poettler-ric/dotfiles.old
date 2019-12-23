filetype plugin on
filetype indent on

set colorcolumn=80
set textwidth=80

"set formatoptions=tcqjn

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set autoindent
set smartindent

set ignorecase
set smartcase
set incsearch
set hlsearch

set number
set relativenumber
"set cursorline
set scrolloff=3

" Turn on the Wild menu
set path+=**
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"set omnifunc=syntaxcomplete#Complete

" handle whitespaces at the end of a line (git friendly)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" find character under cursor
nnoremap <leader>z xP/<C-R>-<CR>

" fly through buffers
nnoremap <leader>s :ls<CR>:b<space>

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
"Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'
Plug 'thinca/vim-quickrun'
"Plug 'valloric/youcompleteme', { 'do': './install.py --go-completer --clang-completer' }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
call plug#end()


" supertab settings
"let g:SuperTabDefaultCompletionType = "<c-n>"

" Tagbar settings
let g:tagbar_autofocus = 1
nmap <Leader>b :TagbarToggle<CR>

" Nerdtree settings
nmap <Leader>n :NERDTreeToggle<CR>

" deoplete settings
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" ale settings
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['autopep8'],
            \ 'rust': ['rustfmt'],
            \}
let g:ale_fix_on_save = 1
let g:ale_rust_cargo_use_clippy = 1

" rust.vim settings
" TODO: :RustFmt doesn't seem to work
let g:rustfmt_autosave = 1

" ultisnips settings
"let g:UltiSnipsExpandTrigger="<c-i>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Filetype settings
autocmd FileType yaml setlocal shiftwidth=2

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
