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
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
-- window navigation


-- window resize
keymap("n", "<C-j>", ":resize +2<cr>", opts)
keymap("n", "<C-k>", ":resize -2<cr>", opts)
keymap("n", "<C-h>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-l>", ":vertical resize +2<cr>", opts)

-- Indenting
keymap("v", "<", "<gv", { noremap = true, silent = false })
keymap("v", ">", ">gv", { noremap = true, silent = false })


-- basic controll
keymap("n", "<C-s>", ":write<cr>", opts)

-- clear search highlight
keymap("n", "<leader>nh", ":nohlsearch<cr>", opts)
