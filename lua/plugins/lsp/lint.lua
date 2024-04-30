-- NOTE: Linting
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = lint.linters_by_ft or {}

    for ft, linters in pairs(require('config.lint').linters) do
      lint.linters_by_ft[ft] = linters
    end

    -- NOTE: Disable linting in files with no linters to avoid vim error
    lint.linters_by_ft['clojure'] = nil
    lint.linters_by_ft['dockerfile'] = nil
    lint.linters_by_ft['inko'] = nil
    lint.linters_by_ft['janet'] = nil
    lint.linters_by_ft['rst'] = nil
    lint.linters_by_ft['ruby'] = nil
    lint.linters_by_ft['terraform'] = nil
    lint.linters_by_ft['text'] = nil

    -- NOTE: Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
      group = lint_augroup,
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
