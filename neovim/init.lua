-- plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'    -- nvim utilities

Plug 'vim-latex/vim-latex'      -- tex support

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'cstrahan/vim-capnp'

-- theme
Plug 'morhetz/gruvbox'          -- theme
Plug 'vim-airline/vim-airline'  -- airline

-- LSP
Plug 'neovim/nvim-lspconfig'    -- LSP config
Plug 'hrsh7th/cmp-nvim-lsp'	    -- autocomplete
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'        -- vsnip
Plug 'hrsh7th/vim-vsnip'

Plug 'jose-elias-alvarez/null-ls.nvim'

vim.call('plug#end')

-- modules
require 'theme'
require 'lsp'

-- fzf searching
vim.api.nvim_set_keymap('n', 'f', '<cmd>Files<CR>', {noremap=true})

-- shortcuts
vim.cmd('map <Tab> :bn<CR>')
vim.cmd('map <S-Tab> :bp<CR>')

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


-- latex
vim.cmd('autocmd BufWritePost,FileWritePost *.tex !latexmk -pdf %')
