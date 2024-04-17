-- Packer bootstrapping stuff
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Plugins start

	-- Telescope: file browser - fuzzy finding
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- tokyonight: Color scheme
	use('folke/tokyonight.nvim')

	-- Treesitter: Generates AST for syntax highlighting, (and stuff?)
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- Harpoon: For switching between files, sort of like tabs
	use('theprimeagen/harpoon')

	-- Fugitive: Git wrapepr
	use('tpope/vim-fugitive')

	-- Undotree: Git graph of changes for undo/redo
	use('mbbill/undotree')

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			--{'hrsh7th/cmp-buffer'},       -- Optional
			--{'hrsh7th/cmp-path'},         -- Optional
			--{'saadparwaiz1/cmp_luasnip'}, -- Optional
			--{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

	-- Airline: Status bar
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Neoformat: Autoformatting
	use('sbdchd/neoformat')

	-- Which key: shows keybinds
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup()
		end
	}

	-- Flutter
	use("nvim-lua/plenary.nvim")
	use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

	-- auto close tags
	use("alvan/vim-closetag")

	-- multicursor
	use("mg979/vim-visual-multi")

	-- Copilot
	use("github/copilot.vim")

	-- Neo Tree
	vim.g.neo_tree_remove_legacy_commands = 1
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	}

	-- Tmux plugin
	use("christoomey/vim-tmux-navigator")

	-- Plugins end

	if packer_bootstrap then
		require('packer').sync()
	end
end)
