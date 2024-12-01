local M = {}

M.linters = {
  markdown = { 'markdownlint' },
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
  vue = { 'eslint_d' },
  json = { 'jsonlint' },
}

return M
