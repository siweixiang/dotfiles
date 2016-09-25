" Setting tab width to 4
set tabstop=4

" Turning on Line numbers
set number

" This is required to enable vim plugin Airline tabs
" to be shown all the time
set laststatus=2

" Mapping keys so we can visually move through lines
" that is so big that it's placed over next line although
" it's the same line
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

" Turning on syntax highlighting 
syntax on
set termguicolors
highlight Normal ctermbg=NONE guibg=NONE 
highlight NonText ctermbg=NONE guibg=NONE


" For solarized theme, make sure it's installed first
" Make sure you also setup solarized theme for your terminal

" For improved readability consider manually installing 
" custom fonts from this repo:
" https://github.com/powerline/fonts

" favourite fonts: monofur for powerline regular 10, 
" source code pro for powerline medium 9

" Note that powerline fonts above are required for plugin airline


set nocompatible              " be iMproved, required
filetype off                  " required

" Enabling blowfish2 crypto for encrypted vim files
" Encryption of a file is done by typing :X
setlocal cm=blowfish2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


Plugin 'Valloric/YouCompleteMe'
" Required for clang autocomplete to work with YouCompleteMe plugin.
" Place that file on home directory
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1


" Plugin Nerd Tree
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" EasyMotion
Plugin 'easymotion/vim-easymotion'
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
let g:EasyMotion_smartcase = 1

"Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use
"https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsUsePythonVersion = 2
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-d>"

" Color schemes for vim
"Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'frankier/neovim-colors-solarized-truecolor-only'

"Plugin 'vim-scripts/Solarized'
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_style="dark"



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set smartindent

" Mapping tab switch keys changed due to Airline
map <C-Left> <Esc>:tabprevious<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-Down> <Esc>:tabclose<CR>

" Automatically format the file when reading or writing 
" to have correct indentaion
autocmd BufRead,BufWritePre *.cpp normal gg=G

" For further vim extensability go through this page for useful plugin list for c/c++:
" http://stackoverflow.com/questions/4237817/help-with-configuring-vim-for-c

"This is needed for vim colors to work properly inside tmux,
" to fall back to supporting 256 colors only as 24bit support
" is still a work in progress for tmux
set t_Co=256
set t_ut=
colorscheme gruvbox
"colorscheme onedark

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
