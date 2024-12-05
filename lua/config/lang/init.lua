local M = {}

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
M.servers = {
  lua_ls = require 'config.lang.lua',
  volar = require 'config.lang.vue',
  vtsls = require 'config.lang.typescript',
  tailwindcss = require 'config.lang.tailwind',
}

M.formatters = {
  'stylua',
  'prettierd',
}

M.formatters_by_filetype = {
  -- Conform can also run multiple formatters sequentially
  -- python = { "isort", "black" },
  --
  -- You can use 'stop_after_first' to run the first available formatter from the list
  -- javascript = { "prettierd", "prettier", stop_after_first = true },
  lua = { 'stylua' },
  javascript = { 'prettierd' },
  javascriptreact = { 'prettierd' },
  typescript = { 'prettierd' },
  typescriptreact = { 'prettierd' },
}

-- TODO: Setup linters and eslint
M.linters = {
  'eslint_d',
}

M.linters_by_filetype = {
  -- markdown = { 'markdownlint' },
}

-- Run :TSInstallInfo to see all languages available
M.treesitter = {
  'bash',
  'c',
  'css',
  'diff',
  'html',
  'hyprlang',
  'javascript',
  'jsdoc',
  'json',
  'jsonc',
  'lua',
  'luadoc',
  'luap',
  'markdown',
  'markdown_inline',
  'printf',
  'python',
  'query',
  'regex',
  'toml',
  'tsx',
  'typescript',
  'vue',
  'vim',
  'vimdoc',
  'xml',
  'yaml',
}

return M
