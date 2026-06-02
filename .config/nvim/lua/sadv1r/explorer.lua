-- Hide the "Netrw Directory Listing" banner at the top of listings
vim.g.netrw_banner = 0

-- Hide the current-directory "./" entry from netrw listings
vim.g.netrw_list_hide = [[^\.\/$]]

-- Open netrw on the left when starting with no file or a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local argc = vim.fn.argc()
    local arg0 = argc > 0 and vim.fn.argv(0) or ""

    local open_tree = false
    if argc == 0 then
      -- no args: the current window is already an empty buffer
      open_tree = true
    elseif vim.fn.isdirectory(arg0) == 1 then
      -- nvim auto-opens the directory in netrw; replace it with an empty buffer
      vim.cmd("cd " .. vim.fn.fnameescape(arg0))
      vim.cmd("enew")
      open_tree = true
    end

    -- netrw in a left split (focused) with the empty buffer on the right
    if open_tree then
      vim.cmd("Vexplore")
      vim.cmd("vertical resize 30")
    end
  end,
})

-- Helper: ensure there is a right-hand editor window
local function ensure_right_editor_window()
  local wins = vim.api.nvim_list_wins()
  if #wins == 1 then
    -- Only tree window exists, create a right split
    vim.cmd("vsplit")
  end
  -- Move to rightmost window
  while true do
    local prev = vim.api.nvim_get_current_win()
    vim.cmd("wincmd l")
    local now = vim.api.nvim_get_current_win()
    if now == prev then
      break
    end
  end
end

-- Resolve the absolute path of the entry under the cursor in netrw.
-- netrw#Call('NetrwGetWord') returns the bare filename (decorations stripped),
-- which we join against b:netrw_curdir so it's correct in any directory.
local function netrw_target_path()
  local curdir = vim.b.netrw_curdir or vim.fn.getcwd()
  local ok, word = pcall(vim.fn["netrw#Call"], "NetrwGetWord")
  if not ok or word == nil or word == "" then
    return nil
  end

  word = word:gsub("/+$", "") -- netrw appends "/" to directories
  if word == "" or word == "." then
    return curdir
  end
  if word == ".." then
    return vim.fn.fnamemodify(curdir, ":h")
  end
  if word:sub(1, 1) == "/" then
    return word -- already absolute (e.g. tree view)
  end
  return curdir .. "/" .. word
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "<CR>", function()
      -- Get path under cursor
      local path = netrw_target_path()
      if path == nil or path == "" then
        return
      end

      -- If directory, just enter it in netrw
      if vim.fn.isdirectory(path) == 1 then
        vim.cmd("Explore " .. vim.fn.fnameescape(path))
        return
      end

      -- Ensure a right editor window exists and go there
      ensure_right_editor_window()

      -- Open file in that right window
      vim.cmd("edit " .. vim.fn.fnameescape(path))
      -- Now your active window is the file, as in an IDE
    end, { buffer = true, silent = true })
  end,
})

-- Focus leftmost window (file tree)
vim.keymap.set("n", "<leader>e", function()
  while true do
    local prev = vim.api.nvim_get_current_win()
    vim.cmd("wincmd h")
    local now = vim.api.nvim_get_current_win()
    if now == prev then
      break
    end
  end
end, { silent = true, desc = "Focus file tree" })
