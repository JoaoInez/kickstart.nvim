-- NOTE:
-- [[ Setting options ]]
-- See `:help vim.opt`
-- For more options see `:help option-list`

-- NOTE: Enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- NOTE: Show which line the cursor is on
vim.opt.cursorline = true

-- NOTE: Enable mouse mode
vim.opt.mouse = 'a'

-- NOTE: Hide mode
vim.opt.showmode = false

-- NOTE: Sync Neovim clipboard to OS clipboard
vim.opt.clipboard = 'unnamedplus'

-- NOTE: Enable break indent
vim.opt.breakindent = true

-- NOTE: Save undo history
vim.opt.undofile = true

-- NOTE: Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- NOTE: Enable signcolumn
vim.opt.signcolumn = 'yes'

-- NOTE: Decrease update time
vim.opt.updatetime = 50

-- NOTE: Decrease which-key popup wait time
vim.opt.timeoutlen = 300

-- NOTE: New splits opening behaviour
vim.opt.splitright = true
vim.opt.splitbelow = true

-- NOTE: Whitespace characters icons
-- See `:help 'list'`
-- and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
  lead = '·',
  eol = '󱞣',
}

-- NOTE: Enable live substitutions
vim.opt.inccommand = 'split'

-- NOTE: Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- NOTE: Set tabs as spaces
vim.opt.expandtab = true

-- NOTE: Set tab width to 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- NOTE: Enable 24-bit colour
vim.opt.termguicolors = true

-- NOTE: Show column edge
vim.opt.colorcolumn = '80'
