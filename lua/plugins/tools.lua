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
    end,
  },
  {
    "mg979/vim-visual-multi",
    "norcalli/nvim-colorizer.lua",
    "norcalli/nvim-colorizer.lua",
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup()
    end,
  },
}
