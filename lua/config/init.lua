local require_dir = require("utils/require-dir")

require_dir("config.vim")
require("config.keymaps")

require("config.plugins.lazy")
require("config.plugins.custom")

require_dir("config.style")
