set colorcolumn=80
set textwidth=80

set formatoptions=tcqjn

set shiftwidth=4
set softtabstop=4
set expandtab

set smartcase
set incsearch
set hlsearch

" handle whitespaces at the end of a line (git friendly)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'
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
"Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" Syntastic (Recommended settings)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_sh_shellcheck_args = "-x"
