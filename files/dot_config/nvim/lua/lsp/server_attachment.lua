--[[
	Name: server_attachment.lua
	Description: 
		- This is the module which comes into picture when we need to attach a server to a buffer
		- Making sure the LSP server gets attached to buffers
		- Advertising capabilities of nvim-cmp to the LSP
	Contains:
		- hrsh7th/cmp-nvim-lsp
		- williamboman/mason-lspconfig.nvim

--]]
-- pcalling lspconfig
local statuslocal status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	print('There is something wrong with mason')
	return
end

-- Making protected calls to mason
local statuslocal status_ok, mason = pcall(require, "mason")
if not status_ok then
	print('There is something wrong with mason')
	return
end

-- pcalling mason-lspconfig
local statuslocal status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	print('There is something wrong with mason-lspconfig')
	return
end
mason_lspconfig.setup()

--[[
	Dynamic Server Startup
	Startup servers installed via mason.nvim without having to manually specify every single one of them

	Register a handler that will be called for all the servers, also make sure nvim-cmp adtertises to the that additional capabilities are supported
	nvim-lsp-installer used the on_server_ready API which was deprecated a while back
	What we need to try: https://github.com/LunarVim/Neovim-from-scratch/blob/0981b2838275468ad1863aba908379af63209e7a/lua/user/lsp/lsp-installer.lua#L6
	Discussion link: https://github.com/williamboman/mason.nvim/discussions/40
--]]

-- the above is enough, but if you want to replicate the "on_server_ready" behaviour where your installed servers are setup "automatically" you can do the following


-- Protected call for cmp_nvim_lsp, required for capability advertisement to the LSP
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	print('There is something wrong with cmp_nvim_lsp')
	return
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local custom_attach = function(client, bufnr)
	-- Passing the keymaps so that they can be used
	lsp_keymaps(bufnr)

	-- Disable formatting (for future reference)
--	if client.name == "tsserver" then
--		client.resolved_capabilities.document_formatting = false
--	end
end

mason_lspconfig.setup_handlers {
	function (server_name)
		-- default handler - setup with default settings
		lspconfig[server_name].setup {
			capabilities = capabilities,
			on_attach = custom_attach
		}
	end,

	-- You can override the default handler by providing custom handlers per server
--	["jdtls"] = function ()
--		-- do something with the nvim-jdtls plugin instead
--	end
}
