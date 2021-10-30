require 'lsp'
require 'theme'

-- plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'vim-latex/vim-latex'      -- tex support

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
vim.call('plug#end')

-- encodings
vim.cmd('set enc=utf-8')
vim.cmd('set fenc=utf-8')
vim.cmd('set termencoding=utf-8')

-- whitespace
vim.cmd('set autoindent')
vim.cmd('set smartindent')
vim.cmd('set tabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set expandtab')
