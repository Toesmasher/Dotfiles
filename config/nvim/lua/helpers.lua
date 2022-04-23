-- Simple helper functions for doing minor things in NVIM
local M = {}
M.key_opts_default = { silent = true }

-- Set options
-- Pass a table where the key is the option name
function M.set_options(options)
  for k, v in pairs(options) do
    vim.opt[k] = v
  end
end

-- Set global variables
-- Pass a table where the key is the variable name
function M.set_globals(globals)
  for k, v in pairs(globals) do
    vim.g[k] = v
  end
end

-- Map keys
-- Pass an array with arguments to nvim_set_keymap
function M.map_keys(keys)
  for _, v in ipairs(keys) do
    vim.api.nvim_set_keymap(unpack(v))
  end
end

-- Create AutoCommands
-- Pass a name for a group to put them in, and an array with arguments to nvim_create_autocmd
function M.create_autocmds(group_name, cmds)
  local gid = vim.api.nvim_create_augroup(group_name, { clear = true })

  for _, v in ipairs(cmds) do
    v[2].group = gid
    vim.api.nvim_create_autocmd(unpack(v))
  end
end

return M
