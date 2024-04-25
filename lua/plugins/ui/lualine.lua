-- NOTE: Status line
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'letieu/harpoon-lualine',
  },
  config = function()
    local function get_harpoon_indicator(prefix, suffix)
      return function(harpoon_entry)
        return (prefix or '') .. harpoon_entry.value .. (suffix or '')
      end
    end

    require('lualine').setup {
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = { 'alpha' } },
      },
      tabline = {
        lualine_c = {
          '%=', -- make the indicator center
          {
            'harpoon2',
            indicators = {
              get_harpoon_indicator '(J) ',
              get_harpoon_indicator '(K) ',
              get_harpoon_indicator '(L) ',
              get_harpoon_indicator '(;) ',
            },
            active_indicators = {
              get_harpoon_indicator('(J) [', ']'),
              get_harpoon_indicator('(K) [', ']'),
              get_harpoon_indicator('(L) [', ']'),
              get_harpoon_indicator('(;) [', ']'),
            },
            _separator = '  ',
          },
        },
      },
      sections = {
        lualine_c = {
          'filename',
        },
        lualine_x = {
          {
            function()
              ---@diagnostic disable-next-line: undefined-field
              return require('noice').api.status.mode.get()
            end,
            cond = function()
              ---@diagnostic disable-next-line: undefined-field
              return package.loaded['noice'] and require('noice').api.status.mode.has()
            end,
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
