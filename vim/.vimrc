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

set laststatus=2

g:mapleader = ','

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

# colors

set termguicolors

highlight! link SignColumn LineNr

highlight GitGutterAdd ctermfg=Green ctermbg=DarkGreen guifg=Green guibg=DarkGreen
highlight GitGutterChange ctermfg=Cyan ctermbg=DarkCyan guifg=Cyan guibg=DarkCyan
highlight GitGutterDelete ctermfg=Red guifg=Red

# Vim Plugs

const plugPath = expand('~/.vim/autoload/plug.vim')
const plugUrl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if !filereadable(plugPath)
  silent execute $'!curl -fLo {shellescape(plugPath)} --create-dirs {shellescape(plugUrl)}'
endif

plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'yegappan/lsp'

plug#end()

# LSPs

final lspServers = [
  {
    name: 'hls',
    filetype: ['haskell', 'lhaskell'],
    path: 'haskell-language-server-wrapper',
    args: ['--lsp'],
    workspaceConfig: {
      haskell: {
        plugin: {
          semanticTokens: {
            globalOn: true,
          },
        },
      },
    },
  }
]

const lspOpts = {
  semanticHighlight: true,
}

autocmd User LspSetup {
  g:LspAddServer(lspServers)
  g:LspOptionsSet(lspOpts)
}

autocmd User LspAttached {
  nnoremap <buffer> <silent> gd <cmd>LspGotoDefinition<cr>
  nnoremap <buffer> <silent> gD <cmd>LspGotoDeclaration<cr>
  nnoremap <buffer> <silent> gI <cmd>LspGotoImpl<cr>
  nnoremap <buffer> <silent> gy <cmd>LspGotoTypeDef<cr>
  nnoremap <buffer> <silent> gr <cmd>LspShowReferences<cr>

  nnoremap <buffer> <silent> K  <cmd>LspHover<cr>

  nnoremap <buffer> <silent> [d <cmd>LspDiag prev<cr>
  nnoremap <buffer> <silent> ]d <cmd>LspDiag next<cr>

  nnoremap <buffer> <silent> <leader>rn <cmd>LspRename<cr>
  nnoremap <buffer> <silent> <leader>f <cmd>LspFormat<cr>
  nnoremap <buffer> <silent> <leader>ca <cmd>LspCodeAction<cr>
}

autocmd User LspDetached {
  silent! nunmap <buffer> gd
  silent! nunmap <buffer> gD
  silent! nunmap <buffer> gI
  silent! nunmap <buffer> gy
  silent! nunmap <buffer> gr

  silent! nunmap <buffer> K

  silent! nunmap <buffer> [d
  silent! nunmap <buffer> ]d

  silent! nunmap <buffer> <leader>rn
  silent! nunmap <buffer> <leader>f
  silent! nunmap <buffer> <leader>ca
}
