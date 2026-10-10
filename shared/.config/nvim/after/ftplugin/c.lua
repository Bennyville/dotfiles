-- Open matching .c/.h counterpart in a vertical split
local function find_counterpart(file, ext)
  local candidate = vim.fn.fnamemodify(file, ":r") .. "." .. ext
  if vim.fn.filereadable(candidate) == 1 then
    return candidate
  end

  local dir = vim.fn.fnamemodify(file, ":h")
  local name = vim.fn.fnamemodify(file, ":t:r") .. "." .. ext
  local search = table.concat({ dir, dir .. "/../include", dir .. "/../src", vim.o.path }, ",")
  local found = vim.fn.findfile(name, search)
  if found ~= "" then
    return vim.fn.fnamemodify(found, ":p")
  end

  return candidate
end

local function open_c_h_pair()
  local file = vim.api.nvim_buf_get_name(0)
  local ext = vim.fn.fnamemodify(file, ":e")

  local c_file, h_file
  if ext == "c" then
    c_file, h_file = file, find_counterpart(file, "h")
  elseif ext == "h" then
    c_file, h_file = find_counterpart(file, "c"), file
  else
    vim.notify("gh: not a .c or .h file", vim.log.levels.WARN)
    return
  end

  local cur = vim.api.nvim_get_current_win()
  local right = vim.fn.win_getid(vim.fn.winnr("l"))
  local left = vim.fn.win_getid(vim.fn.winnr("h"))

  local left_win, right_win
  if right ~= cur then
    left_win, right_win = cur, right
  elseif left ~= cur then
    left_win, right_win = left, cur
  else
    vim.cmd("rightbelow vsplit")
    left_win, right_win = cur, vim.api.nvim_get_current_win()
  end

  vim.api.nvim_win_call(left_win, function()
    vim.cmd("edit " .. vim.fn.fnameescape(c_file))
  end)
  vim.api.nvim_win_call(right_win, function()
    vim.cmd("edit " .. vim.fn.fnameescape(h_file))
  end)

  vim.api.nvim_set_current_win(ext == "c" and left_win or right_win)
end

vim.keymap.set("n", "gh", open_c_h_pair, {
  buffer = true,
  desc = "Open .c/.h pair in vsplit",
})
