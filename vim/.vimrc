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

# Vim Plugs

const plugPath = expand('~/.vim/autoload/plug.vim')
const plugUrl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if !filereadable(plugPath)
  silent execute $'!curl -fLo {shellescape(plugPath)} --create-dirs {shellescape(plugUrl)}'
endif

plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

plug#end()
