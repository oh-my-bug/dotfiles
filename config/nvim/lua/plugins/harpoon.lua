return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    vim.keymap.set("n", "<leader>a", mark.add_file, {})
    vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, {})
  end,
}
