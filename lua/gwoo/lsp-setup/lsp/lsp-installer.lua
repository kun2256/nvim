local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
local nvim_lsp_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok or not nvim_lsp_ok then
  vim.notify("nvim-lspconfig not found!")
  return
end

-- NOTE: 如果发现某些lsp server安装启动时出现， client exit x and signal 0 等错误
-- 可能是因为node版本过低， 升级node版本即可
-- 升级方法
-- npm cache clean -f
-- npm install -g n
-- n stable

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
local servers_lsp = {
  "pyright",
  "jdtls",
  "cmake",
  "bashls",
  "vimls",
  "texlab",
  "jsonls",
  "vuels",
  --"gopls",
  "clangd",
  "sumneko_lua",
  --"csharp_ls",
  --"r_language_server",
  --"rust_analyzer",
  --"julials",
  --"pylsp",
  --"tsserver",
  --"omnisharp",
  --"fsautocomplete",
  --"hls",
  --"dartls",
  --"vala_ls",
  --"volar",
  --"kotlin_language_server",
  --"jedi_language_server",
  --"cssls",
  --"lemminx",
  --"groovyls",
  --"graphql",
  --"html",
  --"yamlls",
  --"ocamllsp",
  --"denols",
  --"taplo",
}
lsp_installer.setup({
  ensure_installed = servers_lsp,
  automatic_installation = true,
  pip = {
    install_args = { "--proxy", "127.0.0.1:7890" }
  }
})

for _, lsp in ipairs(servers_lsp) do
  --local ok, server = lsp_installer.get_server(lsp)
  --if ok then
  --  if not server:is_installed() then
  --    vim.notify("Installing " .. lsp)
  --    server:install()
  --  end
  --end
  local opts = {
    -- on_attach = my_custom_on_attach,
    on_attach = require("gwoo.lsp-setup.lsp.handlers").on_attach,
    capabilities = require("gwoo.lsp-setup.lsp.handlers").capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  if lsp == "clangd" then
    local clangd_opts = require("gwoo.lsp-setup.lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if lsp == "jsonls" then
    local jsonls_opts = require("gwoo.lsp-setup.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if lsp == "sumneko_lua" then
    local sumneko_opts = require("gwoo.lsp-setup.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if lsp == "pyright" then
    local pyright_opts = require("gwoo.lsp-setup.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  nvim_lsp[lsp].setup(opts)
end
