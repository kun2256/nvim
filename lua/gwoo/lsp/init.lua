-- Setup sumneko_lua with lua-dev
require('nvim-lsp-setup').setup({
    -- Default mappings
    -- gD = 'lua vim.lsp.buf.declaration()',
    -- gd = 'lua vim.lsp.buf.definition()',
    -- gt = 'lua vim.lsp.buf.type_definition()',
    -- gi = 'lua vim.lsp.buf.implementation()',
    -- gr = 'lua vim.lsp.buf.references()',
    -- K = 'lua vim.lsp.buf.hover()',
    -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
    -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
    -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
    -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
    -- ['<space>e'] = 'lua vim.lsp.diagnostic.show_line_diagnostics()',
    -- ['[d'] = 'lua vim.lsp.diagnostic.goto_prev()',
    -- [']d'] = 'lua vim.lsp.diagnostic.goto_next()',
    default_mappings = true,
    -- Cusom mappings
    -- Example mappings for telescope pickers:
    -- gd = 'lua require"telescope.builtin".lsp_definitions()',
    -- gi = 'lua require"telescope.builtin".lsp_implementations()',
    -- gr = 'lua require"telescope.builtin".lsp_references()',
    mappings = {},
    -- Global on_attach
    -- on_attach = function(client, bufnr) {
    --     utils.format_on_save(client)
    -- },
    servers = {
        -- Install LSP servers automatically
        -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        -- pylsp = {},
        -- rust_analyzer = {
        --     settings = {
        --         ['rust-analyzer'] = {
        --             cargo = {
        --                 loadOutDirsFromCheck = true,
        --             },
        --             procMacro = {
        --                 enable = true,
        --             },
        --         },
        --     },
        -- },
    },

    servers = {

        sumneko_lua = require('lua-dev').setup({

            lspconfig = {

                on_attach = function(client, _)

                    -- Avoiding LSP formatting conflicts.

                    -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts

                    require('nvim-lsp-setup.utils').disable_formatting(client)

                end,

            },

        }),

       html = {},
            rust_analyzer = {
                settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },


    }

})
