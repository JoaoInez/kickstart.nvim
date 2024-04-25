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
        refresh = {
          tabline = 50,
        },
      },
      tabline = {
        lualine_c = {
          '%=', -- make the indicator center
          {
            'harpoon2',
            indicators = {
              get_harpoon_indicator '(Y) ',
              get_harpoon_indicator '(U) ',
              get_harpoon_indicator '(I) ',
              get_harpoon_indicator '(O) ',
            },
            active_indicators = {
              get_harpoon_indicator('[', ']'),
              get_harpoon_indicator('[', ']'),
              get_harpoon_indicator('[', ']'),
              get_harpoon_indicator('[', ']'),
            },
            _separator = '  ',
            icon = '',
            color = { bg = '#1e1e2e', fg = '#89b4fa' },
          },
        },
      },
      sections = {
        lualine_c = {
          {
            'filename',
            symbols = {
              modified = '',
              readonly = '',
            },
          },
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

    vim.keymap.set('n', '<leader>x', '<cmd>bdelete<cr>', { desc = 'Close current buffer' })
  end,
}
