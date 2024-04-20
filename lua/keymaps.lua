-- NOTE:
-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- NOTE: Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: Use custom keymap or <C-\><C-n> to exit terminal mode
-- This won't work in all terminal emulators/tmux/etc.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: Use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Lazy keymaps
vim.keymap.set('n', '<leader>lo', ':Lazy<CR>', { desc = '[L]azy [O]pen' })
vim.keymap.set('n', '<leader>lu', ':Lazy update<CR>', { desc = '[L]azy [U]update' })
vim.keymap.set('n', '<leader>ls', ':Lazy sync<CR>', { desc = '[L]azy [S]ync' })

-- NOTE: Mason keymaps
-- You can press `g?` for help in this menu.
vim.keymap.set('n', '<leader>m', ':Mason<CR>', { desc = '[M]ason' })

-- NOTE: Lsp keymaps
vim.keymap.set('n', '<leader>i', ':LspInfo<CR>', { desc = 'LSP: [I]nfo' })

-- NOTE:
-- [[ Basic Autocommands ]]
-- See `:help lua-guide-autocommands`

-- NOTE: Highlight when yanking (copying) text
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
