-- NOTE: Status line
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'letieu/harpoon-lualine',
  },
  config = function()
    require('lualine').setup {
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = { 'alpha' } },
      },
      sections = {
        lualine_c = {
          'filename',
          '%=', -- make the indicator center
          'harpoon2',
        },
        lualine_x = {
          {
            ---@diagnostic disable-next-line: deprecated, undefined-field
            require('noice').api.statusline.mode.get,
            ---@diagnostic disable-next-line: deprecated, undefined-field
            cond = require('noice').api.statusline.mode.has,
            color = { fg = '#fab387' },
          },
          'searchcount',
          'encoding',
          'fileformat',
          'filetype',
        },
      },
    }

    vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
    vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<leader>x', '<cmd>bdelete<cr>', { desc = 'Close current buffer' })
  end,
}
