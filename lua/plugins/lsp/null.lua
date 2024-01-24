return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
              -- Formatter
              null_ls.builtins.formatting.stylua,
              null_ls.builtins.formatting.nixfmt,
              null_ls.builtins.formatting.rustfmt,
              null_ls.builtins.formatting.black,
              null_ls.builtins.formatting.clang_format,
              null_ls.builtins.formatting.prettier,
            
              -- Code actions
              null_ls.builtins.code_actions.statix,
              null_ls.builtins.code_actions.eslint_d,
            
              -- Diagnostic
              null_ls.builtins.diagnostics.statix,
              null_ls.builtins.diagnostics.clang_check,
            },
      })
    end
}