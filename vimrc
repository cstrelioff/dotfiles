"
" Christopher C. Strelioff
" 2016 MIT LICENSE
"
" 2016, June: Ubuntu 14.04LTS
"

" Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

syntax on
filetype plugin indent on

" set number of terminal colors to 256
set t_Co=256

" set highlight for column 80
set colorcolumn=80

" set color
colorscheme gruvbox
set background=dark
highlight ColorColumn ctermbg=233

"set background=light
"highlight ColorColumn ctermbg=???

set number  " show line numbers
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing


" Customize the settings for vim-template plugin
let g:email = "chris.strelioff@gmail.com"
let g:user = "Christopher C. Strelioff"
let g:license = "MIT"

" load lightline.vim correctly
set laststatus=2

