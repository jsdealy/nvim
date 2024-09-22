local M = {}

function Lightmode(args)
vim.api.nvim_command("colorscheme delek")
vim.api.nvim_command("hi CursorLine guibg=#FFFFFF")
vim.api.nvim_command("hi CursorColumn guibg=#FFFFFF")
end

return M
