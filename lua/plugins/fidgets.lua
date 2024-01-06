return {
  "j-hui/fidget.nvim",
  event = "UiEnter",
  config = function()
    local fidget = require("fidget")
    fidget.setup({
      notification = {
        window = {
          winblend = "0",
        },
      },
    })
    vim.notify = fidget.notify
  end,
}
