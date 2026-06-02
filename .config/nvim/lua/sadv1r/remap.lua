vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = "Quit window" })
vim.keymap.set("n", "<leader>Q", vim.cmd.qa, { desc = "Quit all windows" })

-- clear search highlight on Esc
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch, { desc = "Clear search highlight" })

-- keep the selection after indenting in visual mode (so you can repeat < / >)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left, keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right, keep selection" })
