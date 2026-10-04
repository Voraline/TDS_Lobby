-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.collectHandles
-- Decompile time: 2.00 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Set = v1.Set
local String = v1.String
local v2 = {}
local stripAnsi = require((script.Parent:WaitForChild("jsHelpers")):WaitForChild("stripAnsi"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local formatExecError = (require((script.Parent.Parent:WaitForChild("jest-message-util")))).formatExecError

function v2.formatHandleErrors(a1, a2) -- Line: 162
    -- upvalues: Set (val), Array (val), formatExecError (val), stripAnsi (val), String (val)
    local u4 = Set.new()
    return Array.filter(Array.map(a1, function(a1) -- Line: 166 -- upvalues: formatExecError (upval), a2 (val)
        return formatExecError(a1, a2, {noStackTrace = false}, nil, true)
    end), function(a1) -- Line: 171 -- upvalues: stripAnsi (upval), String (upval), u4 (val)
        local v1 = stripAnsi(a1)
        local v2 = string.match(v1, "%s+at(.*)")
        if v2 == nil then
            return true
        end
        local v3 = String.trim((string.sub(v1, (string.find(v1, v2)))))
        if u4:has(v3) then
            return false
        end
        u4:add(v3)
        return true
    end)
end

return v2