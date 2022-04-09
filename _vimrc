syntax off
set expandtab
set tabstop=2
set shiftwidth=2

set autoindent
set number
set ruler

command! Reload execute "source ~/_vimrc"

colorscheme monokai

call plug#begin('/plug')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
