-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.getNoTestsFoundMessage
-- Decompile time: 1.66 ms

local Boolean = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Boolean
local v1 = {}
require(script.Parent.Parent:WaitForChild("jest-types"))
local default = require(script.Parent:WaitForChild("getNoTestFound")).default
local default_2 = require(script.Parent:WaitForChild("getNoTestFoundPassWithNoTests")).default
local default_3 = require(script.Parent:WaitForChild("getNoTestFoundVerbose")).default
require(script.Parent:WaitForChild("types"))

function v1.default(a1, a2) -- Line: 28 -- upvalues: Boolean (val), default_2 (val), default_3 (val), default (val)
    local v1 = Boolean.toJSBoolean(a2.passWithNoTests)
    if Boolean.toJSBoolean(a2.passWithNoTests) then
        return {exitWith0 = v1, message = default_2()}
    end
    local v2 = {exitWith0 = v1}
    local toJSBoolean = Boolean.toJSBoolean
    local verbose = true
    if #a1 ~= 1 then
        verbose = a2.verbose
    end
    local v3 = if not toJSBoolean(verbose) then default(a1, a2, v1) else default_3(a1, a2, v1)
    v2.message = v3
    return v2
end

return v1