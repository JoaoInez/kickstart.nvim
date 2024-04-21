local enabled = true

-- NOTE: Tabs plugin
-- See `:h bufferline.nvim` and https://github.com/akinsho/bufferline.nvim
local plugin = {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  keys = {
    { '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
    { '<Tab>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '<leader>x', '<cmd>bd<cr>', desc = '[X] Close current buffer' },
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
    { '<leader>bcp', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = '[B]uffers: [C]lose non-[P]inned' },
    { '<leader>bco', '<Cmd>BufferLineCloseOthers<CR>', desc = '[B]uffers: [C]lose [O]thers' },
    { '<leader>bcr', '<Cmd>BufferLineCloseRight<CR>', desc = '[B]uffers: [C]lose to the [R]ight' },
    { '<leader>bcl', '<Cmd>BufferLineCloseLeft<CR>', desc = '[B]uffers: [C]lose to the [L]eft' },
  },
  -- NOTE: See `:help bufferline-configuration` for more options
  opts = {
    options = {
      numbers = 'ordinal',
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
}

return enabled and plugin or {}
