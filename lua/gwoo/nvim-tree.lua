local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
    return
end

-- 列表操作快捷键

local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")
    
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    
    local map = vim.keymap.set
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    
    -- custom mappings
    map('n', '<CR>', api.node.open.edit, opts('Open'))
    map('n', 'o', api.node.open.edit, opts('Open'))
    map('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
    map('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    map('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
    map('n', 'i', api.tree.toggle_custom_filter, opts('Toggle Filter: Hidden'))
    map('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
    map('n', 'R', api.tree.reload, opts('Refresh'))
    map('n', 'a', api.fs.create, opts('Create File Or Directory'))
    map('n', 'd', api.fs.remove, opts('Delete'))
    map('n', 'r', api.fs.rename, opts('Rename'))
    map('n', 'x', api.fs.cut, opts('Cut'))
    map('n', 'c', api.fs.copy.node, opts('Copy'))
    map('n', 'p', api.fs.paste, opts('Paste'))
    map('n', '<C-j>', api.tree.change_root_to_parent, opts('Up'))
    map('n', '?', api.tree.toggle_help, opts('Help'))
end

nvim_tree.setup({
    on_attach = my_on_attach,
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 40,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
--         hide_root_folder = false,
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
        },
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
})
-- 自动关闭
vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

