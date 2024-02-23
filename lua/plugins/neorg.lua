return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = { config = { icon_preset = "varied" } },
				["core.keybinds"] = {
					config = {
						-- neorg_leader = " ",
						default_keybind = true,
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/docs/notes",
							college = "~/docs/notes/college",
						},
						default_workspace = "notes",
					},
				},
			},
		})
		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
