local M = {}

-- Pass a table to do :set
function M.set_options(t)
  for k, v in pairs(t) do
    vim.opt[k] = v
  end
end

-- Pass a table to set global variables
function M.set_globals(t)
  for k, v in pairs(t) do
    vim.g[k] = v
  end
end

-- Pass an array to map keys
function M.map_keys(a)
  for _, v in ipairs(a) do
    vim.api.nvim_set_keymap(unpack(v))
  end
end

return M
