local icons = require('icons')

local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  return
end

local _, luasnip = pcall(require, 'luasnip')

cmp.setup({
  window = {
    completion = {
      border = 'rounded',
      winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None'
    },
    documentation = {
      border = 'rounded',
      winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None'
    },

  },
  snippet = {
    expand = function(args)
      if luasnip then
        luasnip.lsp_expand(args.body)
      end
    end,
  },
  mapping = {
    ['<Tab>']   = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    --[[ ['<CR>']    = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }), ]]
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'luasnip' },
  },
  formatting = {
    format = function(entry, item)
      item.kind = icons.kind[item.kind]
      item.menu = ({
        nvim_lsp = "[LSP]",
        path =     "[Path]",
        luasnip =  "[Snippet]",
      })[entry.source.name]

      return item
    end,
  },
})
