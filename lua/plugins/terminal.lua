local enabled = true

-- NOTE: Terminal
local plugin = {
  'akinsho/toggleterm.nvim',
  opts = {
    open_mapping = [[<leader>t]],
    insert_mappings = false,
    terminal_mappings = false,
  },
}

return enabled and plugin or {}
