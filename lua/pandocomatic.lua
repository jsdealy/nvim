local M = {}

M.capture_command_output = function(command)
    local file = io.popen(command)  -- Run command and capture output
    if file == nil then return "error" end
    local output = file:read("*all") -- Read all of the file's content
    file:close()
    return output
end

M.read_dot_env_file = function(filePath)
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

M.sioyekOpen = function(filename, forcesioyek, usezathura)
    if forcesioyek or string.find(("ps -e | grep zath"), "zath") == nil then
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
	    os.execute("zathura '" .. pdffilename:gsub("'", ""):gsub('"', "") .. "' &> /dev/null &")
	else print("didn't find .pdf corresponding to: ", pdffilename) end
    end
end

M.run = function(args)
    local message = ""
    -- getting .env variables and storing them in a "table" dict thing <= 01/09/24 18:28:24 -- 
    local this_buffer_path = (string.gsub(vim.api.nvim_buf_get_name(0), "/[^/]+$", ""))
    local env_variables = M.read_dot_env_file(this_buffer_path .. "/.env")

    -- function can take two args, 'push' and 'latex' which should be booleans
    -- there's no point using them unless you assign true to them; false is the default <= 12/24/23 14:33:40 -- 
    local justopensioyek = false
    local forcesioyek = false
    local push = false
    local latex = false
    local verbose = false
    if args ~= nil then
	justopensioyek = args.justopensioyek or false
	forcesioyek = args.forcesioyek or false
	push = args.push or false
	latex = args.latex or false
	verbose = args.verbose or false
    end


    local filename = ""
    local outdir = ""
    if latex and env_variables ~= nil then
	-- storing .env variables in variables 
	-- these should be KEY=value pairs in .env 
	-- values in .env files should be absolute paths <= 01/09/24 18:29:48 -- 
	filename = (env_variables["FILE_FOR_LATEXMK"]) or vim.api.nvim_buf_get_name(0)
	outdir = (env_variables["OUTDIR_FOR_LATEXMK"]) or this_buffer_path
	if env_variables["PUSH"] ~= nil and string.lower(env_variables["PUSH"]):find("^true") ~= nil then push = true else push = false end
    else filename = vim.api.nvim_buf_get_name(0) end

    if justopensioyek == true then
        M.sioyekOpen(filename, true)
	return 0
    end

    -- getting user description of the update <= 12/30/23 14:03:28 -- 
    local commit_description = vim.fn.input("describe this update: ")
    -- clearing the nvim command line <= 12/30/23 14:04:36 -- 
    print("\n")


    -- using the unix command mktemp to create two temporary files <= 12/24/23 14:34:52 -- 
    local temp = M.capture_command_output("mktemp")
    local temp2 = M.capture_command_output("mktemp")

    -- Execute the shell command

    -- Defining the main command <= 12/30/23 13:47:17 -- 
    local command = ""
    if latex then command = "latexmk -pdf -f -outdir='" .. outdir:gsub('"', "") .. "' '" .. filename:gsub('"', "") .. "' &> " .. temp
    else command = "touch output.md && chmod +w output.md && mdcomment '" .. filename:gsub('"', "") .. "' > output.md && chmod -w output.md && pandocomatic output.md &> " .. temp 
    end

    if verbose then message = message .. '\nfilename is <' .. filename .. '>\ncommand is <' .. command .. '>\n' 
    end

    -- executing the main command <= 10/07/23 16:05:30 -- 
    local exitCode2 = os.execute(command)

    -- backup stuff 
    local exitCode1 = 0
    local gitstatus = M.capture_command_output("git status")
    local branch = M.capture_command_output("git branch --show-current"):gsub("\n", "")
    local backingup = false
    local bbcommand = ""
    if gitstatus:find("nothing to commit") == nil then
	backingup = true
	vim.api.nvim_command("Git add -A")
	vim.api.nvim_command("Git commit -m '" .. commit_description .. "'")
	-- pushing to github if 'push' was set to true <= 12/30/23 13:48:29 -- 
	if push then vim.api.nvim_command("Git push origin " .. branch) end
	bbcommand = "bbcxx -v -i '" .. this_buffer_path .. "' -o '" .. this_buffer_path .. "' &>" .. temp2
	---@diagnostic disable-next-line: cast-local-type
	exitCode1 = os.execute(bbcommand)
    end

    -- Check the exit code to determine if the command was successful
    if ((backingup and exitCode1 == 0) or not backingup) and exitCode2 == 0 then
	message = message .. "Commands executed successfully :)"
	print(message)
	-- opening sioyek if it isn't already open <= 10/07/23 12:13:49 -- 
	M.sioyekOpen(filename, forcesioyek)
    elseif exitCode1 ~= 0 then
	if backingup then
	    print(message .. "\nbb failed with exit code:", exitCode1)
	    print("\nbbcommand: " .. bbcommand)
	    vim.api.nvim_command("edit" .. temp2)
	end
    elseif exitCode2 ~= 0 then
	if latex then print(message .. "\nlatexmk exited with code:", exitCode2)
	else print(message .. "\nmdcomment or pandocomatic failed with exit code:", exitCode2) end
	if latex then
	    local grepsuccess = M.capture_command_output("grep 'Output written on' " .. filename:gsub("tex", "log")):find("Output written on")
	    if grepsuccess == nil then vim.api.nvim_command("edit " .. filename:gsub("tex", "log"))
	    else
		print(message .. "\nlatexmk had warnings, but produced a pdf...")
		M.sioyekOpen(filename)
	    end
	    vim.api.nvim_command("edit " .. temp)
	else vim.api.nvim_command("edit " .. temp)
	end
    end
end

return M
