--[[
	Name: packer.lua
	Description: Configuration file for Packer, used for plugin management
	Contains: wbthomason/packer.nvim

--]]

--[[
	Don't touch these configuration options
	They are for bootstrapping purposes
--]]

-- Automatically install packer if it doesn't exist
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.cmd [[packadd packer.nvim]]
end

-- Do :PackerSync each time this file is updated
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost packer.lua source <afile> | PackerSync
	augroup end
]])

--[[
	Configuration options
--]]

-- Define a protected call to packer viz. don't run anything related to packer if there's some error with packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end


-- Use a popup window when showing Packer
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Packer Management
return packer.startup(function(use)
	-- Letting packer manage itself
	use 'wbthomason/packer.nvim'

	-- File explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- File icons
			opt = true
		},
		tag = 'nightly'
	}

	-- nvim.surround, similar to vim surround
	use 'kylechui/nvim-surround'

	-- Automatic pairs
	use {
		'windwp/nvim-autopairs',
		requires = {
			'nvim-treesitter/nvim-treesitter',
			opt = true
		}

	}

	-- Show indentation lines
	use
	{
		'lukas-reineke/indent-blankline.nvim',
		requires = {
			'nvim-treesitter/nvim-treesitter',
			opt = true
		}
	}

	-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- The colorscheme
	use {
		'EdenEast/nightfox.nvim',
		requires = {
			'nvim-treesitter/nvim-treesitter',
			opt = true
		}
	}

	-- Git integration
	use 'lewis6991/gitsigns.nvim'

	-- Tabline
	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = {
			'neovim/nvim-lspconfig',
			'kyazdani42/nvim-web-devicons',
			opt = true
		},
	}
	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
	}

	-- Having treesitter as a dependency
	use {
		-- Different color groups for consecutive () and shit
		'p00f/nvim-ts-rainbow',

		-- Similar to ctags
		'simrat39/symbols-outline.nvim',
		requires = {
			'nvim-treesitter/nvim-treesitter',
		}
	}

	-- LSP support
	use 'neovim/nvim-lspconfig'

	-- Language server management
	use {
		{
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			requires = {
				'neovim/nvim-lspconfig'
			}
		},
		{
			-- Automatically install all the language servers using Mason if they don't exist
			'WhoIsSethDaniel/mason-tool-installer.nvim',
			requires = {
				'neovim/nvim-lspconfig',
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim'
			}
		}
	}

	-- Augmenting the LSP by hooking into it, using null-ls
	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'nvim-lua/plenary.nvim'
		}
	}

	-- Autocompletion
	use {
		-- The core Autocompletion plugin
		'hrsh7th/nvim-cmp',

		-- Autocompletion from the LSP
		{
			'hrsh7th/cmp-nvim-lsp',
			requires = {
				'neovim/nvim-lspconfig',
				'hrsh7th/nvim-cmp'
			}
		},
		-- Snippet engine
		'L3MON4D3/LuaSnip',
		'rafamadriz/friendly-snippets',
		{
			-- Autocompletion from snippets
			'saadparwaiz1/cmp_luasnip',
			requires = {
				'L3MON4D3/LuaSnip'
			}
		},

		-- Autocompletion from buffer
		{
			-- Autocompletion from buffer
			'hrsh7th/cmp-buffer',
			-- Autocompletion from path
			'hrsh7th/cmp-path',
			requires = {
				'hrsh7th/nvim-cmp'
			}
		}
	}

	-- Fuzzy finder: Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			-- Make nvim act as the LSP itself to inject stuff
			'nvim-lua/plenary.nvim',
			{ 'kyazdani42/nvim-web-devicons', opt = true },
			{ 'neovim/nvim-lspconfig/', opt = true },
			{ 'nvim-treesitter/nvim-treesitter', opt = true },
		},
		run = {
			'sudo apt-get install fd-find',
			'sudo apt-get install ripgrep'
		}
	}
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		requires = {
			'nvim-telescope/telescope.nvim'
		},
		run = 'make'

	}

	-- Terminal integration
	use {
		'akinsho/toggleterm.nvim',
		tag = 'v2.*',
	}

	-- Markdown live preview
	use {
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
	}

	-- This must always be placed at the end.
	-- Automatically setup your configuration after cloning packer.nvim if it doesn't exist already
	if packer_bootstrap then
		require('packer').sync()
	end
end)
