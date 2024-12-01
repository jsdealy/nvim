local M = {}

function Darkmode(args)
vim.api.nvim_command("colorscheme torte")
vim.api.nvim_command("hi VertSplit guibg=#000000 guifg=#EE6C05")
-- vim.api.nvim_command("hi Function guifg=#FFAAFF")
vim.api.nvim_command("hi Function gui=bold")
vim.api.nvim_command("hi markdownBold gui=bold")
vim.api.nvim_command("hi markdownItalic gui=italic")
vim.api.nvim_command("hi markdownH1 gui=bolditalic")
vim.api.nvim_command("hi htmlH1 gui=bolditalic")
vim.api.nvim_command("hi NormalFloat guibg=#000000")
vim.api.nvim_command("hi Visual guibg=#008565")
vim.api.nvim_command("hi StatusLine ctermbg=236")
vim.api.nvim_command("hi StatusLine ctermfg=218")
vim.api.nvim_command("hi StatusLine gui=italic")
vim.api.nvim_command("hi StatusLineNC ctermbg=darkgrey")
vim.api.nvim_command("hi StatusLineNC ctermfg=173")
vim.api.nvim_command("hi StatusLineNC gui=italic")
-- vim.api.nvim_command("hi Normal ctermbg=234")
vim.api.nvim_command("hi CursorLine guibg=#111111")
vim.api.nvim_command("hi CursorColumn guibg=#0A0A0A")
vim.api.nvim_command("hi CursorLineNR guibg=#111111")
vim.api.nvim_command("hi CursorColumnNR guibg=#0A0A0A")
vim.api.nvim_command("hi ModeMsg ctermbg=yellow")
vim.api.nvim_command("hi ModeMsg ctermfg=red")
vim.api.nvim_command("hi MoreMsg ctermbg=yellow")
vim.api.nvim_command("hi MoreMsg ctermfg=red")
vim.api.nvim_command("hi Conceal NONE")

vim.api.nvim_command("hi Function guifg=#FFAAFF")
vim.api.nvim_command("hi Type guifg=#CCFFAA")
vim.api.nvim_command("hi Normal guifg=#A0F0FF")
vim.api.nvim_command("hi DiagnosticError guifg=red")


vim.api.nvim_command("hi lualine_c_inactive guibg=#000000 guifg=#EE6C05 gui=italic")
end

return M
