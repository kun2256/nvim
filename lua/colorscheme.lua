local colorscheme = "omni"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

vim.cmd[[
hi FloatBorder guifg=#c296eb
hi NormalFloat guibg=bg
]]
