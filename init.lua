vim.loader.enable()

require("globals")
require("mappings")
require("diagnostic")

vim.cmd("source " .. vim.fs.joinpath(vim.fn.stdpath("config"), "vim/options.vim"))
