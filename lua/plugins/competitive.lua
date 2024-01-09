return {
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    init = function()
      require("competitest").setup({
        testcases_directory = ".testcases",
      })
    end,
    config = function()
      local set_keymap = vim.keymap.set
      set_keymap("n", "<leader>tr", "<cmd>CompetiTest run<CR>")
      set_keymap("n", "<leader>tu", "<cmd>CompetiTest show_ui<CR>")
      set_keymap("n", "<leader>trc", "<cmd>CompetiTest receive contest<CR>")
      set_keymap("n", "<leader>trp", "<cmd>CompetiTest receive problem<CR>")
      set_keymap("n", "<leader>trt", "<cmd>CompetiTest receive testcases<CR>")
      set_keymap("n", "<space>ta", "<cmd>CompetiTest add_testcase<CR>")
      set_keymap("n", "<space>te", ":CompetiTest edit_testcase ")
    end,
    ft = "cpp",
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",
      -- optional
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      directory = "/home/xenoxanite/codes/competitive-programming/leetcode/",
      lang = "cpp",
      arg = "leetcode.nvim",
      cn = { -- leetcode.cn
        enabled = false,
        translator = true,
        translate_problems = true,
      },
      description = {
        -- show_stats = false,
      },
      key = {},
      image_support = false,
    },
  },
}
