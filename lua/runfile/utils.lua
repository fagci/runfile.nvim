local M = {}

M.shell_escape = function(args)
    local ret = {}
    for _, a in pairs(args) do
        local s = tostring(a)
        if s:match("[^A-Za-z0-9_/:=-]") then
            s = "'" .. s:gsub("'", "'\\''") .. "'"
        end
        table.insert(ret, s)
    end
    return table.concat(ret, ' ')
end

--[[
f   file path
p	full path
h	head (last path component removed)
t	tail (last path component only)
r	root (one extension removed)
e	extension only
a   arguments
]]
M.expand_command = function(cmd, args)
    return cmd
        :gsub("{f}", vim.fn.expand('%'))
        :gsub("{p}", vim.fn.expand('%:p'))
        :gsub("{h}", vim.fn.expand('%:h'))
        :gsub("{t}", vim.fn.expand('%:t'))
        :gsub("{r}", vim.fn.expand('%:r'))
        :gsub("{e}", vim.fn.expand('%:e'))
        :gsub("{a}", args and M.shell_escape(args) or '')
end

return M
