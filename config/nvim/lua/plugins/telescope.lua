--[[
	Name: telescope.lua
	Description: Configuration files for the telescope plugin
	Link: https://github.com/nvim-telescope/telescope.nvim
	Dependency: plenary.nvim
--]]


-- Making a protected call
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print('There is something wrong with telescope')
	return
end

-- Keymaps
map('n', '<leader>ff', ':Telescope find_files<cr>', { silent = true })
map('n', '<leader>fg', ':Telescope live_grep<cr>', { silent = true })
map('n', '<leader>fb', ':Telescope buffers<cr>', { silent = true })
map('n', '<leader>fh', ':Telescope help_tags<cr>', { silent = true })


-- Some basic book-keeping that will be used in the configuration later
local actions = require "telescope.actions"

-- Don't preview binaries
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
	filepath = vim.fn.expand(filepath)
	Job:new({
		command = "file",
		args = { "--mime-type", "-b", filepath },
		on_exit = function(j)
			local mime_type = vim.split(j:result()[1], "/")[1]
			if mime_type == "text" then
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			else
				-- maybe we want to write something to the buffer here
				vim.schedule(function()
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
				end)
			end
		end
	}):sync()
end



-- Telescope settings
telescope.setup {
	defaults = {
		-- Don't preview binaries
		-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#dont-preview-binaries
		buffer_previewer_maker = new_maker;
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,
				["<ESC>"] = actions.close,
			}
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		}
	},
}

-- Loading extensions
require('telescope').load_extension('fzf')
