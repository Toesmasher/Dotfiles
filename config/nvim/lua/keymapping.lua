local h = require('helpers')

local opts_default = { silent = true, silent = true }

local g = {
  mapleader = ' ',
  maplocalleader = ' ',
}
h.set_globals(g)

-- Modes: 'n'ormal, 'i'nsert, 'v'isual, 'x'visual_block, 't'erm, 'c'ommand
local keys = {
  -- Set space as leader
  {'', '<Space>', '<Nop>', opts_default},

  -- Window selection
  {'n', '<Leader><Left>',  '<C-w><Left>',  opts_default},
  {'n', '<Leader><Right>', '<C-w><Right>', opts_default},
  {'n', '<Leader><Up>',    '<C-w><Up>',    opts_default},
  {'n', '<Leader><Down>',  '<C-w><Down>',  opts_default},

  -- Splitting
  {'n', '<Leader>s', '<C-w>s', opts_default},
  {'n', '<Leader>v', '<C-w>v', opts_default},
  {'n', '<Leader>e', '<C-w>=', opts_default},

  -- Buffer handling
  {'n', '<Tab>',     ':bnext<CR>',   opts_default},
  {'n', '<S-Tab>',   ':bprev<CR>',   opts_default},
  {'n', '<Leader>c', ':Bdelete<CR>', opts_default},

  -- LSP navigation
  {'n', 'ld', ':lua vim.lsp.buf.declaration()<CR>', opts_default},
  {'n', 'li', ':lua vim.lsp.buf.definition()<CR>', opts_default},
  {'n', 'lb', '<C-o>', opts_default},
  
  -- LSP symbols
  {'n', 'lc', ':Lspsaga hover_doc<CR>', opts_default},
  {'n', 'lx', ':Lspsaga rename<CR>', opts_default},
  {'n', 'lr', ':Lspsaga lsp_finder<CR>', opts_default},

  -- Nvimtree
  {'n', '<Leader>n', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', opts_default},
  
  -- Gitsigns
  {'n', '<Leader>h', ':Gitsigns toggle_linehl<CR>', opts_default},
  {'n', '<Leader>d', ':Gitsigns preview_hunk<CR>',  opts_default},

  -- Telescope
  {'n', 'tt', ':Telescope<CR>', opts_default},
  {'n', 'tg', ':Telescope live_grep<CR>', opts_default},
  {'n', 'tf', ':Telescope find_files<CR>', opts_default},
  {'n', 'tb', ':Telescope git_branches<CR>', opts_default}
}

h.map_keys(keys)
