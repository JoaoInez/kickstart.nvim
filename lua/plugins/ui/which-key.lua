-- NOTE: Show pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>C', group = '[C]hatGPT' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>l', group = '[L]ist' },
      { '<leader>q', group = '[Q]uickfix' },
      { '<leader>G', group = '[G]it', mode = { 'n', 'v' } },
      { '<leader>,', group = '[,] Settings' },
      { '<leader>,l', group = '[,] Settings: [L]azy' },
    }
  end,
}
