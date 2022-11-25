local colorscheme = "omni"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

vim.cmd[[
hi FloatBorder guifg=#c296eb
hi NormalFloat guibg=bg
hi @variable guifg=#8EE5EE
hi @string guifg=#FF99CC
hi @keyword guifg=#eee685
hi @operator guifg=#FF9966
hi @conditional guifg=#FF6600
]]
