return {
	"akinsho/toggleterm.nvim",

	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 13,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			shade_terminal = true,
			shading_factor = 1,
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal",
			autochdir = true,
		})
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<C-\\>", ":ToggleTerm<CR>")
    keymap.set("t", "<C-\\>", "<Cmd>ToggleTerm<CR>")
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
	end,
}
