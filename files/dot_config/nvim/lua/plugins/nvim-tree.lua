--[[
	Name: nvim-tree.lua
	Description: Configuration files for the nvim-tree plugin, a file explorer tree for neovim
	Contains: kyazdani42/nvim-tree.lua
--]]


--[[
	Making a protected call
--]]
local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
	print('There is something wrong with nvim-tree')
	return
end


--[[
	Configuration settings for the plugin
--]]
tree.setup({
	-- Open the tree when if startup buffer is a directory, empty or unnamed. nvim-tree window will be focused.
	open_on_setup = false,

	-- Show LSP and COC diagnostics in the signcolumn
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		custom = {
			-- Hide the .git folder
			"^.git$"
		}
	}
})

--[[
	Key mappings
--]]

-- Toggle nvim-tree
map('n', '<C-b>', ':NvimTreeToggle<CR>')


--[[
	Disable netwr, the default file manager for neovim
	Since we're using nvim-tree now, there's no need to load extraneous plugins
--]]
local global = vim.g
global.loaded_netrw = 1
global.loaded_netrwPlugin = 0
