-- NOTE: UI
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  override = {
    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
    ['vim.lsp.util.stylize_markdown'] = true,
    ['cmp.entry.get_documentation'] = true,
  },
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
  opts = {
    lsp = {
      progress = {
        enabled = true,
        format = 'lsp_progress',
        format_done = 'lsp_progress_done',
        -- throttle = 1000 / 30,
        view = 'notify',
      },
      hover = {
        silent = true,
      },
    },
    views = {
      notify = {
        replace = true,
      },
    },
    routes = {
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
            { find = 'written' },
            { find = 'yanked' },
            { find = 'more lines' },
            { find = 'fewer lines' },
          },
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = 'msg_show',
          kind = 'search_count',
        },
        opts = { skip = true },
      },
    },
  },
}
