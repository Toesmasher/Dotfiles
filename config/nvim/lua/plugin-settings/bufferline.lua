local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup({
  options = {
    numbers = 'none',
    max_name_length = 30,
    max_prefix_length = 30,
    diagnostics = false,
  }
})
