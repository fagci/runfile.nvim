_G.runfile_cmd = function(...)
    require('runfile').run({ ... })
end
vim.cmd([[command! -nargs=* RunFile lua runfile_cmd(<f-args>)]])
