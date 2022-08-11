--[[
	Name: capabilities.lua
	Description: Enabling special capabilities for language servers supported by nvim-cmp
	Link: https://github.com/hrsh7th/nvim-cmp
--]]

-- Protective calling lspconfig
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	print('There is something wrong with lspconfig')
	return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	print('There is something wrong with cmp_nvim_lsp')
	return
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
