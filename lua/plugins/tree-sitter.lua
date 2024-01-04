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
							["naa"] = "@parameter.outer",
							["nia"] = "@parameter.inner",
							["naf"] = "@function.outer",
							["nif"] = "@function.inner",
							["nac"] = "@class.outer",
							["nic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["nas"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							["nai"] = { query = "@conditional.outer", desc = "Select condition outer" },
							["nii"] = { query = "@conditional.inner", desc = "Select condition inner" },
							["nal"] = { query = "@loop.outer", desc = "Select loop outer" },
							["nil"] = { query = "@loop.inner", desc = "Select loop inner" },
						},
						goto_next_end = {
							["naA"] = "@parameter.outer",
							["niA"] = "@parameter.inner",
							["naF"] = "@function.outer",
							["niF"] = "@function.inner",
							["naC"] = "@class.outer",
							["niC"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["naS"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							["naI"] = { query = "@conditional.outer", desc = "Select condition outer" },
							["niI"] = { query = "@conditional.inner", desc = "Select condition inner" },
							["naL"] = { query = "@loop.outer", desc = "Select loop outer" },
							["niL"] = { query = "@loop.inner", desc = "Select loop inner" },
						},
						goto_previous_start = {
							["paa"] = "@parameter.outer",
							["pia"] = "@parameter.inner",
							["paf"] = "@function.outer",
							["pif"] = "@function.inner",
							["pac"] = "@class.outer",
							["pic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["pas"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							["pai"] = { query = "@conditional.outer", desc = "Select condition outer" },
							["pii"] = { query = "@conditional.inner", desc = "Select condition inner" },
							["pal"] = { query = "@loop.outer", desc = "Select loop outer" },
							["pil"] = { query = "@loop.inner", desc = "Select loop inner" },
						},
						goto_previous_end = {
							["paA"] = "@parameter.outer",
							["piA"] = "@parameter.inner",
							["paF"] = "@function.outer",
							["piF"] = "@function.inner",
							["paC"] = "@class.outer",
							["piC"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["paS"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							["paI"] = { query = "@conditional.outer", desc = "Select condition outer" },
							["piI"] = { query = "@conditional.inner", desc = "Select condition inner" },
							["paL"] = { query = "@loop.outer", desc = "Select loop outer" },
							["piL"] = { query = "@loop.inner", desc = "Select loop inner" },
						},
					},
				},
			})
		end
}
