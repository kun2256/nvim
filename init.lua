-- 基础设置
require('basic')
-- 快捷键映射
require("keybindings")
-- Packer 插件管理
require("plugins")
-- 主题设置
require("colorscheme")



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
require("gwoo.indent-blankline")
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("gwoo.nvim-autopairs")
-- markdown预览
require("gwoo.markdown-preview")
-- 括号补全
require("gwoo.autopairs")
-- 活动窗口边框
require("gwoo.colorful-winsep")
