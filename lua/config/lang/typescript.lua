local M = {}

M = {
  on_attach = function()
    local map = require('util').map

    map('<leader>co', function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.organizeImports' },
        },
      }
    end, { desc = 'Organize Imports (Typescript)' })

    map('<leader>cr', function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.removeUnused.ts' },
        },
      }
    end, { desc = 'Remove Unused Imports (Typescript)' })

    map('<leader>cm', function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.addMissingImports.ts' },
        },
      }
    end, { desc = 'Add Missing Imports (Typescript)' })
  end,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
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
      tsserver = { globalPlugins = {} },
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
  -- INFO: https://github.com/yioneko/vtsls/issues/148
  before_init = function(params, config)
    local result = vim.system({ 'npm', 'query', '#vue' }, { cwd = params.workspaceFolders[1].name, text = true }):wait()
    if result.stdout ~= '[]' then
      local vuePluginConfig = {
        name = '@vue/typescript-plugin',
        location = require('mason-registry').get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server',
        languages = { 'vue' },
        configNamespace = 'typescript',
        enableForWorkspaceTypeScriptVersions = true,
      }
      table.insert(config.settings.vtsls.tsserver.globalPlugins, vuePluginConfig)
    end
  end,
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

return M
