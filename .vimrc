set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ShowPairs'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Tasklist.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'

" colors
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'ciaranm/inkpot'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on

" colours
"colorscheme inkpot
colorscheme jellybeans
syntax on

" general settings
" " spaces and tabs
set so=99
set tabstop=4
set shiftwidth=4
set rnu
set autoindent
set ruler
set wildmenu

" custom mappings
let mapleader=","
let maplocalleader="\\"

map <leader><leader> <ESC>

map <leader>qj ddp
map <leader>qk ddkkp

imap <C-BS> <C-W>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>w <C-w>_
nmap <leader>W :res 0<CR>

" plugin settings
let g:NERDTreeWinSize = 50

"open .md files as Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

if $TERM == 'xterm'
	  set t_Co=256
endif

if $COLORTERM == 'gnome-terminal'
	  set t_Co=256
endif

" these are syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"this is to enable powerline fonts
let g:airline_powerline_fonts = 1
