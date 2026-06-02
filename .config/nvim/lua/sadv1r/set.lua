vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.scrolloff = 8

-- case-insensitive search, unless the pattern contains a capital letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- yank/delete/paste use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- keep undo history across sessions
vim.opt.undofile = true
-- vim.opt.undodir = vim.fn.stdpath("state") .. "/undo" -- default: ~/.local/state/nvim/undo

-- use 24-bit colors (requires a true-color terminal)
vim.opt.termguicolors = true

-- colorscheme
--   list available: ":colorscheme <Tab>"
--   try live:       :colorscheme <name> (e.g. :colorscheme zaibatsu)
vim.cmd.colorscheme("sorbet")

-- one statusline for the whole UI instead of one per window (Neovim 0.7+)
vim.opt.laststatus = 3

-- statusline: file on the left, current dir (like `pwd`) on the right
--   %f       file path relative to the cwd
--   %m %r    modified / read-only flags
--   %=       right-align everything after this
--   getcwd() current working directory, with $HOME shown as ~
vim.opt.statusline = " %f %m%r%=%{fnamemodify(getcwd(), ':~')} "

-- also put the cwd in the terminal/tab title (shows up in Ghostty)
vim.opt.title = true
vim.opt.titlestring = [[%{fnamemodify(getcwd(), ':~')} - nvim]]
