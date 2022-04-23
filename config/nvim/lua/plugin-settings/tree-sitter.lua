local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

configs.setup({
  sync_install = false,
  -- ensure_installed = 'maintained',
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'css',
    'dockerfile',
    'html',
    'http',
    'java',
    'javascript',
    'json',
    'json5',
    'latex',
    'llvm',
    'lua',
    'make',
    'markdown',
    'python',
    'regex',
    'rust',
    'vim',
    'yaml'
  },
  ignore_install = {},

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<Leader>t',
      node_incremental = 'n',
      node_decremental = 'N',
      scope_incremental = 's',
    }
  },
})
