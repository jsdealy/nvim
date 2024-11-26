local M = {}

function Quickgit(args)
    local push = false
    if args ~= nil then
	push = args.push or false
    end

    local commit_description = vim.fn.input("describe this update: ")
    print("\n")

    -- using the unix command mktemp to create two temporary files <= 12/24/23 14:34:52 -- 
    local gitstatus = Capture_command_output("git status")
    local branch = Capture_command_output("git branch --show-current"):gsub("\n", "")
    if gitstatus:find("nothing to commit") == nil then
	vim.api.nvim_command("Git add -A")
	vim.api.nvim_command("Git commit -m '" .. commit_description .. "'")
	if push then vim.api.nvim_command("Git push origin " .. branch) end
    end
end

return M
