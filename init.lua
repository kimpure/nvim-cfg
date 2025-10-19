vim.loader.enable()

require("globals")
require("mappings")
require("diagnostic")

vim.cmd("source " .. vim.fs.joinpath(vim.g.stdpath.config, "vim/options.vim"))
