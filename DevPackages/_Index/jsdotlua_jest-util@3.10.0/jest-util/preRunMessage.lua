-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.preRunMessage
-- Decompile time: 0.42 ms

local v1 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local default = require(script.Parent:WaitForChild("clearLine")).default
local default_2 = require(script.Parent:WaitForChild("isInteractive")).default
require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))

function v1.print(a1) -- Line: 19 -- upvalues: default_2 (val), chalk (val)
    if default_2 then
        a1:write((chalk.bold.dim("Determining test suites to run...")))
    end
end

function v1.remove(a1) -- Line: 26 -- upvalues: default_2 (val), default (val)
    if default_2 then
        default(a1)
    end
end

return v1