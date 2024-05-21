-- NOTE: Status line
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'letieu/harpoon-lualine',
  },
  config = function()
    local function get_harpoon_indicator(prefix, suffix)
      return function(harpoon_entry)
        local path = {}
        local i = 1
        local matched = harpoon_entry.value:gmatch '([^/]+)'

        if not matched then
          return 'unknown'
        end

        for value in matched do
          path[i] = value and value or ''
          i = i + 1
        end

        local trimmed_filename = #path > 1 and path[#path - 1] .. '/' .. path[#path] or path[1]

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
            active_indicators = {
              get_harpoon_indicator('1. [', ']'),
              get_harpoon_indicator('2. [', ']'),
              get_harpoon_indicator('3. [', ']'),
            },
            _separator = '  ',
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
  end,
}
