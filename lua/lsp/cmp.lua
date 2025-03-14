local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then return end
local snip = require "luasnip"
local lspkind = require "lspkind"

lspkind.init({
    preset = 'codicons',
    symbol_map = {
        Text = " ",
        Method = " ",
        Function = " ",
        Constructor = " ",
        Field = " ",
        Variable = " ",
        Class = " ",
        Interface = " ",
        Module = " ",
        Property = " ",
        Unit = " ",
        Value = " ",
        Enum = " ",
        Keyword = " ",
        Snippet = " ",
        Color = " ",
        File = " ",
        Reference = " ",
        Folder = " ",
        EnumMember = " ",
        Constant = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
        cmp_tabnine = ""
    },
})

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
    luasnip = "[SN]"
}



cmp.setup ({
    mapping = {
        --["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.get_selected_entry() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end, { "i", "c" }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    preselect = cmp.PreselectMode.None,
    -- 补全源
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- For vsnip users.
        { name = "vsnip" },

        -- For luasnip users.
        -- { name = 'luasnip' },

        --For ultisnips users.
        -- { name = 'ultisnips' },

        -- -- For snippy users.
        -- { name = 'snippy' },
    }, { { name = "buffer" }, { name = "path" } }),

    sorting = {
        comparators = {
            cmp.config.compare.locality,
            cmp.config.compare.recently_used,
            cmp.config.compare.score,
            cmp.config.compare.exact,
            cmp.config.compare.order,
            cmp.config.compare.offset,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
        },
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        --format = kind.cmp_format {
            --  with_text = false,
            --  maxwidth = 80,
            --},
            format = function(entry, vim_item)
                --vim.notify(entry.source.name)
                vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
                vim_item.menu = source_mapping[entry.source.name]
                if entry.source.name == "cmp_tabnine" then
                    vim_item.kind = ""
                    -- show  score
                    --local detail = (entry.completion_item.data or {}).detail
                    --if detail and detail:find('.*%%.*') then
                    --  vim_item.kind = vim_item.kind .. ' ' .. detail
                    --end

                    if (entry.completion_item.data or {}).multiline then
                        vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
                    end
                end
                local maxwidth = 80
                vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
                return vim_item
            end },
    experimental = {
        ghost_text = true,
    },
    window = {
        completion = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            winhighlight = 'FloatBorder:FloatBorder',
        },
        documentation = {
            max_width = 50,
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            winhighlight = 'Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        }
    },
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` users.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` users.
            -- vim.fn["UltiSnips#Anon"](args.body)

            -- For `snippy` users.
            -- require'snippy'.expand_snippet(args.body)
        end,
    },
    -- 快捷键设置
    mapping = require("keybindings").cmp(cmp),
})


-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
