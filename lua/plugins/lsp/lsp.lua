return {
  "neovim/nvim-lspconfig",
  dependencies = {
    
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
		local lspconfig = require("lspconfig")
		local lspui = require("lspconfig.ui.windows")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		lspui.default_options.border = "double"


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


		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
    })
    vim.o.updatetime = 250
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  end,
}
