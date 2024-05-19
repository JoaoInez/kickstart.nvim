---@diagnostic disable: assign-type-mismatch
-- https://github.com/pmizio/typescript-tools.nvim

return {
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
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = false,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = false,
      },
    },
  },
}
