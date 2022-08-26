"CONFIGURACION NEOVIM"

"NUMERO DE FILAS"
set number
"INTERACCION CON EL MOUSE"
set mouse=a
"VER COMANDOS DE TECLADO"
set showcmd
"CODIFICACION"
set encoding=utf-8
"VER FINAL DE PARENTESIS"
set showmatch

syntax enable

"PLUGINS"
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"AIRLINE"
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1

"NERDTREE"
let NERDTreeQuitOnOpen=1
nnoremap <silent><F1> :NERDTreeFind<CR>
nnoremap <silent><F2> :NERDTreeToggle<CR>

