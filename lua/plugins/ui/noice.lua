return {
  'folke/noice.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      opts = {
        background_colour = '#000000',
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,
      },
      init = function()
        vim.notify = require 'notify'
      end,
    },
  },
  event = 'VeryLazy',
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
      progress = {
        enabled = true,
        format = 'lsp_progress',
        format_done = 'lsp_progress_done',
        view = 'notify',
      },
    },
    views = {
      notify = {
        replace = true,
      },
    },
    notify = {
      enabled = true,
      view = 'notify',
    },
    routes = {
      {
        filter = {
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
            { find = '%d fewer lines' },
            { find = '%d more lines' },
            { find = 'written' },
            { find = 'yanked' },
            { find = 'No lines in buffer' },
            { find = 'No information available' },
          },
        },
        view = 'notify',
        opts = { skip = true },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
  -- stylua: ignore
  keys = {
    -- { "<leader>n", "", desc = "+noice"},
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>ml", function() require("noice").cmd("last") end, desc = "Last Message" },
    { "<leader>mh", function() require("noice").cmd("history") end, desc = "History" },
    { "<leader>ma", function() require("noice").cmd("all") end, desc = "All" },
    { "<leader>md", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<leader>mt", function() require("noice").cmd("pick") end, desc = "Picker (Telescope)" },
    -- { "<C-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    -- { "<C-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  },
  config = function(_, opts)
    -- HACK: noice shows messages from before it was enabled,
    -- but this is not ideal when Lazy is installing plugins,
    -- so clear the messages in this case.
    if vim.o.filetype == 'lazy' then
      vim.cmd [[messages clear]]
    end
    require('noice').setup(opts)
  end,
}
