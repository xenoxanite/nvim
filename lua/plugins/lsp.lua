return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvimtools/none-ls.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
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

    local M = {}
    M.on_attach = function()
      -- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
      if vim.fn.has("nvim-0.10") == 1 then
        vim.lsp.inlay_hint.enable(0, true)
      end
    end

    M.capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.nil_ls.setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    })
    lspconfig.clangd.setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    })
    lspconfig.rust_analyzer.setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    })
    lspconfig.svelte.setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    })
    lspconfig.tailwindcss.setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    })

    lspconfig.tsserver.setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    })
    lspconfig.lua_ls.setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          hint = { enable = true },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    })

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = false,
    })
    vim.o.updatetime = 250
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

    vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)

    -- Keybindings for lsp
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end,
    })
  end,
}
