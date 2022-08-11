--[[ 
	Name: keymaps.lua
	Description: Keymaps independent of any plugin
	Important links:
		- Understanding the map() helper function: https://blog.devgenius.io/create-custom-keymaps-in-neovim-with-lua-d1167de0f2c2
		- Difference b/w remap, noremap, nnoremap, vnoremap: https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
--]]


--[[ 
	Helper function used for key remapping

	local function map(mode, lhs, rhs, optionalData)
	mode here refers to in which mode this keymap will be applied to
		normal_mode = "n",
		insert_mode = "i",
		visual_mode = "v",
		visual_block_mode = "x",
		terminal_mode = "t",
		command_mode = "c",

	lhs = the custom keybinds we need
	rhs = the commands or existing keybinds to customise
	optionalData = additional options
--]]
function map(mode, lhs, rhs, optionalData)
    local options = { noremap = true }
    if optionalData then
        options = vim.tbl_extend("force", options, optionalData)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Remap <ESC> to jk
map('i', 'jk', '<Esc>')

--[[
	Switching between buffers
	Horizontal split                       :hsp
	Vertical split                         :vsp
	Quit the buffer                        <C-W>q
	Switch b/w the last used pane          <C-W>w
--]]
map('n', '<C-H>', '<C-W>h')
map('n', '<C-J>', '<C-W>j')
map('n', '<C-K>', '<C-W>k')
map('n', '<C-L>', '<C-W>l')

--[[
	Enable buffer resizing
	<C>arrow_keys
--]]
map("n", "<C-Up>", ":resize +2<CR>", {silent = true})
map("n", "<C-Down>", ":resize -2<CR>", {silent = true})
map("n", "<C-Left>", ":vertical resize -2<CR>", {silent = true})
map("n", "<C-Right>", ":vertical resize +2<CR>", {silent = true})

--[[
	Buffer Navigation
	<Shift> + h Move one buffer left
	<Shift> + l Move one buffer right
--]]
map("n", "<S-l>", ":bnext<CR>", {silent = true})
map("n", "<S-h>", ":bprevious<CR>", {silent = true})


--[[
	After performing one indentation, stay in indentation  mode
	Use <ESC> or <C-c> to get out of it
--]]
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true})


--[[
	Moving line(s) up or down, similar to how it's done in Visual Studio Code
	Select the lines and use K, J to move them

	-- map('n', 'n', ':m +1<CR>', {noremap = false, silent = true})
	-- map('n', 'm', ':m -2<CR>', {noremap = false, silent = true})
--]]

map("v", "<A-j>", ":m .+1<CR>==", { silent = true })
map("v", "<A-k>", ":m .-2<CR>==", { silent = true })
map("x", "J", ":move '>+1<CR>gv-gv", { silent = true })
map("x", "K", ":move '<-2<CR>gv-gv", { silent = true })
map("x", "<A-j>", ":move '>+1<CR>gv-gv", { silent = true })
map("x", "<A-k>", ":move '<-2<CR>gv-gv", { silent = true })
