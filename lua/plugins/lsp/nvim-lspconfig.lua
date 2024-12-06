return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    {
      'j-hui/fidget.nvim',
      opts = { notification = { window = { winblend = 0 } } },
    },
    -- Allows extra capabilities provided by nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local map = require('util').map
    -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
    -- and elegantly composed help section, `:help lsp-vs-treesitter`

    -- You can press `g?` for help in this menu.
    map('<leader>,m', '<cmd> Mason <cr>', { desc = 'Mason' })
    map('<leader>,l', '<cmd> Lazy <cr>', { desc = 'Lazy' })
    map('<leader>,i', '<cmd> LspInfo <cr>', { desc = 'LSP Info' })

    --  This function gets run when an LSP attaches to a particular buffer.
    --    That is to say, every time a new file is opened that is associated with
    --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    --    function will be executed to configure the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local builtin = require 'telescope.builtin'
        local themes = require 'telescope.themes'
        local bmap = require('util').bmap(event.buf)

        bmap('<leader>jd', function()
          builtin.lsp_definitions(themes.get_dropdown())
        end, { desc = 'Definition' })
        bmap('gd', function()
          builtin.lsp_definitions(themes.get_dropdown())
        end, { desc = 'Go to Definition' })

        bmap('<leader>jD', vim.lsp.buf.declaration, { desc = 'Declaration' })
        bmap('gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })

        bmap('<leader>jI', function()
          builtin.lsp_implementations(themes.get_dropdown())
        end, { desc = 'Implementation' })
        bmap('gI', function()
          builtin.lsp_implementations(themes.get_dropdown())
        end, { desc = 'Go to Implementation' })

        bmap('<leader>jr', function()
          builtin.lsp_references(themes.get_dropdown())
        end, { desc = 'References (Telescope)' })
        bmap('gr', function()
          builtin.lsp_references(themes.get_dropdown())
        end, { desc = 'Go to References' })

        bmap('<leader>jy', function()
          builtin.lsp_type_definitions(themes.get_dropdown())
        end, { desc = 'Type Definition' })
        bmap('gy', function()
          builtin.lsp_type_definitions(themes.get_dropdown())
        end, { desc = 'Go to Type Definition' })

        bmap('<leader>ds', function()
          builtin.lsp_document_symbols(themes.get_dropdown())
        end, { desc = 'Symbols (Telescope)' })

        bmap('<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = 'Symbols (Telescope)' })

        bmap('<leader>cr', vim.lsp.buf.rename, { desc = 'Rename Variable' })

        bmap('<leader>ca', vim.lsp.buf.code_action, { desc = 'Action' }, { 'n', 'x' })

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          bmap('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, { desc = 'Inlay Hints (LSP)' })
        end
      end,
    })

    -- Change diagnostic symbols in the sign column (gutter)
    if vim.g.have_nerd_font then
      local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
      local diagnostic_signs = {}
      for type, icon in pairs(signs) do
        diagnostic_signs[vim.diagnostic.severity[type]] = icon
      end
      vim.diagnostic.config { signs = { text = diagnostic_signs } }
    end

    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    require('mason').setup()

    local servers = require('config.lang').servers
    local formatters = require('config.lang').formatters
    local linters = require('config.lang').linters

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, formatters)
    vim.list_extend(ensure_installed, linters)
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
