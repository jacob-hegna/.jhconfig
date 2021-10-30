-- plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'          -- theme
Plug 'vim-latex/vim-latex'      -- tex support
Plug 'neovim/nvim-lspconfig'    -- LSP config
Plug 'hrsh7th/cmp-nvim-lsp'	    -- autocomplete
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'        -- vsnip
Plug 'hrsh7th/vim-vsnip'
vim.call('plug#end')

-- autocomplete
vim.cmd('set completeopt=menu,menuone,noselect')

require('lspconfig').clangd.setup{}

local cmp = require('cmp')
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}

-- theme
vim.cmd('colorscheme gruvbox')

vim.cmd('set cursorline')
vim.cmd('set colorcolumn=80,120')
vim.cmd('highlight ColorColumn ctermbg=lightgrey')
vim.cmd('syntax on')

vim.cmd('set number')
vim.cmd('set showmatch')

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
