return {

  "folke/which-key.nvim",
  dependencies = {
    "akinsho/toggleterm.nvim",
  },

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")
    -- border
    wk.setup({
      window = {
        border = "double",
      },
    })

    local terminal = require("toggleterm.terminal").Terminal

    local toggle_float = function()
      local float = terminal:new({ direction = "float" })
      return float:toggle()
    end

    local toggle_lazygit = function()
      local lazygit = terminal:new({ cmd = "lazygit", direction = "float" })
      return lazygit:toggle()
    end

    -- Keymaps
    local mappings = {
      -- Basic Operations
      q = { ":q<cr>", "Quit File" },
      Q = { ":q!<cr>", "Force Quit File" },
      w = { ":w<cr>", "Save File" },
      W = { ":w!<cr>", "Force Save File" },

      -- Buffers
      b = {
        name = "buffers",

        x = { ":bdelete<cr>", "Close Buffer" },
        n = { ":bnext<cr>", "Next Buffer" },
        l = { ":blast<cr>", "Last Buffer" },
      },

      t = {
        name = "Tab",

        n = { ":tabnext", "Next Tab" },
        p = { ":tabprevious", "Previous Tab" },
        x = { ":tabclose", "Close Tab" },
        c = { ":tabnew", "Create Tab" },

        -- terminal
        t = { ":ToggleTerm<cr>", "Split Below" },
        f = { toggle_float, "Floating Terminal" },
        l = { toggle_lazygit, "LazyGit" },
      },

      Ec = { ":e ~/.config/nvim<cr>", "Edit Configs" },

      -- NvimTree
      e = {
        name = "NvimTree",
        e = { ":NvimTreeToggle<cr>", "NvimTreeToggle" },
        f = { ":NvimTreeFocus<cr>", "NvimTreeFocus" },
        h = { ":e ~/<cr>", "NvimTreeHome" },
      },
      -- Telescope
      f = {
        name = "Telescope",
        f = { ":Telescope find_files theme=ivy<cr>", "Telescope find_files" },
        w = { ":Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Fuzzy Find in File" },
        o = { ":Telescope oldfiles theme=ivy<cr>", "Telescope oldfiles" },
        g = { ":Telescope live_grep theme=ivy<cr>", "Telescope live_grep" },
        r = { ":Telescope resume theme=ivy<cr>", "Telescope resume" },
        b = { ":Telescope buffers theme=ivy<cr>", "Telescope buffers" },
      },
      -- Split
      p = {
        name = "Split",
        v = { ":vsplit<cr>", "Split Vertically" },
        h = { ":split<cr>", "Split Vertically" },
      },

      -- Lsp Stuffs
      l = {
        name = "LSP",
        i = { ":LspInfo<cr>", "Connected Language Servers" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format code" },
        k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        K = { "<cmd>lua vim.lsp.buf.hover<cr>", "Hover Commands" },
        w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
        W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
        l = {
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
          "List Workspace Folders",
        },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
        R = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        r = { vim.lsp.buf.rename, "Rename" },
        a = { vim.lsp.buf.code_action, "Code Action" },
        e = { vim.diagnostic.show, "Show Line Diagnostics" },
        n = { vim.diagnostic.goto_next, "Go To Next Diagnostic" },
        p = { vim.diagnostic.goto_prev, "Go To Previous Diagnostic" },
      },

      r = {
        r = { ":RunCode<cr>", "Open code runner" },
        c = { ":RunClose<cr>", "Close code runner" },
      },
    }

    local opts = { prefix = "<leader>" }
    wk.register(mappings, opts)
  end,
}
