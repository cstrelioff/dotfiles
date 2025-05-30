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

" read njk, webc as html for syntax
au BufReadPost *.njk set syntax=html
au BufReadPost *.webc set syntax=html

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
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'Yggdroot/indentLine'
" add plugins for svelte
Plugin 'evanleck/vim-svelte', {'branch': 'main'}


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
if !has('gui_running')
  set t_Co=256
endif

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Toggle spellcheck
map <F4> :setlocal spell! spelllang=en_us<CR>
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red

" customize vim-template plugin
let g:email = 'chris.strelioff@gmail.com'
let g:user = 'Christopher C. Strelioff'
let g:license = 'MIT'

" lightline fix
set laststatus=2

" for yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" indentLine options
"let g:indentLine_char = '⦙'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" emmet - set HTML5 template to responsive
let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title>My Title</title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" />\n"
\              ."\t<script type=\"module\" src=\"js/main.js\"></script>\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
