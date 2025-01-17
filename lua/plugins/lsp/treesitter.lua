-- NOTE: Highlight, edit, and navigate code
-- See `:help nvim-treesitter`
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'diff',
      'javascript',
      'typescript',
      'tsx',
      'jsdoc',
      'json',
      'jsonc',
      'luap',
      'markdown_inline',
      'python',
      'query',
      'regex',
      'toml',
      'xml',
      'yaml',
      'tmux',
      'hyprlang',
      'vue',
      'css',
    },
    auto_install = true,
    highlight = {
      enable = true,
      --  NOTE: If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- NOTE:
    -- [[ Configure Treesitter ]]

    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    vim.filetype.add {
      pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang', ['dot_zshrc'] = 'zsh' },
    }

    -- NOTE: There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    -- - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    -- - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    -- - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
