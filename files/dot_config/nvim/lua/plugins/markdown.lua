--[[
	Name: markdown.lua
	Description: Configuration file for the live-markdown server
	Link: iamcco/markdown-preview.nvim
--]]

--[[
	Configuration
--]]


local global = vim.g

-- Automatically start the server after opening a markdown file
global.mkdp_auto_start = 1

-- Shut down the server when we change the buffer
global.mkdp_auto_close = 0

-- Update the contents live
global.mkdp_refresh_slow = 0

-- Only bind to localhost
global.mkdp_open_to_the_world = 0

-- Default theme
global.mkdp_theme = 'dark'
