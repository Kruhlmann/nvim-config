local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then return end

local no_really = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = {"markdown", "text"},
    generator = {
        fn = function(params)
            local diagnostics = {}
            for i, line in ipairs(params.content) do
                local col, end_col = line:find("really")
                if col and end_col then
                    table.insert(diagnostics, {
                        row = i,
                        col = col,
                        end_col = end_col,
                        source = "no-really",
                        message = "Don't use 'really!'",
                        severity = 2
                    })
                end
            end
            return diagnostics
        end
    }
}

null_ls.register(no_really)

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black, null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.asmfmt,
        null_ls.builtins.formatting.prettier_d_slim,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.json_tool,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.nginx_beautifier,
        null_ls.builtins.formatting.rufo, null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.uncrustify,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.diagnostics.misspell,
        null_ls.builtins.diagnostics.vint, null_ls.builtins.hover.dictionary,
        null_ls.builtins.completion.spell, null_ls.builtins.diagnostics.pylint
    },
    on_attach = on_attach
})
