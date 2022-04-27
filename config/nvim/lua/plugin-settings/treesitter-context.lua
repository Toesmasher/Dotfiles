local status_ok, tscontext = pcall(require, 'treesitter-context')

if not status_ok then
  return
end

tscontext.setup({
  enable = true,
  throttle = true,
  max_lines = 0,
  patterns = {
    default = {
      'class', 'function', 'method', 'for', 'while', 'if', 'switch', 'case'
    },
  }
})
