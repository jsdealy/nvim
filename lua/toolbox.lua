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

---Read .env file and return values as a table.
---@param filePath string "Path to the .env file (including .env)."
---@return table "The values as a table."
M.read_dot_env = function(filePath)
    local env = {}
    local file = io.open(filePath, "r") -- Open the file for reading

    if file then
        for line in file:lines() do
            -- Matches lines with the pattern KEY=value
            local key, value = line:match("^(.+)%s*[=:]%s*(.+)$")
            if key and value then
                env[key] = value
            end
        end
        file:close()
    else
        print("No .env file, or else unable to open it...\n")
    end

    return env
end

M.get_latin_def = function()
    local word = vim.fn.expand("<cword>")
    local output = M.capture_command_output('cd words ' .. string.lower(word))
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
	    os.execute("sioyek '" .. pdffilename:gsub("'", ""):gsub('"', "") .. "' &> /dev/null &")
	elseif subsmade == 1 and use_zathura then
	    os.execute("zathura '" .. pdffilename:gsub("'", ""):gsub('"', "") .. "' &> /dev/null &")
	else print("filename '" .. filename .. "' does not appear to end in md or tex") end
    end
end

---Set a key-value pair in a .env file in the cwd.
M.set_env_kv = function()
    local key = vim.fn.input{prompt = "Key to set: ", default = "k"}
    local value = vim.fn.input{prompt = "Value: ", default = "v"}
    print("\n")
    local cwd = (vim.loop.cwd())
    local env_variables = M.read_dot_env(cwd .. "/.env")
    env_variables[key] = value
    local content = ""
    for k,v in pairs(env_variables) do
	content = content .. k .. "=" .. v .. "\n"
    end
    local command = "echo '" .. content .. "' > '" .. cwd .. "/.env'"
    os.execute(command)
    print("Updated .env here: " .. cwd)
end

return M
