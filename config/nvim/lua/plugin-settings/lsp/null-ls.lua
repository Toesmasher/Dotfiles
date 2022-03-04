status_ok, nls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local uncrustify_cfg = '~/Repos/xbus_fw/extra/uncrustify.cfg'

nls.setup({
  sources = {
    nls.builtins.formatting.uncrustify.with({
      extra_args = {'-c', vim.fn.expand(uncrustify_cfg) }
    })
  }
})
