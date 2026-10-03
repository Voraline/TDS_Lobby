-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.globsToMatcher
-- Decompile time: 1.25 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Map = v1.Map
local v2 = {}
local picomatch = require(script.Parent.Parent:WaitForChild("picomatch"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local u32 = Map.new()
local u33 = {dot = true}

function v2.default(a1) -- Line: 59 -- upvalues: Array (val), u32 (val), picomatch (val), u33 (val), Boolean (val)
    if #a1 == 0 then
        return function() -- Line: 63
            return false
        end
    end
    local u7 = Array.map(a1, function(a1) -- Line: 68 -- upvalues: u32 (upval), picomatch (upval), u33 (upval), Boolean (upval)
        if not u32:has(a1) then
            local v1 = picomatch(a1, u33, true)
            local v2 = {isMatch = v1}
            local negated = v1.state.negated or Boolean.toJSBoolean(v1.state.negatedExtglob)
            v2.negated = negated
            u32:set(a1, v2)
        end
        return (u32:get(a1))
    end)
    return function(a1) -- Line: 85 -- upvalues: u7 (val), Boolean (upval)
        local isMatch, negated, v1, v2, v3
        local v4 = nil
        local v5 = 0
        local v6 = #u7
        for i = 1, v6 do
            v2 = u7[i]
            isMatch = v2.isMatch
            negated = v2.negated
            if negated then
                v5 = v5 + 1
            end
            v3 = isMatch(v1)
            if v3 then
                if v3 and not negated then
                    v4 = true
                end
            elseif negated then
                v4 = false
            elseif v3 and not negated then
                v4 = true
            end
        end
        if v5 == #u7 then
            return v4 ~= false
        end
        return (Boolean.toJSBoolean(v4))
    end
end

return v2