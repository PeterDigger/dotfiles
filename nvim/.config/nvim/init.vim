syntax on

set termguicolors
set relativenumber
set cursorline
set number
set smarttab
set expandtab
set smartcase
set splitbelow
set splitright
set noshowmode
set encoding=UTF-8
set mouse=a

"" Plugins Zone

call plug#begin('~/.config/nvim/plugged')
        "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        "Plug 'junegunn/fzf.vim'
        "Plug 'junegunn/seoul256.vim'
        "Plug 'itchyny/lightline.vim'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'catppuccin/nvim', {'as': 'catppuccin'}
        Plug 'psliwka/vim-smoothie' 
	Plug 'tpope/vim-fugitive'
        Plug 'neovim/nvim-lspconfig'
        Plug 'folke/zen-mode.nvim'
call plug#end()

"" Require Lua config
lua require('peter')

"" keybind

" Move line with Alt+HJKL
nnoremap <A-j> :silent m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <silent> <S-j> :bnext<CR>==
nnoremap <silent> <S-k> :bprevious<CR>==

nnoremap <silent> <Leader>g :ZenMode<CR>==

" Seoul256 theme
"colorscheme seoul256
colorscheme catppuccin

" Smooth animation 
let g:smoothie_enable = 1

" LightLine configuration
"let g:lightline = {
"      \ 'colorscheme':'catppuccin',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'FugitiveHead'
"      \ },
"      \ }

"" File settings
" yaml file
autocmd FileType yaml setlocal et ts=2 ai sw=2 nu sts=0

"" Lexplore configuration
" Disable header 
let g:netrw_banner = 0

" Some funky status bar code its seems
" https://stackoverflow.com/questions/9065941/how-can-i-change-vim-status-line-colour
set laststatus=2            " set the bottom status bar

" default the statusline when entering Vim
au InsertEnter * hi statusline guifg=black guibg=#A3BE8C ctermfg=black ctermbg=cyan
au InsertLeave * hi statusline guifg=black guibg=#5E81AC ctermfg=black ctermbg=green
hi statusline guifg=black guibg=#5E81AC ctermfg=black ctermbg=green


" Formats the statusline
set statusline=\ %f                             " file name
set statusline+=%h                              "help file flag
set statusline+=%{getbufvar(bufnr('%'),'&mod')?'*':'\ '}        "modified flag
set statusline+=%r                              "read only flag

set statusline+=\ %=                            " align left

set statusline+=%y                              " filetype
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}]                         " file format
set statusline+=\ %l:%c[%p%%]\                  " ?
"set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
"set statusline+=\ Col:%c\                     " current column
"set statusline+=\ Buf:%n                    " Buffer number
"set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
