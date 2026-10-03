-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.installCommonGlobals
-- Decompile time: 1.00 ms

return function() -- Line: 11
    local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
    local Array = v1.Array
    local Object = v1.Object
    local String = v1.String
    local Symbol = v1.Symbol
    local promise = require(script.Parent.Parent:WaitForChild("promise"))
    local v2 = {}
    require(script.Parent.Parent:WaitForChild("jest-types"))
    local default = require(script.Parent:WaitForChild("createProcessObject")).default
    local default_2 = require(script.Parent:WaitForChild("deepCyclicCopy")).default
    local u55 = Array.filter(Object.keys(_G), function(a1) -- Line: 29 -- upvalues: String (val)
        local v1 = false
        if typeof(a1) == "string" then
            v1 = String.startsWith(a1, "DTRACE")
        end
        return v1
    end)

    function v2.default(a1, a2) -- Line: 33
        -- upvalues: default (val), Object (val), Symbol (val), promise (val), Array (val), u55 (val), default_2 (val)
        a1.process = default()
        local assign = Object.assign
        local v1 = {[(Symbol.for_("jest-native-promise"))] = promise}
        local v2 = Symbol.for_("jest-native-now")
        v1[v2] = DateTime.now
        v1["jest-symbol-do-not-touch"] = Symbol
        assign(a1, v1)
        Array.forEach(u55, function(a1_2) -- Line: 70 -- upvalues: a1 (val), a1 (val)
            a1[a1_2] = function(a1_3, ...) -- Line: 72 -- upvalues: a1_2 (val), a1 (upval)
                return _G[a1_2](a1, table.unpack({...}))
            end
        end)
        return Object.assign(a1, default_2(a2))
    end

    return v2
end