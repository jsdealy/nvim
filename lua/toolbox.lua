local M = {}

M.capture_command_output = function(command)
    local file = io.popen(command)  -- Run command and capture output
    if file == nil then return "error" end
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

M.pdf_open = function(filename, forcesioyek, usezathura)
    if forcesioyek or string.find(M.capture_command_output("ps -e | grep sioyek"), "sioyek") == nil then
	local subsmade = 0
	local pdffilename = ""
	print("filename: <", filename, ">\n")
	if filename:find('tex[\"\']*$') then
	    pdffilename, subsmade = filename:gsub('tex[\"\']*$', "pdf")
	elseif filename:find("md[\"\']*$") then
	    pdffilename = "output.pdf"
	    subsmade = 1
	end

	if subsmade == 1 then
	    os.execute("sioyek '" .. pdffilename:gsub("'", ""):gsub('"', "") .. "' &> /dev/null &")
	else print("didn't find .pdf corresponding to: ", pdffilename) end
    end
end

return M
