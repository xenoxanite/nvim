return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
		require("telescope").load_extension("projects")
		vim.keymap.set(
			"n",
			"<leader>fp",
			'<cmd>lua require("telescope").extensions.projects.projects({})<CR>',
			{ desc = "Refresh file explorer" }
		) -- refresh file explorer
	end,
}

