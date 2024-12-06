return {
  'stevearc/dressing.nvim',
  opts = {
    select = {
      telescope = require('telescope.themes').get_dropdown(),
      get_config = function(opts)
        if opts.kind == 'codeaction' then
          return {
            telescope = require('telescope.themes').get_cursor(),
          }
        end
      end,
    },
  },
}
