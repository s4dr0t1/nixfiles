--[[
	Name: handlers.lua
	Previously: lsp.lua
	Description: Configuration settings for the LSP, such as which diagnostic messages to show etc
--]]


--[[
	Configuration
--]]
-- Responsible for showing diagnostic icons and stuff
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	-- disable virtual text
	virtual_text = false,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

--[[
	This function will be used by the server_attachment.lua file to pass these settings to the 
	on_attach event when a server will start, so that we can properly interact with the LSP
	Used in custom_attach
--]]

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
function lsp_keymaps(client, bufnr)
	local opts = { noremap = true, silent = true }
	local set_lsp_key = vim.api.nvim_buf_set_keymap
	set_lsp_key(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	set_lsp_key(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	set_lsp_key(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	set_lsp_key(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	set_lsp_key(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	set_lsp_key(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	set_lsp_key(bufnr, "n", "gk", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	set_lsp_key(
		bufnr,
		"n",
		"gl",
		'<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
		opts
	)
	set_lsp_key(bufnr, "n", "gj", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	set_lsp_key(bufnr, "n", "gm", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	--vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
	

	-- Format on save functionality
	print('LSP attached')
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

end
