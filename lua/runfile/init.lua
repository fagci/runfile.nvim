local M = {}
local utils = require('runfile.utils')

-- Run opened file in shell with args
M.run = function(...)
    local mappings = {
        ['applescript'] = 'osascript {f} {a}',
        ['elixir'] = 'elixir {f} {a}',
        ['erlang'] = 'escript {f} {a}',
        ['ghci'] = 'ghci {f} {a}',
        ['go'] = 'go run {f} {a}',
        ['idris'] = 'idris {f} {a}',
        ['java'] = 'javac -g:none {f} && java {r}',
        ['javascript'] = 'node {f} {a}',
        ['lua'] = 'lua {f} {a}',
        ['moon'] = 'moon {f} {a}',
        ['perl'] = 'perl {f} {a}',
        ['php'] = 'php {f} {a}',
        ['python'] = 'python {f} {a}',
        ['ruby'] = 'ruby {f} {a}',
        ['sh'] = '{f} {a}',
    }

    local ft = vim.bo.filetype

    local cmd = mappings[ft]
    if not cmd then
        print('No support for ' .. ft)
        return
    end

    local command = utils.expand_command(cmd, ...)

    print('Running: ' .. command)
    vim.cmd('term ' .. command)
    vim.cmd('startinsert')
end

return M
