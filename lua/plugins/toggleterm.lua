return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<c-\>]],
      direction = "horizontal",
    })
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<C-\\>", ":ToggleTerm<CR>")
    keymap.set("t", "<C-\\>", "<Cmd>ToggleTerm<CR>")
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
  end,
}
