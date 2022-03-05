local status_ok, icons = pcall(require, 'icons')
if not status_ok then
  return
end

local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  return
end

local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Down']   = cmp.mapping.select_next_item(),
    ['<Up>']    = cmp.mapping.select_prev_item(),
    ['<Tab>']   = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>']    = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
  },
  formatting = {
    format = function(entry, item)
      item.menu = ({
        nvim_lsp = icons.kind.Function,
        path =     icons.kind.File,
        luasnip =  icons.kind.Snippet,
      })[entry.source.name]

      return item
    end,
  },
})
