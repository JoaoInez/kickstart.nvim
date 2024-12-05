---@diagnostic disable: missing-fields, assign-type-mismatch

return {
  on_attach = function()
    vim.keymap.set('n', '<leader>co', function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.organizeImports' },
        },
      }
    end, { desc = '[C]ode: [O]rganize imports' })

    vim.keymap.set('n', '<leader>cr', function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.removeUnusedImports.ts' },
        },
      }
    end, { desc = '[C]ode: [R]emove unused imports' })

    vim.keymap.set('n', '<leader>cm', function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.removeUnused.ts' },
        },
      }
    end, { desc = '[C]ode: Add [M]issing imports' })
  end,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  settings = {
    complete_function_calls = true,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        maxInlayHintLength = 30,
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = 'always' },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = 'literals' },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
    },
  },
  keys = {
    {
      '<leader>co',
      function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { 'source.organizeImports' },
            diagnostics = {},
          },
        }
      end,
      desc = 'Organize Imports',
    },
  },
}
