-- NOTE:
-- [[ Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Keymaps
vim.keymap.set('n', '<leader>,lo', '<cmd>Lazy<CR>', { desc = '[,] Settings: [L]azy [O]pen' })
vim.keymap.set('n', '<leader>,lu', '<cmd>Lazy update<CR>', { desc = '[,] Settings: [L]azy [U]update' })
vim.keymap.set('n', '<leader>,ls', '<cmd>Lazy sync<CR>', { desc = '[,] Settings: [L]azy [S]ync' })

-- NOTE:
-- [[ Configure and install plugins ]]
require('lazy').setup('plugins', {
  ui = {
    -- NOTE: If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
