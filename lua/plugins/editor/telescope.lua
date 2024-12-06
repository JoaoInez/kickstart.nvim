return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- INFO: If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local telescope = require 'telescope'
    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    local themes = require 'telescope.themes'
    local actions = require 'telescope.actions'
    local map = require('util').map

    local open_with_trouble = function(...)
      return require('trouble.sources.telescope').open(...)
    end

    -- local function find_command()
    --   if 1 == vim.fn.executable 'rg' then
    --     return { 'rg', '--files', '--color', 'never', '-g', '!.git' }
    --   elseif 1 == vim.fn.executable 'fd' then
    --     return { 'fd', '--type', 'f', '--color', 'never', '-E', '.git' }
    --   elseif 1 == vim.fn.executable 'fdfind' then
    --     return { 'fdfind', '--type', 'f', '--color', 'never', '-E', '.git' }
    --   elseif 1 == vim.fn.executable 'find' and vim.fn.has 'win32' == 0 then
    --     return { 'find', '.', '-type', 'f' }
    --   elseif 1 == vim.fn.executable 'where' then
    --     return { 'where', '/r', '.', '*' }
    --   end
    -- end

    telescope.setup {
      defaults = {
        file_ignore_patterns = {
          '^.git/',
          '^node_modules/',
          '^.next/',
          '%.DS_Store',
        },
        mappings = {
          i = {
            ['<c-q>'] = open_with_trouble,
            ['<a-q>'] = open_with_trouble,
          },
          n = {
            ['<c-q>'] = open_with_trouble,
            ['<a-q>'] = open_with_trouble,
            ['q'] = actions.close,
          },
        },
      },
      -- TODO: Learn about pickers
      --
      -- pickers = {
      --   find_files = {
      --     find_command = find_command,
      --     hidden = true,
      --   },
      -- },
    }

    pcall(telescope.load_extension, 'fzf')

    map('<leader>fH', builtin.help_tags, { desc = 'Help' })
    map('<leader>fk', function()
      builtin.keymaps(themes.get_ivy())
    end, { desc = 'Keymaps' })
    map('<leader>ff', builtin.find_files, { desc = 'Files' })
    map('<leader>fs', builtin.builtin, { desc = 'Select Telescope' })
    map('<lader>fw', function()
      builtin.grep_string(themes.get_dropdown())
    end, { desc = 'Current Word' })
    map('<leader>ft', function()
      builtin.live_grep(themes.get_dropdown())
    end, { desc = 'Text' })
    map('<leader>wd', builtin.diagnostics, { desc = 'Diagnostics (Telescope)' })
    map('<leader>fr', builtin.resume, { desc = 'Resume Find/Search' })
    map('<leader>f.', builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
    map('<leader><leader>', builtin.buffers, { desc = 'Open Files' })
    map('<leader>d/', function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown { previewer = false })
    end, { desc = 'Search' })
    map('<leader>f/', function()
      builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
    end, { desc = 'Search in Open Files' })
    map('<leader>,c', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config', hidden = true }
    end, { desc = 'Config (Telescope)' })
  end,
}
