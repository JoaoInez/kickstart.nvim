-- NOTE: VSCode like breadcrumbs
return {
  'LunarVim/breadcrumbs.nvim',
  dependencies = {
    { 'SmiteshP/nvim-navic' },
  },
  opts = {},
  config = function()
    require('nvim-navic').setup {
      lsp = {
        auto_attach = true,
      },
    }

    require('breadcrumbs').setup()
  end,
}
