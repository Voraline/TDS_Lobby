-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.getNoTestFoundPassWithNoTests
-- Decompile time: 0.49 ms

local v1 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))

function v1.default() -- Line: 13 -- upvalues: chalk (val)
    return chalk.bold("No tests found, exiting with code 0")
end

return v1