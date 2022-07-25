set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set mousehide
set termencoding=utf-8
set novisualbell

set wrap
set linebreak
set encoding=utf-8
set fileencodings=utf8,cp1251
set ruler

let python_highlight_all = 1

autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

syntax on

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'

nmap <F8> :TagbarToggle<CR>

call plug#end()

" source ~/.vim/plugged/awesome-vim-colorschemes/colors/scheakur.vim
:set background=dark
colorscheme iceberg

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
