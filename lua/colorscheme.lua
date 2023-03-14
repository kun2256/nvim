local colorscheme = "duskfox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

vim.cmd[[
hi FloatBorder guifg=#c296eb
hi @operator guifg=#c4a7e7
hi @keyword.operator guifg=#c4a7e7
]]
