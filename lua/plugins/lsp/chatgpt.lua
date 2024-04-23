-- NOTE: ChatGPT plugin
return {
  'jackMort/ChatGPT.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
  },
  event = 'VeryLazy',
  keys = {
    { '<leader>Cg', '<cmd>ChatGPT<CG>', desc = '[C]hat[G]PT' },
    { '<leader>Ce', '<cmd>ChatGPTEditWithInstruction<CR>', desc = '[C]hatGPT: [E]dit with instruction', mode = { 'n', 'v' } },
    { '<leader>Cc', '<cmd>ChatGPTRun grammar_correction<CR>', desc = '[C]hatGPT: Grammar [C]orrection', mode = { 'n', 'v' } },
    { '<leader>Ct', '<cmd>ChatGPTRun translate<CR>', desc = '[C]hatGPT: [T]ranslate', mode = { 'n', 'v' } },
    { '<leader>Ck', '<cmd>ChatGPTRun keywords<CR>', desc = '[C]hatGPT: [K]eywords', mode = { 'n', 'v' } },
    { '<leader>Cd', '<cmd>ChatGPTRun docstring<CR>', desc = '[C]hatGPT: [D]ocstring', mode = { 'n', 'v' } },
    { '<leader>Ca', '<cmd>ChatGPTRun add_tests<CR>', desc = '[C]hatGPT: [A]dd tests', mode = { 'n', 'v' } },
    { '<leader>Co', '<cmd>ChatGPTRun optimize_code<CR>', desc = '[C]hatGPT: [O]ptimize code', mode = { 'n', 'v' } },
    { '<leader>Cs', '<cmd>ChatGPTRun summarize<CR>', desc = '[C]hatGPT: [S]ummarize', mode = { 'n', 'v' } },
    { '<leader>Cf', '<cmd>ChatGPTRun fix_bugs<CR>', desc = '[C]hatGPT: [F]ix bugs', mode = { 'n', 'v' } },
    { '<leader>Cx', '<cmd>ChatGPTRun explain_code<CR>', desc = '[C]hatGPT: E[X]plain code', mode = { 'n', 'v' } },
    { '<leader>Cr', '<cmd>ChatGPTRun roxygen_edit<CR>', desc = '[C]hatGPT: [R]oxygen edit', mode = { 'n', 'v' } },
    { '<leader>Cl', '<cmd>ChatGPTRun code_readability_analysis<CR>', desc = '[C]hatGPT: Code readability ana[L]ysis', mode = { 'n', 'v' } },
  },
  config = function()
    local chatgpt = require 'chatgpt'

    chatgpt.setup {
      api_host_cmd = 'echo http://localhost:11434',
      api_key_cmd = "echo ''",
      openai_params = {
        model = 'deepseek-coder:6.7b',
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 300,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      openai_edit_params = {
        model = 'deepseek-coder:6.7b',
        frequency_penalty = 0,
        presence_penalty = 0,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      actions_paths = {
        '~/.config/nvim/configs/chatgpt_actions.json',
      },
    }
  end,
}
