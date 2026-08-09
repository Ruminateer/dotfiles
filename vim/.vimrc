vim9script

source $VIMRUNTIME/defaults.vim

set number
set relativenumber

set mouse=a

set autoindent
set smarttab
set expandtab

set list
set listchars=tab:>-,trail:-

set autoread

set updatetime=100

# colors

set termguicolors

highlight! link SignColumn LineNr

highlight GitGutterAdd guifg=Green guibg=DarkGreen
highlight GitGutterChange guifg=Cyan guibg=DarkCyan
highlight GitGutterDelete guifg=Red

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()
