local utils = require("core.utils")
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local function map(mode, keys, action, desc)
  desc = desc or ""
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, keys, action, opts)
end

-- normal mode,
keymap("n", ";", ":", { nowait = true })

-- window navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)

-- split window
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>sv", "<C-w>v", opts)

-- window resize
keymap("n", "<C-j>", ":resize +2<cr>", opts)
keymap("n", "<C-k>", ":resize -2<cr>", opts)
keymap("n", "<C-h>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-l>", ":vertical resize +2<cr>", opts)

keymap("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })

-- Indenting
keymap("v", "<", "<gv", { noremap = true, silent = false })
keymap("v", ">", ">gv", { noremap = true, silent = false })


-- basic controll
keymap("n", "<C-s>", ":write<cr>", opts)
keymap("n", "<C-e>", ":Explore<cr>", opts)

-- clear search highlight
keymap("n", "<leader>nh", ":nohlsearch<cr>", opts)
