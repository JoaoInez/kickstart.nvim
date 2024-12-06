return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local telescope = require 'telescope'
    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    local themes = require 'telescope.themes'
    local map = require('util').map
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    telescope.setup {
      defaults = {
        file_ignore_patterns = {
          '^.git/',
          '^node_modules/',
          '^.next/',
          '%.DS_Store',
        },
        -- mappings = {
        --   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        -- },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = { themes.get_dropdown() },
      },
    }

    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')

    map('<leader>fH', builtin.help_tags, { desc = 'Help' })
    map('<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
    map('<leader>ff', function()
      builtin.find_files(themes.get_ivy())
    end, { desc = 'Files' })
    map('<leader>fs', builtin.builtin, { desc = 'Select Telescope' })
    map('<leader>fw', builtin.grep_string, { desc = 'Current Word' })
    map('<leader>ft', builtin.live_grep, { desc = 'Text' })
    map('<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })
    map('<leader>fr', builtin.resume, { desc = 'Resume' })
    map('<leader>f.', builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
    map('<leader><leader>', builtin.buffers, { desc = 'Open Files' })

    -- Slightly advanced example of overriding default behavior and theme
    map('<leader>d/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(themes.get_dropdown { previewer = false })
    end, { desc = 'Search' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    map('<leader>f/', function()
      builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
    end, { desc = 'Search in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    map('<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Neovim files' })
  end,
}
