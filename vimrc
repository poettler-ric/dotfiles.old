syntax enable

set smartcase
set incsearch
set hlsearch

set textwidth=79
" maybe add 2, too
"set formatoptions+=ronj
set formatoptions+=ron

set smartindent
set expandtab
"set ci

set smarttab
set shiftwidth=4

autocmd BufNewFile,BufRead *.yml setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.yaml setlocal shiftwidth=2
autocmd BufNewFile,BufRead Makefile setlocal noexpandtab nosmarttab
autocmd BufNewFile,BufRead *.mk setlocal noexpandtab nosmarttab
