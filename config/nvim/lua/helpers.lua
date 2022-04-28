-- Simple helper functions for doing minor things in NVIM
local M = {}

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
  local key_opts_default = { silent = true }

  for _, v in ipairs(keys) do
    local mode = v[1]
    local binding = v[2]
    local cmd = v[3]
    local opts = v[4] or key_opts_default

    vim.keymap.set(mode, binding, cmd, opts)
  end
end

-- Create AutoCommands
-- Pass a name for a group to put them in, and an array with arguments to nvim_create_autocmd
function M.create_autocmds(group_name, cmds)
  local gid = vim.api.nvim_create_augroup(group_name, { clear = true })

  for _, v in ipairs(cmds) do
    local event = v[1]
    local opts = v[2]
    opts.group = opts.group or gid
    vim.api.nvim_create_autocmd(event, opts)
  end
end

return M
