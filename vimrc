" ~/.vimrc
"
" Christopher C. Strelioff
" 2016 MIT LICENSE
"
" 2016, Sept: Ubntu 16.04LTS
"   - Move to vundle
" 2016, June: Ubuntu 14.04LTS
"

" no vi compat
set nocompatible

" filetype func off
filetype off

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" start- all plugins below

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'morhetz/gruvbox'
Plugin 'aperezdc/vim-template'
Plugin 'davidhalter/jedi-vim'

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on

set number  " show line numbers
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" set color
colorscheme gruvbox
set background=dark
set colorcolumn=80

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" customize vim-template plugin
let g:email = 'chris.strelioff@gmail.com'
let g:user = 'Christopher C. Strelioff'
let g:license = 'MIT'

" lightline fix
set laststatus=2
