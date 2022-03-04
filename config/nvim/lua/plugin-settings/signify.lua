local h = require('helpers')

local g = {
  signify_sign_add               = '+',
  signify_sign_delete            = '_',
  signify_sign_delete_first_line = '‾',
  signify_sign_change            = '~',

  signify_sign_show_count = 0,
  signify_sign_show_text  = 1,
}

h.set_globals(g)
