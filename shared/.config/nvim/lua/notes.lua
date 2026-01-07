local function project_root()
  local buf = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(buf)
  local start = (name ~= "" and vim.fs.dirname(name)) or vim.fn.getcwd()

  return vim.fs.root(start, {".git"}) or vim.fn.getcwd()
end

local function open_or_create_notes()
  local root = project_root()
  local path = root .. "/notes.local.md"

  if not vim.uv.fs_stat(path) then
    vim.fn.writefile({}, path)
  end

  vim.cmd("edit " .. vim.fn.fnameescape(path))
end

vim.keymap.set("n", "<leader>t", open_or_create_notes, { desc = "Open/create project notes.local.md" })
