return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")
    -- border
    wk.setup({
      window = {
        border = "single",
      },
    })

    local terminal = require("toggleterm.terminal").Terminal

    local toggle_lazygit = function()
      local lazygit = terminal:new({ cmd = "lazygit", direction = "float" })
      return lazygit:toggle()
    end
    -- Keymaps
    local mappings = {
      -- Basic Operations
      q = { ":q<cr>", "Quit File" },
      Q = { ":q!<cr>", "Force Quit File" },

      -- Buffers
      b = {
        name = "Buffers",
        x = { ":bdelete<cr>", "Close Buffer" },
        n = { ":bnext<cr>", "Next Buffer" },
        l = { ":blast<cr>", "Last Buffer" },
      },

      -- tabs
      t = {
        name = "Tabs",
        n = { ":tabnext", "Next Tab" },
        p = { ":tabprevious", "Previous Tab" },
        x = { ":tabclose", "Close Tab" },
        c = { ":tabnew", "Create Tab" },

        l = { toggle_lazygit, "LazyGit" },
      },

      -- NvimTree
      e = {
        name = "NvimTree",
        e = { ":NvimTreeToggle<cr>", "Toggle" },
        f = { ":NvimTreeFocus<cr>", "Focus" },
        q = { ":NvimTreeClose<cr>", "Close" },
        c = { ":NvimTreeCollapse<cr>", "Collapse" },
      },

      -- Telescope
      f = {
        name = "Telescope",

        f = { ":Telescope find_files <cr>", "Telescope find_files" },
        w = { ":Telescope current_buffer_fuzzy_find <cr>", "Fuzzy Find in File" },
        o = { ":Telescope oldfiles <cr>", "Telescope oldfiles" },
        g = { ":Telescope live_grep <cr>", "Telescope live_grep" },
        r = { ":Telescope resume <cr>", "Telescope resume" },
        b = { ":Telescope buffers <cr>", "Telescope buffers" },
        -- f = { ":Telescope find_files theme=ivy<cr>", "Telescope find_files" },
        -- w = { ":Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Fuzzy Find in File" },
        -- o = { ":Telescope oldfiles theme=ivy<cr>", "Telescope oldfiles" },
        -- g = { ":Telescope live_grep theme=ivy<cr>", "Telescope live_grep" },
        -- r = { ":Telescope resume theme=ivy<cr>", "Telescope resume" },
        -- b = { ":Telescope buffers theme=ivy<cr>", "Telescope buffers" },
      },

      -- Competitest
      c = {
        name = "Competitest",
        t = { "<cmd>CompetiTest run<cr>", "Test" },
        u = { "<cmd>CompetiTest show_ui<cr>", "Show ui" },
        a = { "<cmd>CompetiTest add_testcase<cr>", "Add testcase" },
        e = { ":CompetiTest edit_testcase ", "Edit testcase" },
        r = {
          name = "Recieve",
          c = { "<cmd>CompetiTest receive contest<cr>", "Contest" },
          p = { "<cmd>CompetiTest receive problem<cr>", "Problem" },
          t = { "<cmd>CompetiTest receive testcases<cr>", "Testcases" },
        },
      },

      -- window
      w = {
        name = "Window",
        v = { ":vsplit<cr>", "Split Vertically" },
        H = { ":split<cr>", "Split Horizontally" },
        j = { "<C-w>j", "Move to below window" },
        k = { "<C-w>k", "Move to above window" },
        h = { "<C-w>h", "Move to left window" },
        l = { "<C-w>l", "Move to right window" },
      },

      -- Lsp Stuffs
      l = {
        name = "LSP",
        i = { ":LspInfo<cr>", "Connected Language Servers" },
        f = { vim.lsp.buf.format, "Format code" },
        k = { vim.lsp.buf.signature_help, "Signature Help" },
        K = { vim.lsp.buf.hover, "Hover Commands" },
        w = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
        W = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
        l = {
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
          "List Workspace Folders",
        },
        t = { vim.lsp.buf.type_definition, "Type Definition" },
        d = { vim.lsp.buf.definition, "Go To Definition" },
        D = { vim.lsp.buf.declaration, "Go To Declaration" },
        R = { vim.lsp.buf.references, "References" },
        r = { vim.lsp.buf.rename, "Rename" },
        a = { vim.lsp.buf.code_action, "Code Action" },
        e = { vim.diagnostic.show, "Show Line Diagnostics" },
        n = { vim.diagnostic.goto_next, "Go To Next Diagnostic" },
        p = { vim.diagnostic.goto_prev, "Go To Previous Diagnostic" },
      },

      r = {
        name = "Code runner",
        r = { ":RunCode<cr>", "Open code runner" },
        c = { ":RunClose<cr>", "Close code runner" },
      },
    }

    local opts = { prefix = "<leader>" }
    wk.register(mappings, opts)
  end,
}
