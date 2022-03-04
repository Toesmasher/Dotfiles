local status_ok, dracula = pcall(require, 'dracula')
if not status_ok then
  return
end

vim.cmd([[
  color dracula
]])
