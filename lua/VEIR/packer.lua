vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use) 
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  
  --gotta know who to blame (it was me)
  use('f-person/git-blame.nvim')

  -- git status on left side, amazing
  use('lewis6991/gitsigns.nvim')

  -- git view difference between files
  use('sindrets/diffview.nvim')

  -- fuzzy finder for files, searching all files, etc
  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  })

  -- theme
  use('martinsione/darkplus.nvim')

  -- file helper -- TODO should learn how to use this better
  use('ThePrimeagen/harpoon')

  -- really nice, can see undo / redo history in a tree
  use('mbbill/undotree')

  -- magic
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })


	-- LSP
	use({'neovim/nvim-lspconfig'})
	use({'hrsh7th/nvim-cmp'})
	use({'hrsh7th/cmp-nvim-lsp'})
	use({'williamboman/mason.nvim'})
	use({'williamboman/mason-lspconfig.nvim'})

  -- nice closing opening ([{
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  -- close div tags and such in html, react
  use {
    "windwp/nvim-ts-autotag",
      config = function() require("nvim-ts-autotag").setup {} end
  }

  -- multiple cursors
  use({'mg979/vim-visual-multi', branch = 'master'})

  -- higlights words that are the same as what is under your cursor
  use('yamatsum/nvim-cursorline')

  -- vertical lines to help see indentation
  use({
    'lukas-reineke/indent-blankline.nvim',
    opts = {},
  })

  -- line on bottom to say which file you are in
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })

  -- adds the nice icons
  use('nvim-tree/nvim-web-devicons')

  -- helps making commnets
  use('preservim/nerdcommenter')

  -- gives red errors with lsp I suppose, can open and see error and warnings
  use({
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    },
  })

  -- for nice search like vs code
  use('nvim-pack/nvim-spectre')

  -- for the tab manager like vscode, amazing
  use('romgrk/barbar.nvim')

  -- love Tim Pope

  -- session manager, keeps file / state open
  use('tpope/vim-obsession')

  -- adds git commands with :G
  use('tpope/vim-fugitive')

  -- adds git commands with :G
  use('tpope/vim-surround')

end)
