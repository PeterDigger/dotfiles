syntax on

set encoding=UTF-8
set number
set smarttab
set noshowmode

call plug#begin()
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'junegunn/seoul256.vim'
        Plug 'preservim/nerdtree'
        Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
"       Plug 'psliwka/vim-smoothie'
        Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-fugitive'
call plug#end()

" Seoul256 theme
colorscheme seoul256

" Smooth animation
" let g:smoothie_enable = 1

" LightLine configuration
let g:lightline = {'colorscheme':'seoul256'}
