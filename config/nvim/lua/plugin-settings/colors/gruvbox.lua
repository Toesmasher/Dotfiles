local status_ok, gb = pcall(require, 'gruvbox')
if not status_ok then
  return
end

vim.cmd([[
  color gruvbox
]])
