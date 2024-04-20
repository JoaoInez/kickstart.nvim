local enabled = true

-- NOTE: Show pending keybinds.
local plugin = {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    -- NOTE: Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]azy', _ = 'which_key_ignore' },
    }

    -- NOTE: Visual mode
    require('which-key').register({
      ['<leader>h'] = { 'Git [H]unk' },
    }, { mode = 'v' })
  end,
}

return enabled and plugin or {}
