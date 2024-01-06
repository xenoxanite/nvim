local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local utils = require("telescope.utils")
local actions_set = require("telescope.actions.set")
local from_entry = require("telescope.from_entry")

local cdPicker = function(name, cmd)
  pickers
      .new({}, {
        prompt_title = name,
        finder = finders.new_table({ results = utils.get_os_command_output(cmd) }),
        previewer = previewers.vim_buffer_cat.new({}),
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(prompt_bufnr)
          actions_set.select:replace(function(_, type)
            local entry = actions_state.get_selected_entry()
            actions.close(prompt_bufnr)
            local dir = from_entry.path(entry)
            vim.cmd("cd " .. dir)
          end)
          return true
        end,
      })
      :find()
end

function Find_directory(path)
  path = path or "."
  cdPicker("Cd", { vim.o.shell, "-c", "fd . " .. path .. " --type=d 2>/dev/null" })
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
        },
      },
      pickers = {},
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            -- even more opts
          }),
        },
      },
    })

    telescope.load_extension("ui-select")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    -- vim.keymap.set("n", "<leader>fp", Find_project, {})
    vim.keymap.set("n", "<leader>fd", Find_directory, {})
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  end,
}
