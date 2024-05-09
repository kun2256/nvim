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
    > basic.lua： 基础配置，是对默认配置的一个重置。     
    > colorscheme.lua： 我们安装的主题皮肤配置，在这里切换主题。     
    > keybindings.lua： 快捷键的设置，所有插件的快捷键也都会放在这里。     
    > plugins.lua： 插件安装管理，插件安装或卸载全在这里设置。     
* lsp文件夹： 是对 Neovim 内置 LSP 功能的配置，包括常见编程语言与语法提示等。     
    > config文件夹： 包含各种语言服务器单独的配置文件。     
    > cmp.lua：  语法自动补全补全的配置，包括各种补全源，与自定义代码段。     
    > init.lua：      
    > mason-lspconfig.lua：      
    > setup.lua： 内置 LSP 的配置。     
    > ui.lua： 对内置 LSP 功能增强和 UI 美化。     
