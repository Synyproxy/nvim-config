-- Patch for cmake-tools bug: when the cmake terminal window is closed (win_id
-- becomes -1), the plugin creates a new split but does not update opts.win_id,
-- so the subsequent nvim_set_current_win(-1) call throws "Invalid window id: -1".
local ok, terminal = pcall(require, "cmake-tools.terminal")
if not ok then
  return
end

local osys = require("cmake-tools.osys")

terminal.send_data_to_terminal = function(buffer_idx, cmd, opts)
  if not opts or not opts.do_not_add_newline then
    if osys.iswin32 then
      cmd = cmd .. " \r"
    elseif osys.ismac then
      cmd = cmd .. " \n"
    elseif osys.islinux then
      cmd = cmd .. " \n"
    elseif osys.iswsl then
      cmd = cmd .. " \n"
    end
  else
    cmd = cmd .. " "
  end

  if opts and opts.win_id ~= -1 then
    vim.api.nvim_win_set_buf(opts.win_id, buffer_idx)
    if opts.auto_resize then
      if opts.split_direction == "horizontal" then
        vim.api.nvim_win_set_height(opts.win_id, opts.split_size)
      else
        vim.api.nvim_win_set_width(opts.win_id, opts.split_size)
      end
    end
  elseif opts and opts.win_id >= -1 then
    vim.cmd(":" .. opts.split_direction .. " " .. opts.split_size .. "sp")
    opts.win_id = vim.api.nvim_get_current_win() -- fix: update win_id to newly created window
    vim.api.nvim_win_set_buf(0, buffer_idx)
  end

  if opts and opts.focus then
    vim.api.nvim_set_current_win(opts.win_id)
    if opts.start_insert then
      vim.cmd("startinsert")
    end
  else
    local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(0))
    local basename = vim.fn.fnamemodify(name, ":t")
    if opts and (basename:sub(1, #opts.prefix) == opts.prefix) then
      if opts and not opts.focus then
        vim.cmd("wincmd p")
      end
    end
  end

  vim.api.nvim_buf_call(buffer_idx, function()
    local type = vim.api.nvim_get_option_value("buftype", { buf = buffer_idx })
    if type == "terminal" then
      vim.cmd("normal! G")
    end
  end)

  local chan = vim.api.nvim_buf_get_var(buffer_idx, "terminal_job_id")
  vim.api.nvim_chan_send(chan, cmd)
end
