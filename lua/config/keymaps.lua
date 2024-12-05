-- [[ Basic Keymaps ]]
--  See `:help map.set()`

local map = vim.keymap

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- map.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Document Diagnostics' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
map.set('n', '<left>', '<nop>')
map.set('n', '<right>', '<nop>')
map.set('n', '<up>', '<nop>')
map.set('n', '<down>', '<nop>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map.set('n', '<leader>s', '<cmd>w<cr>', { desc = 'Save Current File' })
map.set('n', '<leader>x', '<cmd>xa<cr>', { desc = 'Save and Quit Neovim' })
-- map.set('n', '<leader>q', '<cmd>qa<cr>', { desc = 'Quit Neovim' })

-- Page jumping centers cursor
map.set('n', '<C-d>', '<C-d>zz')
map.set('n', '<C-u>', '<C-u>zz')

-- Search centers cursor
map.set('n', 'n', 'nzzzv')
map.set('n', 'N', 'Nzzzv')

-- Navigate wrapped lines
map.set('n', 'j', 'gj')
map.set('n', 'k', 'gk')
map.set('n', 'gj', 'j', { desc = 'Skip wrapped line down' })
map.set('n', 'gk', 'k', { desc = 'Skip wrapped line up' })

map.set('n', 's', '<nop>')
