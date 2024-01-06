local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- normal mode,
keymap("n", ";", ":", { nowait = true })

-- window navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- split window
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>sv", "<C-w>v", opts)

-- window resize
keymap("n", "<C-j>", ":resize +2<cr>", opts)
keymap("n", "<C-k>", ":resize -2<cr>", opts)
keymap("n", "<C-h>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-l>", ":vertical resize +2<cr>", opts)

-- buffer navigation
keymap("n", "<leader>n", ":bnext<cr>", opts)
keymap("n", "<leader>p", ":bprevious<cr>", opts)
keymap("n", "<leader>q", ":bdelete<cr>", opts)

-- basic controll
keymap("n", "<C-s>", ":write<cr>", opts)
keymap("n", "<C-e>", ":Explore<cr>", opts)

-- clear search highlight
keymap("n", "<leader>nh", ":nohlsearch<cr>", opts)
