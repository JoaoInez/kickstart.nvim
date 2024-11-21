local M = {}

-- NOTE: Language servers
M.servers = {
  lua_ls = require 'config.lsp.lua',
  ts_ls = require 'config.lsp.typescript',
  tailwindcss = {},
  cssls = require 'config.lsp.css',
  hyprls = require 'config.lsp.hyprland',
}

-- NOTE: Additional linters
M.linters = {
  'eslint_d',
  'markdownlint',
  'jsonlint',
}

-- NOTE: Additional formatters
M.formatters = {
  'prettierd',
  'stylua',
  'clang-format',
}

return M
