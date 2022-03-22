local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then return end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("initd.lsp_handlers").on_attach,
        capabilities = require("initd.lsp_handlers").capabilities
    }

    if server.name == "jsonls" then
        local jsonls_opts = require "initd.jsonls"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require "initd.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "pyright" then
        local pyright_opts = require "initd.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server.name == "jdtls" then return end

    if server.name == "solang" then
        local solang_opts = require "initd.solang"
        opts = vim.tbl_deep_extend("force", solang_opts, opts)
    end

    if server.name == "solc" then
        local solc_opts = require "initd.solc"
        opts = vim.tbl_deep_extend("force", solc_opts, opts)
    end

    if server.name == "emmet_ls" then
        local emmet_ls_opts = require "initd.emmet_ls"
        opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
    end

    server:setup(opts)
end)
