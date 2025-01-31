local M = {}

M.toggle = function()
    if vim.g.outline_keyword == "y" then
	vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
	  { desc = "Toggle Outline" })
	vim.keymap.set("n", "<leader>y", "")
	vim.g.outline_keyword = "o"
    else
	vim.keymap.set("n", "<leader>y", "<cmd>Outline<CR>",
	  { desc = "Toggle Outline" })
	vim.keymap.set("n", "<leader>o", "")
	vim.g.outline_keyword = "y"
    end
end

return M
