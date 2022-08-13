--[[
	Name: mason.lua
	Description: Configuration files for the mason toolkit viz. installation of LSP servers
	Contains:
		- williamboman/mason.nvim
		- WhoIsSethDaniel/mason-tool-installer.nvim
--]]


-- Making protected calls to mason and mason_lspconfig
local statuslocal
status_ok, mason = pcall(require, "mason")
if not status_ok then
	print('There is something wrong with mason')
	return
end

local statuslocal
status_ok, installer = pcall(require, "mason-tool-installer")
if not status_ok then
	print('There is something wrong with mason-tool-installer')
	return
end

-- Starting them up
mason.setup()

-- Custom keybind to open Mason
require('core/keymaps')
map('n', '<leader>m', ':Mason<CR>', { silent = true })

-- Automatically install these language servers if they don't exist
installer.setup {
	-- The naming convention followed here will be that of mason, check the file PACKAGES.md in mason.nvim GitHub repository
	ensure_installed = {
		-- Language servers
		'clangd',
		'bash-language-server',
		'json-lsp',
		--		'ltex-ls',
		'lua-language-server',
		'pyright',
		'rust-analyzer',
		'typescript-language-server',
		'yaml-language-server',

		-- Formatters
		'shfmt',
		'black',

		-- Linters
		'shellcheck',
		'vale'
	},

	-- Language servers
	auto_update = false,

	-- Automatically install / update on startup. If set to false nothing
	run_on_start = true,

	-- set a delay (in ms) before the installation starts.
	start_delay = 3000
}
