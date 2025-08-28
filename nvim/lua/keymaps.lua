vim.keymap.set("n", "<C-s>", ":write<CR>", { desc = "Save File", noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", ":quit<CR>", { desc = "Quit Neovim", noremap = true, silent = true })

-- window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "pindah window ke kiri", noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "pindah window ke bawah", noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "pindah window ke atas", noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "pindah window ke bawah", noremap = true, silent = true })

vim.keymap.set("n", "<C-w>v", ":vsplit<CR>", { desc = "pindah window ke bawah", noremap = true, silent = true })
vim.keymap.set("n", "<C-w>s", ":split<CR>", { desc = "pindah window ke samping", noremap = true, silent = true })

-- buffer
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>ba", "<Cmd>BufferLineCloseOthers<CR>", { desc = "close all other visible buffers " })
