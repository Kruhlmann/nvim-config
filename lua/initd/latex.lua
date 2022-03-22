WriteServerName = function()
    local file = assert(io.open("/tmp/current_nvim_servername", "w"))
    local servername = vim.v.servername;
    file:write(servername .. "\n");
    file:close()
end

cmd([[
  augroup vimtex_common
    autocmd!
    autocmd FileType tex lua WriteServerName()
]], false)
