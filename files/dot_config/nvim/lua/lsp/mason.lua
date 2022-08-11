--[[
	Name: mason.lua
	Description: Configuration files for the mason toolkit
	Link: https://github.com/williamboman/mason.nvim#requirements
	Link: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
--]]


-- Making protected calls to mason and mason_lspconfig
local statuslocal status_ok, mason = pcall(require, "mason")
if not status_ok then
	print('There is something wrong with mason')
	return
end

local statuslocal status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	print('There is something wrong with mason')
	return
end

local statuslocal status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	print('There is something wrong with mason-lspconfig')
	return
end

local statuslocal status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not status_ok then
	print('There is something wrong with mason-tool-installer')
	return
end

-- Starting them up
mason.setup()
mason_lspconfig.setup()

-- Automatically install these language servers if they don't exist
mason_tool_installer.setup {
	ensure_installed = {
	--[[
		-- You can pin a tool to a particular version
		{ 'golangci-lint', version = '1.47.0' },
		
		-- You can turn off/on auto_update per tool
		{ 'bash-language-server', auto_update = true },
	
	--]]
--		'clangd',
--		'bash-language-server',
--		'dockerfile-language-server',
--		'json-lsp',
--		'ltex-ls',
--		'lua-language-server',
--		'marksman',
--		'pyright',
--		'rust-analyzer',
--		'typescript-language-server',
--		'yaml-language-server',
--		'autopep8',
	},

	auto_update = false,

	-- Automatically install / update on startup. If set to false nothing
	run_on_start = true,

	-- set a delay (in ms) before the installation starts.
	start_delay = 3000
}


--[[
	Register a handler that will be called for all the servers
	nvim-lsp-installer used the on_server_ready API which was deprecated a while back
	What we need to try: https://github.com/LunarVim/Neovim-from-scratch/blob/0981b2838275468ad1863aba908379af63209e7a/lua/user/lsp/lsp-installer.lua#L6
	Discussion link: https://github.com/williamboman/mason.nvim/discussions/40
--]]

-- the above is enough, but if you want to replicate the "on_server_ready" behaviour where your installed servers are setup "automatically" you can do the following
mason_lspconfig.setup_handlers {
	function (server_name)
		-- default handler - setup with default settings
		lspconfig[server_name].setup {}
	end,

	-- You can override the default handler by providing custom handlers per server
--	["jdtls"] = function ()
--		-- do something with the nvim-jdtls plugin instead
--	end
}
