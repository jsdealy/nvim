M = {}

LAST = ""
Slingshot_popup_win_id = nil
Slingshot_filelist = {}
Slingshot_input_directory = require('toolbox').read_dot_env(vim.loop.cwd() .. "/.env").slingshot_input_directory or vim.loop.cwd() or "/home/justin"
Slingshot_output_directory = require('toolbox').read_dot_env(vim.loop.cwd() .. "/.env").slingshot_output_directory or vim.loop.cwd()
Slingshot_command = require('toolbox').read_dot_env(vim.loop.cwd() .. "/.env").slingshot_command or "slidemaker"
Slingshot_output_file_extension = require('toolbox').read_dot_env(vim.loop.cwd() .. "/.env").slingshot_output_file_extension or "html"
Slingshot_output_viewer_command = require('toolbox').read_dot_env(vim.loop.cwd() .. "/.env").slingshot_output_viewer_command or "rifle"
Slingshot_file_extension_ignore = (function()
    local success, ret = pcall(vim.json.decode,require('toolbox').read_dot_env(vim.loop.cwd() .. "/.env").slingshot_file_extension_ignore)
    if success then return ret end
    return nil
end)() or {"html"}


---The callback that will be executed on the file list after its manipulation in the popup.
---@param table_to_process table "The file list."
M.__core_callback = function (table_to_process)
    local cwd = vim.fn.getcwd()
    local clargs = string.format(" '%s/%s'", cwd, table_to_process[1])
    for i=2, #table_to_process do
	clargs = clargs .. string.format(" '%s/%s'", cwd, table_to_process[i])
    end
    local datetime = string.gsub(os.date()," ","_");
    local file_with_path = "'" .. Slingshot_output_directory .. "/slingshot_output_" .. datetime .. "." .. Slingshot_output_file_extension .. "'"
    print(require("toolbox").capture_command_output(Slingshot_command .. clargs .. " > " .. file_with_path))
    print(require("toolbox").capture_command_output(Slingshot_output_viewer_command .. " " .. file_with_path))
end

---Reset the shell command and file extension that slingshot will run. 
---If no arguments are provided, this will try to get values from .env. 
---If neither works, this will reset to default values, which are "slidemaker" and "html".
---@param shell_command? string "Shell command to run on the file list."
---@param file_extension? string "File extension for output of shell command."
M.reset_command_and_extension = function (shell_command, file_extension)
    Slingshot_command = shell_command
	or require('toolbox').read_dot_env(vim.loop.cwd() .. "/.env").slingshot_command
	or "slidemaker"
    Slingshot_output_file_extension = file_extension
	or require('toolbox').read_dot_env(vim.loop.cwd() .. "/.env").slingshot_output_file_extension
	or "html"
end

---Open a popup window with a callback to execute on enter.
---@param opts table "A selection of options for the popup to display."
---@param cb function "A function to which to pass the filepaths as ordered in the popup."
M.__open_popup = function(opts, cb)
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

M.open = function()
    M.__get_file_list()
    M.__open_popup(Slingshot_filelist, M.__core_callback)
end

M.__get_file_list = function()
    local dirIter = vim.loop.fs_scandir(Slingshot_input_directory)

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

    -- we have to use the clean_table var method bc lua doesn't know how to remove elements from tables 
    -- while iterating through them at the same time <== 02/02/02/02/25 16:35:30---
    local clean_table = {}
    for i=1, #Slingshot_file_extension_ignore do
	local reg = Slingshot_file_extension_ignore[i]
	for _,filename in ipairs(Slingshot_filelist) do
	    if not string.match(filename,reg.."$") then
		table.insert(clean_table, filename)
	    end
	end
    end
    Slingshot_filelist = clean_table
end

return M
