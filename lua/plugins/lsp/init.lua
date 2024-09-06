return {
  -- NOTE: Preview colors
  { 'NvChad/nvim-colorizer.lua', opts = { user_default_options = { css = true, css_fn = true, tailwind = true } } },

  -- NOTE: Context aware comments in tsx
  { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true, opts = { enable_autocmd = false } },

  require 'plugins.lsp.autopairs',
  require 'plugins.lsp.chatgpt',
  require 'plugins.lsp.cmp',
  require 'plugins.lsp.comment',
  require 'plugins.lsp.conform',
  require 'plugins.lsp.inc-rename',
  require 'plugins.lsp.lint',
  require 'plugins.lsp.lsp-config',
  require 'plugins.lsp.treesitter',
  require 'plugins.lsp.ts-autotag',
}
