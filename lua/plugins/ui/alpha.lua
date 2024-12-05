return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require 'alpha.themes.dashboard'
    local logo = [[


           ▄ ▄                   
       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     
       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     
    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     
  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  
  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄
▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    




    ]]

    dashboard.section.header.val = vim.split(logo, '\n')
    -- stylua: ignore
    dashboard.section.buttons.val = {
      { type = "text", val = "Quick actions", opts = { hl = "SpecialComment", position = "center" } },
      { type = "padding", val = 1, opts = {} },
      dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
      dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files hidden=true <cr>"),
      dashboard.button("t", " " .. " Find text",       [[<cmd> Telescope live_grep <cr>]]),
      dashboard.button("e", "󰙅 " .. " File explorer",   "<cmd> Neotree reveal float <cr>"),
      dashboard.button("s", " " .. " Restore session", "<cmd> lua require('harpoon'):list():select(1) <cr>"),
      { type = "padding", val = 2, opts = {} },
      { type = "text", val = "Settings", opts = { hl = "SpecialComment", position = "center" } },
      { type = "padding", val = 1, opts = {} },
      dashboard.button("c", " " .. " Config",          "<cmd> lua require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config', hidden = true } <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      dashboard.button("m", "󱊈 " .. " Mason",           "<cmd> Mason <CR>"),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
      { type = "padding", val = 2, opts = {} },
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end
    dashboard.section.header.opts.hl = 'AlphaFooter'
    dashboard.section.buttons.opts.hl = 'AlphaButtons'
    dashboard.section.footer.opts.hl = 'AlphaFooter'
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        once = true,
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    require('alpha').setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      once = true,
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        -- dashboard.section.footer.val = '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        dashboard.section.footer.val = 'Loaded ' .. stats.count .. ' plugins  in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
