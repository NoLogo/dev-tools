" Destroy the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Make life easier
nnoremap j gj
nnoremap k gk

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>v <C-w>v

" Pathogen Settings
execute pathogen#infect()
syntax on
filetype plugin indent on

" Airline Settings
let g:airline_powerline_fonts = 1

" Python Syntax
let python_highlight_all = 1

" PyDoc Settings
filetype plugin on

" Solarized theme
syntax enable
set background=dark
colorscheme solarized

" Line Numbers
set number

" Highlighting
set cursorline
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow

" Ruler
set colorcolumn=79

" Display EOL whitespace
set list
set listchars=trail:.

" Tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Font
set guifont=Menlo\ Regular:h14

" CtrlP

let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['tag']
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif


