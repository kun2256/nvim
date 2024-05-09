-- 基础设置
require('basic')
-- 快捷键映射
require("keybindings")
-- Packer 插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 浮窗设置
require("gwoo.window")



-- 插件配置
-- 文件树
require("gwoo.nvim-tree")
-- bufferline
require("gwoo.bufferline")
-- 状态栏
require("gwoo.lualine")
-- 模糊搜索
require("gwoo.telescope")
-- 启动页
require("gwoo.dashboard")
require("gwoo.project")
-- 高亮
require("gwoo.nvim-treesitter")
-- 内置LSP (新增)
-- require("gwoo.indent-blankline")
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("gwoo.nvim-autopairs")
require("lsp.luasnip")
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.marksman.setup{}
-- require'lspconfig'.dockerfile\-language\-server.setup{}
-- require'lspconfig'.html\-lsp.setup{}
-- require'lspconfig'.json\-lsp.setup{}
-- require'lspconfig'.lua\-language\-serve.setup{}
-- require'lspconfig'.css\-lsp.setup{}
-- require'lspconfig'.bash\-language\-server.setup{}
-- markdown预览
require("gwoo.markdown-preview")
-- 括号补全
require("gwoo.autopairs")
-- 活动窗口边框
--require("gwoo.colorful-winsep")
require("lsp.init")
require("lsp.mason-lspconfig") 
