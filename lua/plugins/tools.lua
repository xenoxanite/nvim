return {
  {
    "CRAG666/code_runner.nvim",
    event = "BufReadPre",
    config = function()
      local code_runner = require("code_runner")

      code_runner.setup({
        mode = "term",
        startinsert = true,
        filetype = {
          java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          python = "python3 -u",
          typescript = "deno run",
          rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
          c = "cd $dir && mkdir -p bin && cd bin && gcc ../$fileName -o $fileName.exe && ./$fileName.exe",
          cpp = "cd $dir && mkdir -p .bin && cd .bin && g++ ../$fileName -o $fileName.exe && ./$fileName.exe",
        },
        project = {},
      })

      local keymap = vim.api.nvim_set_keymap
      keymap("n", "<leader>rr", ":RunCode<cr>", {
        silent = true,
      })

      keymap("n", "<leader>rc", ":RunClose<cr>", {
        silent = true,
      })
    end,
  },
  {
    "mg979/vim-visual-multi",
  },
}
