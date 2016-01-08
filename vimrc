" Setting tab width to 4
set tabstop=4

" Turning on Line numbers
set number

" This is required to enable vim plugin Airline tabs
" to be shown all the time
set laststatus=2

" Turning on syntax highlighting 
syntax on

" For solarized theme, make sure it's installed first
" Make sure you also setup solarized theme for your terminal
set background=dark

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
let g:ycm_global_ycm_extra_conf = '~/.ycm_global_ycm_extra_conf'


Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'kolor'
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
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
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
" Current favorite Monokai with molokai 
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Mapping tab switch keys changed due to Airline
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>
map <C-Down> <Esc>:bdelete<CR>


colorscheme elflord

" For further vim extensability go through this page for useful plugin list for c/c++:
" http://stackoverflow.com/questions/4237817/help-with-configuring-vim-for-c




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
