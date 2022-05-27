local h = require('helpers')

-- Check documentation with ':help <option>', i.e. ':help cmdheight'
local o = {
  -- Basic look
  cmdheight = 2,             -- Height of command window
  conceallevel = 0,          -- Don't conceal syntax stuff
  cursorline = false,        -- Highlight the line with the cursor
  colorcolumn = { 80, 120 }, -- Line length indicators
  -- gcr = '',               -- Cursor look override
  hidden = true,             -- Hide buffers when abandoned
  laststatus = 3,            -- Use single statusbar (nvim 0.7.0)
  number = true,             -- Show line numbers
  pumblend = 30,             -- Slight popup transparency
  pumheight = 10,            -- Popup menu max height
  ruler = true,              -- Show ruler
  showmode = false,          -- Don't show mode, lualine does that
  showtabline = 2,           -- Always show the tabline
  signcolumn = 'yes',        -- Add the sign column
  termguicolors = true,
  title = true,              -- Set the terminal title
  wrap = true,               -- Softwrap text

  -- Timings
  timeoutlen = 500,          -- Wait 500ms between keys in sequences
  updatetime = 500,          -- Wait 500ms after input for things to trigger

  -- Scrolling
  scrolloff = 10,            -- Move up/down 10 lines ahead of cursor
  sidescrolloff = 20,        -- Move left/right 20 columns ahead of cursor

  -- Encodings
  encoding = 'utf-8',
  fileencoding = 'utf-8',

  -- Split behavior
  splitbelow = true,         -- New horizontal splits below
  splitright = true,         -- New vertical splits to the right

  -- Tab stuff
  expandtab = true,          -- Replace tab with spaces
  shiftwidth = 2,            -- Indentation width
  smartindent = true,
  tabstop = 2,               -- Spaces per tab

  -- Searching
  hlsearch = true,           -- Highlight search
  ignorecase = true,         -- Ignore case when searching
  incsearch = true,          -- Incremental search
  smartcase = true,          -- Don't ignore case when search term includes case

  -- Swap and backup stuff
  autoread = true,           -- Automatically reload changed files
  backup = false,            -- No backup files
  swapfile = false,          -- No swap files
  writebackup = false        -- No write-backup
}

local g = {
  do_filetype_lua = 1,       -- Use 0.7.0 LUA method of detecting filetypes
  did_load_filetypes = 0,    -- Do not load old vim filetypes as fallback
}

h.set_options(o)
h.set_globals(g)
