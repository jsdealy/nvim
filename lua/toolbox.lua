local M = {}

---Run a string as a shell command and capture output to a string.
---@param command string "The shell command to run."
---@return string | nil "The output."
M.capture_command_output = function(command)
    local file = io.popen(command)  -- Run command and capture output
    if file == nil then return nil end
    local output = file:read("*all") -- Read all of the file's content
    file:close()
    return output
end

M.read_dot_env = function(filePath)
    local env = {}
    local file = io.open(filePath, "r") -- Open the file for reading

    if file then
        for line in file:lines() do
            -- Matches lines with the pattern KEY=value
            local key, value = line:match("^(.+)=(.+)$")
            if key and value then
                env[key] = value
            end
        end
        file:close()
    else
        print("No .env file, or else unable to open it...")
    end

    return env
end

M.open_buf_with_var = function(content)
	-- Create a new scratch buffer
    local wrap_line = function(line, width)
      local wrapped = {}
      while #line > width do
	local wrap_at = line:sub(1, width):match(".*()%s+") or width
	table.insert(wrapped, line:sub(1, wrap_at))
	line = line:sub(wrap_at + 1):match("^%s*(.*)")
      end
      table.insert(wrapped, line)
      return wrapped
    end

    local wrap_lines = function(lines, width)
      local out = {}
      for _, line in ipairs(lines) do
	vim.list_extend(out, wrap_line(line, width))
      end
      return out
    end

    local lines = vim.split(content, "\n")
    local wrapped = wrap_lines(lines, 80)
    local buf = vim.api.nvim_create_buf(false, true) -- not listed, scratch buffer

    if (lines ~= nil) then
	-- Set the buffer lines
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, wrapped)
	-- Open the buffer in a new window
	vim.api.nvim_set_current_buf(buf)
    else
	print("no output to show!")
    end
end

M.alatius = function(args)
    local query = vim.fn.input("alatius query: ")
    print("\n")
    local output = M.capture_command_output('alatius ' .. string.lower(query) .. ' glow')
    M.open_buf_with_var(output)
end

M.words = function(args)
    local query = vim.fn.input("whitaker's words query: ")
    print("\n")
    local output = M.capture_command_output('cd ~/bin; words ' .. string.lower(query))
    print(output)
end

M.words_english = function(args)
    local query = vim.fn.input("whitaker's words (english) query: ")
    print("\n")
    local output = M.capture_command_output('cd ~/bin; words "~e" ' .. string.lower(query))
    print(output)
end

M.alatius_whole_entry = function(args)
    local query = vim.fn.input("alatius (whole entry) query: ")
    print("\n")
    local output = M.capture_command_output('alatius -w ' .. string.lower(query) .. ' glow')
    M.open_buf_with_var(output)
end

M.get_latin_def = function()
    local word = vim.fn.expand("<cword>")
    local output = M.capture_command_output('cd ~/bin; words ' .. string.lower(word))
    print(output)
end

M.git_lewis_short = function()
    local word = vim.fn.expand("<cword>")
    local output = M.capture_command_output('alatius ' .. string.lower(word))
    print(output)
end


M.pdf_open = function(filename, force, use_zathura)
    -- TODO: this is kind of cludgy, there can be pdfs open other than the file, which would trigger the condition <== 12/30/24 12:17:01 -- 
    local psPerlHack = "ps -e | perl -ne 'BEGIN{$ret = 0} $ret = 1 if (m/zathura|sioyek/); END{print $ret}'"
    if force or tonumber(M.capture_command_output(psPerlHack) or "0") == 0 then
	local subsmade = 0
	local pdffilename = ""

	-- logging the filename to stdout <== 12/30/24 10:23:42 -- 
	print("filename: <", filename, ">\n")

	-- building the pdf name with a simple gsub from the filename <== 12/30/24 12:17:24 -- 
	if filename:find('tex[\"\']*$') then
	    pdffilename, subsmade = filename:gsub('tex[\"\']*$', "pdf")
	elseif filename:find("md[\"\']*$") then
	    pdffilename = "output.pdf"
	    subsmade = 1
	end

	if subsmade == 1 and not use_zathura then
	    os.execute("open -a Skim '" .. pdffilename:gsub("'", ""):gsub('"', "") .. "' &> /dev/null &")
	elseif subsmade == 1 and use_zathura then
	    os.execute("zathura '" .. pdffilename:gsub("'", ""):gsub('"', "") .. "' &> /dev/null &")
	else print("filename '" .. filename .. "' does not appear to end in md or tex") end
    end
end

return M
