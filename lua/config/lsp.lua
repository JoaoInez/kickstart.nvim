local M = {}

-- NOTE: Language servers
M.servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  -- https://github.com/pmizio/typescript-tools.nvim
  tsserver = {
    on_attach = function()
      vim.keymap.set('n', '<leader>co', function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { 'source.organizeImports.ts' },
            diagnostics = {},
          },
        }
      end, { desc = '[C]ode: [O]rganize imports' })

      vim.keymap.set('n', '<leader>cr', function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { 'source.removeUnusedImports.ts' },
            diagnostics = {},
          },
        }
      end, { desc = '[C]ode: [R]emove unused imports' })

      vim.keymap.set('n', '<leader>cm', function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { 'source.addMissingImports.ts' },
            diagnostics = {},
          },
        }
      end, { desc = '[C]ode: Add [M]issing imports' })
    end,
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
  },
  tailwindcss = {},
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
}

return M
