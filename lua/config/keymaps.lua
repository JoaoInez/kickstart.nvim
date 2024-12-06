-- [[ Basic Keymaps ]]
--  See `:help map.set()`

local map = require('util').map

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- map('<leader>dl', vim.diagnostic.setloclist, { desc = 'Diagnostics' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }, 't')

-- TIP: Disable arrow keys in normal mode
map('<left>', '<nop>')
map('<right>', '<nop>')
map('<up>', '<nop>')
map('<down>', '<nop>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('<leader>s', '<cmd>w<cr>', { desc = 'Save Current File' })
map('<leader>x', '<cmd>xa<cr>', { desc = 'Save and Quit Neovim' })
-- map('<leader>qq', '<cmd>qa<cr>', 'Quit Neovim')

-- Page jumping centers cursor
map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')

-- Search centers cursor
map('n', 'nzzzv')
map('N', 'Nzzzv')

-- Navigate wrapped lines
map('j', 'gj')
map('k', 'gk')
map('gj', 'j', { desc = 'Skip wrapped line down' })
map('gk', 'k', { desc = 'Skip wrapped line up' })

-- Yanking
map('yc', '<cmd>norm yygcc<cr>p', { desc = 'Duplicate line and comment original' })
map('<leader>dy', 'gg0yG', {desc = 'Yank'})

map('s', '<nop>', { desc = nil }, { 'n', 'v' })
