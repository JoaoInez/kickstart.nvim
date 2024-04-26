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
        local path = {}
        local i = 1

        for value in harpoon_entry.value:gmatch '([^/]+)' do
          path[i] = value
          i = i + 1
        end

        local trimmed_filename = path[#path - 1] .. '/' .. path[#path]

        return (prefix or '') .. trimmed_filename .. (suffix or '')
      end
    end

    require('lualine').setup {
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = { 'alpha' } },
        refresh = {
          tabline = 50,
        },
      },
      tabline = {
        lualine_a = {
          {
            'filename',
            symbols = {
              modified = '',
              readonly = '',
            },
            path = 4,
          },
        },
        lualine_b = {
          {
            'harpoon2',
            indicators = {
              get_harpoon_indicator '1. ',
              get_harpoon_indicator '2. ',
              get_harpoon_indicator '3. ',
            },
            active_indicators = { '1. 󰷊', '2. 󰷊', '3. 󰷊' },
            _separator = '  ',
            icon = '',
          },
        },
      },
      sections = {
        lualine_c = {
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
        },
        lualine_x = {
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
