-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    paccker_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
        install_path,
    })

    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Pakcer.nvim 安装完毕")
end



-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("没有安装 packer.nvim")
    return
end



-- 每次保存 plugins.lua 自动安装插件
pcall(
vim.cmd,
[[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
)



packer.startup({
    function(use)
        -- Packer 可以升级自己
        use("wbthomason/packer.nvim")
        --------------------- colorschemes --------------------
        -- tokyonight
        use("folke/tokyonight.nvim")
        use("getomni/neovim")
        use("EdenEast/nightfox.nvim")

        ------------------------- plugins -------------------------------------------
        -- nvim-tree
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -- bufferline
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
        -- lualine (新增)
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        -- telescope （新增）
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
        -- telescope extensions
        use "LinArcX/telescope-env.nvim"
        -- dashboard-nvim (新增)
        use("glepnir/dashboard-nvim")
        -- project
        use("ahmedkhalf/project.nvim")
        -- treesitter （新增）
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        use { 'nvim-treesitter/playground' }
        -- lsp  
        use({ "williamboman/mason.nvim" })
        use({ "williamboman/mason-lspconfig.nvim" })
        -- Lspconfig
        use({ "neovim/nvim-lspconfig" })
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        -- snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        use('saadparwaiz1/cmp_luasnip')
        use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' } }

        -- 常见编程语言代码片段
        use("rafamadriz/friendly-snippets")
        -- ui (新增)
        use("onsails/lspkind-nvim")
        -- indent-blankline
        use("lukas-reineke/indent-blankline.nvim")
        use("tami5/lspsaga.nvim")

        --  括号补全
        use("windwp/nvim-autopairs")
        -- markdown预览
        use {"iamcco/markdown-preview.nvim"}
        -- 记录树
        use { "mbbill/undotree"}
        -- 活动窗口边框 
        use { "nvim-zh/colorful-winsep.nvim"}


    end
})
