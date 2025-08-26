local dir = require("utils.dir")

return function(path)
    local files = dir.read_dir(path)

    for i=1, #files do
        require(path .. "." .. files[i])
    end
end
