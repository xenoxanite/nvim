return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig/util")
    local M = {}
    M.on_attach = function()
      -- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
      if vim.fn.has("nvim-0.10") == 1 then
        vim.lsp.inlay_hint.enable(0, true)
      end
    end

    M.capabilities = vim.lsp.protocol.make_client_capabilities()
    M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)

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
      filetype = { "rust" },
      root_dir = util.root_pattern("*"),
      settings = {
        ["rust-analyzer"] = {
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          procMacro = {
            enable = true,
          },
        },
      },
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

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = true,
      underline = true,
      severity_sort = false,
      float = {
        border = "single",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "single",
    })

    vim.o.updatetime = 250
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  end,
}
