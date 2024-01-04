return {
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "cpp", "lua", "rust" },
				auto_install = true,
				highlight = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>ss",
						node_incremental = "<leader>si",
						scope_incremental = "<leader>sc",
						node_decremental = "<leader>sd",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["aw"] = "@word.outer",
							["iw"] = "@word.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							["ai"] = { query = "@conditional.outer", desc = "Select condition outer" },
							["ii"] = { query = "@conditional.inner", desc = "Select condition inner" },
							["al"] = { query = "@loop.outer", desc = "Select loop outer" },
							["il"] = { query = "@loop.inner", desc = "Select loop inner" },
						},
						selection_modes = {
							["@parameter.outer"] = "v",
							["@function.outer"] = "v",
							["@class.outer"] = "v",
						},
						include_surrounding_whitespace = true,
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["na"] = "@parameter.outer",
							["nf"] = "@function.outer",
							["nc"] = "@class.outer",
							["ns"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							["ni"] = { query = "@conditional.outer", desc = "Select condition outer" },
							["nl"] = { query = "@loop.outer", desc = "Select loop outer" },
						},
					goto_previous_start = {
							["pa"] = "@parameter.outer",
							["pf"] = "@function.outer",
							["pc"] = "@class.outer",
							["ps"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							["pi"] = { query = "@conditional.outer", desc = "Select condition outer" },
							["pl"] = { query = "@loop.outer", desc = "Select loop outer" },
						},
				},
				},
			})
		end
}
