--[[
	Name: sumneko_lua.lua
	Description: Configuration files for the sumneko_lua LSP server installed via mason.nvim
	Contains: sumneko/lua-language-server
--]]

require'lspconfig'.sumneko_lua.setup {
	-- CUSTOM_ATTACH is a global variable imported from server_attachment.lua, used for passing custom keys and other things included, on the on_attach event because in non-default cases (the ones which are defined manually by me, they will not have the capability and on_attach thingy being passed down to it)
	on_attach = CUSTOM_ATTACH,
	capability = CMP_CAPABILITIES,
	settings = {
		Lua = {
				runtime = {
					version = 'LuaJIT',
				},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
				},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
