--[[
	Name: telescope.lua
	Description: Configuration files for the telescope plugin
	Link: https://github.com/nvim-telescope/telescope.nvim
	Dependency: plenary.nvim
--]]

-- Keymaps
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fb', ':Telescope buffers<cr>')
map('n', '<leader>fh', ':Telescope help_tags<cr>')

-- Telescope settings
require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		}
	}
}

-- To get fzf loaded and working with telescope, you need to call load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
