-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_path@3.10.0.path
-- Decompile time: 0.21 ms

local Path = require(script:WaitForChild("path")).Path

function makePathImpl() -- Line: 5 -- upvalues: Path (val)
    local v1 = Path.new()
    v1:initialize("/", "/")
    return v1
end

return {path = makePathImpl(), Path = Path}