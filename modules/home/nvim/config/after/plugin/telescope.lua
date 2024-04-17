require("telescope").setup {
	pickers = {
		git_files = {
			show_untracked = true
		}
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>pd", builtin.live_grep, {})
vim.keymap.set("n", "<leader>per", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>prr", builtin.lsp_references, {})

