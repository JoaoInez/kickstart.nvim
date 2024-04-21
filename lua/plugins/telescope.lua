local enabled = true

-- NOTE: Fuzzy Finder (files, lsp, etc)
-- See :Telescope help_tags
-- Two important keymaps to use while in Telescope are:
--  - Insert mode: <c-/>
--  - Normal mode: ?
local plugin = {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      -- NOTE: If encountering errors, see telescope-fzf-native README for installation instructions
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
    -- NOTE:
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = { 'node_modules' },
        -- mappings = {
        --   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        -- },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          -- require('telescope.themes').get_dropdown(),
          require('telescope.themes').get_cursor(),
        },
      },
    }

    -- NOTE: Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- NOTE: See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[Find] [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[Find] [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[Find] [F]iles' })
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[Find] [S]elect Telescope' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[Find] current [W]ord' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[Find] by [G]rep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[Find] [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[Find] [R]esume' })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[Find] Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- NOTE: See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[Find] [/] in Open Files' })

    -- NOTE: Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[Find] [N]eovim files' })
  end,
}

return enabled and plugin or {}
