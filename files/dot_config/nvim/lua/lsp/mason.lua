--[[
	Name: mason.lua
	Description: Configuration files for the mason toolkit
	Contains:
	- williamboman/mason.nvim
	- WhoIsSethDaniel/mason-tool-installer.nvim
	- neovim/nvim-lspconfig/
	- williamboman/mason-lspconfig.nvim
--]]


-- Making protected calls to mason and mason_lspconfig
local statuslocal status_ok, mason = pcall(require, "mason")
if not status_ok then
	print('There is something wrong with mason')
	return
end

local statuslocal status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not status_ok then
	print('There is something wrong with mason-tool-installer')
	return
end

-- Starting them up
mason.setup()

-- Automatically install these language servers if they don't exist
mason_tool_installer.setup {
	ensure_installed = {
		'clangd',
		'bash-language-server',
		'json-lsp',
		'ltex-ls',
		'lua-language-server',
		-- 'marksman',
		'pyright',
		'rust-analyzer',
		'typescript-language-server',
		'yaml-language-server',
	},

	auto_update = false,

	-- Automatically install / update on startup. If set to false nothing
	run_on_start = true,

	-- set a delay (in ms) before the installation starts.
	start_delay = 3000
}
