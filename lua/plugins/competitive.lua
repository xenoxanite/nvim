return {
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    init = function()
      require("competitest").setup({
        testcases_directory = ".testcases",
      })
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
      directory = "/home/xenoxanite/dev/leetcode/",
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
