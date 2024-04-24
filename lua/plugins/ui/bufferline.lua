-- NOTE: Tabs plugin
-- See `:h bufferline.nvim` and https://github.com/akinsho/bufferline.nvim
return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  keys = {
    { '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
    { '<Tab>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '<leader>x', '<cmd>bd<cr>', desc = 'Close current buffer' },
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = '[B]uffers: Toggle [P]in' },
    { '<leader>b1', '<Cmd>BufferLineGoToBuffer 1<CR>', desc = 'Go to [B]uffer [1]' },
    { '<leader>b2', '<Cmd>BufferLineGoToBuffer 2<CR>', desc = 'Go to [B]uffer [2]' },
    { '<leader>b3', '<Cmd>BufferLineGoToBuffer 3<CR>', desc = 'Go to [B]uffer [3]' },
    { '<leader>b4', '<Cmd>BufferLineGoToBuffer 4<CR>', desc = 'Go to [B]uffer [4]' },
    { '<leader>b5', '<Cmd>BufferLineGoToBuffer 5<CR>', desc = 'Go to [B]uffer [5]' },
    { '<leader>b6', '<Cmd>BufferLineGoToBuffer 6<CR>', desc = 'Go to [B]uffer [6]' },
    { '<leader>b7', '<Cmd>BufferLineGoToBuffer 7<CR>', desc = 'Go to [B]uffer [7]' },
    { '<leader>b8', '<Cmd>BufferLineGoToBuffer 8<CR>', desc = 'Go to [B]uffer [8]' },
    { '<leader>b9', '<Cmd>BufferLineGoToBuffer 9<CR>', desc = 'Go to [B]uffer [9]' },
    { '<leader>bn', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = '[B]uffers: Close [N]on-pinned' },
    { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = '[B]uffers: Close [O]thers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = '[B]uffers: Close to the [R]ight' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = '[B]uffers: Close to the [L]eft' },
  },
  -- NOTE: See `:help bufferline-configuration` for more options
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Explorer',
          text_align = 'left',
          separator = true,
        },
      },
    },
  },
  -- Fix bufferline when restoring a session
  -- config = function(_, opts)
  --   require('bufferline').setup(opts)
  --   vim.api.nvim_create_autocmd('BufAdd', {
  --     callback = function()
  --       vim.schedule(function()
  --         pcall(nvim_bufferline)
  --       end)
  --     end,
  --   })
  -- end,
}
