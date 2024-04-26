-- NOTE: Dashboard
return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local theta = require 'alpha.themes.theta'
    local dashboard = require 'alpha.themes.dashboard'

    theta.header.val = {
      '           ▄ ▄                   ',
      '       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ',
      '       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ',
      '    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ',
      '  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ',
      '  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄',
      '▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █',
      '█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █',
      '    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ',
    }
    -- theta.header.opts = {
    --   position = 'center',
    --   hl = 'AlphaHeader',
    --   -- wrap = "overflow";
    -- }

    theta.buttons.val = {
      { type = 'text', val = 'Quick actions', opts = { hl = 'SpecialComment', position = 'center' } },
      { type = 'padding', val = 1 },
      dashboard.button('n', '  [N]ew file', '<cmd>ene<CR>'),
      dashboard.button('f', '󰈞  [F]ind file', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>'),
      dashboard.button('g', '󰊄  [G]rep text', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('q', '󰅚  [Q]uit', '<cmd>qa<CR>'),
      { type = 'padding', val = 2 },
      { type = 'text', val = 'Settings', opts = { hl = 'SpecialComment', position = 'center' } },
      { type = 'padding', val = 1 },
      dashboard.button('c', '  [C]onfiguration', '<cmd>cd ~/.config/nvim/ <CR> | <cmd>e init.lua<CR>'),
      dashboard.button('l', '󰒲  [L]azy', '<cmd>Lazy<CR>'),
      dashboard.button('m', '󱊈  [M]ason', '<cmd>Mason<CR>'),
    }

    alpha.setup(theta.config)

    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
