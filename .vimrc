:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'majutsushi/tagbar'

nmap <F8> :TagbarToggle<CR>

call plug#end()

" source ~/.vim/plugged/awesome-vim-colorschemes/colors/scheakur.vim
:set background=dark
colorscheme iceberg

nnoremap <C-t> :NERDTreeToggle<CR>
