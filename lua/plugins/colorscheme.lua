local catppuccin = {
   "catppuccin/nvim",
   name = "catppuccin",
   priority = 1000 ,
   config = function()
     require("catppuccin").setup({
       flavour = "mocha", -- latte, frappe, macchiato, mocha
       background = { -- :h background
         light = "latte",
       },
       transparent_background = true, -- disables setting the background color.
       styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
         comments = { "italic" }, -- Change the style of comments
         conditionals = { "italic" },
         loops = {},
         functions = {},
         keywords = {},
         strings = {},
         variables = {},
         numbers = {},
         booleans = {},
         properties = {},
         types = {},
         operators = {},
       },
       color_overrides = {},
       custom_highlights = {},
       integrations = {
         cmp = true,
         gitsigns = true,
         nvimtree = true,
         treesitter = true,
         notify = false,
         mini = {
           enabled = true,
           indentscope_color = "",
         },
       },
     })

     -- setup must be called before loading
     vim.cmd.colorscheme "catppuccin"
   end
 }

 return catppuccin
