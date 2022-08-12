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
local statuslocal
status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	print('There is something wrong with mason')
	return
end

-- Making protected calls to mason
local statuslocal
status_ok, mason = pcall(require, "mason")
if not status_ok then
	print('There is something wrong with mason')
	return
end

-- pcalling mason-lspconfig
local statuslocal
status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
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
CMP_CAPABILITIES = vim.lsp.protocol.make_client_capabilities()
CMP_CAPABILITIES = cmp_nvim_lsp.update_capabilities(CMP_CAPABILITIES)

--[[
	Things to do when a server is attached to a buffer
	This one here is pretty important, apart from being used in mason_lspconfig just few lines below, it's also used in the server configurations
	Because in those cases, the default handler will not run, and thus on_attach will not be passed so we need to pass it
	That is why I've made the variable global so that they can be accessed through server configurations settings
--]]

-- Used for enabling formatting on save option
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
CUSTOM_ATTACH = function(client, bufnr)
	print('Hello from CUSTOM_ATTACH')
	-- Passing the keymaps so that they can be used
	lsp_keymaps(bufnr)


	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.formatting_sync()
			end,
		})
	end


	-- Disable formatting (for future reference)
	--	if client.name == "tsserver" then
	--		client.resolved_capabilities.document_formatting = false
	--	end
end

mason_lspconfig.setup_handlers {
	function(server_name)
		-- default handler - setup with default settings
		lspconfig[server_name].setup {
			capabilities = CMP_CAPABILITIES,
			on_attach = CUSTOM_ATTACH
		}
	end,

	-- For those servers with custom settings, define them here, all servers which you want to start up with default settings will be dealt by the upper code snippet. The server name convention followed here will be that of lspconfig, and not mason's package names. Check this link for more information: https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

	["sumneko_lua"] = function()
		require('lsp/server_settings/sumneko_lua')
	end,
}
