set colorcolumn=80
set textwidth=80

set formatoptions=tcqjn

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set expandtab

set smartcase
set incsearch
set hlsearch

set scrolloff=3

" handle whitespaces at the end of a line (git friendly)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" find character under cursor
nnoremap <leader>z xP/<C-R>-<CR>

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go'
Plug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/csv.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" Syntastic (Recommended settings)
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_sh_shellcheck_args = "-x"

" Tagbar settings
let g:tagbar_autofocus = 1
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ale settings
" let g:ale_open_list = 1
" let g:ale_list_window_size = 5
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['autopep8'],
            \}
let g:ale_fix_on_save = 1
