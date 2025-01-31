M = {}

Slingshot_popup_win_id = nil
Slingshot_filelist = {"a", "b", "c"}

---The callback that will be executed on the file list after its manipulation in the popup.
---@param table_to_process table "The file list."
M.core_callback = function(table_to_process)
    local cwd = vim.fn.getcwd()
    local s = table_to_process[1]
    for i=2, #table_to_process do
	s = s .. " " .. string.format("%s/%s", cwd, table_to_process[i])
    end
    print(require('toolbox').capture_command_output("cat " .. s .. " > slingshotTest.txt"))
end

---Open a popup window with a callback to execute on enter.
---@param opts table "A selection of options for the popup to display."
---@param cb function "A function to which to pass the filepaths as ordered in the popup."
M.open_popup = function(opts, cb)
    local height = 30
    local width = 100
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    -- a function to grab the lines from the popup buffer and 
    -- pass them as a table to cb <== 01/15/25 21:01:38 -- 
    local _innercb = function()
	local bufnr = vim.api.nvim_win_get_buf(Slingshot_popup_win_id)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)
	local opts_to_print = {}

	for x, line in pairs(lines) do
	    table.insert(opts_to_print, line)
	end
	cb(opts_to_print)
    end

    Slingshot_popup_win_id, Win = require('plenary.popup').create(opts, {
	title = "Slingshot",
	highlight = "MyProjectWindow",
	line = 3,
	col = math.floor((vim.o.columns - width) / 2),
	minwidth = width,
	minheight = height,
	borderchars = borderchars,
	callback = _innercb,
    })

    vim.api.nvim_win_set_option(
        Win.border.win_id,
        "winhl",
        "Normal:SlingshotBorder"
    )

    local bufnr = vim.api.nvim_win_get_buf(Slingshot_popup_win_id)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent=false })
end

M.open_menu = function()
    M.open_popup(Slingshot_filelist, M.core_callback)
end

M.get_file_list = function()
    local cwd = vim.fn.getcwd()
    local dirIter = vim.loop.fs_scandir(cwd)

    if type(dirIter) == "nil" then
	return
    end
    Slingshot_filelist = {}

    while true do
	local name, type = vim.loop.fs_scandir_next(dirIter)
	if name == nil then
	    break
	end

	-- ignoring hidden files <== 01/15/25 21:34:02 -- 
	if type == "file" and not name:match("^%.") then
	    table.insert(Slingshot_filelist, name)
	end
    end
end

M.get_file_list()
M.open_menu()

return M
