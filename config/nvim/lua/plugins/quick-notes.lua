return {
	"oh-my-bug/quick-notes.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local quick_notes = require("quick-notes")
		quick_notes.setup()
		vim.keymap.set("n", "<leader>n", quick_notes.toggle, {})
	end,
}
