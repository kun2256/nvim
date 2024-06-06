# README
## 构造
```
├── init.lua
├── README.md
├── plugin
└── lua
    ├── basic.lua
    ├── colorscheme.lua 
    ├── keybindings.lua
    ├── plugins.lua
    ├── gwoo
    │   ├── cmp.lua
    │   ├── init.lua
    │   ├── luasnip.lua
    │   ├── mason-lspconfig.lua
    │   ├── autopairs.lua        
    │   ├── colorful-winsep.lua  
    │   ├── indent-blankline.lua 
    │   ├── markdown-preview.lua 
    │   ├── nvim-tree.lua        
    │   ├── project.lua          
    │   ├── window.lua 
    │   ├── bufferline.lua       
    │   ├── dashboard.lua       
    │   ├── lualine.lua          
    │   ├── nvim-autopairs.lua   
    │   ├── nvim-treesitter.lua  
    │   └── telescope.lua
    └── lsp
        ├── config
        │   └── lua.lua
        ├── cmp.lua
        ├── init.lua
        ├── luasnip.lua
        ├── mason-lspconfig.lua
        ├── setup.lua
        └── ui.lua
```
* init.lua： 是整个配置的入口文件，负责引用所有其他的模块，基本上想要打开或关闭某个插件只要在这里修改一行代码即可。
* lua 
    \> basic.lua： 基础配置，是对默认配置的一个重置。     
    \> colorscheme.lua： 我们安装的主题皮肤配置，在这里切换主题。     
    \> keybindings.lua： 快捷键的设置，所有插件的快捷键也都会放在这里。     
    \> plugins.lua： 插件安装管理，插件安装或卸载全在这里设置。     
* lsp文件夹： 是对 Neovim 内置 LSP 功能的配置，包括常见编程语言与语法提示等。     
    \> config文件夹： 包含各种语言服务器单独的配置文件。     
    \> cmp.lua：  语法自动补全补全的配置，包括各种补全源，与自定义代码段。     
    \> init.lua：      
    \> mason-lspconfig.lua：      
    \> setup.lua： 内置 LSP 的配置。     
    \> ui.lua： 对内置 LSP 功能增强和 UI 美化。     

## 基础快捷键

### 特殊按键说明
| 按键 | 说明 | 
| :--: | :-- | 
|\<leader\> | 意为; |
|\<C-\> | 意为ctrl键+其他键 |
|\<A-\> | 意为alt键+其他键 |
|\<CR\> | 意为回车键 |


### 窗口操作

 | 按键 | 说明 | 
 | :--: | :-- | 
 | sv | 垂直分屏 | 
 | sc | 关闭当前窗口 | 
 | so | 关闭其他窗口 | 
 | s+h j k l | 窗口之间跳转 | 
 | s+, . | 窗口比例控制 | 
 | s= | 窗口等比例 | 

### terminal

 | 按键 | 说明 | 
 | :--: | :-- | 
 | \<leader\>t | 创建一个terminal | 

### visual模式缩进

 | 按键 | 说明 | 
 | :--: | :-- | 
 | \< *&* \> | 减少或增加缩进 | 
 | J *&* K | 往下或往上移动选中文本 | 

### 其他

 | 按键 | 说明 | 
 | :--: | :-- | 
 | \<C-j\> | 向下移动4次，等于4j | 
 | \<C-k\> | 向上移动4次，等于4k | 
 | \<leader\>g | 基于首行进行全文排版 | 
 | \<C-a\> | 全选 | 
 | \<leader\>' | 快捷用'包裹当前块 | 
 | \<leader\>" | 快捷用"包裹当前块 | 

## 插件快捷键

### nvim-tree

 | 按键 | 说明 | 
 | :--: | :-- | 
 | tr | 打开tree | 
 | o | 打开文件或文件夹 | 
 | v *&* h | 分屏打开文件 | 
 | i *&* . | 显示或隐藏文件 | 
 | a | create | 
 | d | remove | 
 | r | rename | 
 | x | cut | 
 | c | copy | 
 | p | paste | 
 | s | system\_open | 

### buff栏

 | 按键 | 说明 | 
 | :--: | :-- | 
 | B | 切换buff栏 | 
 | cb | 删除buff栏 | 
 | \<C-w\> | 删除当前buff栏 | 
 | \<A-h\> *&* \<A-l\> | 左右切换buff栏 | 

### telescope

 | 按键 | 说明 | 
 | :--: | :-- | 
 | \<C-p\> | 查找文件 | 
 | \<C-f\> | 全局搜索 | 
 | \<C-j\> *&* \<C-k\> | 列表中上下移动 | 
 | \<C-n\> *&* \<C-p\> | 历史记录 | 
 | \<C-c\> | 关闭窗口 | 
 | \<C-u\> *&* \<C-d\> | 预览窗口上下滚动 | 

### 补全

 | 按键 | 说明 | 
 | :--: | :-- | 
 | \<A-.\> *&* \<A-,\> | 补全的出现和隐藏 | 
 | \<C-j\> *&* \<C-k\> | 补全选项下一个和上一个 | 
 | \<CR\> | 确认 | 
 | \<C-u\> *&* \<C-d\> | 预览窗口内容太多时上下滚动 | 
 | \<C-h\> *&* \<C-l\> | 自定义代码段跳转到上一个或下一个参数 | 
 | \<Tab\> *&* \<S-Tab\> | 自定义代码段跳转到上一个或下一个参数 | 
