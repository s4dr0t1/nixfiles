--[[
	Name: null_ls.lua
	Description: Contains configuration files for the null_ls plugin, which is used to hook into the LSP
	Contains: jose-elias-alvarez/null-ls.nvim
--]]

-- Protective call to null-ls
local status, null_ls = pcall(require, "null-ls")
if not status then
	print('There is something wrong with null-ls')
	return
end


-- Defining variables to make our lives easier :')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

--[[
	Specifying LSP sources
	Check this link for more information: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
--]]
local sources = {
	-- Formatting
	formatting.black,
	formatting.shfmt,

	-- Diagnostics
	diagnostics.shellcheck,
	diagnostics.vale.with({
		extra_filetypes = { "txt", "text" },
		extra_args = { "--config", vim.fn.expand("~/.config/vale/.vale.ini") },
	}),
}

-- Used to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Configuration
null_ls.setup({
	debug = false,
	sources = sources,
	-- Format on save
	on_attach = function(client, bufnr)
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
	end,
})
