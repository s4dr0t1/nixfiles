--[[
	Name: autopairs.lua
	Description: Pair autocompletion for [], {}, () and the likes
	Link: windwp/nvim-autopairs
--]]


--[[
	Configuration
--]]

-- Making a protected call
local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	print('There is something wrong with nvim-autopair')
	return
end

-- Configuration
autopairs.setup {}

-- Hooking into the LSP to augment autocompletion
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
