local M = {}
local commentcommand = [[norm i
||| ]];
local regularcommand = [[norm i
]];

function ContinueTextComment()
    local line = vim.api.nvim_get_current_line();
    if string.find(string.sub(line, 0, 3), "|||") ~= nil
	then
	    vim.api.nvim_command(commentcommand);
	    vim.api.nvim_input("a");
	else
	    vim.api.nvim_command(regularcommand);
	    vim.api.nvim_input("i");
    end
end

return M


-- " lua <<eof
-- " function luaSeek(input)
-- "     local str = vim.api.nvim_get_current_line();
-- "     local a = vim.api.nvim_win_get_cursor(0);
-- "     local b, c = string.find(str, input, a[2]+1);
-- "     if b ~= nil 
-- " 	then 
-- " 	    if string.match(string.sub(str, a[2]+1, a[2]+1), input) 
-- " 		then 
-- " 		    vim.api.nvim_win_set_cursor(0, {a[1], a[2]+1});
-- " 	    else 
-- " 		vim.api.nvim_win_set_cursor(0, {a[1], b-1});
-- " 	    end
-- "     else 
-- " 	vim.api.nvim_win_set_cursor(0, {a[1], a[2]+1});
-- "     end
-- " end
-- " eof


-- " lua <<eof
-- " function luaRevSeek(input)
-- "     local str = vim.api.nvim_get_current_line();
-- "     local a = vim.api.nvim_win_get_cursor(0);
-- "     local b, c = string.find(string.reverse(str), input, string.len(str)-(a[2]-1));
-- "     if b ~= nil 
-- " 	then 
-- " 	    if string.match(string.sub(str, a[2], a[2]), input) 
-- " 		then 
-- " 		    vim.api.nvim_win_set_cursor(0, {a[1], a[2]-1});
-- " 	    else 
-- " 		    vim.api.nvim_win_set_cursor(0, {a[1], string.len(str)-(b-1)});
-- " 	    end
-- " 	elseif a[2] ~= 0 then  
-- " 	    vim.api.nvim_win_set_cursor(0, {a[1], a[2]-1});
-- " 	else print("no more room")
-- "     end
-- " end
-- " eof

-- " lua <<eof
-- " function luaDelMatch(input)
-- "     local str = vim.api.nvim_get_current_line();
-- "     local a = vim.api.nvim_win_get_cursor(0);
-- "     local count = 1;
-- "     local b, c
-- "     repeat 
-- " 	b, c = string.find(str, input[count], a[2]);
-- " 	if b == a[2] and c == b+1
-- " 	    then
-- " 		vim.api.nvim_win_set_cursor(0, {a[1], a[2]});
-- " 		vim.api.nvim_command("normal hxx");
-- " 		return
-- " 	end 
-- " 	count = count + 1;
-- "     until b ~= nil or count > 3
-- "     if a[2] == 0
-- " 	then 
-- " 	    vim.api.nvim_command("normal kJ");
-- "     elseif a[2] > 0 
-- " 	then
-- " 	    vim.api.nvim_win_set_cursor(0, {a[1], a[2]});
-- " 	    vim.api.nvim_command("normal hx");
-- "     else 
-- " 	vim.api.nvim_feedkeys("error 1!", "t", false)
-- " 	print("error 1.")
-- "     end
-- " end
-- " eof



-- " imap <s-bs> <c-o>:lua luaDelMatch({'%"%"', "%'%'", "%`%'"})<cr>
-- " imap <BS> <c-o>:lua luaDelMatch({"%(%)","%[%]","%{%}"})<cr>
-- " imap <c-f> <c-o>:lua luaSeek("[%[%]%{%}%(%)\"\']+")<cr>
-- " imap <c-b> <c-o>:lua luaRevSeek("[%[%]%{%}%(%)\"\']")<cr>
