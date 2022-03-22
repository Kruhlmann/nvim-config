local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    }
}

return packer.startup(function(use)
    use {"wbthomason/packer.nvim", opt = true}
    use {'mfussenegger/nvim-jdtls'}
    use {'tomlion/vim-solidity'}
    use {'RishabhRD/popfix'}
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = [[require("plugins.config.treesitter")]]
    }
    use {"RishabhRD/nvim-lsputils"}
    use {"ludovicchabant/vim-gutentags"}
    use {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"},
        config = [[require("plugins.config.telescope")]]
    }
    use {
        "hoob3rt/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = [[require("plugins.config.lualine")]]
    }
    use {"tpope/vim-commentary"}
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = {"tpope/vim-commentary"}
    }
    use {"hkupty/iron.nvim", config = [[require("plugins.config.iron")]]}
    use {
        "lewis6991/gitsigns.nvim",
        config = [[require("plugins.config.gitsigns")]]
    }
    use {"neovim/nvim-lspconfig", config = [[require("plugins.config.lsp")]]}
    use {
        "folke/lsp-trouble.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            config = [[require("plugins.config.devicons")]]
        },
        config = [[require("plugins.config.lsptrouble")]]
    }
    use {"folke/which-key.nvim"}
    use {
        "AckslD/nvim-whichkey-setup.lua",
        config = [[require("plugins.config.which_key")]]
    }
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        cmd = "MarkdownPreview",
        ft = "markdown"
    }
    use {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = 'hrsh7th/nvim-cmp',
        config = [[require("plugins.config.tabnine")]]
    }
    use {
        "Kruhlmann/gruvbox-with-ANGRY-comments",
        config = [[require("plugins.config.gruvbox")]]
    }
    use {"junegunn/vim-easy-align"}
    use {"mhartington/formatter.nvim"}
    use {"saadparwaiz1/cmp_luasnip"}
    use {"L3MON4D3/LuaSnip"}
    use {"rafamadriz/friendly-snippets"}
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
            config = [[require("plugins.config.devicons")]]
        },
        config = [[require("plugins.config.nvim_tree")]]
    }
    use {"ray-x/lsp_signature.nvim"}
    use {
        "romgrk/barbar.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            config = [[require("plugins.config.devicons")]]
        }
    }
    use {
        "lewis6991/spellsitter.nvim",
        config = [[require("plugins.config.spellsitter")]]
    }
    use {"editorconfig/editorconfig-vim"}
    use {"lervag/vimtex", config = [[require("plugins.config.vimtex")]]}
    use {"folke/lua-dev.nvim"}
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use {'ms-jpq/coq.thirdparty', branch = '3p'}
    use {"junegunn/gv.vim", requires = {"tpope/vim-fugitive"}}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"tami5/lspsaga.nvim"}
    use {"jose-elias-alvarez/null-ls.nvim"}
    use {"jose-elias-alvarez/nvim-lsp-ts-utils"}
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
