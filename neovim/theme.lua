
-- plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'          -- theme
Plug 'vim-airline/vim-airline'  -- airline
vim.call('plug#end')

-- theme
vim.cmd('colorscheme gruvbox')

vim.cmd('set cursorline')
vim.cmd('set colorcolumn=80,120')
vim.cmd('highlight ColorColumn ctermbg=lightgrey')
vim.cmd('syntax on')

vim.cmd('set number')
vim.cmd('set showmatch')
