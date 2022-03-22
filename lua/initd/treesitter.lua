local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup({
    ensure_installed = "maintained",
    sync_install = false,
    ignore_install = {""},
    highlight = {
        enable = true,
        disable = {"css"},
        additional_vim_regex_highlighting = true
    },
    autopairs = {enable = true},
    indent = {enable = true, disable = {"python", "css"}},
    context_commentstring = {enable = true, enable_autocmd = false},
    autotag = {enable = true, disable = {"xml"}},
    rainbow = {
        enable = true,
        colors = {"Gold", "Orchid", "DodgerBlue"},
        disable = {"html"}
    },
    playground = {enable = true}
})
