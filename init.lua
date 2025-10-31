vim.loader.enable()

require("lua.globals")
require("lua.mappings")
require("lua.diagnostic")
require("lua.package")

vim.cmd("source " .. vim.fs.joinpath(vim.fn.stdpath("config"), "vim/options.vim"))
