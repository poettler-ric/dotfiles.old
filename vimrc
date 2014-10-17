syntax enable

set smartcase
set incsearch
set hlsearch

set textwidth=80
" maybe add 2, too
"set formatoptions+=ronj
set formatoptions+=ron

set smartindent

set smarttab
set shiftwidth=4

autocmd BufNewFile,BufRead *.yml setlocal shiftwidth=2
