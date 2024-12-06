local M = {}

M.map = function(keys, func, opts, mode)
  mode = mode or 'n'
  opts = opts or {}

  vim.keymap.set(mode, keys, func, opts)
end

M.bmap = function(buffer)
  return function(keys, func, opts, mode)
    mode = mode or 'n'
    opts = opts or {}
    opts.buffer = buffer

    vim.keymap.set(mode, keys, func, opts)
  end
end

return M
