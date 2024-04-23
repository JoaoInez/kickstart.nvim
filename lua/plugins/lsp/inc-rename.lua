-- NOTE: Rename the variable under your cursor, but incrementally.
return {
  'smjonas/inc-rename.nvim',
  config = function()
    ---@diagnostic disable-next-line: missing-parameter
    require('inc_rename').setup()

    vim.keymap.set('n', '<leader>rn', ':IncRename ', { desc = 'LSP: [R]e[N]ame (incrementally)' })
  end,
}
